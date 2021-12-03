# Docker Present

This project is a simple Dockerfile that does a `go get` for the present tool and makes it easy to run the present tool anywhere.

It pulls code from https://github.com/golang/tools/tree/master/present

## Examples

### Running it directly

Run it directly by mounting a volume with the location of your .slide files
`docker run -d -p 3999:3999 -v /mylocalslides:/app mkboudreau/go-present`

The default command for the present tool that is executed is:

```
present -http=0.0.0.0:3999 -use_playground
```

#### Want to have full control?

If you want to have complete control, simply pass any and all options as options to the docker run command: `docker run ... -opt1 -opt2`

**Important**: The `ENTRYPOINT` is just the `present` command. The options are set as the _default_ `CMD` value. Passing any options to the `docker run` command will remove the `-http=0.0.0.0:3999 -use_playground` options since these are the default `CMD` parameters in the `Dockerfile`. Keep that in mind if you decide to customize.

If you are running this in Vagrant, docker-machine, or some other VM, and you want to use the playground in the container (instead of the golang playground), then you may need to add the IP address that is able to be routed back to the container: `-orighost=<Accessible IP Address>`

### Baking your presentation
If you'd like to *bake* in your slides and make them really portable, all you have to do is put a Dockerfile alongside your slides. Your Dockerfile only needs one line: `FROM mkboudreau/go-present:latest-onbuild`

`docker build -t <yourrepo>/<yourtag> .`

Then just run your baked presentation with or without the -d
`docker run -d -p 3999:3999 <yourrepo>/<yourtag>`

#### Customizing the *bake*
If you need more control over your prebaking, if your slides are in some nested directory or something, simply use  `FROM mkboudreau/go-present:latest` instead of *onbuild* and then use `COPY <your actual dir> /app`
