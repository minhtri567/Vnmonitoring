FROM node:20-alpine AS build

WORKDIR /app
COPY . .

ARG IS_DOCKER=true
ARG VITE_API_URL=
ENV IS_DOCKER=$IS_DOCKER
ENV VITE_API_URL=$VITE_API_URL

RUN npm install && npm run build

FROM nginx:alpine AS stage-1
COPY --from=build /app/dist /usr/share/nginx/html
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80