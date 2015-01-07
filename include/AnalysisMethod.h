//===--- include/AnalysisMethod.h - Basic Block Cost Estimator -*- C++ -*--===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of every method for analysis the 
/// execution cost of a LLVM function.
///
//===----------------------------------------------------------------------===//

#ifndef ANALYSISMETHOD_H
#define ANALYSISMETHOD_H

#include "DatabaseManager.h"

#include "llvm/IRReader/IRReader.h"   
#include "llvm/Support/SourceMgr.h"       
#include "llvm/Support/GCOV.h"

#include <vector>

/// \brief An enumeration to represent each different type of time cost analysis
enum AnalysisMethods {
  instM, hashM, randM, hashPlusInstM, freqM, instCostM, hashWM
};

/// \brief Every execution time cost analysis must inherit from this class
class AnalysisMethod {
  public:
    /// \brief This function is responsible for calculating the cost of a LLVM 
    /// function. This cost must reflect on the execution time of this function. 
    ///
    /// \returns A double value that represents the execution cost of the LLVM 
    /// function (Function) when executed in the given frequency (GCOVFunction).
    virtual double 
      estimateExecutionTime(llvm::Function*, llvm::GCOVFunction*) = 0;
};

/// \brief This method uses the number of instructions multiplied by the 
/// execution frequency to evaluate the execution cost of the given function.
class InstructionMethod : public AnalysisMethod {
  public:
    double estimateExecutionTime(llvm::Function*, llvm::GCOVFunction*); 
};

/// \brief This method uses a weight given by the execution time of a similar 
/// basic block. For that it uses a database of basic blocks and their execution
///  time. This weight is multiplied by the execution frequency 
///  to evaluate the execution cost of the given function.
class HashMethod : public AnalysisMethod {
  private:
    /// \brief It needs a basic block database.
    DatabaseManager *DBManager;
  public:
    /// \brief The constructor needs a string with the path to the database 
    /// file.
    HashMethod(llvm::StringRef);

    double estimateExecutionTime(llvm::Function*, llvm::GCOVFunction*); 
};

/// \brief This method uses a weight given by the execution time of a similar 
/// basic block. For that it uses a database of basic blocks and their execution
/// time. The search on the database in made using weights for each part of the
/// hash. For instance, double multiplication has a higher weight when looking 
/// for similar basic blocks. Finally, this weight is multiplied by the 
/// execution frequency to evaluate the execution cost of the given function. 
class HashWeightedMethod : public AnalysisMethod {
  private:
    /// \brief It needs a basic block database.
    DatabaseManager *DBManager;
  public:
    /// \brief The constructor needs a string with the path to the database 
    /// file.
    HashWeightedMethod(llvm::StringRef);

    double estimateExecutionTime(llvm::Function*, llvm::GCOVFunction*); 
};

/// \brief This method uses a random number multiplied by the execution 
/// frequency to evaluate the execution cost of the given function.
class RandomMethod : public AnalysisMethod {
  public:
    double estimateExecutionTime(llvm::Function*, llvm::GCOVFunction*); 
};

/// \brief This method uses just the frequency to evaluate the execution cost 
/// of the given function.
class FrequencyMethod : public AnalysisMethod {
  public:
    double estimateExecutionTime(llvm::Function*, llvm::GCOVFunction*); 
};

/// \brief This method uses the sum of an estimate cost of each instruction in 
/// the function multiplied by the frequency of execution to evaluate its 
/// execution cost.
class InstructionCostMethod : public AnalysisMethod {
  public:
    double estimateExecutionTime(llvm::Function*, llvm::GCOVFunction*); 
};

/// \brief This method uses the sum of both estimations from HashMethod and 
/// InstructionMethod.
class InstructionPlusHashMethod : public AnalysisMethod {
  private:
    /// \brief Uses both InstructionMethod and HashMethod
    InstructionCostMethod *IM;
    HashWeightedMethod *HM;
  public:
    /// \brief Needs the database path as parameter for the HashMethod 
    /// constructor.
    InstructionPlusHashMethod(llvm::StringRef);

    double estimateExecutionTime(llvm::Function*, llvm::GCOVFunction*); 
};

/// \brief This method uses a similar approach as HashMethod. But instead 
/// searching in a database the cost of each basic block is directly given. 
class ProfMethod : public AnalysisMethod {
  private:
    std::vector<double> Times;
  public:
    /// \brief Needs the database path as parameter for the HashMethod 
    /// constructor.
    ProfMethod(llvm::StringRef);

    double estimateExecutionTime(llvm::Function*, llvm::GCOVFunction*); 
};

#endif
