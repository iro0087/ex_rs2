#!/bin/bash

server_="no"

bash ~/new-rss/code_/new-rss.sh

bash ~/new-rss/code_/new-rss2.sh

if [ "$server_" = "yes" ]
then

        bash ~/new-rss/server.sh

fi


