FROM node:18-alpine

WORKDIR /app

# Salin package.json & install deps
COPY package*.json ./
RUN npm install

# Salin semua source code ke container
COPY . .

# Set environment variable (harus VITE_ prefix)
ENV VITE_API_PATH=http://209.38.95.60:3000

EXPOSE 5173

# Jalankan Vite dev server
CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
