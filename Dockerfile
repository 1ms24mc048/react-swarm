# Use Node to build React app
FROM node:18-alpine
WORKDIR /Desktop/react-swarm
COPY . .
RUN npm install
RUN npm run build

# Use Nginx to run the app
FROM nginx:alpine
COPY --from=0 /Desktop/react-swarm/build /usr/share/nginx/html
EXPOSE 80
