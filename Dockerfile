# Usa imagem oficial do Node
FROM node:18

# Cria diretório de trabalho
WORKDIR /data

# Instala n8n globalmente
RUN npm install -g n8n

# Expõe a porta
EXPOSE 5678

# Comando para iniciar
CMD ["n8n", "start"]
