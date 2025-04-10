/*
========================================================================================
    IMPORT MODULES
========================================================================================
*/

include { createYamlParamStrChannel } from '../nf-modules/lib/Utils'

/*
========================================================================================
    IMPORT LOCAL MODULES/SUBWORKFLOWS
========================================================================================
*/

include { LIMMA_COMPARE } from '../nf-modules/modules/ptm_analysis/limmacompare/main'

/*
========================================================================================
    RUN MAIN WORKFLOW
========================================================================================
*/

workflow LIMMACOMPARE {

    take:
    input_file
    compa_file
    params_file

    main:
    //
    // SUBMODULE: Performs hypothesis testing using Limma package
    //
    LIMMA_COMPARE('03', input_file, compa_file, createYamlParamStrChannel(params_file, ['LimmaCompare'])) // generate string with the current parameters from the given file

    // return channels
    ch_ofile   = LIMMA_COMPARE.out.ofile

    emit:
    ofile = ch_ofile
}

/*
========================================================================================
    THE END
========================================================================================
*/
