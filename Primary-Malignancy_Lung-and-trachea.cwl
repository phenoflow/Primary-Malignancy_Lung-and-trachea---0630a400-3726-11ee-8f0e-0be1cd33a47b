cwlVersion: v1.0
steps:
  read-potential-cases-fhir:
    run: read-potential-cases-fhir.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule1
  primary-malignancy_lung-and-trachea-bronchu---primary:
    run: primary-malignancy_lung-and-trachea-bronchu---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule2
      potentialCases:
        id: potentialCases
        source: read-potential-cases-fhir/output
  primary-malignancy_lung-and-trachea-neoplasm---primary:
    run: primary-malignancy_lung-and-trachea-neoplasm---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule3
      potentialCases:
        id: potentialCases
        source: primary-malignancy_lung-and-trachea-bronchu---primary/output
  upper-primary-malignancy_lung-and-trachea---primary:
    run: upper-primary-malignancy_lung-and-trachea---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule4
      potentialCases:
        id: potentialCases
        source: primary-malignancy_lung-and-trachea-neoplasm---primary/output
  primary-malignancy_lung-and-trachea-pancoast's---primary:
    run: primary-malignancy_lung-and-trachea-pancoast's---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule5
      potentialCases:
        id: potentialCases
        source: upper-primary-malignancy_lung-and-trachea---primary/output
  primary-malignancy_lung-and-trachea-middle---primary:
    run: primary-malignancy_lung-and-trachea-middle---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule6
      potentialCases:
        id: potentialCases
        source: primary-malignancy_lung-and-trachea-pancoast's---primary/output
  lower-primary-malignancy_lung-and-trachea---primary:
    run: lower-primary-malignancy_lung-and-trachea---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule7
      potentialCases:
        id: potentialCases
        source: primary-malignancy_lung-and-trachea-middle---primary/output
  primary-malignancy_lung-and-trachea---primary:
    run: primary-malignancy_lung-and-trachea---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule8
      potentialCases:
        id: potentialCases
        source: lower-primary-malignancy_lung-and-trachea---primary/output
  primary-malignancy_lung-and-trachea-carcinoma---primary:
    run: primary-malignancy_lung-and-trachea-carcinoma---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule9
      potentialCases:
        id: potentialCases
        source: primary-malignancy_lung-and-trachea---primary/output
  primary-malignancy_lung-and-trachea-history---primary:
    run: primary-malignancy_lung-and-trachea-history---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule10
      potentialCases:
        id: potentialCases
        source: primary-malignancy_lung-and-trachea-carcinoma---primary/output
  lung---primary:
    run: lung---primary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule11
      potentialCases:
        id: potentialCases
        source: primary-malignancy_lung-and-trachea-history---primary/output
  primary-malignancy_lung-and-trachea-neoplasm---secondary:
    run: primary-malignancy_lung-and-trachea-neoplasm---secondary.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule12
      potentialCases:
        id: potentialCases
        source: lung---primary/output
  output-cases:
    run: output-cases.cwl
    out:
    - output
    in:
      inputModule:
        id: inputModule
        source: inputModule13
      potentialCases:
        id: potentialCases
        source: primary-malignancy_lung-and-trachea-neoplasm---secondary/output
class: Workflow
inputs:
  inputModule1:
    id: inputModule1
    doc: Js implementation unit
    type: File
  inputModule2:
    id: inputModule2
    doc: Python implementation unit
    type: File
  inputModule3:
    id: inputModule3
    doc: Python implementation unit
    type: File
  inputModule4:
    id: inputModule4
    doc: Python implementation unit
    type: File
  inputModule5:
    id: inputModule5
    doc: Python implementation unit
    type: File
  inputModule6:
    id: inputModule6
    doc: Python implementation unit
    type: File
  inputModule7:
    id: inputModule7
    doc: Python implementation unit
    type: File
  inputModule8:
    id: inputModule8
    doc: Python implementation unit
    type: File
  inputModule9:
    id: inputModule9
    doc: Python implementation unit
    type: File
  inputModule10:
    id: inputModule10
    doc: Python implementation unit
    type: File
  inputModule11:
    id: inputModule11
    doc: Python implementation unit
    type: File
  inputModule12:
    id: inputModule12
    doc: Python implementation unit
    type: File
  inputModule13:
    id: inputModule13
    doc: Python implementation unit
    type: File
outputs:
  cases:
    id: cases
    type: File
    outputSource: output-cases/output
    outputBinding:
      glob: '*.csv'
requirements:
  SubworkflowFeatureRequirement: {}
