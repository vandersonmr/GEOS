//=== include/DatabaseManager.h - Basic Block Database Manager  -*- C++ -*-===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains declarations of the Basic Block Database Manager.
///
//===----------------------------------------------------------------------===//

#include "BBHash.h"

#include <string>
#include <unordered_map>

/// \brief This class is responsible for loading and saving hashes databases. 
/// It is a representation in memory of a hash database and has functions to 
/// use and manipulate it.
class DatabaseManager {
  private:
    /// \brief The database itself. Each element has a key, a BBHash, that 
    /// represents a BasicBlock and a double value which represents the 
    /// execution time of this BasicBlock.
    std::unordered_map<BBHash, double> DB;
    
    /// \brief Buckets for nearest hashes. Each BBHash readed is applied to a
    /// locality-sensitive hash that returns the same int for near points. So 
    /// when looking for a nearest hash it just need to look into the specified
    /// bucket, saving time.
    std::unordered_map<int, std::vector<BBHash>> CDB;

    /// \brief Loads from a file, which the path is given as parameter, the 
    /// BB Hash Database.
    void loadDatabase(llvm::StringRef);

  public:
    /// \brief Creates a database loading it from a file.
    DatabaseManager(llvm::StringRef);

    /// \brief Returns the number of different BB hashes which there are in the 
    /// database.
    int size() const;

    /// \brief Returns the execution time found in the database for the given 
    /// Hash (BBDescritor). 
    double getTime(const BBHash&) const;

    /// \brief Returns true if and only if there is an exactly equal hash on
    /// the database.
    bool hasHash(const BBHash&) const;

    /// \brief Insert a new value in the database. 
    // 
    /// \param The first parameter is the hash and the second is the execution
    ///  time of this hash. 
    void insert(const BBHash&, double);

    /// \brief This function merge the database with the one given as parameter.
    void unionWith(DatabaseManager&);

    /// \brief Prints all the database. Each new line contains a hash and its 
    /// execution time separated by space. 
    void printDatabase() const;

    /// \brief Returns the nearest BBHash from the given parameter in the 
    /// database. 
    BBHash* getNearest(const BBHash&) const;

    typedef std::unordered_map<BBHash, double>::iterator iterator;
    typedef std::unordered_map<BBHash, double>::
      const_iterator const_iterator;

    iterator begin() { return DB.begin(); };

    const_iterator cbegin() const { return DB.cbegin(); };

    iterator end() { return DB.end(); };

    const_iterator cend() const { return DB.cend(); };
};
