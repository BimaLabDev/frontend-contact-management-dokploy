FROM node:18-alpine

WORKDIR /app

# Salin package.json & install deps
COPY package*.json ./
RUN npm install

# Set environment variable (harus VITE_ prefix)
ENV VITE_API_PATH="https://bimadev.com/api"

# Salin semua source code ke container
COPY . .

EXPOSE 5173

# Jalankan Vite dev server
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
