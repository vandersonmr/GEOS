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

  assert(DatabaseFileBuffer && "Impossible to open the database file.");

  std::pair<StringRef, StringRef> LineAndTail =
      (*DatabaseFileBuffer)->getBuffer().split('\n');

  while (!LineAndTail.first.empty()) {
    char   HashString[1000];
    double Time;

    sscanf(LineAndTail.first.str().c_str(), "%s %lf", HashString, &Time); 

    DB[BBHash(StringRef(HashString))] = Time;
  
    LineAndTail = LineAndTail.second.split('\n'); 
  }
}

DatabaseManager::DatabaseManager(StringRef Filename) {
  loadDatabase(Filename); 
}

int DatabaseManager::size() const {
  return DB.size();
}

double DatabaseManager::getTime(const BBHash &Hash) const {
  if(hasHash(Hash))
    return DB.at(Hash);
  else 
    return 0.0;
}

bool DatabaseManager::hasHash(const BBHash &Hash) const {
  return DB.count(Hash) == 1;
}

BBHash* DatabaseManager::
getNearest(const BBHash &Hash, bool Weight = false) const {
  double SmallestDistance = std::numeric_limits<double>::max();
  std::string Smallest = "";

  for (auto Elem : DB) {
    double Distance = 0;
    Distance = BBHash::distance(Elem.first, Hash, Weight);

    if (Distance == 0) { Smallest = Elem.first.getString(); break; }
    if (Distance < SmallestDistance) {
      SmallestDistance = Distance;
      Smallest         = Elem.first.getString();
    }
  }

  return new BBHash(Smallest);
}

void DatabaseManager::insert(BBHash Hash, double Value) {
  assert(Value > 0 && "Cannot insert in the database a negative value.");
  
  if (hasHash(Hash)) 
    DB[Hash] = (Value + DB[Hash])/2;
  else 
    DB[Hash] = Value;
}

void DatabaseManager::unionWith(DatabaseManager &DB2) {
  for (auto Elem : DB2)  
    hasHash(Elem.first);
  for (auto Elem : DB2)  
    insert(Elem.first, Elem.second);
}

void DatabaseManager::printDatabase() const {
  for (auto i : DB)
    outs() << i.first.getString() << " " << i.second << "\n";
}
