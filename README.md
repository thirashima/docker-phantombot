Docker-PhantomBot
=================


To run this docker image use

    docker run -d -e BOT_USERNAME=<bot_name> -e 'BOT_OAUTH=<oauth key>' -e BOT_CHANNEL=<bot_channel> -e BOT_OWNER=<bot_owner> --name=phantombot test

 ```bot_name```, ```bot_owner```, ```bot_channel``` should just be a username, eg ```tuxyq```. ```oauth_key``` has to be in the format ```oauth:abcdabcdbcd9bqfp9nf6wkl3mb9ps2```

The container exposes port 25000, 25001 and 25002
