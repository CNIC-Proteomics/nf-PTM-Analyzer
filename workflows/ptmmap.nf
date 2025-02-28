/*
========================================================================================
    IMPORT LOCAL MODULES/SUBWORKFLOWS
========================================================================================
*/

include { PTM_MAP } from '../nf-modules/modules/ptm_analysis/ptmmap/main'

/*
========================================================================================
    RUN MAIN WORKFLOW
========================================================================================
*/

workflow PTMMAP {

    take:
    input_file
    params_file

    main:
    //
    // SUBMODULE: Optimize the spectral count threshold at each integration step
    //
    PTM_MAP('04', input_file, params_file)

    // return channels
    ch_odir = PTM_MAP.out.odir

    emit:
    odir = ch_odir
}

/*
========================================================================================
    THE END
========================================================================================
*/
