#include "ProfileModule/ProfileModule.h"

#include "llvm/CodeGen/MachineFunctionAnalysis.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/MachinePostDominators.h"
#include "llvm/IR/LegacyPassManager.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Analysis/TargetLibraryInfo.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetSubtargetInfo.h"

using namespace llvm;

template<typename T> static T* 
runCodeGenPasses(Module *M, const ProfileModule *Profile, 
    legacy::PassManager &PM) {

  Triple TheTriple;

  std::string TargetTriple;
  StringRef MCPU = sys::getHostCPUName();

  M->setTargetTriple(Triple::normalize(TargetTriple));
  TheTriple = Triple(M->getTargetTriple());

  if (TheTriple.getTriple().empty())
    TheTriple.setTriple(sys::getDefaultTargetTriple());

  std::string Error;
  const Target *TheTarget = TargetRegistry::lookupTarget("", TheTriple, Error);

  if (!TheTarget) {
    errs() << ": " << Error;
    return nullptr;
  }

  std::string FeaturesStr;
  CodeGenOpt::Level OLvl = CodeGenOpt::None;

  TargetOptions Options;

  //std::unique_ptr<TargetMachine> Target(
  TargetMachine* Target = TheTarget->createTargetMachine(TheTriple.getTriple(), MCPU, FeaturesStr,
      Options, Reloc::Model::Default, 
      CodeModel::Model::Default,
      OLvl);
  assert(Target && "Could not allocate target machine!");

  TargetLibraryInfoWrapperPass *TLIWP = 
    new TargetLibraryInfoWrapperPass(TheTriple);
  PM.add(TLIWP);

  M->setDataLayout(Target->createDataLayout());

  std::error_code Err;
  raw_fd_ostream Out("/dev/null", Err, llvm::sys::fs::OpenFlags::F_None);

  Target->addPassesToEmitFile(PM, Out, 
      TargetMachine::CodeGenFileType::CGFT_Null, false, 
      nullptr, nullptr);

  auto MRU = new T(Profile, *Target);
  PM.add(MRU);
  PM.run(*M);

  delete Target;

  return MRU;
}

