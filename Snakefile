import pandas as pd
import numpy as np
import os
# srcdir = os.curdir 
from snakemake.utils import validate, min_version

##### set minimum snakemake version #####
min_version("5.1.2")

##### load config and sample sheets #####
configfile: "config.yaml"
validate(config, schema="06_Schemas/config.schema.yaml")

#### Set variables ####
ROOTDIR = os.getcwd()
RAWDATA = srcdir("00_RawData/")
CONTAINER = srcdir("02_Container/")
SCRIPTDIR = srcdir("03_Script/")
ENVDIR = srcdir("04_Workflow/")
OUTPUTDIR = srcdir("05_Output/")

# ----------------------------------------------
# Target rules
# ----------------------------------------------

rule all:
	input:
		multivariate_analyses_output = expand(OUTPUTDIR + "multivariate_analyses/multivariate_analyses_output.txt"),

# ----------------------------------------------
# Load rules 
# ----------------------------------------------

include: ENVDIR + "multivariate_analyses.smk"
