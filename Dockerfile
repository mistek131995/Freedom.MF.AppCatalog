FROM node:latest

WORKDIR ./home/source
COPY . .

RUN apt update && apt -y install nginx # && apt -y install npm
RUN npm install && npm run build

EXPOSE 81

CMD ["nginx", "-g", "daemon off;"]