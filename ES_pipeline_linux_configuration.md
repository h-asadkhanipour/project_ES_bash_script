# Enabling sharefolder
## requirement: open-vm-tools
sudo apt update && sudo apt install open-vm-tools open-vm-tools-desktop
sudo mkdir -p /mnt/hgfs


# add this line to /etc/fstab for auto nount
.host:/ /mnt/hgfs fuse.vmhgfs-fuse	auto,allow_other	0	0


# Customize terminal to be full screen at startup and have increase font size
right click on terminal > preferences > initial terminal size 240 * 100 // font 16 //


# Install tree for better view of files and directories
sudo apt-get install tree


# Installing make 
sudo apt-get install build-essential
sudo apt-get install cmake


# Installing git 
sudo apt-get install git
sudo add-apt-repository ppa:git-core/ppa
sudo apt update; sudo apt install git


# Installing curl
sudo snap install curl


# Installing full version of vim // text editor
sudo apt install vim-gtk3


# Installing plocate // for searching whole systemfiles 
sudo apt install plocate
- each time before use --> sudo updatedb


# Installing htop // for better view of processes and whole system load and status
sudo apt install htop


# Install pigz for more efficient compression of files // more efficient that gzip
sudo apt install pigz


# my prefered path for programs like fastqc --> /opt

# FastQC
- requirements: Java Runtime Environment // Perl 

- download compiled file and extract it
- add it to path
	sudo nano .bashrc
	export PATH="$PATH:/opt/FastQC/"
	source .bashrc


# fastp
- it is available on bioconda BUT may not be the latest version // better to install from prebuilt binary
- wget http://opengene.org/fastp/fastp
- chmod a+x ./fastp
- add it to path
	sudo nano .bashrc
	export PATH="$PATH:/opt/"
	source .bashrc


# bwa
- requirements: zlib
	- zlib installation from source file
	tar xvzf zlib-1.3.1.tar.gz
	cd zlib-1.3.1
	./configure
	make test
	sudo make install
	- check for proper installation --> dpkg -s zlib1g-dev // can delete source files
- bwa installation
sudo git clone https://github.com/lh3/bwa.git
cd bwa/
sudo make
- add it to path
	sudo nano .bashrc
	export PATH="$PATH:/opt/bwa/"
	source .bashrc


# GATK
- requirements:(for run) Java 17 // Python 3.10.13 // R 4.3.1

## Java installation
sudo apt update
sudo apt install openjdk-17-jdk


- requirements:(for build) Java 17 JDK // Git 2.5 // git-lfs // Gradle 5.6. // R 4.3.1 // conda (between Anaconda and Miniconda,I chose Anaconda but it was wrong, best way is miniconda that is same version of gatk development)

## git-lfs
gwet https://github.com/git-lfs/git-lfs/releases/download/v3.7.0/git-lfs-linux-amd64-v3.7.0.tar.gz
tar xvzf git-lfs-linux-amd64-v3.7.0.tar.gz
cd git-lfs-3.7.0/
sudo ./install.sh


" GATK4 uses the Conda package manager to establish and manage the Python environment and dependencies required by Python-based GATK tools. This environment also includes the R dependencies used for plotting in some of the tools. "

## Conda --> It was recommended to use same miniconda version that was used for gatk development 

wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.10.0-1-Linux-x86_64.sh  
bash Miniconda3-py310_23.10.0-1-Linux-x86_64.sh -p /opt/miniconda -b 
- diable autoupdate of conda
conda config --set auto_update_conda false
- set solver to be mamba
conda config --set solver libmamba

- install environment dependencies with ES_pipeline_env_configuration.yml file
conda env update --name base --file ES_pipeline_env_configuration.yml
 

# ./gradlew in build will install Gradle 5.6. automatically

# building GATK
cd /opt
sudo git clone https://github.com/broadinstitute/gatk.git
cd gatk-4.6.2.0/
sudo ./gradlew


# Installing samtools, htslib, bedtools
- download from offitial website: htslib.org/download/
- extract via --> tar -xvjf 
- requirenemt: 
	- sudo apt-get install libbz2-dev
	- sudo apt-get install liblzma-dev
	- sudo apt-get install libcurl4-openssl-dev
	- sudo apt-get install libcurl4-nss-dev
	- sudo apt-get install libcurl4-gnutls-dev
	- sudo apt-get install libncurses5-dev
- sudo ./configure
- sudo make
- sudo make install 


# Installing annovar
- register on website and download annovar.latest.tar.gz  
- extract annovar.latest.tar.gz in /opt directory (you must have sudo permission)
- mv example/ and humandb/ directories to ngsdb/annovar_data/
- edit ~/.bashrc and add this alias:
	- export PATH="$PATH:/opt/annovar/"
- download data with annovar_data_download_script.sh


