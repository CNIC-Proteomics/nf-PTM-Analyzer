___
## 1.4

### Date 📅 *2025_09*

### Changes in detail

**rc1**
+ Renamed the repository to 'PTM-Analyzer' (previously called ReportAnalysis).
+ Updated to the new version of the PTM-Analyzer repository.
+ In the PTM-Analyzer, we use the PDM table but at the PGM level. We have renamed the processes and files from 'PDM' to 'PGM'.
+ Updated sample parameters.
+ Updated documentation: Zenodo repository.
+ Version format reduced from three segments to two (major.minor).

### Image Version history

+ Updated to the new version:
  - PTM-Analyzer (previously called ReportAnalysis)

| Singularity image (version)                                                                    | Code                                                                 | Version |
|------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|---------|
| [ptm_analysis:1.3](https://cloud.sylabs.io/library/proteomicscnic/next-launcher/ptm_analysis)  |                                                                      |         |
|                                                                                                | [PTM-Analyzer](https://github.com/CNIC-Proteomics/PTM-Analyzer)      | v1.06   |



___
## 0.1.3

### Date 📅 *2025_08*

### Changes in detail

**rc1**
+ Redefine the process container attribute.
+ Updated documentation:
  - Summary log in the pipeline execution (nextflow).

### Image Version history

| Singularity image (version)                                                                      | Code                                                                     | Version |
|--------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|---------|
| [ptm_analysis:0.1.2](https://cloud.sylabs.io/library/proteomicscnic/next-launcher/ptm_analysis)  |                                                                          |         |
|                                                                                                  | [ReportAnalysis](https://github.com/CNIC-Proteomics/ReportAnalysis)      | v1.04   |



___
## 0.1.2

### Date 📅 *2025_04*

### Changes in detail

+ Rename the 'qf' column to 'qc' to maintain consistency with the manuscript's nomenclature.
+ Add the module that merges the quantification report from iSanXoT and the PDM table from PTM-compass.

### Image Version history

| Singularity image (version)                                                                      | Code                                                                     | Version |
|--------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|---------|
| [ptm_analysis:0.1.2](https://cloud.sylabs.io/library/proteomicscnic/next-launcher/ptm_analysis)  |                                                                          |         |
|                                                                                                  | [ReportAnalysis](https://github.com/CNIC-Proteomics/ReportAnalysis)      | v1.04   |



___
## 0.1.1

### Date 📅 *2025_04*

### Changes in detail

+ ReportAnalysis:
  + New update to the PTMMap program: includes plot parameters, the ability to download the map in SVG format, and more.
  + PTM maps are obtained by group.
+ Rename the PTMmap folder with threshold.

### Image Version history

+ ReportAnalysis (v1.03):
  + New update to the PTMMap program: includes plot parameters, the ability to download the map in SVG format, and more.
  + Update and improve documentation.
  + Update the PTMMap program to accept simplified input parameters.
  + PTM maps are obtained by group.


| Singularity image (version)                                                                      | Code                                                                     | Version |
|--------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|---------|
| [ptm_analysis:0.1.1](https://cloud.sylabs.io/library/proteomicscnic/next-launcher/ptm_analysis)  |                                                                          |         |
|                                                                                                  | [ReportAnalysis](https://github.com/CNIC-Proteomics/ReportAnalysis)      | v1.03   |



___
## 0.1.0

### Date 📅 *2025_02*

### Changes in detail

+ First release of nf-PTM-Analyzer that executes the ReportAnalysis programs as Nextflow pipeline.

### Image Version history

+ ReportAnalysis (v1.01):
  + Added the PTMMap to the repository:
    - Change the input parameter file to yaml format.
  + Modified the input parameter file:
    - Created a unique global file containing all parameters.
    - The global file includes a section name for the method used.
  + Adapted all methods to the new input parameter file.

| Singularity image (version)                                                                      | Code                                                                     | Version |
|--------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------|---------|
| [ptm_analysis:0.1.0](https://cloud.sylabs.io/library/proteomicscnic/next-launcher/ptm_analysis)  |                                                                          |         |
|                                                                                                  | [ReportAnalysis](https://github.com/CNIC-Proteomics/ReportAnalysis)      | v1.01   |

