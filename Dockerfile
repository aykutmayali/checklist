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

# 2.way ---------------------
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

#3.way------------------

FROM node:12

WORKDIR /usr/src/app

COPY package.json .

RUN yarn global add gatsby-cli

RUN yarn install

COPY gatsby-config.js .

# Optionally, copy your .env file to the container filesystem
COPY .env .

EXPOSE 8000

#CMD ["gatsby", "develop", "-H", "0.0.0.0"]
CMD ["yarn", "develop", "-H", "0.0.0.0"]

#4.way--------

#FROM node:12-alpine

#EXPOSE 8000

#RUN apk update && \
    #apk add --update --repository http://dl-3.alpinelinux.org/alpine/edge/testing vips-tools vips-dev fftw-dev gcc g++ make libc6-compat && \
    #apk add git && \
    #apk add python && \
    #rm -rf /var/cache/apk/*

#RUN npm install --global gatsby --no-optional gatsby@1.9 

#RUN mkdir -p /site
#WORKDIR /site
#VOLUME /site

#COPY ./entry.sh /
#RUN chmod +x /entry.sh
#ENTRYPOINT ["/entry.sh"]
