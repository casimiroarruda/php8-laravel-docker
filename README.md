# Projeto exemplo

## PHP8 + Laravel + Docker + XDebug

<p align="center"><a href="https://laravel.com" target="_blank"><img src="https://raw.githubusercontent.com/laravel/art/master/logo-lockup/5%20SVG/2%20CMYK/1%20Full%20Color/laravel-logolockup-cmyk-red.svg" width="400"></a></p>

### Construindo a imagem pra `DESENVOLVIMENTO`

```shell
docker build -t casimiro:php8-laravel-dev .
```

### XDebug

Inicie a sessão no VSCode `ANTES` de executar o container por possível conflito de porta

### Rodando a aplicação

```shell
docker run -p 80:80 -p 9003:9003 --name dev -v $PWD:/var/www/app:Z -it casimiro:php8-laravel-dev
```

#### Consideração sobre XDEBUG e WSL

> É uma configuração deveras complicadinha. Executei em uma máquina Windows, pelo WSL2. Pode ser que no Linux diretamente possa ser mais tranquilo.

### Produção

```shell
docker build -t casimiro:php8-laravel-prod -f production.dockerfile .
```

### `.docker-resources`

No diretório `.docker-resources` estão os arquivos de configuração para PHP, FPM, Nginx e Supervisor.
