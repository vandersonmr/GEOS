//===---- include/BBHash.h - Basic Block Hash Manager  -*- C++ -*----===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of a Basic Block Hash representation. 
/// Which is responsable for creating, loading and comparing BB's Hashs. 
///
//===----------------------------------------------------------------------===//

#include "llvm/IR/Function.h"
#include "llvm/IR/IRBuilder.h"
#include "llvm/IR/Module.h"

#include <cmath>
#include <fstream>
#include <string>
#include <sstream>
#include <unordered_map>
#include <vector>

/// \brief Represent each item in the basic block's hash
enum DescriptorKind {
  NumberOfInstructions = 0,
  GetElementPtr = 1,
  Ret  = 2,
  Phi  = 3,
  Br   = 4,
  FRem = 5,
  FAdd = 6,
  FSub = 7,
  FMul = 8,
  FDiv = 9,
  Add  = 10,
  Sub  = 11,
  Mul  = 12,
  UDiv = 13, 
  SDiv = 14,
  URem = 15,
  SRem = 16,
  Shl  = 17, 
  LShr = 18,
  AShr = 19,
  And  = 20,
  Or   = 21,
  Xor  = 22,
  ICmp = 23,
  FCmp = 24,
  Store= 25,
  Load = 26,
  ExtractElement = 27,
  InsertElement  = 28,
  ShuffleVector  = 29,
  Calls  = 30,
  Printf = 31,
  Malloc = 32,
  Pow    = 33,
  Sqrt   = 34,
  Others = 35
};


/// \brief This class is responsible for representing BB's hashes in memory. 
/// It can be constructed by a string (hash representation in the file) or by 
/// a basic block that will serve as a base to create a new hash.
class BBHash {
  private:
    /// \brief size of the hash. Need to be the same size of the enum 
    /// Descriptor.
    const static int Size = 35;

    /// \brief representation of the hash itself. The hash is a vector of int 
    /// separated by '-'. Each int is called a descriptor. 
    std::vector<int> Hash;

    /// \brief Fill the descriptios if informations about the basic block pass 
    /// as a parameter.
    void loadBB(llvm::BasicBlock&);

    /// \brief Returns a weight for each information in the hash.
    static unsigned descriptorWeight(DescriptorKind d);
  public:
    /// \brief Create an empty hash.
    BBHash();

    /// \brief Create a hash for the Basic Block given as parameter.
    BBHash(llvm::BasicBlock&);

    /// \brief Creates a memory representation of the hash from a string 
    /// representation of the hash. Useful when loading the hash from a file. 
    BBHash(const llvm::StringRef&); 

    /// \brief set an information in the hash with a new value given as 
    /// parameter.
    void setDescriptor(DescriptorKind, int);

    /// \brief Sum 1 or n to the value of an information in the hash.
    void addUpDescriptor(DescriptorKind, int n = 1); 

    /// \brief get the value from an information in the hash.
    int getDescriptor(DescriptorKind) const;

    /// \brief returns a string that represents this hash. For instance:
    /// "25-0-1-0-0-1-7-4-2-0-1-0-0-0-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1-1"
    /// Where each position represents the amount of something in the basic
    /// block. For example, in this case the first number is the number of 
    /// instruction in the basic block. So this basic block had 25 instructions.
    llvm::StringRef getString() const;

    /// \brief Calculates an Euclidian distance between two hashes.
    ///
    /// \returns it returns a double that represents how equally two basic 
    /// blocks are. 
    static double 
      distance(const BBHash&, const BBHash&);

    /// \brief Calculates the dot product between two hashes.
    ///
    /// \returns it returns a double from the result of the dot product. 
    static int dotProduct(const BBHash&, const BBHash&);

    /// \brief Generates a randomic Hash.
    static BBHash* getRandomHash();

    bool operator==(const BBHash &Other) const { 
      return distance(Other, *this) == 0;
    }
};

namespace std {
  /// \brief Define the hash function for the type BBHash. It uses the 
  /// result of hash<string> applied in the getString from the BBHash.
  template <> 
    struct hash<BBHash> {
      size_t operator()(const BBHash& K) const {
        return BBHash::distance(K, BBHash()) *
          K.getDescriptor(DescriptorKind::NumberOfInstructions);
      }
    };
} // namespace

