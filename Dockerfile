FROM node:18-alpine

WORKDIR /app

# Tambahkan environment variable
ENV VITE_API_URL=http://209.38.95.60:3000

COPY package*.json ./
RUN npm install

COPY . .

EXPOSE 5173

CMD ["npm", "run", "dev", "--", "--host", "0.0.0.0"]
