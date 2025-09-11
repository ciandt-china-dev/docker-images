FROM node:22-slim

LABEL maintainer=stevenl@ciandt.com

RUN npm install serverless -g --ignore-scripts spawn-sync

USER node

WORKDIR /home/node

CMD ["serverless"]
