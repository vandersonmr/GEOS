//===---- include/PassSequence.h - The Pass Sequence Manager  -*- C++ -*---===//
//
//              The LLVM Time Cost Analyser Infrastructure
//
//  This file is distributed under the MIT License. See LICENSE.txt for details.
//              
//===----------------------------------------------------------------------===//
///
/// \file
/// \brief This file contains the definition and implementation of a sequence
/// of passes. 
///
//===----------------------------------------------------------------------===//
#ifndef PASSSEQUENCE_H
#define PASSSEQUENCE_H

#include "llvm/Pass.h"
#include "llvm/Transforms/IPO/PassManagerBuilder.h"
#include "llvm/Transforms/Scalar.h"
#include "llvm/PassManager.h"
#include "llvm/PassRegistry.h"

#include "EnumString.h"

#include <stdio.h>
#include <vector>
#include <unordered_map>
#include <cctype>

/// \brief List of all possible function pass.
enum OptimizationKind {
    adce,
    alwaysInline,
    argpromotion,
    bbVectorize,
    blockPlacement,
    breakCritEdges,
    codegenprepare,
    constmerge,
    constprop,
    dce,
    deadargelim,
    deadtypeelim,
    die,
    dse,
    functionattrs,
    globaldce,
    globalopt,
    gvn,
    indvars,
    inlining,
    instcombine,
    //internalize,
    ipconstprop,
    ipsccp,
    jumpThreading,
    lcssa,
    licm,
    loopDeletion,
    //loopExtract,
    //loopExtractSingle,
    loopReduce,
    loopRotate,
    loopSimplify,
    loopUnroll,
    loopUnswitch,
    loweratomic,
    lowerinvoke,
    lowerswitch,
    mem2reg,
    memcpyopt,
    mergefunc,
    mergereturn,
    partialInliner,
    pruneEh,
    reassociate,
    reg2mem,
    scalarrepl,
    sccp,
    simplifycfg,
    sink,
    stripDeadPrototypes,
    tailcallelim
};

Begin_Enum_String( OptimizationKind ) 
{
  Enum_String( adce );
  Enum_String( alwaysInline );
  Enum_String( argpromotion );
  Enum_String( bbVectorize );
  Enum_String( blockPlacement );
  Enum_String( breakCritEdges );
  Enum_String( codegenprepare );
  Enum_String( constmerge );
  Enum_String( constprop );
  Enum_String( dce );
  Enum_String( deadargelim );
  Enum_String( deadtypeelim );
  Enum_String( die );
  Enum_String( dse );
  Enum_String( functionattrs );
  Enum_String( globaldce );
  Enum_String( globalopt );
  Enum_String( gvn );
  Enum_String( indvars );
  Enum_String( inlining );
  Enum_String( instcombine );
  //Enum_String( internalize );
  Enum_String( ipconstprop );
  Enum_String( ipsccp );
  Enum_String( jumpThreading );
  Enum_String( lcssa );
  Enum_String( licm );
  Enum_String( loopDeletion );
  //Enum_String( loopExtract );
  //Enum_String( loopExtractSingle );
  Enum_String( loopReduce );
  Enum_String( loopRotate );
  Enum_String( loopSimplify );
  Enum_String( loopUnroll );
  Enum_String( loopUnswitch );
  Enum_String( loweratomic );
  Enum_String( lowerinvoke );
  Enum_String( lowerswitch );
  Enum_String( mem2reg );
  Enum_String( memcpyopt );
  Enum_String( mergefunc );
  Enum_String( mergereturn );
  Enum_String( partialInliner );
  Enum_String( pruneEh );
  Enum_String( reassociate );
  Enum_String( reg2mem );
  Enum_String( scalarrepl );
  Enum_String( sccp );
  Enum_String( simplifycfg );
  Enum_String( sink );
  Enum_String( stripDeadPrototypes );
  Enum_String( tailcallelim );
}
End_Enum_String;

/// \brief Kinds of optimizations. None = O0, Small = O1, Standard = O2 and 
/// Aggressive = O3.
enum OptLevel {
  None, Small, Standard, Aggressive, Random
};

