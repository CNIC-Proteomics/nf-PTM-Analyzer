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

include { NM_PY_COMPARE } from '../nf-modules/modules/ptm_analysis/nmpycompare/main'

/*
========================================================================================
    RUN MAIN WORKFLOW
========================================================================================
*/

workflow NMPYCOMPARE {

    take:
    input_file
    params_file

    main:
    //
    // SUBMODULE: calculate NM-corrected values
    //
    NM_PY_COMPARE('02', input_file, createYamlParamStrChannel(params_file, ['General','NMpyCompare'])) // generate string with the current parameters from the given file

    // return channels
    ofile = NM_PY_COMPARE.out.ofile

    emit:
    ofile
}

/*
========================================================================================
    THE END
========================================================================================
*/
