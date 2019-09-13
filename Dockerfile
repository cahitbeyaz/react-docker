#section install dependencies and run npm run build
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
#app/builder
#production run phase

#previous step will stop here
FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html
#no need for starting nginx it start when container is built

