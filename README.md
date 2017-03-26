  CMake files for the AXIOM project
========================================

This repository inclues the cmake lists skeleton for compiling the axiom repo

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


## Notes

* The CMake files do not provide install option yet (not needed for now)
* License -> please review the license of the AXIOM project  git.axiom-project.eu/axiom-allocator/blob/master/COPYING
