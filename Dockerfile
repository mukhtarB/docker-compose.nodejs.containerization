FROM node:18-alpine3.20


WORKDIR /app/

EXPOSE 3000 3306

VOLUME [ "/app/mounted-host-files" ]

COPY package*.json .

COPY .env.example .env

# - attempt to automate creation of .env file and needed data by copying and appending to .env.example on build time

# RUN echo 'MARIADB_ROOT_PASSWORD=${DB_PASSWORD}' >> .env
# RUN echo 'MARIADB_USER=${DB_USERNAME}' >> .env
# RUN echo 'MARIADB_PASSWORD=${DB_PASSWORD}' >> .env
# RUN echo 'MARIADB_DATABASE=${DB_DATABASE}' >> .env

# didn't work out, lol


RUN npm install

COPY . .

CMD [ "node", "app.js" ]