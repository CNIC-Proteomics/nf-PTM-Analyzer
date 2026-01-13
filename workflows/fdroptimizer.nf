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

include { FDR_OPTIMIZER } from '../nf-modules/modules/ptm_analysis/fdroptimizer/main'

/*
========================================================================================
    RUN MAIN WORKFLOW
========================================================================================
*/

workflow FDROPTIMIZER {

    take:
    input_file
    params_file

    main:
    //
    // SUBMODULE: Optimize the spectral count threshold at each integration step
    //
    FDR_OPTIMIZER('04', input_file, createYamlParamStrChannel(params_file, ['General','FDRoptimizer'])) // generate string with the current parameters from the given file

    // return channels
    ofile = FDR_OPTIMIZER.out.ofile

    emit:
    ofile
}

/*
========================================================================================
    THE END
========================================================================================
*/
