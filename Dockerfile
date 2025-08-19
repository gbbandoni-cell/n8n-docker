FROM n8nio/n8n

# Render usa a variável interna $PORT, precisamos expor ela
EXPOSE $PORT

# Comando para iniciar o n8n usando a porta dinâmica do Render
CMD ["n8n", "start", "--port", "$PORT"]
