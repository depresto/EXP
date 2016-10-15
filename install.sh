wget https://github.com/depresto/EXP/raw/master/miner.tar.gz
tar -zxvf miner.tar.gz

echo "setsid ./darkmine/ethdcrminer64 -epool ebit4fun.com:8008 -ewal 0x668fa3e3295b819bbd18d73bc3c096385e503ee3 -epsw x -mode 1 -wd 1 -esm 0 -allcoins 1 -eworker $WORKER >> ~/mine.log 2>&1 < /dev/null &" >> ./startup-miner.sh
./startup-miner.sh

