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

#include "BBDescriptor.h"

#include <string>
#include <unordered_map>

/// \brief This class is responsible for loading and saving hashes databases. 
/// It is a representation in memory of a hash database and has functions to 
/// use and manipulate it.
class DatabaseManager {
  private:
    /// \brief The database itself. Each element has a key, a string, that 
    /// represents a BB hash and a double value linked with that represents the
    /// execution time of this BB.
    std::unordered_map<std::string, double> DB;

    /// \brief Loads from a file, which the path is given as parameter, the 
    /// BB Hash Database.
    void loadDatabase(llvm::StringRef);

  public:
    /// \brief Creates a database loading it from a file.
    DatabaseManager(llvm::StringRef);

    /// \brief Returns the number of different BB hashes which there are in the 
    /// database.
    int size();

    /// \brief Returns the execution time found in the database for the given 
    /// Hash (BBDescritor). 
    double getTime(BBDescriptor&);

    /// \brief Returns true if and only if there is an exactly equal hash on
    /// the database.
    bool hasHash(BBDescriptor&);

    /// \brief Given an another database this function merge them.
    void unionWith(std::unordered_map<std::string, double>&);

    /// \brief Prints all the database. Each new line contains a hash and its 
    /// execution time separated by space. 
    void printDatabase();

    /// \brief Returns the most equally hash from the given parameter in the 
    /// database. 
    BBDescriptor* getNearest(BBDescriptor&, bool);
};
