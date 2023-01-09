FROM node:16-alpine

RUN apk update && apk add build-base gcc autoconf automake zlib-dev libpng-dev nasm bash vips-dev

WORKDIR /opt/app

COPY ./backend .

RUN npm install

RUN npm install --ignore-scripts=false --foreground-scripts --verbose sharp

RUN npm run build

EXPOSE 1337

CMD ["npm", "run", "start"]
