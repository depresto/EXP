Claymore's Dual Ethereum+Decred AMD GPU Miner.
=========================



LINKS:

GOOGLE: https://drive.google.com/open?id=0B69wv2iqszefdFZUV2toUG5HdlU
MEGA: https://mega.nz/#F!O4YA2JgD!n2b4iSHQDruEsYUvTQP5_w



FEATURES:

- Supports new "dual mining" mode: mining both Ethereum and Decred at the same time, with no impact on Ethereum mining speed. Ethereum-only mining mode is supported as well.
- Effective Ethereum mining speed is higher by 3-5% because of a completely different miner code - much less invalid and outdated shares, higher GPU load, optimized OpenCL code.
- No DAG files.
- Supports all Stratum versions for Ethereum: can be used directly without any proxies with all pools that support eth-proxy, qtminer or miner-proxy.
- Supports both Http and Stratum for Decred.
- Supports failover.
- Displays detailed mining information and hashrate for every card.
- Supports GPU selection, built-in GPU overclocking features and temperature management.
- Supports Ethereum forks (Expanse, etc).
- Windows and Linux versions.



This is POOL version.

Catalyst (Crimson) 15.12 is required for best performance and compatibility. You can get very bad results for different drivers version, or miner can fail on startup.

Set the following environment variables, especially if you have 2GB cards:

GPU_FORCE_64BIT_PTR 0
GPU_MAX_HEAP_SIZE 100
GPU_USE_SYNC_OBJECTS 1
GPU_MAX_ALLOC_PERCENT 100
GPU_SINGLE_ALLOC_PERCENT 100

For multi-GPU systems, set Virtual Memory size in Windows at least 16 GB:
"Computer Properties / Advanced System Settings / Performance / Advanced / Virtual Memory".

This miner is free-to-use, however, current developer fee is 1% for Ethereum-only mining mode (-mode 1) and 2% for Ethereum+Decred mining mode (-mode 0), every hour the miner mines for 36 or 72 seconds for developer. 
Decred is mined without developer fee.
If you don't agree with the dev fee - don't use this miner.

This version is for recent AMD videocards only: 7xxx, 2xx and 3xx, 2GB or more. No nVidia support.

There are builds for Windows x64 and for Linux x64 (tested on Ubuntu 12.04). No 32-bit support. 



COMMAND LINE OPTIONS:

-epool 	Ethereum pool address. Only Stratum protocol is supported. Miner supports all pools that are compatible with Dwarfpool proxy and accept Ethereum wallet address directly.

-ewal 	Your Ethereum wallet address. Also worker name and other options if pool supports it. 
	Pools that require "Login.Worker" instead of wallet address are not supported directly currently, but you can use "-allpools 1" option to mine there.

-dwal	Your Decred wallet address or worker name, it depends on pool.

-epsw 	Password for Ethereum pool, use "x" as password.

-eworker Worker name, it is required for some pools.

-esm	Ethereum Stratum mode. 0 - eth-proxy mode (for example, dwarpool.com), 1 - qtminer mode (for example, ethpool.org), 2 - miner-proxy mode (for example, coinotron.com). 0 is default. 

-etha	Ethereum algorithm mode. 0 - optimized for fast cards, 1 - optimized for slow cards. -1 - autodetect (default). 
	You can also set this option for every card individually, for example "-etha 0,1,0".

-ethi	Ethereum intensity. Default value is 8, you can decrease this value if you don't want Windows to freeze or if you have problems with stability. The most low GPU load is "-ethi 0".
	Also "-ethi" now can set intensity for every card individually, for example "-ethi 1,8,6".
	You can also specify negative values, for example, "-ethi -8192", it exactly means "global work size" parameter which is used in official miner.

-allpools Specify "-allpools 1" if miner does not want to mine on specified pool (because it cannot mine devfee on that pool), but you agree to use some default pools for devfee mining. 
	Note that if devfee mining pools will stop, entire mining will be stopped too.

