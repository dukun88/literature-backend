# BEGIN ANSIBLE MANAGED BLOCK
FROM node:10-alpine
WORKDIR /home/root/
ENV NODE_ENV=production
ENV DATABASE_URL=postgres://masedo:admin123@103.181.142.234:5432/literature
COPY . .
RUN npm install && npm install -g nodemon
RUN npm install sequelize-cli -g
CMD ["npx", "sequelize", "db:migrate"]
FROM node:10-alpine
COPY . .
EXPOSE 5000
CMD ["nodemon", "server.js"]
# END ANSIBLE MANAGED BLOCK
