# [ZNC](https://wiki.znc.in/)

Docker image of ZNC with [push](https://github.com/jreese/znc-push/) module available.

## Running

Create the config file first:

```sh
docker run -v $(pwd):/znc -ti --rm bltavares/znc znc -d /znc --makeconf
```

Then start the container

```sh
docker run -v $(pwd):znc -d bltavares/znc
```
