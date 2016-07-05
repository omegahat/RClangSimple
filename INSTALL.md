# UNIX
To install on Linux, install llvm + clang.
You can download pre-built binaries from
    http://llvm.org/releases/download.html

Install the relevant one for your Linux distribution.
Use lsb_release -a to find the name of your Linux release.
Use Fedora for Scientific Linux Release.

You can extract the archive to a local directory, say
```
mkdir ~/ClangLLVM
tar Jxf clang+llvm-3.8.0-x86_64-fedora23.tar.xz -C ~/ClangLLVM
```
to create
```
/home/duncan/ClangLLVM/clang+llvm-3.8.0-x86_64-fedora23
```

Then we can install the package with 
```
 R CMD INSTALL --configure-args='--with-clang=/home/duncan/ClangLLVM/clang+llvm-3.8.0-x86_64-fedora23' RCIndex_0.2-0.tar.gz
```
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

## Ubuntu

On Ubuntu, you can install the necessary headers and libraries via the libclang-dev module:
```
sudo apt install libclang-dev
```
It is probably sensible to install clang and llvm.


# Windows

You can download a self-installing executable for LLVM and Clang at 
 http://llvm.org/releases/download.html
Choose the 64 or 32  bit version corresponding to the characteristics of the R you currently have installed.
Download the file and launch it. It will install the necessary files in 
```
C:/Program Files/LLVM
```
This directory will contain the include/, bin/ and lib/ directories, amongst others.

We have a bin/libclang.dll and lib/libclang.lib. However, we need to create a libclang.a
in order to create the RCIndex shared library (RCIndex.dll).
To create this, we use the commands
```
pexports.exe libclang.dll > libclang.def
dlltool -U -d libclang.def -l libclang.a
```
This requires installing pexports which can be [downloaded
from here](https://sourceforge.net/projects/mingw/files/MinGW/Extension/pexports/).
Place the pexports.exe executable in your path, e.g. in `C:/Rtools/bin`.

If libclang.a is not in LLVM/bin/, the configure.win script will create it.

