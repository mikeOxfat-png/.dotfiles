# makes wget save filename as recommended by the server
alias wget="wget --content-disposition"

# python aliases
alias py="python3"
alias ipy="ipython"

# logisim aliases (CSO211)
alias logi="java -jar ~/Tools/logisim/logisim-generic-2.7.1.jar"
alias logidark="java -jar ~/Tools/logisim/logisim-dark-generic-0.9.9.jar"

# nand-2-tetris aliases
alias hwsimul="/home/aks/codin/random_stuff/nand_2_tetris/nand2tetris/tools/HardwareSimulator.sh"
alias cpusimul="/home/aks/codin/random_stuff/nand_2_tetris/nand2tetris/tools/CPUEmulator.sh"

# ctf etc aliases
alias cyberchef="firefox --new-window  ~/Tools/CyberChef/*.html"
alias pwn_college="ssh -i ~/.ssh/id_ed25519 hacker@dojo.pwn.college"
alias tryhackme="echo -e '\033[48;2;255;219;21m\033[38;2;0;0;255m******************************************************************\n* ensure that mobile hotspot is connected, then the switch trick *\n******************************************************************\033[m';sudo openvpn ~/codin/infosec/ctf/tryhackme/rasimhankunrava.ovpn"

# corewars pmars alias
alias pmars='/home/aks/random/pmars_core_wars/pmars-0.9.4/src/pmars'

# alias for browser-sync (with p5.js)
alias bs='browser-sync start --server --files "*.js, *.html, *.css"'

mcd()
{
	 test -d "$1" || mkdir "$1" && cd "$1"
}


submit_imaginary()
{
	echo "Submitting $1"
	curl -iL \
    	 -H "Content-Type: application/json" \
     	-d "{\"flag\": \"$1\"}" \
    	"https://imaginaryctf.org/api/flags/submit?apikey=$imaginary_api_key"

}


contest()
{
    cd ~/codin/cp/codeforces
	echo "reached the codeforces directory" 
	
	if [[ "$1" -ne 0 ]]
		then
		echo "making contest $1 folder"
		mcd "$1"
		nvim 
	fi
	
}
ctf()
{
	cd ~/codin/infosec/ctf
	
	if [[ -n  "$1" ]]
		then
		mcd "$1"
		mkdir "crypto" "pwn" "rev" "foren" "web" "misc" "osint"
		nvim .
	fi
}
export PATH=$PATH:~/.local/bin 
export PATH=/home/aks/.nimble/bin:$PATH

source /home/aks/.zsh_plugins/z_jump_around/z.sh
