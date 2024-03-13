FROM elasticsearch:7.17.18

LABEL maintainer="stonec@ciandt.com"

RUN elasticsearch-plugin -v install --batch https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v7.17.18/elasticsearch-analysis-pinyin-7.17.18.zip \
  && elasticsearch-plugin -v install --batch https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v7.17.18/elasticsearch-analysis-ik-7.17.18.zip

COPY config/extra_stopword.dic /usr/share/elasticsearch/config/analysis-ik/extra_stopword.dic
COPY config/IKAnalyzer.cfg.xml /usr/share/elasticsearch/config/analysis-ik/IKAnalyzer.cfg.xml
