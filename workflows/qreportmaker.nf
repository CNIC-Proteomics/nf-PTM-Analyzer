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

include { QREPORT_MAKER } from '../nf-modules/modules/ptm_analysis/qreportmaker/main'
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
    QREPORT_PTMMAP_MAKER('05', input_file, qmeta_file, createYamlParamStrChannel(params_file, ['PTMMap','qReportMaker'])) // generate string with the current parameters from the given file

    // return channels
    ch_PTMmaps           = QREPORT_PTMMAP_MAKER.out.PTMmaps
    ch_PTMmaps_filtered  = QREPORT_PTMMAP_MAKER.out.PTMmaps_filtered
    ch_qReports          = QREPORT_PTMMAP_MAKER.out.qReports
    ch_FreqTables        = QREPORT_PTMMAP_MAKER.out.FreqTables

    emit:
    PTMmaps          = ch_PTMmaps
    PTMmaps_filtered = ch_PTMmaps_filtered
    qReports         = ch_qReports
    FreqTables       = ch_FreqTables
}

workflow QREPORTMAKER {

    take:
    input_file
    params_file
    map_dir
    qmeta_file

    main:
    //
    // SUBMODULE: Obtains the significant changes of proteins
    //
    QREPORT_MAKER('06', input_file, params_file, map_dir, qmeta_file)

    // return channels
    ch_odir   = QREPORT_MAKER.out.odir

    emit:
    odir = ch_odir
}

/*
========================================================================================
    THE END
========================================================================================
*/
