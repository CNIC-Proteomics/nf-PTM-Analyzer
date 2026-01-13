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

include { MERGE_QUANT_PGM } from '../nf-modules/modules/ptm_analysis/mergequantpgm/main'

/*
========================================================================================
    RUN MAIN WORKFLOW
========================================================================================
*/

workflow MERGEQUANTPGM {

    take:
    quant_file
    pgm_file

    main:
    //
    // SUBMODULE: Merge the quantification report (from iSanXoT) with the PDM table
    //
    MERGE_QUANT_PGM('01', quant_file, pgm_file)

    // return channels
    ofile = MERGE_QUANT_PGM.out.ofile

    emit:
    ofile
}

/*
========================================================================================
    THE END
========================================================================================
*/
