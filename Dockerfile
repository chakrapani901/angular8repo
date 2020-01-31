FROM nginx:1.13.9-alpine AS base
COPY public/nginx.conf /etc/nginx/nginx.conf
EXPOSE 80

FROM node:8.9.4 AS build
WORKDIR angular8repo/my-sample-app
COPY . .
RUN npm install && npm run build:linux && \
    rm -f .npmrc

FROM base AS final
WORKDIR /usr/share/nginx/html
COPY --from=build /my-sample-app/dist
