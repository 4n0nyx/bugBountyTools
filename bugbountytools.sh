#!/bin/bash
echo '
    ____              ____                    __       
   / __ )__  ______ _/ __ )____  __  ______  / /___  __
  / __  / / / / __ `/ __  / __ \/ / / / __ \/ __/ / / /
 / /_/ / /_/ / /_/ / /_/ / /_/ / /_/ / / / / /_/ /_/ / 
/_____/\__,_/\__, /_____/\____/\__,_/_/ /_/\__/\__, /  
            /____/                            /____/   
  ______            __    
 /_  __/___  ____  / /____
  / / / __ \/ __ \/ / ___/
 / / / /_/ / /_/ / (__  ) 
/_/  \____/\____/_/____/                  by 4n0nyx
                         
' 
echo -e '\e[1;31mThe following tools will be installed: 
ffuf, wfuzz, assetfinder, subfinder, anew, amass,findomain,chaos, haktrails, github-search, dnsx, httpx, gowitness, waybackurls, 
gau, gauplus, gf, unfurl,arjun, paramSpider, subjs, anti-burl, kiterunner, gitDorker, nuclei, dalfox, jsscanner.\n\n\e[0m' ;

echo -e '\e[1;32mUpdating system...\n\e[0m' ;

sudo apt update ;
sudo apt upgrade ;

mkdir bugbounty ;
cd bugbounty ;

chaos=yourApiKey
github=yourApiKey
securitytrails=yourApiKey
shodan=yourApiKey

mkdir api ;
echo '${chaos}' > ./api/chaos ;
echo '${github}' > ./api/github ;
echo '${securitytrails}' > ./api/securitytrails ;
echo '${shodan}' > ./api/shodan ;

echo -e '\e[1;32m\nInstalling...\n\e[0m' ;

sudo apt install golang-go ;
sudo apt -y install python3-pip ;
sudo apt install jq ;
sudo apt install git ;
sudo apt install chromium-browser ;
sudo apt install snapd ;
sudo service snapd start ;

sudo go get -u github.com/ffuf/ffuf ;
sudo cp /root/go/bin/ffuf /usr/bin/ffuf ;

sudo pip3 install wfuzz ;

sudo go get -u github.com/tomnomnom/assetfinder ;
sudo cp /root/go/bin/assetfinder /usr/bin/assetfinder ;

sudo GO111MODULE=on go get -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder ;
sudo cp /root/go/bin/subfinder /usr/bin/subfinder ;
sudo echo 'resolvers:
    - 1.1.1.1:53
    - 1.0.0.1:53
    - 8.8.8.8:53
    - 8.8.4.4:53
    - 9.9.9.9:53
    - 9.9.9.10:53
    - 77.88.8.8:53
    - 77.88.8.1:53
    - 208.67.222.222:53
    - 208.67.220.220:53
sources:
    - alienvault
    - anubis
    - bufferover
    - certspotter
    - censys
    - chaos
    - crtsh
    - dnsdumpster
    - hackertarget
    - intelx
    - passivetotal
    - robtex
    - riddler
    - securitytrails
    - shodan
    - spyse
    - sublist3r
    - threatcrowd
    - threatminer
    - virustotal
all-sources:
    - alienvault
    - anubis
    - archiveis
    - binaryedge
    - bufferover
    - censys
    - certspotter
    - chaos
    - commoncrawl
    - crtsh
    - dnsdumpster
    - dnsdb
    - github
    - hackertarget
    - intelx
    - passivetotal
    - rapiddns
    - riddler
    - recon
    - robtex
    - securitytrails
    - shodan
    - sitedossier
    - sonarsearch
    - spyse
    - sublist3r
    - threatbook
    - threatcrowd
    - threatminer
    - virustotal
    - waybackarchive
    - zoomeye
recursive:
    - alienvault
    - binaryedge
    - bufferover
    - certspotter
    - crtsh
    - dnsdumpster
    - hackertarget
    - passivetotal
    - securitytrails
    - sonarsearch
    - sublist3r
    - virustotal
binaryedge: []
censys: []
certspotter: []
chaos: 
	- ${chaos}
dnsdb: []
github: 
	- ${github}
intelx: []
passivetotal: []
recon: []
robtex: []
securitytrails:
	- ${securitytrails}
shodan: 
	- ${shodan}
spyse: []
threatbook: []
urlscan: []
virustotal: []
zoomeye: []
subfinder-version: 2.4.8' > /root/.config/subfinder/config.yaml ;

sudo go get -u github.com/tomnomnom/anew ;
sudo cp /root/go/bin/anew /usr/bin/anew ;

sudo snap install amass ;

wget https://github.com/findomain/findomain/releases/latest/download/findomain-linux ;
chmod +x findomain-linux ;
mv findomain-linux findomain ;
mv findomain /usr/bin/ ;

sudo GO111MODULE=on go get -v github.com/projectdiscovery/chaos-client/cmd/chaos ;
sudo cp /root/go/bin/chaos /usr/bin/chaos ;

sudo go get github.com/hakluke/haktrails ;
sudo cp /root/go/bin/haktrails /usr/bin/haktrails ;
sudo mkdir /root/.config/haktrails/ ;
echo '
securitytrails:
  key: ${securitytrails}
' > /root/.config/haktools/haktrails-config.yml ; 

git clone https://github.com/gwen001/github-search.git ;
sudo pip3 install -r ./github-search/requirements3.txt ;

sudo GO111MODULE=on go get -v github.com/projectdiscovery/dnsx/cmd/dnsx ;
sudo cp /root/go/bin/dnsx /usr/bin/dnsx ;

sudo GO111MODULE=on go get -v github.com/projectdiscovery/httpx/cmd/httpx ;
sudo cp /root/go/bin/httpx /usr/bin/httpx ;

sudo go get -u github.com/sensepost/gowitness ;
sudo cp /root/go/bin/gowitness /usr/bin/gowitness ;

sudo go get github.com/tomnomnom/waybackurls ;
sudo cp /root/go/bin/waybackurls /usr/bin/waybackurls ;

sudo GO111MODULE=on go get -u -v github.com/lc/gau ;
sudo cp /root/go/bin/gau /usr/bin/gau ;

sudo GO111MODULE=on go get -u -v github.com/bp0lr/gauplus ;
sudo cp /root/go/bin/gauplus /usr/bin/gauplus ;

sudo go get -u github.com/tomnomnom/gf ;
sudo cp /root/go/bin/gf /usr/bin/gf ;
sudo mkdir /root/.gf ;
echo 'source $GOPATH/src/github.com/tomnomnom/gf/gf-completion.bash' >> /root/.bashrc ;
cp -r $GOPATH/src/github.com/tomnomnom/gf/examples /root/.gf ;

git clone https://github.com/devanshbatham/ParamSpider ;
sudo pip3 install -r ./ParamSpider/requirements.txt ;

sudo go get -u github.com/tomnomnom/unfurl ;
sudo cp /root/go/bin/unfurl /usr/bin/unfurl ;

sudo pip3 install arjun ;

sudo GO111MODULE=on go get -u -v github.com/lc/subjs ;
sudo cp /root/go/bin/subjs /usr/bin/subjs ;

wget https://raw.githubusercontent.com/tomnomnom/hacks/master/anti-burl/main.go ;
go build main.go ;
rm -rf main.go ;
mv main anti-burl ;
mv anti-burl /usr/bin/ ;

wget https://github.com/assetnote/kiterunner/releases/download/v1.0.2/kiterunner_1.0.2_linux_amd64.tar.gz ;
tar -xvf kiterunner_1.0.2_linux_amd64.tar.gz ;
mv kr /usr/bin/ ;
rm -rf kiterunner_1.0.2_linux_amd64.tar.gz ;
mkdir kr ;
wget https://wordlists-cdn.assetnote.io/data/kiterunner/routes-large.kite.tar.gz
tar -xvf routes-large.kite.tar.gz ;
rm -rf routes-large.kite.tar.gz ;
mv routes-large.kite ./kr/ ;

git clone https://github.com/obheda12/GitDorker.git ;
sudo pip3 install -r ./GitDorker/requirements.txt ;

sudo GO111MODULE=on go get -v github.com/projectdiscovery/nuclei/v2/cmd/nuclei ;
sudo cp /root/go/bin/nuclei /usr/bin/nuclei ;
nuclei -update-templates ;

sudo snap install dalfox ;
mkdir dalfox ;
wget https://raw.githubusercontent.com/s0md3v/Arjun/master/arjun/db/params.txt ;
mv params.txt ./dalfox ;

git clone https://github.com/0x240x23elu/JSScanner.git ;
pip3 install -r  ./JSScanner/requirements.txt ;


echo '
 ___ _      _    _           _   ___         _        _ _      _   _          
| __(_)_ _ (_)__| |_  ___ __| | |_ _|_ _  __| |_ __ _| | |__ _| |_(_)___ _ _  
| _|| |   \| (_-<   \/ -_) _` |  | ||   \(_-<  _/ _` | | / _` |  _| / _ \   \ 
|_| |_|_||_|_/__/_||_\___\__,_| |___|_||_/__/\__\__,_|_|_\__,_|\__|_\___/_||_|
    															
    															 by 4n0nyx
'
