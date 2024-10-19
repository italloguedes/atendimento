# Use uma imagem base adequada
FROM php:8.2-fpm

# Instale as dependências do sistema
RUN apt-get update && apt-get install -y nginx

# Copie a configuração do Nginx
COPY ./nginx.config /etc/nginx/conf.d/default.conf

# Copie o código da aplicação para o diretório apropriado
COPY . /var/www

# Exponha a porta 80
EXPOSE 80

# Inicie o Nginx e PHP-FPM
CMD service nginx start && php-fpm
