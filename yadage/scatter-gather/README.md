### Simple workflow showing scatter-gather paradigm in yadage

Run with 

```console
yadage-run workdir workflow.yaml input.yaml
```

* Reads input files from [input.yaml](input.yaml), currently a list of eight.
* Scatter the jobs in batches of 2, i.e. 4 jobs are created.
