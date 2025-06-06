## Use Node image to build the React app
#FROM node:20-alpine as build
#WORKDIR /app
#COPY package*.json ./
#RUN npm install
#COPY . .
#RUN npm run build

## Use Nginx to serve the built app
#FROM nginx:alpine
#COPY --from=build /app/build /usr/share/nginx/html
#EXPOSE 80
#CMD ["nginx", "-g", "daemon off;"]


FROM python:3.6-alpine

# Install nginx in the same layer
RUN apt-get update && apt-get install -y nginx && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install node dependencies and build
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Serve built files using nginx
RUN mkdir -p /var/www/html && cp -r build/* /var/www/html

CMD ["nginx", "-g", "daemon off;"]


