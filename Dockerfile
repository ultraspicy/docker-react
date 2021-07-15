FROM node:alpine 

WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
# NOo volume cuz w dont change production on the fly

# /app/build will feed into nginx
RUN npm run build 


FROM nginx
COPY  --from=0 /app/build /usr/share/nginx/html