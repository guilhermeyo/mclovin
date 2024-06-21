if [ -d ~/backgrounds ]; then
  mv "~/backgrounds" "$HOME/backgrounds.old.$(date +%Y-%m-%d_%H-%M-%S)"
fi
cd /tmp
wget https://guilherme44.s3.sa-east-1.amazonaws.com/limbo-files/backgrounds.zip
unzip /tmp/backgrounds.zip -d ~/
rm backgrounds.zip
cd -
