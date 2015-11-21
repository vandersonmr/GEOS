# Guide for Exploration of the Optimization Space (GEOS)  [![Build Status](https://travis-ci.org/vandersonmr/GEOS.svg?branch=v1.0)](https://travis-ci.org/vandersonmr/GEOS)   [![Software License](https://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](LICENSE.txt)

The Guide for Exploration of the Optimization Space is a LLVM tool designed for be used by heuristics in the search for good optimization sequences. This tool, which is also known as GEOS, provides a set of analysis that can mensure the execution time of a LLVM code. By invoking GEOS the heuristic can be guided without executing the code, what can be seriously faster.

### Source code

* Get the sources: `git clone https://github.com/vandersonmr/GEOS; git checkout v1.0`

### Dependences

* GEOS 1.0 needs LLVM 3.6 and Clang 3.6.

### Building

GEOS can be easily compiled with CMake:

```
cd build 
cmake ..
sudo make install
```

## How to use it

GEOS can be used as an API as the follow example.

```
  // Initialize all needed structures and passes from LLVM.
  GEOS::init();
  
  // Parse a set of standard GEOS command lines
  gcl::GEOSParseCommandLineOptions(argc, argv);
  
  Module *MyModule = 
    parseIRFile(LLVMFilename.c_str(), Error, Context).release();                 
    
  // Instanciate a ProfileModule without any profiling yet.
  ProfileModule *PModule = new ProfileModule(MyModule); 
  
  // Read gcov profile and set all options for analysis.
  CostEstimatorOptions Opts = gcl::populatePModule(PModule);
  
  // Estimate time cost
  double Cost = GEOS::analyseCost(PModule, Opts);
```

To generate the GCOV profiling you need to compile your code with the following flags.

```
clang -O0 -g -coverage test.c
./a.out
```

If needed the [documentation](https://vandersonmr.github.io/GEOS/docs/namespaceGEOS.html) can be used for better understand.

## License

GEOS is licensed under the [MIT license](LICENSE.txt).
