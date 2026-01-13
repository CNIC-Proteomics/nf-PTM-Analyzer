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

include { QREPORT_PTMMAP_MAKER } from '../nf-modules/modules/ptm_analysis/qreportptmmapmaker/main'

/*
========================================================================================
    RUN MAIN WORKFLOW
========================================================================================
*/

workflow QREPORTPTMMAPMAKER {

    take:
    input_file
    qmeta_file
    params_file

    main:
    //
    // SUBMODULE: Create the PTM maps and obtains the significant changes of proteins
    //
    QREPORT_PTMMAP_MAKER('05', input_file, qmeta_file, createYamlParamStrChannel(params_file, ['General','PTMMap','qReportMaker'])) // generate string with the current parameters from the given file

    // return channels
    PTMmaps           = QREPORT_PTMMAP_MAKER.out.PTMmaps
    PTMmaps_filtered  = QREPORT_PTMMAP_MAKER.out.PTMmaps_filtered
    qReports          = QREPORT_PTMMAP_MAKER.out.qReports
    FreqTables        = QREPORT_PTMMAP_MAKER.out.FreqTables

    emit:
    PTMmaps
    PTMmaps_filtered
    qReports
    FreqTables
}

/*
========================================================================================
    THE END
========================================================================================
*/
