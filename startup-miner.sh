#cd ~/softwares/eth-proxy; setsid python eth-proxy.py >> ~/mine-server.log 2>&1 < /dev/null &
#setsid ethminer --farm-recheck 300 -G -F http://127.0.0.1:8080/depresto >> ~/mine.log 2>&1 < /dev/null &
export GPU_FORCE_64BIT_PTR=0
export GPU_MAX_HEAP_SIZE=100
export GPU_USE_SYNC_OBJECTS=1
export GPU_MAX_ALLOC_PERCENT=100
export GPU_SINGLE_ALLOC_PERCENT=100

#setsid ~/darkmine/ethdcrminer64 -epool eth-asia.dwarfpool.com:8008 -ewal 0xa10927bff2fd2485fe1a24150d917dc24d3dfb36 -epsw x -mode 1 -wd 1 -eworker depresto >> ~/mine.log 2>&1 < /dev/null &
setsid ./darkmine/ethdcrminer64 -epool ebit4fun.com:8008 -ewal 0x668fa3e3295b819bbd18d73bc3c096385e503ee3 -epsw x -mode 1 -wd 1 -esm 0 -allcoins 1 -eworker depresto >> ~/mine.log 2>&1 < /dev/null &
