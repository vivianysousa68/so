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

dev_senior:x:1001:1001: :/home/dev_senior:/bin/sh
dev_junior:x:1002:1001: :/home/dev_junior:/bin/sh
qa_analyst:x:1003:1002: :/home/qa_analyst:/bin/sh


# 3 Definições de senha dos usuarios

sudo passwd dev_senior | dev_junior | qa_analyst "@mar532"


# 4 Estrutura de Diretórios

sudo mkdir -p /srv/projetos/backend
sudo mkdir -p /srv/projetos/frontend,


# Verificação

total:8
drwxr-xr-x2 root root 4096 jan 13 13:18 backend
drwxr-xr-x2 root root 4096 jan 13 13:18 frontend


# 5
