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

cp -rf allocator-patch/patch/* axiom-allocator/src/
sed -e 's/#define USE_EXT_LDSCRIPT/#ifdef __aarch64__\
#define USE_EXT_LDSCRIPT\
#endif/g' -i axiom-allocator/src/axiom_allocator.c



echo '	axiom_libraries_CFLAGS=""
	AC_SUBST([axiom_libraries_CFLAGS])
	evidence_lmm_CFLAGS=""
	AC_SUBST([evidence_lmm_CFLAGS])' >> axiom-evi-gasnet/configure.in

sed -e 's/PKG_CHECK_MODULES(\[axiom/#PKG_CHECK_MODULES(\[axiom/g' -i axiom-evi-gasnet/configure.in
sed -e 's/PKG_CHECK_MODULES(\[evidence_lmm\]/#PKG_CHECK_MODULES(\[evidence_lmm\]/g' -i axiom-evi-gasnet/configure.in

sed -e 's|CONDUIT_EXTRALIBCFLAGS =|CONDUIT_EXTRALIBCFLAGS = @axiom_libraries_CFLAGS@ @evidence_lmm_CFLAGS@ -I$(srcdir)/../../axiom-evi-nic/include -I$(srcdir)/../../axiom-evi-apps/include -I$(srcdir)/../../axiom-allocator/include |g' -i axiom-evi-gasnet/axiom-conduit/Makefile.am
sed '/#include <gasnet_core_internal.h>/ a #include <time.h>' -i axiom-evi-gasnet/axiom-conduit/gasnet_core.c 


cp nanoxMakefile.am axiom-evi-nanox/src/arch/cluster/Makefile.am
