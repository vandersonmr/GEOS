//===--- ExecutionTimeMeasurer - Real Execution Time Measurer -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file define classes that execute a given Module and measure its
/// execution time (this is named as real execution time, contrasting with the
/// estimated cost).

//===----------------------------------------------------------------------===//

#include "llvm/IR/Function.h"

#include "ProfileModule/ProfileModule.h"

#include <sys/time.h>
#include <vector>
#include <string>
#include "papi.h"

typedef unsigned long long timestampType;

/// \brief Returns in mileseconds the time now.
static timestampType getTimestamp() {
  struct timeval now;
  gettimeofday (&now, NULL);
  return now.tv_usec + (timestampType) now.tv_sec * 1000000;
}

/// \brief This class is a interface to implement a execution time measurer. The
/// way that this execution is done can be implemented in diferents ways.
class ExecutionTimeMeasurer {
  private:
    /// \brief This interface must implement a way to execute (run) the module 
    /// that was given by the constructor.
    virtual void run(std::vector<std::string>&, char* const*) = 0;

    /// \brief Clean the data cache in order to give a better result for the 
    /// execution time.
    void flushCache() {
      int cs = 32770 * 1024 / sizeof(double);
      double* flush = (double*) calloc (cs, sizeof(double));
      int i;                  
      double tmp = 0.0;       
      for (i = 0; i < cs; i++)
        tmp += flush[i];      
      assert (tmp <= 10.0);   
      free (flush);           
    } 
  public:
    /// \brief Call and measure the execution time of the run function passing
    /// the arguments argv and evnp to the module's main function.
    double getExecutionTime(std::vector<std::string>& Argv, 
        char* const* Envp, const int PAPIEvent = -1) {
      flushCache();
      timestampType T0, T1;
      T0 = getTimestamp();
      run(Argv, Envp);
      T1 = getTimestamp();
      return (T1 - T0) / 1000000.0L;
    }

    /// \brief Call and measure the execution time of the run function.
    double getExecutionTime() {
      std::vector<std::string> Argv;
      Argv.push_back("program_name");
      return getExecutionTime(Argv, nullptr);
    }

    /// \brief Call and measure PAPI's profile of the run function passing
    /// the arguments argv and evnp to the module's main function.
    long long int *getPAPIProfile(std::vector<std::string>& Argv, 
        char* const* Envp, int *PAPIEvents, int Size) {
      assert(PAPIEvents != nullptr && "PAPIEvents is null\n");
      assert(PAPI_num_counters() > 2 && 
          "No hardware counters here, or PAPI not supported.\n");
      flushCache();
      PAPI_start_counters(PAPIEvents, Size);

      run(Argv, Envp);

      long long int *Values = 
        static_cast<long long int*>(malloc(sizeof(long long int)*Size));  
      PAPI_stop_counters(Values, Size);
      return Values;
    }

    /// \brief Call and measure PAPI's profile of the run function.
    long long int *getPAPIProfile(int *PAPIEvents, int Size) {
      std::vector<std::string> Argv;
      Argv.push_back("program_name");
      return getPAPIProfile(Argv, nullptr, PAPIEvents, Size);
    }

    ~ExecutionTimeMeasurer() {};
};

/// \brief This class implements a ExecutionTimeMeasurer using a JIT compiler.
class JITExecution : public ExecutionTimeMeasurer {
  private:
    ProfileModule *PModule;
    /// \brief This function uses the LLVM JIT compiler to execute the PModule.
    void run(std::vector<std::string>&, char* const*);
  public:
    JITExecution(const ProfileModule*);
    ~JITExecution();
};

enum ExecutionKind {
  JIT
};

class ExecutionFactory {
  public:
    static ExecutionTimeMeasurer& 
      createRuntimeMeasurer(ExecutionKind E, const ProfileModule *PModule) {
        switch(E) {
          default:
            return *(new JITExecution(PModule));
        }
      }
};
