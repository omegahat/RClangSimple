RCIndex
=======

This package is an R interface to libclang's C interface.
This allows us to parse C code and access its elements
directly in R.  



To work with the git repository, you will need to create symbolic
links to RConverters.c and RConverters.h from the RAutoGenRunTime
package or repository.
You might do something like

```shell
git clone https://github.com/duncantl/Rnvvm
git clone https://github.com/omegahat/RAutoGenRunTime

cd Rnvvm/src
ln -s ../../RAutoGenRunTime/src/RConverters.c .
ln -s ../../RAutoGenRunTime/inst/include/RConverters.h .
```
