# nf-PTM-Analyzer

nf-PTM-Analyzer is a [Nextflow](https://www.nextflow.io/) pipeline that executes the PTM-Analyzer programs, which enable statistical analysis and quantitative exploration of proteomics data related to post-translational modifications (PTMs).

nf-PTM-Analyzer was developed by the Cardiovascular Proteomics Lab/Proteomic Unit at The National Centre for Cardiovascular Research (CNIC, https://www.cnic.es).

This application is licensed under a Creative Commons Attribution-NoDerivatives 4.0 International (CC BY-ND 4.0) License. For further details, read the https://creativecommons.org/licenses/by-nd/4.0/.



# Installation

## Prerequisites

Before you begin, ensure you have met the following requirements:

- A **Linux operating system** is needed on your machine.

## Linux operating system on Windows

If you are using a Windows operating system, refer to the section [Install WSL on Windows](docs/WSL.md) to set up a Linux operating system on your Windows machine.

## Install Singularity

For more information, read the [How to install Singularity](docs/SingularityCE.md) section.

## Install Nextflow

For more information, read the [How to install Nextflow](docs/Nextflow.md) section.

## Install Git

For more information, read the [How to install Git](docs/Git.md) section.



# Download the pipeline with the latest release

Export an environment variable to define the version:
```
export PIPELINE_VERSION=1.4
```
Note: The list of releases is located on the [releases page](https://github.com/CNIC-Proteomics/nf-PTM-Analyzer/releases).

You can clone the latest release directly using git with the following command:
```
git clone https://github.com/CNIC-Proteomics/nf-PTM-Analyzer.git --branch ${PIPELINE_VERSION} --recursive
```
With the *--recursive* parameter, the submodules repositories are cloned as well.



# Download Singularity images

Export an environment variable to define the version of singularity image:
```
export IMAGE_VERSION=1.3
```
Note: The list of releases is located on the [singularity repository page](https://cloud.sylabs.io/library/proteomicscnic/next-launcher/ptm_analysis).

Navigate to the backends folder:
```
cd nf-PTM-Analyzer/backends
```

You need to download the Singularity image for the pipeline, ensuring version compatibility with the Nextflow pipeline. See the above *versions* section:
```
singularity pull --arch amd64 library://proteomicscnic/next-launcher/ptm_analysis:${IMAGE_VERSION}
```

You might see warning messages like the following. You can discard or ignore them:

    WARNING: failed to get key material: 404 Not Found: entity not found
    WARNING: integrity: signature object 5 not valid: openpgp: signature made by unknown entity
    WARNING: Skipping container verification

Create a symbolic link
```
ln -s ptm_analysis_${IMAGE_VERSION}.sif ptm_analysis.sif
```



# Usage

## Samples 1: iSanXoT Report and PDM table for Mouse Heteroplasmia (Heart)

Input files for PTM-Analyzer, derived from the quantification results of iSanXoT [1] and the PDM table from the PTM-compass [2].

The samples originate from `heart` tissue, based on the study by Bagwan N, Bonzon-Kulichenko E, Calvo E, et al. [3].

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
        --quant_file "samples/heteroplasmic_heart/inputs/q_all.tsv" \
        --pgm_file "samples/heteroplasmic_heart/inputs/DMTable_PeakAssignation_FDRfiltered_DM0S_PA_T_PeakAssignation_SS_Heart_FDR_PDMTable_GM_J_PGM_Table_pgmFreq.tsv" \
        --params_file "samples/heteroplasmic_heart/inputs/params_nf.yml" \
        --compa_file "samples/heteroplasmic_heart/inputs/limma_comparisons.tsv" \
        --qmeta_file "samples/heteroplasmic_heart/inputs/myMitocarta.tsv" \
        --outdir  "samples/heteroplasmic_heart/results" \
        -resume
```

## Samples 2: iSanXoT Report and PDM table for Mouse Heteroplasmia (Liver)

You can download the input files for this `liver` sample, derived from the study by Bagwan N, Bonzon-Kulichenko E, Calvo E, et al. [1] at the following URL:

https://zenodo.org/records/17141424/files/heteroplasmic_liver.zip?download=1

To execute the pipeline, follow the same steps as in Sample 1.


## Samples 3: iSanXoT Report and PDM table for Mouse Heteroplasmia (Muscle)

You can download the input files for this sample from the following URL:

https://zenodo.org/records/17141424/files/heteroplasmic_muscle.zip?download=1

To execute the pipeline, follow the same steps as in Sample 1.



# Image Version History

For more information about the program version included within the Singularity version, refer to the [changelog](changelog.md) for the current version.



# References

[1] Rodríguez, Jose Manuel et al. *iSanXoT: A standalone application for the integrative analysis of mass spectrometry-based quantitative proteomics data.* Computational and structural biotechnology journal vol. 23 452-459. 26 Dec. 2023, doi: https://doi.org/10.1016/j.csbj.2023.12.034

[2] Cristina A. Devesa, Rafael Barrero-Rodríguez, Andrea Laguillo-Gómez, et al. *Integrative multi-layer workflow for quantitative analysis of post-translational modifications.* bioRxiv 2025.01.20.633864; doi: https://doi.org/10.1101/2025.01.20.633864

[3] Bagwan N, Bonzon-Kulichenko E, Calvo E, et al. *Comprehensive Quantification of the Modified Proteome Reveals Oxidative Heart Damage in Mitochondrial Heteroplasmy*. Cell Reports. 2018;23(12):3685-3697.e4. https://doi.org/10.1016/j.celrep.2018.05.080