FROM elasticsearch:8.7.0

RUN elasticsearch-plugin -v install --batch https://github.com/medcl/elasticsearch-analysis-pinyin/releases/download/v8.7.0/elasticsearch-analysis-pinyin-8.7.0.zip \
  && elasticsearch-plugin -v install --batch https://github.com/medcl/elasticsearch-analysis-ik/releases/download/v8.7.0/elasticsearch-analysis-ik-8.7.0.zip

COPY config/extra_stopword.dic /usr/share/elasticsearch/config/analysis-ik/extra_stopword.dic
COPY config/IKAnalyzer.cfg.xml /usr/share/elasticsearch/config/analysis-ik/IKAnalyzer.cfg.xml