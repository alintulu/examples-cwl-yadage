#!/usr/bin/env cwl-runner

cwlVersion: v1.0
class: CommandLineTool

requirements:
  InitialWorkDirRequirement:
    listing:
      - $(inputs.message)

baseCommand: /bin/sh

inputs:
  message:
    type: string

outputs: []

arguments:
  - prefix: -c
    valueFrom: |
      echo '$(inputs.message)'
