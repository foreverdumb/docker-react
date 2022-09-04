#USE FOR PROD ONLY

FROM node:16-alpine as build_step

WORKDIR /usr/app
COPY ./package.json /usr/app
RUN npm install

COPY ./ /usr/app/
RUN npm run build

FROM nginx:latest

COPY --from=build_step /usr/app/build /usr/share/nginx/html