//===---- DatabaseManager.cpp - Basic Block Database Manager -*- C++ -*----===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the implementation of a basic block database. 
/// It's responsable for loading and saving BB's databases. Those
/// databases constains hashs that represents each basic block and also 
/// their execution time.
///
//===----------------------------------------------------------------------===//

#include "DatabaseManager.h"

#include "llvm/Support/MemoryBuffer.h"
#include <llvm/Support/raw_ostream.h>

using namespace llvm;

void DatabaseManager::loadDatabase(StringRef Filename) {
  ErrorOr<std::unique_ptr<MemoryBuffer>> DatabaseFileBuffer = 
      MemoryBuffer::getFile(Filename);

  std::pair<StringRef, StringRef> LineAndTail =
      (*DatabaseFileBuffer)->getBuffer().split('\n');

  while (!LineAndTail.first.empty()) {
    char   HashString[1000];
    double Time;

    scanf(LineAndTail.first.str().c_str(), "%s %f", HashString, &Time); 

    DB[std::string(HashString)] = Time;
  
    LineAndTail = LineAndTail.second.split('\n'); 
  }
}

DatabaseManager::DatabaseManager(StringRef Filename) {
  loadDatabase(Filename); 
}

int DatabaseManager::size() {
  return DB.size();
}

double DatabaseManager::getTime(BBDescriptor &Hash) {
  if(hasHash(Hash))
    return DB[Hash.getString()];
  else 
    return 0.0;
}

bool DatabaseManager::hasHash(BBDescriptor &Hash) {
  return DB.count(Hash.getString()) == 1;
}

BBDescriptor* 
DatabaseManager::getNearest(BBDescriptor &Hash, bool Weight = false) {
  auto SmallestDistance = 1000000000000;
  std::string Smallest = "";

  for (auto Elem : DB) {
    BBDescriptor H(Elem.first);
    auto Distance = 0;
    if (Weight)
      Distance = BBDescriptor::distance(H, Hash, true);
    else
      Distance = BBDescriptor::distance(H, Hash, false);

    if (Distance == 0) { Smallest = Elem.first; break; }
    if (Distance < SmallestDistance) {
      SmallestDistance = Distance;
      Smallest         = Elem.first;
    }
  }

  return new BBDescriptor(Smallest);
}

void DatabaseManager::unionWith(std::unordered_map<std::string, double> &DB2) {
  for (auto Elem : DB2) {
    if (DB.count(Elem.first) == 0)
      DB[Elem.first] = Elem.second;
    else
      DB[Elem.first] = (Elem.second + DB[Elem.first])/2;
  }
}

void DatabaseManager::printDatabase() {
  for (auto i : DB)
    outs() << i.first << " " << i.second << "\n";
}
