FROM node:20.9 as  build-stage

ARG BUILD_ENV

WORKDIR /usr/app/

COPY package*.json ./

RUN npm install -g @angular/cli

RUN npm install

COPY . .

RUN ng build --configuration=production

FROM  nginx:1.24.0-alpine

COPY --from=build-stage /usr/app/dist/web-app/browser/* /usr/share/nginx/html

EXPOSE 80

ENTRYPOINT [ "nginx","-g","daemon off;" ]