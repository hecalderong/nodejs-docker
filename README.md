<img src="https://github.com/hecalderong/nodejs-docker/blob/main/images/node-docker.png" alt="Dockerizando NodeJS" width="100%">

# Node.js Docker Development Environment

Este proyecto proporciona un entorno de desarrollo completo para Node.js usando Docker, configurado con una estructura moderna y herramientas de desarrollo esenciales.

## 📋 Tabla de Contenidos

- [Requisitos Previos](#requisitos-previos)
- [Estructura del Proyecto](#estructura-del-proyecto)
- [Servicios Incluidos](#servicios-incluidos)
- [Configuración Inicial](#configuración-inicial)
- [Uso](#uso)
- [Configuración de Servicios](#configuración-de-servicios)
- [Comandos Útiles](#comandos-útiles)
- [Solución de Problemas](#solución-de-problemas)

## 🔧 Requisitos Previos

- Docker (versión 20.10 o superior)
- Docker Compose (versión 2.0 o superior)
- Git (opcional)

## 📁 Estructura del Proyecto

```
proyecto/
├── docker/
│   ├── nginx/
│   │   └── conf.d/
│   │       └── app.conf
│   └── init.sh
├── src/                 # Código fuente de Node.js
├── docker-compose.yml
└── Dockerfile
```

## 🚀 Servicios Incluidos

### 1. Aplicación Node.js
- Node.js 18
- Nodemon para desarrollo
- Express.js preconfigurado
- Hot-reload activado
- Puerto: 3000 (configurable)

### 2. Nginx
- Proxy inverso configurado
- Balanceo de carga
- Puerto: 8000 (configurable)

### 3. MySQL
- Versión: 8.0
- Persistencia de datos
- Puerto: 3306
- Credenciales configurables

### 4. PHPMyAdmin
- Interfaz web para MySQL
- Puerto: 8080 (configurable)
- Acceso directo a la base de datos

## ⚙️ Configuración Inicial

1. Crea la estructura de directorios:
```bash
mkdir -p mi-proyecto/docker/nginx/conf.d
cd mi-proyecto
```

2. Copia los archivos de configuración:
- `docker-compose.yml` en la raíz
- `Dockerfile` en la raíz
- `app.conf` en `docker/nginx/conf.d/`
- `init.sh` en `docker/`

3. Configura permisos:
```bash
chmod +x docker/init.sh
```

## 🚀 Uso

### Primera Ejecución

```bash
docker-compose up --build -d
```

Este comando:
1. Construye las imágenes
2. Crea un nuevo proyecto Node.js si no existe
3. Instala dependencias básicas
4. Inicia todos los servicios

### Ejecuciones Posteriores

```bash
docker-compose up -d
```

### Detener Servicios

```bash
docker-compose down
```

## 🔧 Configuración de Servicios

### Node.js
- Ubicación del código: `./src`
- URL API: `http://localhost:3000`
- URL Nginx: `http://localhost:8000`

### MySQL
- Host: `db`
- Puerto: `3306`
- Base de datos: `nodejs_db`
- Usuario: `nodejs_user`
- Contraseña: `user_password`
- Root Password: `root_password`

### PHPMyAdmin
- URL: `http://localhost:8080`
- Usuario: `nodejs_user`
- Contraseña: `user_password`

## 📝 Comandos Útiles

### Acceder al Contenedor Node.js
```bash
docker-compose exec app sh
```

### Instalar Nuevas Dependencias
```bash
docker-compose exec app npm install [paquete]
```

### Ver Logs
```bash
docker-compose logs -f [servicio]
```

### Ejecutar Scripts NPM
```bash
docker-compose exec app npm run [script]
```

## 🔍 Solución de Problemas

### Problemas con node_modules
Si hay problemas con los módulos:
```bash
docker-compose down
rm -rf src/node_modules
docker-compose up --build -d
```

### Error de Conexión a MySQL
Si la API no puede conectar a MySQL:
1. Verifica el servicio:
```bash
docker-compose ps
```
2. Comprueba las variables de entorno
3. Confirma que el host sea `db`

### Problemas con Nodemon
Si el hot-reload no funciona:
1. Verifica los logs:
```bash
docker-compose logs app
```
2. Comprueba la configuración de volúmenes

## 🔒 Seguridad

- Modifica las contraseñas por defecto
- Revisa los permisos de archivos
- Actualiza las imágenes regularmente
- Configura CORS apropiadamente
- Usa variables de entorno para secrets

## 📦 Personalización

### Modificar Puertos
En `docker-compose.yml`:
```yaml
ports:
  - "nuevo_puerto:3000"  # Para Node.js
  - "nuevo_puerto:80"    # Para nginx
```

### Añadir Dependencias Globales
En `Dockerfile`:
```dockerfile
RUN npm install -g [paquete]
```

### Configurar Nginx
Edita `docker/nginx/conf.d/app.conf`

## 🛠️ Desarrollo

### Estructura de API Recomendada
```
src/
├── controllers/
├── models/
├── routes/
├── middleware/
├── config/
└── index.js
```

### Scripts NPM Incluidos
- `npm start`: Inicia la aplicación
- `npm run dev`: Inicia con nodemon

### Debugging
1. Configura el inspect flag:
```yaml
command: node --inspect=0.0.0.0 index.js
```
2. Conecta usando Chrome DevTools

## 🤝 Contribuir

1. Fork el proyecto
2. Crea tu rama de feature
3. Commit tus cambios
4. Push a la rama
5. Crea un Pull Request

## 📝 Notas Adicionales

- El proyecto usa Express.js por defecto
- Configurado con las mejores prácticas de Docker
- Optimizado para desarrollo
