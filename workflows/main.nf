/*
========================================================================================
    IMPORT LOCAL MODULES/SUBWORKFLOWS
========================================================================================
*/

include { MERGEQUANTPDM } from './mergequantpdm'
include { NMPYCOMPARE } from './nmpycompare'
include { LIMMACOMPARE } from './limmacompare'
include { FDROPTIMIZER } from './fdroptimizer'
include { PTMMAP } from './ptmmap'
include {
    QREPORTMAKER;
    QREPORTPTMMAPMAKER
} from './qreportmaker'

//
// SUBWORKFLOW: Create input channels
//

include {
    CREATE_INPUT_CHANNEL_PTM_ANALYSIS
} from '../nf-modules/subworkflows/ptm_analysis'


//
// WORKFLOW: Run main analysis pipeline
//

workflow PTM_ANALYSIS_WORKFLOW {
    //
    // SUBWORKFLOW: Create input channels
    //
    CREATE_INPUT_CHANNEL_PTM_ANALYSIS()
    //
    // WORKFLOW: Merge the quantification report (from iSanXoT) with the PDM table
    //
    MERGEQUANTPDM(
        CREATE_INPUT_CHANNEL_PTM_ANALYSIS.out.ch_quant_file,
        CREATE_INPUT_CHANNEL_PTM_ANALYSIS.out.ch_pdm_file
    )
    //
    // WORKFLOW: Calculate NM-corrected values
    //
    NMPYCOMPARE(
        MERGEQUANTPDM.out.ofile,
        CREATE_INPUT_CHANNEL_PTM_ANALYSIS.out.ch_params_file
    )
    //
    // WORKFLOW: Performs hypothesis testing using Limma package
    //
    LIMMACOMPARE(
        NMPYCOMPARE.out.ofile,
        CREATE_INPUT_CHANNEL_PTM_ANALYSIS.out.ch_compa_file,
        CREATE_INPUT_CHANNEL_PTM_ANALYSIS.out.ch_params_file
    )
    //
    // WORKFLOW: Optimize the spectral count threshold at each integration step
    //
    FDROPTIMIZER(
        LIMMACOMPARE.out.ofile,
        CREATE_INPUT_CHANNEL_PTM_ANALYSIS.out.ch_params_file
    )
    // //
    // // WORKFLOW: Create PTM maps
    // //
    // PTMMAP(
    //     FDROPTIMIZER.out.ofile,
    //     CREATE_INPUT_CHANNEL_PTM_ANALYSIS.out.ch_params_file
    // )
    // //
    // // WORKFLOW: Calculate the significant changes of proteins
    // //
    // QREPORTMAKER(
    //     FDROPTIMIZER.out.ofile,
    //     CREATE_INPUT_CHANNEL_PTM_ANALYSIS.out.ch_params_file,
    //     PTMMAP.out.odir,
    //     CREATE_INPUT_CHANNEL_PTM_ANALYSIS.out.ch_qmeta_file
    // )
    //
    // WORKFLOW:Create the PTM maps and the significant changes of proteins
    //
    QREPORTPTMMAPMAKER(
        FDROPTIMIZER.out.ofile,
        CREATE_INPUT_CHANNEL_PTM_ANALYSIS.out.ch_qmeta_file,
        CREATE_INPUT_CHANNEL_PTM_ANALYSIS.out.ch_params_file
    )
}

/*
========================================================================================
    THE END
========================================================================================
*/
