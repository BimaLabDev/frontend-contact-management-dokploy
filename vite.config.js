import { defineConfig } from 'vite'
import react from '@vitejs/plugin-react'

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  define: {
    'import.meta.env.VITE_API_PATH': JSON.stringify(process.env.VITE_API_PATH || 'http://localhost:3000/api')
  },
  server: {
    host: '0.0.0.0',
    port: 5173,
    allowedHosts: ['bimadev.com'],
  }
})
