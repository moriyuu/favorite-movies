FROM node:10

WORKDIR /usr/src/app

COPY . .
RUN yarn install

RUN yarn run build

ENV HOST 0.0.0.0
EXPOSE 80
CMD yarn run start
