# Cluster analysis of neuronal properties 

## Author

Thomas Vannier (@metavannier), https://centuri-livingsystems.org/t-vannier/

## About

This workflow performs a Snakemake pipeline to process cluster analysis of neuronal properties 

## Usage

You need to install [Singularity](https://github.com/hpcng/singularity/blob/master/INSTALL.md#install-golang) on your computer. This workflow also work in a slurm environment.

Each snakemake rules call a specific conda environment. In this way you can easily change/add tools for each step if necessary. 

### Step 1: Install workflow

You can use this workflow by downloading and extracting the latest release. If you intend to modify and further extend this workflow or want to work under version control, you can fork this repository.

We would be pleased if you use this workflow and participate in its improvement. If you use it in a paper, don't forget to give credits to the author by citing the URL of this repository and, if available, its [DOI](https://).

### Step 2: Configure workflow

Configure the workflow according to your needs via editing the files and repositories:
- 00_RawData need tabulated file with variable data on row for each cells in column.
- [config.yaml](/config.yaml) indicating the parameters to use.
- Comment the [Snakefile](/Snakefile) on the input line not expected for the pipeline.
- Build the singularity image of mambaforge:23.1.0-1 and cellranger v6.0.0 (file to large for a github repository):

`singularity build mambaforge:23.1.0-1.sif docker://condaforge/mambaforge:23.1.0-1`
`mv mambaforge:23.1.0-1.sif 02_Container/`

`singularity build cellranger.sif docker://litd/docker-cellranger:v7.1.0`
`mv cellranger.sif 02_Container/`

### Step 3: Execute workflow

#### On your cumputer

- You need [Singularity v3.5.3](https://github.com/hpcng/singularity/blob/master/INSTALL.md#install-golang) installed on your computer or cluster.

- Load snakemake from a docker container and run the workflow from the working directory by using these commands:

`singularity run --bind ${PWD}:${PWD} docker://snakemake/snakemake:v6.3.0`

- Then execute the workflow locally via

`snakemake --use-conda --use-singularity --cores 12`

#### On a cluster

- Adapt the batch scripts run_slurm.sh to run your snakemake from the working directory

It will install snakemake with pip and run the workflow in the HPC:

`sbatch run_slurm.sh`

### Step 4: Investigate results

After successful execution, you can create a self-contained interactive HTML report with all results via:

`snakemake --report global_report.html`
