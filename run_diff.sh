#!/bin/bash
export TESTING=False
export NYT_TWITTER_CONSUMER_KEY=$NYT_TWITTER_CONSUMER_KEY
export NYT_TWITTER_CONSUMER_SECRET=$NYT_TWITTER_CONSUMER_SECRET
export NYT_TWITTER_ACCESS_TOKEN=$NYT_TWITTER_ACCESS_TOKEN
export NYT_TWITTER_ACCESS_TOKEN_SECRET=$NYT_TWITTER_ACCESS_TOKEN_SECRET
export RSS_URL=$RSS_URL
export PHANTOMJS_PATH=./phantomjs-2.1.1-linux-x86_64/bin/

wget -qc https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 -O phantom.tar.bz

tar jxf phantom.tar.bz

sudo apt -qq install python3-venv

python3 -m venv venv

source venv/bin/activate

python3 -m pip install -q -r requirements.txt

python3 nytdiff.py
