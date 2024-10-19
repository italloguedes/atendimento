# Use a imagem base oficial do PHP 8.2
FROM php:8.2-fpm

# Instale as dependências do sistema
RUN apt-get update && apt-get install -y libpng-dev libjpeg-dev libfreetype6-dev unzip git

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

# Exponha a porta 9000
EXPOSE 9000

# Execute o servidor PHP
CMD ["php-fpm"]
