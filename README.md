# nf-PTM-Analyzer

nf-PTM-Analyzer is a [Nextflow](https://www.nextflow.io/) pipeline that executes the ReportAnalysis programs.

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
export PIPELINE_VERSION=0.1.1
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
export IMAGE_VERSION=0.1.1
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

## Execute the pipeline with samples


1. Download sample files
```
cd samples && \
wget https://zenodo.org/records/15096592/files/heteroplasmic_heart.zip?download=1 -O heteroplasmic_heart.zip && \
unzip heteroplasmic_heart.zip && \
cd ..
```

2. Execute the pipeline using MSFragger results as input:
```
nextflow \
    -log "/tmp/nextflow/log/nf-ptm-analyzer.log" \
    run main.nf   \
        -profile singularity \
        --isanxot_file "samples/heteroplasmic_heart/inputs/isanxot_report_q2all_pdm.tsv" \
        --params_file "samples/heteroplasmic_heart/inputs/params.yml" \
        --compa_file "samples/heteroplasmic_heart/inputs/limma_comparisons.tsv" \
        --qmeta_file "samples/heteroplasmic_heart/inputs/myMitocarta.tsv" \
        --outdir  "samples/heteroplasmic_heart/results" \
        -resume
```


# Image Version History

For more information about the program version included within the Singularity version, refer to the [changelog](changelog.md) for the current version.

