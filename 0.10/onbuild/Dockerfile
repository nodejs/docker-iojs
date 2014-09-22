FROM node:0.10.32

RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

ONBUILD ADD package.json /usr/src/app/
ONBUILD RUN npm install
ONBUILD ADD . /usr/src/app

CMD [ "npm", "start" ]
