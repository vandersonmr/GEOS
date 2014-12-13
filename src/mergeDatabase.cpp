//===------ mergeDatabase.cpp - Basic Block Database Merger -*- C++ -*-----===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the implementation of a basic block database. 
/// It's responsable for merging databases. Those databases constains hashs 
/// that represents each basic block and also their execution time.
///
//===----------------------------------------------------------------------===//

#include "DatabaseManager.h"

#include "llvm/Support/CommandLine.h"
#include "llvm/Support/MemoryBuffer.h"

#include <cmath>
#include <fstream>
#include <iostream>
#include <sstream>
#include <string>
#include <unordered_map>
#include <vector>

using namespace llvm;

static cl::opt<std::string> 
DatabaseFilename("database", 
                  cl::desc("Database filename to check for duplicates"), 
                  cl::value_desc("filename"), cl::Required);
cl::alias dbAlias("db", cl::desc("Alias for -database"), 
              cl::aliasopt(DatabaseFilename));

static cl::opt<std::string> 
HashFilename("hash", cl::desc("Hash filename"), cl::value_desc("filename"), 
              cl::Required);
cl::alias hsAlias("hs", cl::desc("Alias for -hash"), 
              cl::aliasopt(HashFilename));

static cl::opt<std::string> 
ProfFilename("profile", cl::desc("Profile filename"), cl::value_desc("filename"), 
              cl::Required);
cl::alias pAlias("p", cl::desc("Alias for -profile"), 
              cl::aliasopt(ProfFilename));

int main(int argc, char **argv) {
  cl::ParseCommandLineOptions(argc, argv, "Database merger");

  ErrorOr<std::unique_ptr<MemoryBuffer>> HashFileBuffer = 
      MemoryBuffer::getFile(HashFilename);

  ErrorOr<std::unique_ptr<MemoryBuffer>> ProfFileBuffer = 
      MemoryBuffer::getFile(ProfFilename);

  DatabaseManager DBManager(DatabaseFilename);

  std::unordered_map<int, BBDescriptor*> Hashs;
  std::unordered_map<int, double> Times;

  std::pair<StringRef, StringRef> HashLineAndTail =
      (*HashFileBuffer)->getBuffer().split('\n');

  while (!HashLineAndTail.first.empty()) {
    int Id;
    char HashString[1000];

    scanf(HashLineAndTail.first.str().c_str(), "%d: %s", &Id, HashString); 

    Hashs[Id] = new BBDescriptor(std::string(HashString));
    
    HashLineAndTail = HashLineAndTail.second.split('\n'); 
  }

  std::pair<StringRef, StringRef> ProfLineAndTail =
      (*ProfFileBuffer)->getBuffer().split('\n');

  while (!ProfLineAndTail.first.empty()) {
    int Id;
    double Time; 

    scanf(HashLineAndTail.first.str().c_str(), "%d: %f", &Id, &Time); 

    Times[Id] = Time;
    
    ProfLineAndTail = ProfLineAndTail.second.split('\n'); 
  }

  std::unordered_map<std::string, double> DB2;
  for (auto i : Times) 
    if (Hashs.count(i.first) != 0) {
      if (DB2.count(Hashs[i.first]->getString()) == 0)
        DB2[Hashs[i.first]->getString()] = i.second;
      else
        DB2[Hashs[i.first]->getString()] = (DB2[Hashs[i.first]->getString()] 
                                              + i.second)/2;
    }

  DBManager.unionWith(DB2);  

  DBManager.printDatabase();

  return 0;
}
