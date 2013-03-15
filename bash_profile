#print_before_the_prompt () {  
      #printf "\n$txtred%s: $bldgrn%s $txtpur%s\n$txtrst" "$USER" "$PWD" "$(vcprompt -f '[%n:%b%m%u] ')"  
#}

print_before_the_prompt () {  
      printf "\n$txtblu%s$txtwht@$bldgrn%s: $txtwht%s $txtpur%s\n$txtrst" "$USER" "$HOSTNAME" "$PWD"  
}

# alias vim="/Applications/MacVim.app/Contents/MacOS/Vim"

export PATH=/usr/bin:$PATH:/Users/sethe/stuff/adt-bundle-mac/sdk/platform-tools:/Users/sethe/stuff/adt-bundle-mac/sdk/tools
EVENT_NOKQUEUE=1
txtblk='\e[0;30m' # Black - Regular  
txtred='\e[0;31m' # Red  
txtgrn='\e[0;32m' # Green  
txtylw='\e[0;33m' # Yellow  
txtblu='\e[0;34m' # Blue  
txtpur='\e[0;35m' # Purple  
txtcyn='\e[0;36m' # Cyan  
txtwht='\e[0;37m' # White  
bldblk='\e[1;30m' # Black - Bold  
bldred='\e[1;31m' # Red  
bldgrn='\e[1;32m' # Green  
bldylw='\e[1;33m' # Yellow  
bldblu='\e[1;34m' # Blue  
bldpur='\e[1;35m' # Purple  
bldcyn='\e[1;36m' # Cyan  
bldwht='\e[1;37m' # White  
unkblk='\e[4;30m' # Black - Underline  
undred='\e[4;31m' # Red  
undgrn='\e[4;32m' # Green  
undylw='\e[4;33m' # Yellow  
undblu='\e[4;34m' # Blue  
undpur='\e[4;35m' # Purple  
undcyn='\e[4;36m' # Cyan  
undwht='\e[4;37m' # White  
bakblk='\e[40m'   # Black - Background  
bakred='\e[41m'   # Red  
badgrn='\e[42m'   # Green  
bakylw='\e[43m'   # Yellow  
bakblu='\e[44m'   # Blue  
bakpur='\e[45m'   # Purple  
bakcyn='\e[46m'   # Cyan  
bakwht='\e[47m'   # White  
txtrst='\e[0m'    # Text Reset

export PATH=~/bin:$PATH

export EC2_HOME=~/.ec2
export PATH=$PATH:$EC2_HOME/bin:$HOME/.rvm/scripts:/usr/local/mongodb/bin
export EC2_PRIVATE_KEY=pk-XWJIYYP7RFIZ35TBG7DN2W3AQYAAS5GU.pem
export EC2_CERT=cert-XWJIYYP7RFIZ35TBG7DN2W3AQYAAS5GU.pem
export JAVA_HOME=/System/Library/Frameworks/JavaVM.framework/Home/

PROMPT_COMMAND=print_before_the_prompt

PS1='-> '

# MacPorts Installer addition on 2011-08-01_at_12:14:45: adding an appropriate PATH variable for use with MacPorts.
export PATH=/opt/local/bin:/opt/local/sbin:$PATH

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

##################
# Command Aliases
##################

alias la="ls -laF"
alias pyserve='python -m SimpleHTTPServer 8000'

alias gwd="pwd | pbcopy"

alias gitpush="git push -u origin master"
alias glog="git log --format='%Cgreen%h%Creset %C(cyan)%an%Creset - %s' --graph"

# View HTTP traffic
alias sniff="sudo ngrep -d 'en1' -t '^(GET|POST) ' 'tcp and port 80'"
alias httpdump="sudo tcpdump -i en1 -n -s 0 -w - | grep -a -o -E \"Host\: .*|GET \/.*\""

# Recursively delete `.DS_Store` files
alias cleanup="find . -name '*.DS_Store' -type f -ls -delete"

# Empty the Trash on all mounted volumes and the main HDD
alias emptytrash="sudo rm -rfv /Volumes/*/.Trashes; rm -rfv ~/.Trash"

# Show/hide hidden files in Finder
alias show="defaults write com.apple.Finder AppleShowAllFiles -bool true && killall Finder"
alias hide="defaults write com.apple.Finder AppleShowAllFiles -bool false && killall Finder"

# Hide/show all desktop icons (useful when presenting)
alias hidedesktop="defaults write com.apple.finder CreateDesktop -bool false && killall Finder"
alias showdesktop="defaults write com.apple.finder CreateDesktop -bool true && killall Finder"

alias stfu="osascript -e 'set volume output muted true'"
alias pumpitup="osascript -e 'set volume 10'"
alias hax="growlnotify -a 'Activity Monitor' 'System error' -m 'WTF R U DOIN'"

#webserver
alias ws="ftp -i sethetter.com@sethetter.com:/domains/sethetter.com/html/wp-content/themes/sethetter/"
alias cynergiftp="ftp -i hymangse@web6.myhsphere.cc"

# Quit applications
function quit() { osascript -e "tell app \"$1\" to quit"; }

#disable mouse acceleration
alias disablemouseaccel="defaults write .GlobalPreferences com.apple.mouse.scaling -1 && defaults write .GlobalPreferences com.apple.trackpad.scaling -1"

# Fast download of commonly used JS libraries, be sure to send output into a file
alias getjquery="curl http://code.jquery.com/jquery-1.8.2.min.js"
alias getjqueryui="curl http://jqueryui.com/resources/download/jquery-ui-1.9.1.custom.zip"
alias getunderscore="curl http://underscorejs.org/underscore-min.js"
alias getbackbone="curl http://backbonejs.org/backbone-min.js"

##################
# Custom Functions
##################

#open a file in photoshop
function photoshop() {
  open -a "Adobe Photoshop CS6" $1;
} 
