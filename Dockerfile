FROM node:10-alpine

RUN mkdir -p /home/node/app/node_modules && chown -R node:node /home/node/app

WORKDIR /home/node/app

COPY package*.json ./

COPY wait-for.sh /home/node/app/wait-for.sh

USER node

RUN npm install

USER root 

RUN chmod +x /home/node/app/wait-for.sh

USER node

COPY --chown=node:node . .

EXPOSE 8080

#CMD [ "node", "app.js" ]
CMD ["/bin/sh", "-c", "./wait-for.sh db:27017 -- npm start"]
