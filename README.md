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


## Notes

* The CMake files do not provide any install options yet (not needed for now)
* License -> [please review the license of the AXIOM project](http://git.axiom-project.eu/axiom-allocator/blob/master/COPYING)

