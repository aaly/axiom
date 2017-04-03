#!/bin/bash

repos=( "axiom-allocator" "axiom-evi-allocator-lib" "axiom-evi-nic" "axiom-evi-allocator-drv" "axiom-evi-apps" \
	"axiom-evi-extrae" "axiom-evi-gasnet" "axiom-evi-nanox" "axiom-evi-mcxx")

for repo in ${repos[@]}
do
	cd $repo
	git init
	git remote add origin https://git.axiom-project.eu/$repo
	if [[ "$repo" == "axiom-evi-allocator-drv" ]] || [[ "$repo" == "axiom-evi-nic" ]]
	then
		git pull origin axiom-x86-pci-ettore
	elif [[ "$repo" == "axiom-evi-gasnet" ]] || [[ "$repo" == "axiom-evi-extrae" ]] || [[ "$repo" == "axiom-evi-nanox" ]] || [[ "$repo" == "axiom-evi-mcxx" ]]
	then
		git pull origin axiom
	else
		git pull origin master
	fi
	#echo "git clone https://git.axiom-project.eu/$repo"
	cd ..
done


#sed -e 's/__ld/_ld/g' -i axiom-allocator/src/axiom_allocator.c
#sed -e 's/extern//g' -i axiom-allocator/src/axiom_allocator.c
#sed -e 's/#define USE_EXT_LDSCRIPT//g' -i axiom-allocator/src/axiom_allocator.c
sed -e '11 i\#define _GNU_SOURCE' -i axiom-evi-apps/axiom-run/master.c

sed -e 's/#define USE_EXT_LDSCRIPT/#ifdef __aarch64__\
#define USE_EXT_LDSCRIPT\
#endif/g' -i axiom-allocator/src/axiom_allocator.c