/// \brief The aim of this class is to manage a sequence of optimizations.
class PassSequence {
  private:
    /// \brief The sequence itself.
    std::vector<OptimizationKind> Opts;
    /// \brief Module size optimization level
    OptLevel OSize  = None;
    /// \brief Module optimization level (Note: not function passes).
    OptLevel OLevel = None;

    /// \brief Returns a number between the min and the max following an uniform
    /// distribution.
    int getRandom(int Min, int Max) const {
      std::random_device Rd;
      std::default_random_engine E1(Rd());
      std::uniform_int_distribution<int> uniform_dist(Min, Max);
      return uniform_dist(E1);
    }

    /// \brief Returns a random OptimizationKind.
    OptimizationKind getRandomOptimizationKind() {
      return static_cast<OptimizationKind>(
          getRandom(0, static_cast<int>(OptimizationKind::tailcallelim)));
    }

    std::string getOptimizationName(OptimizationKind OptChoosed) {
      if (OptChoosed == OptimizationKind::inlining)
        return std::string("inline");
      std::string RawName = EnumString<OptimizationKind>::From(OptChoosed); 
      size_t i = 0;
      for (;;) {
        i = RawName.find_first_of("ABCDEFGHIJKLMNOPQRSTUVWXYZ", i);
        if (i == std::string::npos) {
          break;
        }
        char A[] = { static_cast<char>(tolower(RawName[i])), '\0'};
        RawName.replace(i, 1, "-"+std::string(A));
      }
      return RawName;
    }

    OptimizationKind getKindByName(std::string OptChoosed) {
      if (OptChoosed == "inline")
        return OptimizationKind::inlining;

      // Replaces -a to -A
      bool isAfterBar = false; // bar = '-'
      for (auto &C : OptChoosed) {
        if (C == '-') isAfterBar = true;
        if (isAfterBar) { 
          C = toupper(C);
          isAfterBar = false;
        }
      }
      // Remove all -
      OptChoosed.erase(
          std::remove(OptChoosed.begin(), OptChoosed.end(), '-'), 
          OptChoosed.end());

      OptimizationKind X;
      EnumString<OptimizationKind>::To(X, OptChoosed); 
      return X;
    }

    /// \brief Given an OptimizationKind this function returns the respective 
    /// instanciation for this optimization (Pass).
    llvm::Pass* getOptimization(OptimizationKind OptChoosed) {
      llvm::PassRegistry *PR = llvm::PassRegistry::getPassRegistry();
      const llvm::PassInfo *PI = 
        PR->getPassInfo(getOptimizationName(OptChoosed));
      if (PI != nullptr)
        return PI->createPass();
      else 
        return nullptr;
    }

  public:
    void loadString(std::string S) {
      char CharsToRemove[] = "'[] ";
      for (unsigned int i = 0; i < strlen(CharsToRemove); ++i) {
        S.erase(remove(S.begin(), S.end(), CharsToRemove[i]), S.end() );
      }

      std::string Delimiter = ",";

      size_t Pos = 0;
      std::string Token;
      while ((Pos = S.find(Delimiter)) != std::string::npos) {
        Token = S.substr(0, Pos);
        Token.erase(0, 1);
        add(getKindByName(Token));
        S.erase(0, Pos + Delimiter.length());
      }
      add(getKindByName(S));
    }

    void setOLevel(OptLevel OL) {
      OLevel = OL;
    }

    void setOSize(OptLevel OS) {
      OSize = OS; 
    }
      
    /// \brief Inserts an Optimization at the end.
    void add(OptimizationKind P) {
      Opts.push_back(P);
    }

    /// \brief Populates the PassSequence with randomic optimizations.
    /// \param RandomSize when set as true make the function generate sequences
    /// with size in the range between 1 and NumOfOptimizations.
    void randomize(unsigned NumOfOptimizations, bool RandomSize = false, 
         OptLevel OL = None, OptLevel OS = None) {
      if (RandomSize) 
        NumOfOptimizations = getRandom(1, NumOfOptimizations); 

      setOLevel(OL == Random ? static_cast<OptLevel>(getRandom(1, 3)) : OL);
      setOSize (OS == Random ? static_cast<OptLevel>(getRandom(1, 3)) : OS);

      Opts.clear();
      for (unsigned i = 0; i < NumOfOptimizations; i++) 
        add(getRandomOptimizationKind());
    }

