export MyPyHome="$HOME/git/python-learn"
[[ -d "$MyPyHome" ]] || mkdir -p $MyPyHome
pipenv --version || pip3 install pipenv || return 1
python3 --version
echo '$MyPyHome:'$MyPyHome;

cd $MyPyHome
subl -a $MyPyHome

installPack() {
	[[ -z $1 ]] && "Please tell me a package name to install"
	[[ -z $1 ]] || pipenv install $1 --three
}

newpy() {
	[[ "$2" == "-f" ]] && (rm -rf $MyPyHome/$1)
	[[ -d "$MyPyHome/$1" ]] || (echo "Create $MyPyHome/$1"; mkdir -p "$MyPyHome/$1"; printf "def main():\r\tprint('main function')\rmain()" >> "$MyPyHome/$1/main.py"; cd $MyPyHome/$1; runpy main.py;)
	[[ -d "$MyPyHome/$1" ]] && return 0
	echo "$MyPyHome/$1 already exists"; 
}

removepy() {
	[[ -d "$MyPyHome/$1" ]] && (rm -rf $MyPyHome/$1)
	[[ -d "$MyPyHome/$1" ]] || (echo "$MyPyHome/$1 has removed")
}

runpy() {
	[[ -f "./$1" ]] && (pipenv run python3 ./$1;)
	[[ -f "./$1" ]] || (pipenv run python3 ./main.py;)
}

function rb() {
	[ -f ~/.bashrc ] && source ~/.bashrc
	[ -f ~/.bash_profile ] && source ~/.bash_profile
}

function eb() {
	[ -d $MyPyHome ] && subl -a $MyPyHome
}

alias rb=rb
alias eb=eb
alias n=newpy
alias d=removepy
alias r=runpy
alias i=installPack
