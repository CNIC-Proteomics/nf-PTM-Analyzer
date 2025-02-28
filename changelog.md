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

