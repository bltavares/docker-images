# [mkdocs] with extensions

This is a [mkdocs] with [PlantUML] installed to be used for diagrams.

It provides a default config, in order to reduce the setup needs.
The default config has some extensions enabled.

```sh
docker run \
  -v $(pwd):/docs/docs \
  bltavares/mkdocs:latest
```

To override the config, add a new volume pointing to the location.

```sh
docker run \
  -v $(pwd):/docs/docs \
  -v ${config_location}:/docs/mkdocs.yml \
  bltavares/mkdocs:latest
```

[mkdocs]: https://github.com/mkdocs/mkdocs
[PlantUML]: https://plantuml.com/
