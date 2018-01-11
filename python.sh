export MyPyHome="$HOME/python_learn" 
[[ -d "$MyPyHome" ]] || mkdir -p $MyPyHome

echo '$MyPyHome:'$MyPyHome;

cd $MyPyHome
subl -a $MyPyHome

newpy() {
	[[ "$2" == "-f" ]] && (rm -rf $MyPyHome/$1)
	[[ -d "$MyPyHome/$1" ]] || (echo "Create $MyPyHome/$1"; mkdir -p "$MyPyHome/$1"; touch "$MyPyHome/$1/main.py")
	[[ -d "$MyPyHome/$1" ]] && return 0
	echo "$MyPyHome/$1 already exists"; 
}

removepy() {
	[[ -d "$MyPyHome/$1" ]] && (rm -rf $MyPyHome/$1)
	[[ -d "$MyPyHome/$1" ]] || (echo "$MyPyHome/$1 has removed")
	[[ -d "$MyPyHome/$1" ]] || return 0
	echo "Can not find $MyPyHome/$1"
}

alias rb="source ~/.bashrc"
alias eb="subl -a ~/.bashrc"
alias n=newpy
alias c=removepy
