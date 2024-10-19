# Use a imagem base oficial do PHP 8.2
FROM php:8.2-fpm

# Instale as dependências do sistema
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev unzip git nginx

# Instale as extensões do PHP necessárias
RUN docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install gd

# Defina o diretório de trabalho
WORKDIR /var/www

# Copie o conteúdo do seu projeto para o contêiner
COPY . .

# Instale as dependências do Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && composer install --no-interaction --optimize-autoloader

# Copie o arquivo de configuração do Nginx
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Exponha a porta 80
EXPOSE 80

# Execute o Nginx e o PHP-FPM
CMD ["sh", "-c", "service nginx start && php-fpm"]
