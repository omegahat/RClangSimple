To install on Linux, install llvm + clang.
You can install these from
    http://llvm.org/releases/download.html

Install the relevant one for your Linux distribution.
Use lsb_release -a to find the name of your Linux release.
Use Fedora for Scientific Linux Release.

You can extract the archive to a local directory, say
```
 /home/duncan/ClangLLVM/clang+llvm-3.8.0-x86_64-fedora23
```

Then we can install the package with 
R CMD INSTALL --configure-args='--with-clang=/home/duncan/ClangLLVM/clang+llvm-3.8.0-x86_64-fedora23' RCIndex_0.2-0.tar.gz
or 
```r
 install.packages("RCIndex", configure.args = c("--with-clang", "/home/duncan/ClangLLVM/clang+llvm-3.8.0-x86_64-fedora23"))
```

The --with-clang configuration parameter specifies the directory that contains the lib/ and include/ directories.

In some situations, the include/ and lib/ directories are not under the same directory. We can specify the include/ and lib/
directory with the --with-clang-include and --with-include-lib 
```
R CMD INSTALL 
  --configure-args='--with-clang-include=/home/duncan/ClangLLVM/clang+llvm-3.8.0-x86_64-fedora23/include --with-clang-lib=/home/duncan/ClangLLVM/clang+llvm-3.8.0-x86_64-fedora23/lib' 
 RCIndex_0.2-0.tar.gz
```


Instead of using the command line arguments via --configure-args and --with-clang, --with-clang-include, --with-clang-lib, 
we can use corresponding environment variables
```
  CLANG_LIB
  CLANG_INC
  CLANG_DIR
```
to the parent director, include/ and lib/ directories respectively in the extracted hierarchy, e.g.,

So one means to install this is
```
  wget http://llvm.org/releases/3.8.0/clang+llvm-3.8.0-i686-fedora23.tar.xz
  mkdir ClangLLVM
  cd ClangLLVM
  tar ../clang+llvm-3.8.0-i686-fedora23.tar.xz
 
 export CLANG_INC=${HOME}/ClangLLVM/clang+llvm-3.8.0-x86_64-fedora23/include
 export CLANG_LIB=${HOME}/ClangLLVM/clang+llvm-3.8.0-x86_64-fedora23/lib

  R CMD INSTALL RCIndex_0.3-0.tar.gz
```


An installation of clang+llvm on a machine from the prebuilt binaries may not work if the supporting libraries are not present.
For example, the following is output from R CMD INSTALL 
```
 unable to load shared object '/home/duncan/Rpackages/RCIndex/libs/RCIndex.so':
  /lib64/libc.so.6: version `GLIBC_2.15' not found (required by /home/duncan/ClangLLVM/clang+llvm-3.8.0-x86_64-fedora23/lib/libclang.so.3.8)
```
The issue is the version of libc and this requires updating or overriding other software on the machine.


On Ubuntu, you can install the necessary headers and libraries via the libclang-dev module:
```
sudo apt install libclang-dev
```

It is probably sensible to install clang and llvm.
