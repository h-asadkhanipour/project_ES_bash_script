##############################################################################
# Linux general configuration
##############################################################################

# Enabling sharefolder
- requirement: open-vm-tools
- sudo apt update && sudo apt install open-vm-tools open-vm-tools-desktop
- sudo mkdir -p /mnt/hgfs


# add this line to /etc/fstab for auto mount
.host:/ /mnt/hgfs fuse.vmhgfs-fuse	auto,allow_other	0	0


# Customize terminal to be full screen at startup and have increase font size
right click on terminal > preferences > initial terminal size 240 * 100 // font 16 


# Installing git 
- sudo apt install git-all


# Install tree for better view of files and directories
- sudo apt-get install tree


# Installing make 
- sudo apt-get install build-essential
- sudo apt-get install cmake


# Installing curl
- sudo snap install curl


# Installing full version of vim // text editor // optional
- sudo apt install vim-gtk3 	


# Installing plocate // for searching whole systemfiles // optional
- sudo apt install plocate
- each time before use --> sudo updatedb


# Installing htop // for better view of processes and whole system load and status // optional
- sudo apt install htop


# Install pigz for more efficient compression of files // more efficient that gzip
- sudo apt install pigz


##############################################################################
# ES pipeline configuration
# my prefered path for programs like fastqc --> /opt
##############################################################################

# FastQC
- requirements: Java Runtime Environment // Perl 

- download compiled file and extract it
- cd ~/Downloads
- unzip fastqc_v0.12.1.zip
- move extracted directory to /opt
- sudo mv FastQC/ /opt 
- add it to path
	- cd 
	- sudo nano .bashrc
	- export PATH="$PATH:/opt/FastQC/"
	- source .bashrc


# fastp
- it is available on bioconda BUT may not be the latest version // better to install from prebuilt binary
- cd /opt && wget http://opengene.org/fastp/fastp
- chmod a+x ./fastp
- add it to path
	- cd
	- sudo nano .bashrc
	- export PATH="$PATH:/opt/"
	- source .bashrc


# bwa
- requirements: zlib
	- sudo apt install zlib1g-dev
- cd /opt && sudo git clone https://github.com/lh3/bwa.git
- cd bwa/
- sudo make
- add it to path
	- cd
	- sudo nano .bashrc
	- export PATH="$PATH:/opt/bwa/"
	- source .bashrc


# GATK
- requirements:(for run) Java 17 // Python 3.10.13 // R 4.3.1
- requirements:(for build) Java 17 JDK // Git 2.5 // git-lfs // Gradle 5.6. // R 4.3.1 // conda (between Anaconda and Miniconda,I chose Anaconda but it was wrong, best way is miniconda that is same version of gatk development)

# Java installation
- sudo apt update
- sudo apt install openjdk-17-jdk


# git-lfs // optional
- cd /opt && wget https://github.com/git-lfs/git-lfs/releases/download/v3.7.0/git-lfs-linux-amd64-v3.7.0.tar.gz
- tar xvzf git-lfs-linux-amd64-v3.7.0.tar.gz
- cd git-lfs-3.7.0/
- sudo ./install.sh


# Conda // better install in home directory
- cd && wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.10.0-1-Linux-x86_64.sh  
- bash Miniconda3-py310_23.10.0-1-Linux-x86_64.sh 
- source .bashrc
- diable autoupdate of conda
	- conda config --set auto_update_conda false
- set solver to be mamba
	- conda config --set solver libmamba
- install environment dependencies with ES_pipeline_env_configuration.yml file
	- cd project_ES_bash_script/	
	- conda env update --name base --file ES_pipeline_env_configuration.yml


# ./gradlew in build will install Gradle 5.6. automatically

# building GATK // better install in home directory
- sudo git clone https://github.com/broadinstitute/gatk.git
- cd gatk-4.6.2.0/
- sudo ./gradlew


# Installing samtools, htslib, bcftools
- requirenemt: 
	- sudo apt-get install libbz2-dev
	- sudo apt-get install liblzma-dev
	- sudo apt-get install libcurl4-openssl-dev
	- sudo apt-get install libcurl4-nss-dev
	- sudo apt-get install libcurl4-gnutls-dev
	- sudo apt-get install libncurses5-dev
- download each program from official website: htslib.org/download/
- cd Downloads/
- sudo mv *.bz2 /opt
- cd /opt
- for each program:
	- extract via --> tar -xvjf 
	- cd to each directory
	- sudo ./configure && sudo make && sudo make install


# Installing annovar
- register on website and download annovar.latest.tar.gz  
- extract annovar.latest.tar.gz in /opt directory (you must have sudo permission)
- mv example/ and humandb/ directories to ngsdb/annovar_data/
- sudo mv *.pl /opt
- add it to path
	- cd
	- sudo nano .bashrc
	- export PATH="$PATH:/opt/"
	- source .bashrc
- download data with annovar_data_download_script.sh


