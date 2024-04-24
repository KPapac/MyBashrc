# Aliases
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
# Check if exa is installed
if command -v exa &> /dev/null; then
  alias ll='exa -l -s name'
  alias la='exa -al -s name'
  alias lt='exa -l -s modified'
  alias l='exa'
else
  alias ls='ls --color=auto'
  alias ll='ls --color=auto -lh'
  alias la='ls --color=auto -lha'
  alias lt='ls --color=auto -lhrt'
fi

# May need to setup for correct nvim path?
#alias vim='~/nvim-linux64/bin/nvim'

# Functions
function tsv {
  cat "$@" | column -t -s $'\t' | less -S
}
function csv {
  cat "$@" | column -t -s,  | less -S
}

fasta_extract_contigs(){
  fasta_file=$1
  list_of_contig_headers=$2
  awk '{ if ((NR>1)&&($0~/^>/)) { printf("\n%s", $0); } else if (NR==1) { printf("%s", $0); } else { printf("\t%s", $0); } }' $fasta_file | grep -Ff $list_of_contig_headers - | tr "\t" "\n" 
}
fasta_remove_contigs(){
  fasta_file=$1
  list_of_contig_headers=$2
  awk '{ if ((NR>1)&&($0~/^>/)) { printf("\n%s", $0); } else if (NR==1) { printf("%s", $0); } else { printf("\t%s", $0); } }' $fasta_file | grep -v -Ff $list_of_contig_headers - | tr "\t" "\n" 
}

# Paths exported for binaries
export PATH=$PATH:/home/kostas/bin/
export PATH=$PATH:/home/kostas/opt/

source $HOME/.config/history.sh
source $HOME/.config/shopt.sh
eval "$(starship init bash)"
