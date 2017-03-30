  CMake files for the AXIOM project
========================================

This repository includes the cmake lists skeleton for compiling the axiom repo

![Alt Axiom software Architecture map ](architecture.png?raw=true "Architecture map")


## How to compile

```
# execute the following to update all supported repos (only repos with CMake lists file)
./updateRepos.sh


# run cmake to generate Makefiles
cmake .

# run make to start compiling
make
```

## Make options

```
# to have a verbose output
make VERBOSE=1
```
```
# to see available make targets
make help
```

## How to install

in order to install the files make sure you run the "cmake ." command first

```
# assign whichever installation path you like to DESTDIR
make DESTDIR=/
```

## How to build a debian/ubuntu package

```
# first update all repos 
./updateRepos.sh

```

```
# run package making script
./makePkg.sh

```


## Notes

* License -> [please review the license of the AXIOM project](http://git.axiom-project.eu/axiom-allocator/blob/master/COPYING)

