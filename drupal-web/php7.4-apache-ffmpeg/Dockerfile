FROM ciandtchina/drupal-web:php7.4-apache

COPY ./default-ssl.conf /etc/apache2/sites-available/
COPY ./test.pem /etc/ssl/certs/cmsselfcareqa.cer
COPY ./test.key /etc/ssl/private/cms.iretailqa.johnsonsbaby.com.cn.key
COPY ./test.cer /etc/ssl/certs/cms_iretailqa_johnsonsbaby_com_cn.cer

RUN apt-get update \
    && apt-get install ffmpeg -y \
    && apt-get install poppler-utils -y \
    && a2enmod ssl \
    && cd /etc/apache2/sites-available \
    && a2ensite default-ssl.conf \
    && service apache2 restart