# Cluster analysis of neuronal properties 

## Author

Thomas Vannier (@metavannier), https://centuri-livingsystems.org/t-vannier/

## About

This workflow performs a Snakemake pipeline to process cluster analysis of neuronal properties 

## Usage

You need to install conda to run a snakemake environment.

Each snakemake rules call a specific conda environment. In this way you can easily change/add tools for each step if necessary. 

### Step 1: Install workflow

You can use this workflow by downloading and extracting the latest release. If you intend to modify and further extend this workflow or want to work under version control, you can fork this repository.

We would be pleased if you use this workflow and participate in its improvement. If you use it in a paper, don't forget to give credits to the author by citing the URL of this repository and, if available, its [DOI](https://).

### Step 2: Configure workflow

Configure the workflow according to your needs via editing the files and repositories:
- 00_RawData need tabulated file with variable data on row for each cells in column.
- [config.yaml](/config.yaml) indicating the parameters to use.
- If necessary, comment the [Snakefile](/Snakefile) on the input line not expected for the pipeline.
- Build and run the snakemake version=6.3.0 environment :
`conda env create -f snakemake_env.yml` or `conda create -n snakemake_env -c conda-forge -c bioconda snakemake=6.3.0`
`conda activate snakemake_env`

### Step 3: Execute workflow

#### On your cumputer

- Then execute the workflow locally via

`snakemake --use-conda --conda-frontend conda --cores 12`

- To run again the workflow, you need to remove the file  05_Output/multivariate_analyses/multivariate_analyses_output.txt

#### On a cluster

- Adapt the batch scripts run_slurm.sh to run your snakemake from the working directory

It will install snakemake with pip and run the workflow in the HPC:

`sbatch run_slurm.sh`

### Step 4: Investigate results

After successful execution, you will find the a self-contained interactive HTML report with all results on the 05_Output/multivariate_analyses/multivariate_analyses.html

