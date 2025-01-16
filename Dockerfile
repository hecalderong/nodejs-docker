# Dockerfile
FROM node:18

# Crear directorio de la aplicación
WORKDIR /usr/src/app
#   RUN usermod -u 1000 node
# Instalar dependencias globales
#RUN npm install -g nodemon

# Copiar package.json y package-lock.json (si existe)
#COPY ./src/package*.json ./

# Copiar script de inicio
#COPY docker/init.sh ./docker/init.sh
#RUN chmod +x ./docker/init.sh
COPY docker/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh
# Cambiar el propietario del directorio
RUN chown -R node:node /usr/src/app

# Cambiar al usuario node
USER node

# El comando de inicio se define en docker-compose.yml
