#!/bin/bash

# This script will download default data for hg38 reference genome
# You can edit this script for another reference genome e.g. hg19
# You can change buildver from hg38 to hg19 BUT data may not be available for hg19
# Checkout https://annovar.openbioinformatics.org/en/latest/ for more information
# Make sure you have install table_annovar as it was instructed in ES_pipeline_linux_configuration.md file
# It is recommended to run an download each data separately 

# set directory for annovar data
# your directory must end to /ngsdb/annovar_data/humandb/

# Caution:
# directory for your download with annotate_variation should be on your system
# If download in mounted directory. Extraction with gzip will fail and you will face this error:
# gzip: hg38_refGene.txt: Value too large for defined data type


# You have two options for downloading data
# First option: you can download your data with annotate_variation.pl program 
# that was recommended in annovar documentation
# this method will download data and then extract data after download.
# Second option: you can download your data with wget downloader (if your internet connection is unstable)


##############################################################################
# set download directory
# set the number of threads
##############################################################################

annovar_data="/home/happy/annovar_data/humandb/"
threads=12

##############################################################################

read -p " Did you set annovar_data download directory? (Press y/n): " ad_set
if [ $ad_set == n ]; then
	exit
elif [ $ad_set == y ]; then
	echo " You can continue "
else
	echo " wrong input , run again "
	exit
fi


read -p " Select between fisrt option and second option for data download: (Enter first/second):" download_option
if [ $download_option == first ]; then

##############################################################################
# First option for download - annotate_variation.pl
##############################################################################

# Following data will be downloaded separately // maybe some files are not available in future
	annotate_variation.pl -buildver hg38 -downdb refGene -webfrom annovar $annovar_data
	annotate_variation.pl -buildver hg38 -downdb knownGene -webfrom annovar $annovar_data
	annotate_variation.pl -buildver hg38 -downdb ensGene -webfrom annovar $annovar_data
	annotate_variation.pl -buildver hg38 -downdb dbnsfp47a -webfrom annovar $annovar_data
	annotate_variation.pl -buildver hg38 -downdb intervar_20250721 -webfrom annovar $annovar_data
	annotate_variation.pl -buildver hg38 -downdb logofunc -webfrom annovar $annovar_data
	annotate_variation.pl -buildver hg38 -downdb gnomad41_exome -webfrom annovar $annovar_data
	annotate_variation.pl -buildver hg38 -downdb regeneron -webfrom annovar $annovar_data
	annotate_variation.pl -buildver hg38 -downdb allofus -webfrom annovar $annovar_data
	annotate_variation.pl -buildver hg38 -downdb revel -webfrom annovar $annovar_data
	annotate_variation.pl -buildver hg38 -downdb avsnp151 -webfrom annovar $annovar_data
	annotate_variation.pl -buildver hg38 -downdb clinvar_20250721 -webfrom annovar $annovar_data
	echo " All data has been downloaded "

elif [ $download_option == second ]; then

##############################################################################
# Second option for download - wget
##############################################################################

	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_refGene.txt.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_refGeneMrna.fa.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_refGeneVersion.txt.gz \
		-P $annovar_data

	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_knownGene.txt.gz \
		-P $annvar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_knownGeneMrna.fa.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_kgXref.txt.gz \
		-P $annovar_data


	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_ensGene.txt.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_ensGeneMrna.fa.gz \
		-P $annovar_data


	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_dbnsfp47a.txt.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_dbnsfp47a.txt.idx.gz \
		-P $annovar_data

	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_intervar_20250721.txt.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_intervar_20250721.txt.idx.gz \
		-P $annovar_data

	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_logofunc.txt.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_logofunc.txt.idx.gz \
		-P $annovar_data

	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_gnomad41_exome.txt.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_gnomad41_exome.txt.idx.gz \
		-P $annovar_data

	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_regeneron.txt.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_regeneron.txt.idx.gz \
		-P $annovar_data

	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_allofus.txt.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_allofus.txt.idx.gz \
		-P $annovar_data

	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_revel.txt.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_revel.txt.idx.gz \
		-P $annovar_data

	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_avsnp151.txt.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_avsnp151.txt.idx.gz \
		-P $annovar_data

	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_clinvar_20250721.txt.gz \
		-P $annovar_data
	wget -c  http://www.openbioinformatics.org/annovar/download/hg38_clinvar_20250721.txt.idx.gz \
		-P $annovar_data

	pigz -p $threads -dv ${annovar_data}/hg38*.gz
	echo " All data has been downloaded and extracted " 
else
	echo " wrong input , run again "
	exit
fi


##############################################################################
# Data information 
##############################################################################

## Build,Table Name,Explanation,Date
# For gene-based annotation
## hg38,refGene,FASTA sequences for all annotated transcripts in RefSeq Gene (last update was 2020-08-17 at UCSC),20211019
## hg38,knownGene,FASTA sequences for all annotated transcripts in UCSC Known Gene (last update was 2022-05-15 at UCSC),20211019
## hg38,ensGene,FASTA sequences for all annotated transcripts in Gencode v46 Basic collection (last update was 2024-05-13 at UCSC),20241008
# For filter-based annotation
## hg38,dbnsfp47a,dbNSFP v4.7 academic (have more datasets compared to commercial version),20240525
## hg38,intervar_20250721, InterVar: clinical interpretation of missense variants (indels not supported),20250721
## hg38,logofunc,genome-wide GOF/LOF predictions reported in this paper,20250721
## hg38,gnomad41_exome,version 4.1 whole-exome data,20240602
## hg38,allofus,whole-genome data from first ~250k srWGS in All of Us,20250321
## hg38,regeneron,regeneron exome,20250321
## hg38,revel,REVEL scores for non-synonymous variants,20161205
## hg38,avsnp151,dbSNP151 with allelic splitting,20240525
## hg38,clinvar_20250721,Clinvar version 20250721 with separate columns for germline variants, oncogenecity variants and somatic variants),20250721

# file size for download and after extraction:
# refGene file size is 8MB and after extraction is 25MB
# knownGene file size is 11MB and after extraction is 52MB
# ensGene file size is 6MB and after extraction is 28MB
# dbnsfp file size is 21GB and after extraction is 82GB
# intervar file size is 1.1GB and after extraction is 28GB
# logofunc file size is 3.4GB and after extraction is 16GB
# gnomad41_exome is 2.7GB and after extraction is 18GB
# regeneron file size is 644MB and after extraction is 2.7GB
# allofus file size is 11G and after extraction is 80GB
# revel file size is 395MB and after extraction is 2.4GB
# avsnp151 file size is 7.5GB and after extraction is 28GB
# clinvar_20250721 file size is 52MB and after extraction is 737MB

# Total size of data for downloading is: 49GB
# Total size of data after extraction is: 258GB 


##############################################################################
# Following line shows protocol and operation for table_annovar.pl
# If one or more dataset was not available or was not important for you,
# change protocol and operation according to you preferance
##############################################################################

# protocol:  refGene,knownGene,ensGene,dbnsfp47a,intervar_20250721,logofunc,gnomad41_exome,regeneron,allofus,revel,avsnp151,clinvar_20250721
# operation: gx,g,g,f,f,f,f,f,f,f,f,f

