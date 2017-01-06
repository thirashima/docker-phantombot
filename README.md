Docker-PhantomBot
=================
[![ImageLayers Layers](https://img.shields.io/imagelayers/layers/thorerik/phantombot/latest.svg?style=flat-square)](https://imagelayers.io/?images=thorerik/phantombot:latest) [![Layer Size](https://badge.imagelayers.io/thorerik/phantombot:latest.svg)](https://imagelayers.io/?images=thorerik/phantombot:latest) [![Docker Stars](https://img.shields.io/docker/stars/thorerik/phantombot.svg?style=flat-square)](https://hub.docker.com/r/thorerik/phantombot/) [![Docker Pulls](https://img.shields.io/docker/pulls/thorerik/phantombot.svg?style=flat-square)](https://hub.docker.com/r/thorerik/phantombot/)

[Dockerfile][1]

To run this docker image use

    docker run -d -e BOT_USERNAME=<bot_name> -e 'BOT_OAUTH=<oauth key>' -e BOT_CHANNEL=<bot_channel> -e BOT_OWNER=<bot_owner> --name=phantombot thorerik/phantombot:latest

 ```bot_name```, ```bot_owner```, ```bot_channel``` should just be a username, eg ```tuxyq```. ```oauth_key``` has to be in the format ```oauth:abcdabcdbcd9bqfp9nf6wkl3mb9ps2```

The container exposes port 25000, 25002, 25003, 25004 and 25005

You can also optionally specify the variable ```PB_VERSION``` with the desired version of Phantombot, eg.
```
-e "PB_VERSION=1.6.6"
```

optionally you can provide your own botlogin.txt by passing ```-v /path/to/botlogin.txt:/provided_botlogin.txt``` (change 1.6.6.1 if you have specified PB_VERSION)  
It's then recommended to set the ```datastore=``` key in your botlogin.txt to /persistent and pass ```-v /path/to/persistent:/persistent```

[1]: https://github.com/thorerik/docker-phantombot/blob/master/Dockerfile