-allcoins Specify "-allcoins 1" to be able to mine Ethereum forks, in this mode miner will use some default pools for devfee Ethereum mining. 
	Note that if devfee mining pools will stop, entire mining will be stopped too. 
	Miner has to use two DAGs in this mode - one for Ethereum and one for Ethereum fork, it can cause crashes because DAGs have different sizes. 
	Therefore for this mode it is recommended to specify current Ethereum epoch (or a bit larger value), 
	for example, "-allcoins 47" means that miner will expect DAG size for epoch #47 and will allocate appropriate GPU buffer at starting, instead of reallocating bigger GPU buffer (may crash) when it starts devfee mining.
	Another option is to specify "-allcoins -1", in this mode miner will start devfee round immediately after start and therefore will get current epoch for Ethereum, after that it will be able to mine Ethereum fork.

-dpool 	Decred pool address. Only HTTP protocol is supported currently.

-dpsw 	Password for Decred pool, use "x" as password.

-di 	GPU indexes, default is all available GPUs. For example, if you have four GPUs "-di 02" will enable only first and third GPUs (#0 and #2).

-mode	Select mining mode:
	"-mode 0" (default) means Ethereum+Decred mining mode.
	"-mode 1" means Ethereum-only mining mode. You can set this mode for every card individually, for example, "-mode 1-02" will set mode "1" for first and third GPUs (#0 and #2).

-dcri	Decred intensity. Default value is 30, you can adjust this value to get the best Decred mining speed without reducing Ethereum mining speed. 
	You can also specify values for every card, for example "-dcri 30,100,50".
	You can change the intensity in runtime with "+" and "-" keys and check current statistics with "s" key.
	For example, by default (-dcri 30) 390 card shows 29MH/s for Ethereum and 440MH/s for Decred. Setting -dcri 70 causes 24MH/s for Ethereum and 850MH/s for Decred.

-dcrt	Time period between Decred HTTP requests for new job, in seconds. Default value is 10 seconds.

-wd 	watchdog option. Default value is "-wd 1", it enables watchdog, miner will be closed (or restarted, see "-r" option) if any thread is not responding for 1 minute or OpenCL call failed.
	Specify "-wd 0" to disable watchdog.

-r	Restart miner mode. "-r 0" (default) - restart miner if something wrong with GPU. "-r -1" - disable automatic restarting. -r >20 - restart miner if something 
	wrong with GPU or by timer. For example, "-r 60" - restart miner every hour or when some GPU failed.
	"-r 1" closes miner and execute "reboot.bat" file in the miner directory (if exists) if some GPU failed. 
	So you can create "reboot.bat" file and perform some actions, for example, reboot system if you put this line there: "shutdown /r /t 5 /f".

-dbg	debug log and messages. "-dbg 0" - (default) create log file but don't show debug messages. 
	"-dbg 1" - create log file and show debug messages. "-dbg -1" - no log file and no debug messages.

-tt	set target GPU temperature. For example, "-tt 80" means 80C temperature. You can also specify values for every card, for example "-tt 70,80,75".
	You can also set static fan speed if you specify negative values, for example "-tt -50" sets 50% fan speed. Specify zero to disable control for some card(s).
	Unfortunately, AMD blocked underclocking for some reason, you can overclock only.

-cclock	set target GPU core clock speed, in MHz. If not specified or zero, miner will not change current clock speed. You can also specify values for every card, for example "-cclock 1000,1050,1100,0".
	Unfortunately, AMD blocked underclocking for some reason, you can overclock only.

-mclock	set target GPU memory clock speed, in MHz. If not specified or zero, miner will not change current clock speed. You can also specify values for every card, for example "-mclock 1200,1250,1200,0".



SAMPLE USAGE

Dual mining Ethereum & Decred:

 ethpool, ethermine  (and Stratum for Decred): 
	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool stratum+tcp://yiimp.ccminer.org:4252 -dwal DsabMdMku2tjrDcPtkwd7tvGfyskgHMG8ex -dpsw x
	you can also specify "-esm 1" option to enable "qtminer" mode, in this mode pool will display additional information about shares (accepted/rejected), for example:
	EthDcrMiner64.exe -epool us1.ethermine.org:4444 -esm 1 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F.YourWorkerName -epsw x -dpool stratum+tcp://yiimp.ccminer.org:4252 -dwal DsabMdMku2tjrDcPtkwd7tvGfyskgHMG8ex -dpsw x

 dwarfpool (and Stratum for Decred):
	EthDcrMiner64.exe -epool eth-eu.dwarfpool.com:8008 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F/YourWorkerName -epsw x -dpool stratum+tcp://dcr.suprnova.cc:2252 -dwal Redhex.my -dpsw x

 miningpoolhub:
	EthDcrMiner64.exe -epool us-east1.ethereum.miningpoolhub.com:20536 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F -eworker YourLogin.YourWorkerName -epsw x -dpool http://dcr.suprnova.cc:9111 -dwal Redhex.test -dpsw x
	you must also create worker "YourWorkerName" on pool and specify your wallet address there.

 coinotron:
	EthDcrMiner64.exe -epool coinotron.com:3344 -ewal Redhex.rig1 -esm 2 -epsw x -dpool http://dcr.suprnova.cc:9111 -dwal Redhex.my -dpsw x -allpools 1

 coinmine:
	EthDcrMiner64.exe -epool eth.coinmine.pl:4000 -ewal USERNAME.WORKER -esm 2 -epsw WORKER_PASS -dpool stratum+tcp://dcr.coinmine.pl:2222 -dwal USERNAME.WORKER -dpsw WORKER_PASS  -allpools 1

Ethereum-only mining:

 ethpool:
	EthDcrMiner64.exe -epool us1.ethpool.org:3333 -ewal 0xD69af2A796A737A103F12d2f0BCC563a13900E6F -epsw x

 f2pool:
	EthDcrMiner64.exe -epool eth.f2pool.com:8008 -ewal 0xd69af2a796a737a103f12d2f0bcc563a13900e6f -epsw x -eworker rig1

 nanopool:
	EthDcrMiner64.exe -epool eu1.nanopool.org:9999 -ewal 0xd69af2a796a737a103f12d2f0bcc563a13900e6f -epsw x -eworker rig1

Ethereum forks mining:

	EthDcrMiner64.exe -epool exp-us.dwarfpool.com:8018 -ewal 0xd69af2a796a737a103f12d2f0bcc563a13900e6f -epsw x -allcoins -1



FAILOVER

Use "epools.txt" and "dpools.txt" files to specify additional pools. These files have text format, one pool per line. Every pool has 3 connection attempts.
If the first character of a line is ";" or "#", this line will be ignored. 
Pool specified in command line is "main" pool, miner will try to return to it every 30 minutes if it has to use some different pool from the list.



KNOWN ISSUES

- Weak/old cards like 7xxx/270/270X cannot handle dual mining properly, Ethereum mining is slower by about 5%.



TROUBLESHOOTING

1. Install Catalyst v15.12.
2. Disable overclocking.
3. Set environment variables as described above.
4. Set Virtual Memory 16 GB.
5. Reboot computer.
6. Check hardware.
7. Set some timeout in .bat file before starting miner at system startup (30sec or even a minute), and try "-ethi 4" to check if it is more stable. It can help if miner is not stable on some system.
 


ADDITIONAL INFORMATION

What is dwarfpool proxy (eth-proxy)?
Official Ethereum miner does not support Stratum protocol, it supports HTTP protocol only. It causes less profit because of delays.
A proxy was created to fix it, so official Ethereum miner is locally connected to the proxy by HTTP protocol, for local network delays due to HTTP protocol are small. Proxy is connected to the pool via Stratum protocol so it has small delays too. Currently most pools support Stratum and you have to use HTTP-to-Stratum proxy to make official miner work with pools properly. Of course you can try to connect official miner to a pool directly via HTTP but you will lose 10-20% shares because of a short block time in Ethereum.
My miner does not use HTTP protocol, it uses Stratum. So you should connect it directly to the pool at Stratum port and it will work a bit faster than official miner via proxy because there is no proxy between miner and pool.
