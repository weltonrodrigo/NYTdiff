#!/bin/bash
export TESTING=False
export NYT_TWITTER_CONSUMER_KEY=$NYT_TWITTER_CONSUMER_KEY
export NYT_TWITTER_CONSUMER_SECRET=$NYT_TWITTER_CONSUMER_SECRET
export NYT_TWITTER_ACCESS_TOKEN=$NYT_TWITTER_ACCESS_TOKEN
export NYT_TWITTER_ACCESS_TOKEN_SECRET=$NYT_TWITTER_ACCESS_TOKEN_SECRET
export RSS_URL=\
https://feeds.folha.uol.com.br/opiniao/rss091.xml\
,https://feeds.folha.uol.com.br/poder/rss091.xml\
,https://feeds.folha.uol.com.br/ambiente/rss091.xml\
,https://g1.globo.com/rss/g1/
,https://oglobo.globo.com/rss.xml?completo=true
export PHANTOMJS_PATH=./phantomjs-2.1.1-linux-x86_64/bin/

if [ ! -d "./phantomjs-2.1.1-linux-x86_64/" ]
  then
    wget -qc \
      https://bitbucket.org/ariya/phantomjs/downloads/phantomjs-2.1.1-linux-x86_64.tar.bz2 \
      -O phantom.tar.bz
    tar jxf phantom.tar.bz --skip-old-files
fi

sudo apt -qq install python3-venv

if [ ! -d ".venv" ]
  then
    python3 -m venv venv
    source venv/bin/activate
    python3 -m pip install -q -r requirements.txt
  else
    source venv/bin/activate
fi

python3 nytdiff.py 2>&1 | tee nytdiff.log