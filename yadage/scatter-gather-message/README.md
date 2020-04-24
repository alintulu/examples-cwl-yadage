The input can be seen to be read as an array with four entries

```console
2020-04-24 11:35:15,756 | packtivity.asyncback |   INFO | configured pool size to 8
2020-04-24 11:35:15,805 |      yadage.creators |   INFO | initializing workflow with initdata: {'message_array': ['Hello world!', 'Hola mundo!', 'Bonjour le monde!', 'Hallo welt!']} discover: True relative: True
2020-04-24 11:35:15,805 |    adage.pollingexec |   INFO | preparing adage coroutine.
2020-04-24 11:35:15,805 |                adage |   INFO | starting state loop.
2020-04-24 11:35:15,839 |     yadage.wflowview |   INFO | added </init:0|defined|unknown>
2020-04-24 11:35:15,971 |     yadage.wflowview |   INFO | added </scatter:0|defined|unknown>
2020-04-24 11:35:16,084 |    adage.pollingexec |   INFO | submitting nodes [</init:0|defined|known>]
2020-04-24 11:35:16,156 |       pack.init.step |   INFO | publishing data: <TypedLeafs: {'message_array': ['Hello world!', 'Hola mundo!', 'Bonjour le monde!', 'Hallo welt!']}>
2020-04-24 11:35:16,305 |           adage.node |   INFO | node ready </init:0|success|known>
2020-04-24 11:35:16,306 |    adage.pollingexec |   INFO | submitting nodes [</scatter:0|defined|known>]
2020-04-24 11:35:16,307 |    pack.scatter.step |   INFO | starting file logging for topic: step
2020-04-24 11:35:19,698 |           adage.node |   INFO | node ready </scatter:0|success|known>
2020-04-24 11:35:19,719 | adage.controllerutil |   INFO | no nodes can be run anymore and no rules are applicable
2020-04-24 11:35:19,719 | adage.controllerutil |   INFO | no nodes can be run anymore and no rules are applicable
2020-04-24 11:35:19,719 |                adage |   INFO | adage state loop done.
2020-04-24 11:35:19,719 |                adage |   INFO | execution valid. (in terms of execution order)
2020-04-24 11:35:19,719 |                adage |   INFO | workflow completed successfully.
2020-04-24 11:35:19,719 |  yadage.steering_api |   INFO | done. dumping workflow to disk.
```

However when passed it seems to go as nine entries

```bash
for x in {input}; do
             echo $x >> {outputfile};
```

Leads to

```
Hello
world!
Hola
mundo!
Bonjour
le
monde!
Hallo
welt!
```

While expected outcome is

```
Hello world!
Hola mundo!
Bonjour le monde!
Hallo welt!
```
