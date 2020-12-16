# Acknowledgements
I forged this pipeline from https://github.com/angelovangel/nextflow-bcl and started to use it as training pipeline to adjust it to our server structure and also to
familiarize myself further with Nextflow. Possibly I'll try to translate it to DSL2.

# Preparations
First, create a docker image like this (On Ubuntu 20.04 you can currently install docker by typing `sudo apt-get install -y docker.io`)

```bash
sudo docker build -t fischuu/bcl:0.2 -t fischuu/bcl:latest .
sudo docker login
sudo docker push fischuu/bcl
singularity build bcl.sif docker://fischuu/bcl
```

# nextflow-bcl

A simple [nextflow](https://www.nextflow.io/) pipeline for obtaining Illumina run metrics (InterOp) and generation of fastq files (bcl2fastq). The input is an Illumina run folder (with bcl files) a SampleSheet.csv file
as well as an output folder. So far tested with runs from NextSeq and MiSeq machines. Run it with:

```bash
module load bioconda
conda activate nextflow
nextflow run main.nf --runfolder /scratch/project_2001881/200608_NB551722_0012_AHCKCTAFX2
nextflow run main.nf --runfolder /scratch/project_2001881/200806_NB551722_0013_AHYGFLBGXC
nextflow run main.nf --runfolder /scratch/project_2001881/200817_NB551722_0014_AHY5GCBGXC
nextflow run main.nf --runfolder /scratch/project_2001881/200930_NB551722_0015_AH2J53BGXF
nextflow run main.nf --runfolder /scratch/project_2001881/201110_NB551722_0016_AHYGMKBGXC
nextflow run main.nf --runfolder /scratch/project_2001881/201119_NB551722_0017_AH2HJ5BGXF
nextflow run main.nf --runfolder /scratch/project_2001881/201204_NB551722_0018_AH2HWGBGXF
nextflow run main.nf --runfolder /scratch/project_2001881/201214_NB551722_0019_AHYGCTBGXC

```

The pipeline runs uses a docker container translated into a singularity image, so no need to install anything (except nextflow of course). It executes the Illumina programs [InterOp](https://github.com/Illumina/interop) summary and [bcl2fastq](https://emea.support.illumina.com/sequencing/sequencing_software/bcl2fastq-conversion-software.html), saves the fastq files in the outfolder (default: `results-bcl/fastq/`), and generates a [MultiQC](https://multiqc.info/) report. That's it!  

*Tip* - you can then run the [angelovangel/fastp](https://github.com/angelovangel/nextflow-fastp) pipeline on the fastq files to get data on their quality and filter/trim them.   

And finally, if you don't have nextflow [go get it!](https://www.nextflow.io/)  
Cheers!
