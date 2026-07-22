FROM  node:26-alpine.23 

WORKDIR /app

COPY . .

RUN npm install 

CMD [ "npm" , "run" , "dev"]