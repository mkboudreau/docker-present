# Docker Present

This project is a simple Dockerfile that does a `go get` for the present tool and makes it easy to run the present tool anywhere.

## Examples

### Running it directly

Run it directly by mounting a volume with the location of your .slide files
`docker run -v /mylocalslides:/app mkboudreau/go-present`


### Baking your presentation
If you'd like to *bake* in your slides and make them really portable, all you have to do is put a Dockerfile alongside your slides. Your Dockerfile only needs one line: `FROM mkboudreau/go-present:latest-onbuild`

`docker build -t <yourrepo>/<yourtag> .`

Then just run your baked presentation with or without the -d
`docker run -d -p 3999:3999 <yourrepo>/<yourtag>`

#### Customizing the *bake*
If you need more control over your prebaking, if your slides are in some nested directory or something, simply use  `FROM mkboudreau/go-present:latest` instead of *onbuild* and then use `COPY <your actual dir> /app`
