import { defineConfig } from 'vite'

export default defineConfig({
  server: {
    watch: {
      // Use polling so atomic file writes (from MCP/editors) trigger hot-reload
      usePolling: true,
      interval: 500,
    },
  },
})
