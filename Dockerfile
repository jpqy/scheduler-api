FROM node:10-alpine

ENV PORT=22223

RUN mkdir -p /home/node/scheduler-api/node_modules && chown -R node:node /home/node/scheduler-api

WORKDIR /home/node/scheduler-api

COPY package*.json ./

USER node

RUN npm install

COPY --chown=node:node . .

EXPOSE 22223

CMD [ "node", "./src/index.js" ]
