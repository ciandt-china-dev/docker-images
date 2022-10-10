FROM elasticsearch:7.16.2

LABEL maintainer="allenz@ciandt.com"

RUN elasticsearch-plugin -v install https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v7.16.2/elasticsearch-analysis-pinyin-7.16.2.zip \
  && elasticsearch-plugin -v install https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.16.2/elasticsearch-analysis-ik-7.16.2.zip
