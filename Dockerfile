FROM alpine:3.15
RUN apk add --no-cache nodejs
ENV NODE_ENV=production
ENV NODE_PATH=/usr/local/lib/node_modules
ARG version=latest
COPY . .
RUN npm install --production
CMD ["node", "server.js"]

EXPOSE 8080
