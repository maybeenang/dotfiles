clear
echo ".. please wait... terminal's loading.... "
progress_bar 2
clear
zsh -c 'for i in {1..$COLUMNS}; do echo -ne .; done'
zsh -c 'for i in {1..$(($COLUMNS/4))}; do echo -ne " "; done; echo "Welcome back, $USER"'
zsh -c 'for i in {1..$COLUMNS}; do echo -ne .; done; echo -ne "\n";'
echo $(mail)
echo "Disk Usage:"
df -h | grep disk | head -n2 | awk '{print "\t"$1"\t"$2"\t"$3"\t"$5"\t"$9}'
zsh -c 'for i in {1..$COLUMNS}; do echo -ne _; done'
