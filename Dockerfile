FROM node:alpine
#RUN mkdir -p /home/ubuntu/backLaboratorioSO/node_modules && chown -R node:node /home/ubuntu/backLaboratorioSO
WORKDIR /usr/app
RM package.json *.* ./
COPY package.json *.* ./
RUN npm install
COPY . .
EXPOSE 3000
CMD npm start