# ----------------------------------------------
# This script is used to launch the compilation
# of the RMarkdown report for the velocity analyses with URD 
# independently of Rstudio interface
# ----------------------------------------------

WORKING_DIR = getwd()

SCRIPTDIR = file.path( WORKING_DIR, "03_Script")
OUTPUTDIR = file.path( WORKING_DIR, "05_Output")


rmarkdown::render( input = file.path(SCRIPTDIR, "multivariate_analyses.Rmd"),
                output_dir = file.path(OUTPUTDIR),
                output_file = "multivariate_analyses.html",
                quiet = FALSE)
