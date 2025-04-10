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

include { MERGE_QUANT_PDM } from '../nf-modules/modules/ptm_analysis/mergequantpdm/main'

/*
========================================================================================
    RUN MAIN WORKFLOW
========================================================================================
*/

workflow MERGEQUANTPDM {

    take:
    quant_file
    pdm_file

    main:
    //
    // SUBMODULE: Merge the quantification report (from iSanXoT) with the PDM table
    //
    MERGE_QUANT_PDM('01', quant_file, pdm_file)

    // return channels
    ch_ofile   = MERGE_QUANT_PDM.out.ofile

    emit:
    ofile = ch_ofile
}

/*
========================================================================================
    THE END
========================================================================================
*/
