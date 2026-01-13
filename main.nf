#!/usr/bin/env nextflow

nextflow.enable.dsl = 2


/*
========================================================================================
    VALIDATE & PRINT PARAMETER SUMMARY
========================================================================================
*/

// Under construction
WorkflowMain.initialise(workflow, params, log)

/*
========================================================================================
    IMPORT MAIN LOCAL MODULES/SUBWORKFLOWS
========================================================================================
*/

include { PTM_ANALYSIS_WORKFLOW } from './workflows/main'


/*
========================================================================================
    RUN MAIN WORKFLOW
========================================================================================
*/

// Info required for completion email and summary
def multiqc_report = []

//
// WORKFLOW: Execute the named workflow for the pipeline
//
workflow {
    // Execute main workflow
    PTM_ANALYSIS_WORKFLOW()
}

/*
========================================================================================
    THE END
========================================================================================
*/
