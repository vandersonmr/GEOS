#include "llvm/CodeGen/MachineFunctionAnalysis.h"
#include "llvm/CodeGen/MachineModuleInfo.h"
#include "llvm/CodeGen/MachinePostDominators.h"
#include "llvm/PassManager.h"
#include "llvm/Support/TargetRegistry.h"
#include "llvm/Support/FileSystem.h"
#include "llvm/Support/FormattedStream.h"
#include "llvm/Target/TargetLibraryInfo.h"
#include "llvm/Target/TargetMachine.h"
#include "llvm/Target/TargetSubtargetInfo.h"

using namespace llvm;

static TargetMachine* 
loadCodeGenPasses(Module *M, const ProfileModule *Profile, PassManager &PM) {
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

  TargetLibraryInfo *TLI = new TargetLibraryInfo(TheTriple);
  PM.add(TLI);

  if (const DataLayout *DL = Target->getSubtargetImpl()->getDataLayout())
    M->setDataLayout(DL);
  PM.add(new DataLayoutPass());

  std::error_code Err;
  raw_fd_ostream *Out =          
    new raw_fd_ostream("/dev/null", Err, llvm::sys::fs::OpenFlags::F_None);
  formatted_raw_ostream FOS(*Out);

  Target->addPassesToEmitFile(PM, FOS, 
      TargetMachine::CodeGenFileType::CGFT_Null, false, 
      nullptr, nullptr);

  Out->close();
  return Target;
}

