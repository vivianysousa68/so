# 1 criação dos grupos

sudo groupadd desenvolvedores
sudo groupadd testadores

# Verificação

cat /etc/group | grep -E "desenvolvedores|testadores"


# saída

desenvolvedores: x:1001;
testadores: x;1002;



# 2 criação dos usuarios

sudo useradd -m -g desenvolvedores dev_senior
sudo useradd -m -g desenvolvedores dev_junior
sudo useradd -m -g testadores qa_analyst
sudo usermod -aG testadores dev_senior


# Verificação

cat /etc/passwd | grep -E
"dev_senior|dev_junior|qa_analyst"

 # saída
 
dev_senior:x:1001:1001: :/home/dev_senior:/bin/sh
dev_junior:x:1002:1001: :/home/dev_junior:/bin/sh
qa_analyst:x:1003:1002: :/home/qa_analyst:/bin/sh


# 3 Definições de senha dos usuarios

sudo passwd dev_senior | dev_junior | qa_analyst "@mar532"


# 4 Estrutura de Diretórios

sudo mkdir -p /srv/projeto/backend
sudo mkdir -p /srv/projeto/frontend,


# Verificação

 ls -l /srv/projeto

 # saída
total 8
drwxr-xr-x2 root root 4096 jan 13 13:18 backend
drwxr-xr-x2 root root 4096 jan 13 13:18 frontend


# 5 Gerenciamento de Permissões

sudo chown -R dev_senior:desenvolvedores /srv/projeto
sudo chmod -R 750 /srv/projeto


# Verificação

ls -l /srv/

 # saída

Total 4
drwxr-x--- 4 dev_senior desenvolvedores 4096 Jan 13 13:18 projeto


# 6 Controle de Processos

sudo login dev_junior
sleep 500 &


# Verificação PID

ps aux | grep sleep

 # saída

dev_jun+ 7969 0.0 0.0 8288 2068? S 12:32 0:00 sleep 500
vboxuser 7978 0.0 0.0 9144 2284 pts/0 S+ 12:34 0:00 grep -- color=auto sleep

# Finalizar processo
sudo kill <PID>


# 7 Shell Script de Boas-Vindas

sudo nano /usr/local/bin/boasvindas.sh

#!/bin/bash
echo '=========================================='
echo 'Bem-vindo(a) ao Servidor de Desenvolvimento!'
echo "Data e hora atual: $(date)"
echo '=========================================='

# Permissão de execução

sudo chmod 755 /usr/local/bin/boasvindas.sh
