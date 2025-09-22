# Usage

## Execute the pipeline with samples


1. Download sample files
```
cd samples && \
wget https://zenodo.org/records/17141424/files/heteroplasmic_heart.zip?download=1 -O heteroplasmic_heart.zip && \
unzip heteroplasmic_heart.zip && \
cd ..
```

2. Execute the pipeline using iSanXoT report (q_all) and PDM table from PTM-compass as inputs:
```
nextflow \
    -log "/tmp/nextflow/log/nf-ptm-analyzer.log" \
    run main.nf   \
        -profile singularity \
        --quant_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_heart/inputs/q_all.tsv" \
        --pgm_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_heart/inputs/DMTable_PeakAssignation_FDRfiltered_DM0S_PA_T_PeakAssignation_SS_Heart_FDR_PDMTable_GM_J_PGM_Table_pgmFreq.tsv" \
        --params_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_heart/inputs/params_nf.yml" \
        --compa_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_heart/inputs/limma_comparisons.tsv" \
        --qmeta_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_heart/inputs/myMitocarta.tsv" \
        --outdir  "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_heart/results" \
        -resume
```

+ You can download the input files for this `liver` sample from the study by Bagwan N, Bonzon-Kulichenko E, Calvo E, et al. [1] at the following URL:
https://zenodo.org/records/17141424/files/heteroplasmic_liver.zip?download=1

```
nextflow \
    -log "/tmp/nextflow/log/nf-ptm-analyzer.log" \
    run main.nf   \
        -profile singularity \
        --quant_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_liver/inputs/q_all.tsv" \
        --pgm_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_liver/inputs/DMTable_PeakAssignation_FDRfiltered_DM0S_PA_T_PeakAssignation_SS_Liver_FDR_PDMTable_GM_J_PGM_Table_pgmFreq.tsv" \
        --params_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_liver/inputs/params_nf.yml" \
        --compa_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_liver/inputs/limma_comparisons.tsv" \
        --qmeta_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_liver/inputs/myMitocarta.tsv" \
        --outdir  "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_liver/results" \
        -resume
```

+ You can download the input files for this `muscle` sample from the study by Bagwan N, Bonzon-Kulichenko E, Calvo E, et al. [1] at the following URL:
https://zenodo.org/records/17141424/files/heteroplasmic_muscler.zip?download=1

```
nextflow \
    -log "/tmp/nextflow/log/nf-ptm-analyzer.log" \
    run main.nf   \
        -profile singularity \
        --quant_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_muscle/inputs/q_all.tsv" \
        --pgm_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_muscle/inputs/DMTable_PeakAssignation_FDRfiltered_DM0S_PA_T_PeakAssignation_SS_Muscle_FDR_PDMTable_GM_J_PGM_Table_pgmFreq.tsv" \
        --params_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_muscle/inputs/params_nf.yml" \
        --compa_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_muscle/inputs/limma_comparisons.tsv" \
        --qmeta_file "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_muscle/inputs/myMitocarta.tsv" \
        --outdir  "/mnt/tierra/U_Proteomica/UNIDAD/Softwares/jmrodriguezc/nf-PTM-Analyzer/samples/heteroplasmic_muscle/results" \
        -resume
```
