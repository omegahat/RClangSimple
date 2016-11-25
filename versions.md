We generate bindings for different versions of libclang(-c).  We need to match the bindings to the
We can think of enumerated values.  We generate R values and variables for the corresponding
enumerated values in the C interface.  If we install the package against a version of libclang-c, we
need to ensure that we match the enumerated values approriately.  So we check the version and enable
the code for that version.
There are two versions of libclang in play here: 1) the version at compile/installation time, and 2) 
the run-time version of libclang.

For 2, it is possible to install the package with one version of libclang (e.g. 3.7) and
then to load the package against a different version (e.g. 3.8).
We can detect this by comparing the 
  clangVersion() and clangVersionNum()
