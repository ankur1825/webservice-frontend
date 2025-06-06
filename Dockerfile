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


FROM node:10

WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

# Install nginx and serve static site
RUN apt-get update && apt-get install -y nginx \
  && rm -rf /var/lib/apt/lists/*
COPY --from=0 /app/build /var/www/html

CMD ["nginx", "-g", "daemon off;"]

