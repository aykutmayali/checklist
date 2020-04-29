#FROM node:alpine

# Also exposing VSCode debug ports
#EXPOSE 8000 9929 9230
#EXPOSE 80
#RUN \
  #apk add --no-cache python make g++ && \
  #apk add vips-dev fftw-dev --update-cache \
  #--repository http://dl-3.alpinelinux.org/alpine/edge/community \
  #--repository http://dl-3.alpinelinux.org/alpine/edge/main \
  #&& rm -fR /var/cache/apk/*

#RUN npm install -g gatsby-cli

#WORKDIR /app
#COPY ./package.json .
#RUN yarn install && yarn cache clean
#COPY . .
#CMD ["yarn", "develop", "-H", "0.0.0.0" ]

# 2.way
#ARG GATSBY_ACTIVE_ENV=production


#FROM node:12-buster AS build

#RUN yarn global add gatsby-cli
#ARG GATSBY_ACTIVE_ENV
#ENV GATSBY_ACTIVE_ENV=$GATSBY_ACTIVE_ENV

#WORKDIR /app
#ADD . ./
#RUN yarn install
#RUN gatsby build
#RUN ls -la **/*

#EXPOSE 80

#3.way

FROM node:12

WORKDIR /usr/src/app

COPY package.json .

RUN yarn global add gatsby-cli

RUN yarn install

COPY gatsby-config.js .

# Optionally, copy your .env file to the container filesystem
COPY .env .

EXPOSE 8000

CMD ["gatsby", "develop", "-H", "0.0.0.0"]