    void populatePassManager(llvm::PassManager &PM, 
        llvm::FunctionPassManager &FPM) {
      llvm::PassManagerBuilder Builder;
      Builder.SizeLevel = static_cast<int>(OSize)  - 1;
      Builder.OptLevel  = static_cast<int>(OLevel) - 1;
      Builder.populateFunctionPassManager(FPM);
      Builder.populateModulePassManager(PM);

      for (auto Opt : Opts) {
        auto P = getOptimization(Opt);
        if (P != nullptr) {
          if (P->getPassKind() < 4) 
            FPM.add(P);
          else 
            PM.add(P);
        }
      }
    }    

    unsigned size() const {
      return Opts.size();
    }

    void print() {
      for (auto Opt : Opts) {
        auto P = getOptimization(Opt);
        if (P != nullptr) {
          printf("%s | ", P->getPassName());
          delete P;
        }
      }
      printf(" O%d | OSize = %d", OLevel, OSize);
      printf("\n");
    }

    /// \brief Returns a PassSequence of the same size of both PassSequences 
    /// (parameter and this). This PassSequences is created by a mix between 
    /// them. Where there is 50% chance for each pass to be from the first or 
    /// second sequence.  
    PassSequence crossOver(const PassSequence &Rhs) const {
      PassSequence Res;
      auto Irhs = Rhs.begin();
      for (auto Opt : Opts) { 
        int i = getRandom(1,10);
        if (i % 2 == 0) {
          Res.add(Opt);
        } else {
          Res.add(*Irhs);
        }
        Irhs++;
      }
      return Res;
    }
   
    /// \brief Same as crossOver. 
    PassSequence operator*(const PassSequence &Rhs) const {
      return this->crossOver(Rhs);
    }

    /// \brief Add all sequences from the second into the first.
    PassSequence operator+(const PassSequence &Rhs) const {
      PassSequence Res;
      for (auto Opt : Opts)
        Res.add(Opt);
      for (auto Opt : Rhs) 
        Res.add(Opt);
      return Res;
    }

    /// \brief Returns true if both sequences have the same passes and also in 
    /// the same order.
    bool operator==(const PassSequence &Rhs) const { 
      if (Rhs.size() != size()) return false;
      auto Irhs = Rhs.begin();
      bool Equal = true;
      for (auto Opt : Opts) { 
        Equal &= (*Irhs) == Opt;
        Irhs++;
        if (!Equal) return false;
      }
      return true;
    }

    bool operator!=(const PassSequence &Rhs) const { 
      return !((*this) == Rhs);
    }

    OptimizationKind& operator[](std::size_t idx) { return Opts[idx]; };

    unsigned distance(PassSequence &Rhs) {
      int S1len = Rhs.size();
      int S2len = Opts.size();

      auto ColumnStart = (decltype(S1len)) 1;

      auto Column = new decltype(S1len)[S1len + 1];
      std::iota(Column + ColumnStart, Column + S1len + 1, ColumnStart);

      for (auto X = ColumnStart; X <= S2len; X++) {
        Column[0] = X;
        auto LastDiagonal = X - ColumnStart;
        for (auto Y = ColumnStart; Y <= S1len; Y++) {
          auto OldDiagonal = Column[Y];
          auto Possibilities = {
            Column[Y] + 1,
            Column[Y - 1] + 1,
            LastDiagonal + (Rhs[Y - 1] == Opts[X - 1]? 0 : 1)
          };
          Column[Y] = std::min(Possibilities);
          LastDiagonal = OldDiagonal;
        }
      }
      auto Result = Column[S1len];
      delete[] Column;
      return Result;
    }

    typedef std::vector<OptimizationKind>::iterator iterator;
    typedef std::vector<OptimizationKind>::const_iterator const_iterator;
    iterator begin() { return Opts.begin(); }
    const_iterator begin() const { return Opts.cbegin(); }
    iterator end() { return Opts.end(); }
    const_iterator end() const { return Opts.cend(); }
};

#endif
