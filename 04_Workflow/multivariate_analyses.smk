rule multivariate_analyses:
    input:
        data = expand(RAWDATA + config["data"]["file"]),

    output:
        multivariate_analyses_output = expand(OUTPUTDIR + "multivariate_analyses/multivariate_analyses_output.txt"),

    conda:
        CONTAINER + "multivariate_analyses.yaml"

    message:
        "Run the multivariate analysis and generate the report"

    script:
        SCRIPTDIR + "multivariate_analyses_reports_compilation.R"