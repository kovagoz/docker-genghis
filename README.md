Docker Genghis
==============

The single-file [MongoDB admin app](http://genghisapp.com) in a tiny Docker container.

How to use
----------

Launch a MongoDB instance:

```bash
$ docker run -d --name mongo mongo:latest
```

Run the Genghis app:

```bash
$ docker run -d --name genghis --link mongo -p 8000:8000 -e "GENGHIS_SERVERS=mongodb://mongo" kovagoz/genghis
```

And finally open http://localhost:8000 in your favourite web browser.

That's it.

Build from Dockerfile
---------------------

Just run:

```bash
$ make
```
