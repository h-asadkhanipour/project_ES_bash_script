
###############################################################################
# defualt vcf modification and filtering 
###############################################################################
read -p " Do you want to modify annotated vcf? (Press y/n): " modification 
if [ $modification == y] ; then
	export annotated_vcf="${sample_dir}/annotation_filtering/after_anno.vcf.hg38_multianno.txt"
	export modified_vcf="${sample_dir}/annotation_filtering/modified_vcf.tsv"
	Rscript vcf_modification_R_script.R
	echo " Annotated vcf has been modified "
else
	exit
fi	


read -p " Do you want to filter modified vcf? (Press y/n): " filtering
if [ $filtering == y ]; then 
	echo " filtering stategy is not read yet "
	echo " This is the end, hold your breath and count to ten ... "

else
	echo " This is the end, hold your breath and count to ten ... "
	exit
fi
