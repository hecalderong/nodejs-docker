#!/bin/bash
# docker/init.sh

# Verificar si el proyecto ya existe
if [ ! -f "package.json" ]; then
    echo "Creando nuevo proyecto Node.js..."
    # Inicializar nuevo proyecto
    npm init -y

    # Instalar dependencias básicas
    echo "Instalando dependencias básicas..."
    npm install express cors dotenv multer -S
    npm i nodemon -D


    # Crear archivo de entrada básico
    echo "Creando archivo de entrada básico..."
    cat > index.js << EOL
const express = require('express');
const cors = require('cors');
const app = express();

app.use(cors());
app.use(express.json());

const PORT = process.env.PORT || 3000;

app.get('/', (req, res) => {
    res.json({ message: 'Bienvenido a la API de Node.js' });
});

app.listen(PORT, () => {
    console.log(\`Servidor corriendo en el puerto \${PORT}\`);
});
EOL

    # Actualizar package.json con scripts
    node -e "
        const package = require('./package.json');
        package.scripts = {
            ...package.scripts,
                'start': 'node index.js',
            'dev': 'nodemon --watch index.js'
        };
        require('fs').writeFileSync('package.json', JSON.stringify(package, null, 2));
    "
    echo "Archivo de entrada creado con éxito"
    echo "Iniciando el servidor en modo desarrollo..."
    npm run dev
else
    echo "El proyecto ya existe, instalando dependencias..."
    npm install
    echo "Iniciando el servidor en modo desarrollo..."
    npm run dev
fi  
