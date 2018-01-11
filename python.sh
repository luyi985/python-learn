export MyPyHome="$HOME/python-learn" 
[[ -d "$MyPyHome" ]] || mkdir -p $MyPyHome

echo '$MyPyHome:'$MyPyHome;

cd $MyPyHome
subl -a $MyPyHome

newpy() {
	[[ "$2" == "-f" ]] && (rm -rf $MyPyHome/$1)
	[[ -d "$MyPyHome/$1" ]] || (echo "Create $MyPyHome/$1"; mkdir -p "$MyPyHome/$1"; printf "def main():\r\tprint('main function')\rmain()" >> "$MyPyHome/$1/main.py"; build $1)
	[[ -d "$MyPyHome/$1" ]] && return 0
	echo "$MyPyHome/$1 already exists"; 
}

removepy() {
	[[ -d "$MyPyHome/$1" ]] && (rm -rf $MyPyHome/$1)
	[[ -d "$MyPyHome/$1" ]] || (echo "$MyPyHome/$1 has removed")
}

build() {
	[[ -d "$MyPyHome/$1" ]] && (py "$MyPyHome/$1/main.py")
	[[ -d "$MyPyHome/$1" ]] || (echo "$MyPyHome/$1 not found!")
}

alias rb="source ~/.bashrc"
alias eb="subl -a ~/.bashrc"
alias n=newpy
alias d=removepy
alias b=build
