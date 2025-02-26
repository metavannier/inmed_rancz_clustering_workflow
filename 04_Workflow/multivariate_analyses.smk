rule multivariate_analyses:
    input:
        data = expand(RAWDATA + config["data"]["file"]),
        mutant_data = expand(RAWDATA + config["data"]["mutant_file"]),

    output:
        multivariate_analyses_output = expand(OUTPUTDIR + "multivariate_analyses/multivariate_analyses_output.txt"),

    params:
        test = config["normality"]["test"],
        VariablesNotSelected = config["variables"]["notselected"].split(','),

    conda:
        CONTAINER + "multivariate_analyses.yaml"

    message:
        "Run the multivariate analysis and generate the report"

    script:
        SCRIPTDIR + "multivariate_analyses_reports_compilation.R"