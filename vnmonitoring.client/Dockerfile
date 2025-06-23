FROM node:20-alpine AS build

WORKDIR /app
COPY . .

ARG IS_DOCKER=true
ENV IS_DOCKER=$IS_DOCKER

RUN npm install && npm run build

FROM nginx:alpine AS stage-1
COPY --from=build /app/dist /usr/share/nginx/html
EXPOSE 80