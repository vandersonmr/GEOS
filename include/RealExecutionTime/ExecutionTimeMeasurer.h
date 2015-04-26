//===---- include/CostAnalysis.h - Basic Block Cost Estimator -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of every method for analysis of the 
/// execution cost of a LLVM function.
///
//===----------------------------------------------------------------------===//

#include "llvm/IR/Function.h"

#include "ProfileModule/ProfileModule.h"

#include <sys/time.h>
#include <vector>
#include <string>

typedef unsigned long long timestampType;

static timestampType getTimestamp() {
  struct timeval now;
  gettimeofday (&now, NULL);
  return now.tv_usec + (timestampType) now.tv_sec * 1000000;
}

class ExecutionTimeMeasurer {
  private:
    virtual void run(std::vector<std::string>&, char* const*) = 0;
  public:
    double getExecutionTime() {
      std::vector<std::string> Argv;
      Argv.push_back("program_name");
      timestampType T0 = getTimestamp();
      run(Argv, nullptr);
      timestampType T1 = getTimestamp();
      return (T1 - T0) / 1000000.0L;
    }

    double getExecutionTime(std::vector<std::string>& Argv, 
        char* const* Envp) {
      timestampType T0 = getTimestamp();
      run(Argv, Envp);
      timestampType T1 = getTimestamp();
      return (T1 - T0) / 1000000.0L;
    }

    ~ExecutionTimeMeasurer() {};
};

class JITExecution : public ExecutionTimeMeasurer {
  private:
    ProfileModule *PModule;
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
