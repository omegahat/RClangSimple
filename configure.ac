AC_INIT(src/clang.c)

dnl R CMD INSTALL --configure-args='--with-clang=/home/login/lang+llvm-3.5.0-macosx-apple-darwin' RCIndex_0.3-0.tar.gz
AC_ARG_WITH([clang], [--with-clang], [ CLANG_INC="$withval/include"; CLANG_LIB="$withval/lib" ])

dnl If we have to specify the include and lib directories separately.
AC_ARG_WITH([clang-include], [--with-clang-include], CLANG_INC="$withval")
AC_ARG_WITH([clang-lib], [--with-clang-lib], CLANG_LIB="$withval")


if ! test "x$CLANG_DIR" = "x" ; then
  if test -z "$CLANG_LIB" ; then
     if test -d ${CLANG_DIR}/lib ; then
        CLANG_LIB=$CLANG_DIR/lib
     elif test -d ${CLANG_DIR}/build/Debug+Asserts/lib ; then
        CLANG_LIB=$CLANG_DIR/build/Debug+Asserts/lib
     fi
  fi
  if test -z "$CLANG_INC" && test -d ${CLANG_DIR}/tools/clang/include/clang-c ; then
     CLANG_INC=$CLANG_DIR/tools/clang/include
  fi
fi

if test -z "$CLANG_LIB" || test -z "$CLANG_INC" ; then
 echo "Trying to find include and library directories via llvm-config"
 if test -z "${LLVM_CONFIG}" ; then
   AC_PATH_PROG(LLVM_CONFIG, llvm-config, , ${PATH})
 elif ! (test -f "$LLVM_CONFIG" && test -x "$LLVM_CONFIG") ; then
    echo "${LLVM_CONFIG} is not an executable command"
    exit 1;
 fi


 if test -n "${LLVM_CONFIG}" ; then

    TMP=`${LLVM_CONFIG}  --includedir`
    if test -d $TMP/clang-c && test -e $TMP/clang-c/Index.h ; then 
       CLANG_INC=$TMP
       echo "Found clang-c at $TMP/clang-c"
    else
       echo "*** Couldn't find clang-c using ${LLVM_CONFIG}"
    fi

    TMP=`${LLVM_CONFIG}  --libdir`
    if test -e $TMP/libclang.so || test -e $TMP/libclang.a || test -e $TMP/libclang.dylib ; then 
       CLANG_LIB=$TMP
       echo "Found libclang at $CLANG_LIB"
    else
       echo "*** Couldn't find libclang using ${LLVM_CONFIG}"
    fi
  fi
fi


if test -z "$CLANG_LIB" || test -z "$CLANG_INC" ; then

  if test -r $HOME/llvm-devel/tools/clang/include/clang-c ; then
     CLANG_INC=$HOME/llvm-devel/tools/clang/include/
  fi
  if test -r $HOME/llvm-devel/build/Debug+Asserts/lib ; then
     CLANG_LIB=$HOME/llvm-devel/build/Debug+Asserts/lib
  fi

  if test -z "$CLANG_LIB" || test -z "$CLANG_INC" ; then

  if test -z "$CLANG_INC" ; then
    echo "****   for now, you must specify the directory containing the clang includes, e.g. .../clang/include"
    echo "      e.g. /Users/duncan/Projects/Rspeedup/llvm-devel/tools/clang/include/"
    echo "  Set the environment variable CLANG_INC or use --with-clang-include as a command line argument to configure, typically via R CMD INSTALL --configure-args='--with-clang-include=/my/dir/'"
  fi

  if test -z "$CLANG_LIB" ; then
    echo "****    for now, you must specify the directory containing the clang libraries, e.g .../clang/lib"
    echo "       e.g. /Users/duncan/Projects/Rspeedup/llvm-devel/Debug+Asserts/lib"
    echo "  Set the environment variable CLANG_LIB or use --with-clang-lib as a command line argument to configure, typically via R CMD INSTALL --configure-args='--with-clang-lib=/my/dir/'"
  fi

  exit 1
  fi
fi

if ! test -r $CLANG_INC/clang-c/Index.h; then 
  echo "Cannot find $CLANG_INC/clang-c/Index.h"
  echo "Is CLANG_INC correct?"
fi

# https://www.gnu.org/software/autoconf-archive/ax_compare_version.html
if test `uname` = "Darwin" ; then
    dnl https://coderwall.com/p/4yz8dq/determine-os-x-version-from-the-command-line
  OSX_VERSION=[`defaults read loginwindow SystemVersionStampAsString | sed -Ee 's/.[0-9]+$//'`]   # the [] are necessary due to the [] in the sed expression.
echo "Testing OSX version"
  echo "$OSX_VERSION >= 10.11" | bc
  if test $? ; then 
    CLANG_RPATH="-Wl,-rpath,$CLANG_LIB"
    echo "Setting CLANG_RPATH to $CLANG_RPATH"
  fi
  dnl  AX_COMPARE_VERSION($OSX_VERSION, [ge], [10.11.0], [CLANG_RPATH="-W,-rpath$CLANG_LIB"], [CLANG_RPATH=""])
fi


AC_PROG_CC

LIBCLANG_VERSION="NA"

echo "$CLANG_INC       $CLANG_LIB"
${CC} -o version -I$CLANG_INC  version.c -L$CLANG_LIB -lclang $CLANG_RPATH

if test "$?" != 0 ; then
  echo "Failed to compile ./version executable."
else
  LIBCLANG_VERSION=`./version`
fi




DEFINES=""

CFLAGS="-I$CLANG_INC"
AC_TRY_COMPILE([#include <clang-c/Index.h>
#include <clang-c/Documentation.h>
], [
CXComment com;
],
[ DEFINES="-DHAVE_DOCUMENTATION_H"])


echo "libclang version $LIBCLANG_VERSION"

AC_SUBST(CLANG_INC)
AC_SUBST(CLANG_LIB)
AC_SUBST(DEFINES)
AC_SUBST(CLANG_RPATH)
AC_SUBST(LIBCLANG_VERSION)

dnl AC_OUTPUT(src/Makevars R/config.R R/A.R)

AC_CONFIG_FILES(src/Makevars R/config.R R/A.R)
AC_OUTPUT
