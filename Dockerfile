FROM node:18-alpine

# Criar diretório de trabalho
WORKDIR /app

# Instalar n8n globalmente
RUN npm install -g n8n

# Expor a porta dinâmica do Render
ENV PORT=5678
EXPOSE ${PORT}

# Comando de inicialização
CMD ["n8n", "start"]
