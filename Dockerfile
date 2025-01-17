# Dockerfile
FROM node:18

# Crear directorio de la aplicación
WORKDIR /usr/src/app

# Copiar script de inicio

COPY docker/init.sh /usr/local/bin/init.sh
RUN chmod +x /usr/local/bin/init.sh
# Cambiar el propietario del directorio
RUN chown -R node:node /usr/src/app

# Cambiar al usuario node
USER node

# El comando de inicio se define en docker-compose.yml
