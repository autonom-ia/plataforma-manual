FROM nginx:stable-alpine

COPY treinamento.html /usr/share/nginx/html/index.html
COPY *.png /usr/share/nginx/html/

# Configuração do Nginx para servir o site estático
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
