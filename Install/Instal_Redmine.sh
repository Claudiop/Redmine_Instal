#!/bin/bash

clear

echo '###############################'
echo '# Instalador do Redmine [ECO] #'
echo '#                             #'
echo '# Criado por:                 #'
echo '# claudiophelippe@gmail.com   #'
echo '#                             #'
echo '###############################'
echo ''
sleep 2

if [ "root" != "$USER" ]; then
	echo "Inicie o Script como usuário root!";
	sleep 3
	exit;
fi

VR=$1

if [ "${VR,,}" == "-i" ]; then

echo ''
echo 'Iniciando Verificacao de Repositorios...'

DiretorioSS="/etc/apt/sources.list"

SITE0="deb http://br.archive.ubuntu.com/ubuntu/ focal main restricted"
SITE1="deb http://br.archive.ubuntu.com/ubuntu/ focal-updates main restricted"
SITE2="deb http://br.archive.ubuntu.com/ubuntu/ focal universe"
SITE3="deb http://br.archive.ubuntu.com/ubuntu/ focal-updates universe"
SITE4="deb http://br.archive.ubuntu.com/ubuntu/ focal multiverse"
SITE5="deb http://br.archive.ubuntu.com/ubuntu/ focal-updates multiverse"
SITE6="deb http://br.archive.ubuntu.com/ubuntu/ focal-backports main restricted universe multiverse"
SITE7="deb http://security.ubuntu.com/ubuntu focal-security main restricted"
SITE8="deb http://security.ubuntu.com/ubuntu focal-security universe"
SITE9="deb http://security.ubuntu.com/ubuntu focal-security multiverse"
SITE10="deb http://archive.ubuntu.com/ubuntu focal main restricted"
SITE11="deb http://archive.ubuntu.com/ubuntu focal-updates main restricted"
SITE12="deb http://security.ubuntu.com/ubuntu focal-security main restricted"
SITE13="deb https://repo.protonvpn.com/debian unstable main"
SITE14="deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_17.04/ ./"
SITE15="deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_17.04/ ./"
SITE16="deb http://download.opensuse.org/repositories/home:/strycore/xUbuntu_17.04/ ./"



if grep -q "### ADD ###" "$DiretorioSS"; then
        echo "..."
else
	echo "### ADD ###" >> "$DiretorioSS"
	echo "###########" >> "$DiretorioSS"
fi



if grep -q "$SITE0" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE0" >> "$DiretorioSS"
	echo "Adicionado: $SITE0"
fi

if grep -q "$SITE1" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE1" >> "$DiretorioSS"
	echo "Adicionado: $SITE1"
fi

if grep -q "$SITE2" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE2" >> "$DiretorioSS"
	echo "Adicionado: $SITE2"
fi

if grep -q "$SITE3" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE3" >> "$DiretorioSS"
	echo "Adicionado: $SITE3"
fi

if grep -q "$SITE4" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE4" >> "$DiretorioSS"
	echo "Adicionado: $SITE4"
fi

if grep -q "$SITE5" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE5" >> "$DiretorioSS"
	echo "Adicionado: $SITE5"
fi

if grep -q "$SITE6" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE6" >> "$DiretorioSS"
	echo "Adicionado: $SITE6"
fi

if grep -q "$SITE7" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE7" >> "$DiretorioSS"
	echo "Adicionado: $SITE7"
fi

if grep -q "$SITE8" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE8" >> "$DiretorioSS"
	echo "Adicionado: $SITE8"
fi

if grep -q "$SITE9" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE9" >> "$DiretorioSS"
	echo "Adicionado: $SITE9"
fi

if grep -q "$SITE10" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE10" >> "$DiretorioSS"
	echo "Adicionado: $SITE10"
fi

if grep -q "$SITE11" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE11" >> "$DiretorioSS"
	echo "Adicionado: $SITE11"
fi

if grep -q "$SITE12" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE12" >> "$DiretorioSS"
	echo "Adicionado: $SITE12"
fi

if grep -q "$SITE13" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE13" >> "$DiretorioSS"
	echo "Adicionado: $SITE13"
fi

if grep -q "$SITE14" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE14" >> "$DiretorioSS"
	echo "Adicionado: $SITE14"
fi

if grep -q "$SITE15" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE15" >> "$DiretorioSS"
	echo "Adicionado: $SITE15"
fi

if grep -q "$SITE16" "$DiretorioSS"; then
        echo "[OK]"
else
	echo "$SITE16" >> "$DiretorioSS"
	echo "Adicionado: $SITE16"
fi

echo "###############################################" >> "$DiretorioSS"
echo ""
echo "Dependencias Estabelecidas!"
fi
sleep 3
echo "Iniciando Atualizacao"
echo ""

apt-get update -y
apt-get upgrade -y

echo ""
echo "Iniciando Instalacao do Banco: "
echo ""

apt-get install mariadb-server mariadb-client -y
systemctl enable mariadb
mysql_secure_installation

echo ""
echo "Banco Instalado"
echo ""
echo ""
echo "Criando Database no banco"
echo "Pressione uma tecla para continuar..."
read
echo ""
mysql -u root -p

echo "Finalizado Configuracoa do Banco"
echo ""
echo ""
echo "Instalando Apache"
echo ""
apt-get install apache2 libapache2-mod-passenger -y

echo ""
echo "_______________________________"
echo ""
echo "Instalando Redmine"
echo ""
apt-get install redmine redmine-mysql -y
echo ""
echo "Redmine Instalado!"
echo ""
echo "Instalando GEM..."
echo ""
gem install bundler
echo ""
echo "Necessario Configurar o arquivo do apache..."
echo "Pressione uma tecla para continuar..."
read
echo ""
sleep 1
echo ""
nano /etc/apache2/mods-available/passenger.conf
echo ""
echo "Arquivo Configurado."
echo ""
echo "Iniciando sets do apache e redmine..."
echo ""
echo ""
ln -s /usr/share/redmine/public /var/www/html/redmine
touch /usr/share/redmine/Gemfile.lock
chown www-data:www-data /usr/share/redmine/Gemfile.lock
chown -R www-data:www-data /var/www/html/redmine
echo ""
echo "Sets Configurados."
sleep 1
echo ""
echo "Necessario Configurar Arquivo 'Conf' do redmine..."
echo "Insira os Dados de Configuracao em seguida!"
echo "Pressione uma tecla para continuar..."
read
echo ""
sleep 6
nano /etc/apache2/sites-available/redmine.conf
echo ""
echo ""
echo "Arquivo do redmine configurado."
echo ""
echo "Setando Conf:"
a2ensite redmine.conf
echo "Resetando Apache..."
systemctl restart apache2
echo "Apache resetado."
echo "Instalacao Finalizada!"
echo ""
systemctl status apache2
echo ""
