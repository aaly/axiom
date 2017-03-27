#!/bin/bash

repos=("axiom-allocator" "axiom-evi-allocator-lib" "axiom-evi-nic" "axiom-evi-allocator-drv" "axiom-evi-apps")

for repo in ${repos[@]}
do
	cd $repo
	git init
	git remote add origin https://git.axiom-project.eu/$repo
	if [[ "$repo" == "axiom-evi-allocator-drv" ]] || [[ "$repo" == "axiom-evi-nic" ]]
	then
		git pull origin axiom-x86-pci-ettore
	else
		git pull origin master

	fi
	#echo "git clone https://git.axiom-project.eu/$repo"
	cd ..
done


#sed -e 's/__ld/_ld/g' -i axiom-allocator/src/axiom_allocator.c
#sed -e 's/extern//g' -i axiom-allocator/src/axiom_allocator.c
sed -e 's/#define USE_EXT_LDSCRIPT//g' -i axiom-allocator/src/axiom_allocator.c
