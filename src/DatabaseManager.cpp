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

using namespace llvm;

// For the next values read the paper:
//    Locality-Sensitive Hashing for Finding Nearest Neighbors 
//    by Malcolm Slaney and Michael Casey; 2008.

// w constant is related with the size of each bucket. Smaller values creates
// buckets with less Hashes, but also decrease the precision.
constexpr int w = 5;

// PrimeNumber define the largest locality-sensitive hash number. 
// In other words, it defines the size of CDB.
constexpr int PrimeNumber = 59;

// A randomic hash used to calculate the locality-sensitive hash using 
// dotProduct to reduce the dimensions to a scalar.
BBHash* RandomHash;

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

    insert(BBHash(std::string(HashString)), Time);

    LineAndTail = LineAndTail.second.split('\n'); 
  }
}

DatabaseManager::DatabaseManager(StringRef Filename) {
  RandomHash = BBHash::getRandomHash();
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

std::unordered_map<BBHash, BBHash*> Nearest;

BBHash* DatabaseManager::
getNearest(const BBHash &Hash) const {
  if (Nearest.count(Hash) == 0) {
    double SmallestDistance = std::numeric_limits<double>::max();
    llvm::StringRef Smallest = "";

    int dotProduct = BBHash::dotProduct(Hash, *RandomHash);

    int Deslocation = 0;  
    while (CDB.count(((dotProduct+Deslocation)/w) % PrimeNumber) == 0)
      Deslocation++;

    auto Hashes = CDB.at(((dotProduct+Deslocation)/w) % PrimeNumber);

    for (auto &Elem : Hashes) {
      double Distance = 0;
      Distance = BBHash::distance(Elem, Hash);

      if (Distance == 0) { 
        Smallest = Elem.getString(); 
        break; 
      } if (Distance < SmallestDistance) {
        SmallestDistance = Distance;
        Smallest         = Elem.getString();
      }
    }

    Nearest[Hash] = new BBHash(Smallest);
  }

  return Nearest[Hash];
}

void DatabaseManager::insert(const BBHash &Hash, double Value) {
  assert(Value > 0 && "Cannot insert in the database a negative value.");

  CDB[(BBHash::dotProduct(Hash, *RandomHash)/w) % PrimeNumber]
    .push_back(Hash);

  if (hasHash(Hash)) 
    DB[Hash] = (Value + DB[Hash])/2;
  else 
    DB[Hash] = Value;
}

void DatabaseManager::unionWith(DatabaseManager &DB2) {
  for (auto Elem : DB2)  
    insert(Elem.first, Elem.second);
}

void DatabaseManager::printDatabase() const {
  for (auto i : DB) 
    printf("%s %lf\n", i.first.getString().str().c_str(), i.second);
}
