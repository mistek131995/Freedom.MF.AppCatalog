FROM node:latest

WORKDIR ./home/source
COPY . .

RUN apt update && apt -y install nginx && apt -y install nano
RUN npm install && npm run build
RUN rm -R /etc/nginx/sites-available/default && mv -f ./nginx.conf /etc/nginx/sites-available

EXPOSE 81

CMD ["nginx", "-g", "daemon off;"]