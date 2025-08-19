# Usa a imagem oficial do n8n
FROM n8nio/n8n:latest

# Define o diretório de trabalho
WORKDIR /data

# Expõe a porta (Render usa a env $PORT)
EXPOSE 10000

# Comando de inicialização
CMD ["n8n"]
