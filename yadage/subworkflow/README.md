### Simple workflow showing scatter-gather paradigm and subworkflows in yadage

Run with

```console
yadage-run workdir workflow.yaml inputs.yaml
```

Why subworkflows? You can define an entire workflow to run as a single step in another workflow! Converting a two step workflow to a single step subworkflow.

The file workflow.yaml starts by calling subworkflow.yml. The subworkflow defines two unique steps, the second depending on the first. The second step expects as input a file from the first step, it will wait until everything in step one is finished before starting.

The subworkflow is called as a multistep-stage meaning that N number of jobs are created for the first step, each job having a unique input read from `inputs.yaml`. Without a subworfklow the second step would have to wait until all N jobs are done in step one, despite only depending on the output from one of those jobs. Fortunately with a subworkflow, scattering on steps can proceed independently. This mean that when job 5 is done with step one (create ntuple) it can continue to step two (list lumi sections) without having to wait for job 4 (or any other job) to finish step one.

To see what I mean:

[Start the workflow]

* input: `inputs.yaml` a text file containg the input 

[Start subworkflow...creating N jobs, all jobs running parallel, each job performing]

1. Run stageA
 * input: one line from `inputs.yaml`
 * output: one text file
2. Runs stageB
 * input: one text file created in previous step
 * output: one text file

[End subworkflow...when all N jobs are done for step two]

* output: N text files

3. Gather the output from previous step in stageB and perform stage reduce
 * input: N text files
 * output: one text file
