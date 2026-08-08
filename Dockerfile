# 1. Usar una imagen de Node
FROM node:24-alpine

# 2. Establecer el directorio de trabajo
WORKDIR /app

# 3. Copiar dependencias y configuración de Yarn
COPY package.json yarn.lock .yarnrc.yml ./

# 4. Habilitar Corepack e instalar dependencias (Yarn moderno)
RUN corepack enable
RUN yarn install 

# 5. Copiar el resto del código 
COPY . .

# 6. Ejecutar el script de construcción
RUN yarn build

# 7. Comando para arrancar 
CMD ["node", "dist/index.cjs"]