# Today is 15th of August 2025
# I want to make note for recovery of ES pipeline
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
- I have installed Java 21 BUT faced an error for requiring Java 17

## Java installation
sudo apt update
sudo apt install openjdk-17-jdk

- Again faced an error despite i have installed Java 17 as well as Java 21 
- Solution --> switch between different versions of Java // I can change it to java 21 whenever I want 
sudo apt install java-common
sudo update-java-alternatives --list # set to java 17
sudo update-java-alternatives --set <version-name>

## git-lfs
gwet https://github.com/git-lfs/git-lfs/releases/download/v3.7.0/git-lfs-linux-amd64-v3.7.0.tar.gz
tar xvzf git-lfs-linux-amd64-v3.7.0.tar.gz
cd git-lfs-3.7.0/
sudo ./install.sh


## R installation
sudo apt update -qq
sudo apt install --no-install-recommends software-properties-common dirmngr
wget -qO- https://cloud.r-project.org/bin/linux/ubuntu/marutter_pubkey.asc | sudo tee -a /etc/apt/trusted.gpg.d/cran_ubuntu_key.asc
sudo add-apt-repository "deb https://cloud.r-project.org/bin/linux/ubuntu $(lsb_release -cs)-cran40/"
sudo apt install --no-install-recommends r-base

## R Libraries

- r-base=4.3.1
- r-data.table=1.14.8
- r-dplyr=1.1.3
- r-getopt=1.20.4
- r-ggplot2=3.4.4
- r-gplots=3.1.3
- r-gsalib=2.2.1
- r-optparse=1.7.3
- r-backports=1.4.1


## requirements:(for build) Java 17 JDK // Git 2.5 // git-lfs // Gradle 5.6. // R 4.3.1 // conda (between Anaconda and Miniconda,I chose Anaconda but it was wrong, best way is miniconda that is same version of gatk development)

" GATK4 uses the Conda package manager to establish and manage the Python environment and dependencies required by Python-based GATK tools. This environment also includes the R dependencies used for plotting in some of the tools. "

## Conda --> It was recommended to use same miniconda version that was used for gatk development 

wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.10.0-1-Linux-x86_64.sh  
bash Miniconda3-py310_23.10.0-1-Linux-x86_64.sh -p /opt/miniconda -b 
- diable autoupdate of conda
conda config --set auto_update_conda false
- set solver to be mamba
conda config --set solver libmamba

# ./gradlew in build will install Gradle 5.6. automatically

# building GATK
cd /opt
sudo git clone https://github.com/broadinstitute/gatk.git
cd gatk-4.6.2.0/
sudo ./gradlew

# add gatk to path
sudo nano .bashrc
export PATH="$PATH:/opt/gatk/"
source .bashrc

######## gatk installation is done


# Installing samtools
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
