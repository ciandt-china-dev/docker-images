# Based on the official 9.8.1 image
FROM solr:9.8.1

# Switch to root to copy files
USER root

# Copy all ICU module jars to Solr's webapp classpath
RUN cp /opt/solr/modules/analysis-extras/lib/*.jar \
       /opt/solr/server/solr-webapp/webapp/WEB-INF/lib/

# Restore solr user
USER solr