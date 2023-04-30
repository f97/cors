FROM node:lts-alpine AS dependencies
WORKDIR /home/cors
COPY ./package.json /home/cors
RUN yarn install --production

FROM alpine:3.15
WORKDIR /home/cors
COPY --from=dependencies /home/cors/node_modules ../node_modules/
RUN apk add --no-cache nodejs
ENV NODE_ENV=production
ENV NODE_PATH=/usr/local/lib/node_modules
ARG version=latest
COPY . .
CMD ["node", "server.js"]

EXPOSE 8080
