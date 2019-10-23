textreset=$(tput sgr0) # reset the foreground colour
red=$(tput setaf 1)
green=$(tput setaf 2) 
yellow=$(tput setaf 3) 

function devmode () {
  echo
  echo "${green}===================================================================="
  echo "          __                  _   _                   "
  echo "         / _|_   _ _ __   ___| |_(_) ___  _ __  ___  "
  echo "        | |_| | | | '_ \ / __| __| |/ _ \| '_ \/ __| "
  echo "       _|  _| |_| | | | | (__| |_| | (_) | | | \__ \ "
  echo "      (_)_|  \__,_|_| |_|\___|\__|_|\___/|_| |_|___/ "
  echo "===================================================================="
  echo

  echo "${yellow}*********************   Available Commands are   *******************"
  echo
  echo "${green}rip          ${textreset} ${red} # uses wget to fetch source of website on the internet"
  echo "${green}dash         ${textreset} ${red} # opens up dash documentation browser"
  echo "${green}jrepl        ${textreset} ${red} # interactive java repl"
  echo "${green}frails4      ${textreset} ${red} # find in rails source"
  echo "${green}fs           ${textreset} ${red} # file size"
  echo "${green}f            ${textreset} ${red} # shorthand for find command"
  echo "${green}remind       ${textreset} ${red} # Add reminder to Reminders.app (OS X 10.8)" ${textreset}
  echo "${green}rubysource   ${textreset} ${red} # cd into ruby source code directory"
  echo "${green}myip         ${textreset} ${red} # Tells you your ip external ip address"
  echo "${green}rubyserver   ${textreset} ${red} # Start a ruby server, default port is 500"
  echo "${green}youtube-rip  ${textreset} ${red} # Download video from youtube and convert it to mp3 - video id required"
  echo "${green}youtube-rip-playlist  ${textreset} ${red} # Download video playlist from youtube and convert it to mp3 - playlist  id required"
  echo "${green}youtube-vid  ${textreset} ${red} # Download video from youtube"
}

#function convert-to_underscore() {
#  find . -depth -name '*-*' | while IFS= read -r f ; do mv -i "$f" "$(dirname "$f")/$(basename "$f"|tr - _)" ; done
#}

function cslinux() {
    ssh tabdulra@cslinux.fitchburgstate.edu -p 50022
}

function jrepl() {
    java -jar /Users/tawheedabdul-raheem/java-repl/build/artifacts/javarepl-dev.build.jar
}

function rubyserver() {
    if [ "$#" -eq "1" ]
    then
        ruby -run -e httpd . -p $1
    else
        ruby -run -e httpd . -p 5000
    fi

}


function rip() {
    wget --user-agent="Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.0.3) Gecko/2008092416 Firefox/3.0.3" -r -e robots=off $1
}

function dash() {
    if [ $# -eq 2 ]; 
    then
        open "dash://$1: $2"
    else 
        open "dash://$1"
    fi
}

# Determine size of a file or total size of a directory
function fs() {
    echo ${green}"SIZE    ${yellow}NAME"${textreset}
	if du -b /dev/null > /dev/null 2>&1; then
		local arg=-sbh
	else
		local arg=-sh
	fi
	if [[ -n "$@" ]]; then
		du $arg -- "$@" 
	else
		du $arg .[^.]* *
	fi
}

# find shorthand
function f() {
    find . -iname "$1"
}

# Add reminder to Reminders.app (OS X 10.8)
# Usage: `remind 'foo'` or `echo 'foo' | remind`
function remind() {
	local text
	if [ -t 0 ]; then
		text="$1" # argument
	else
		text=$(cat) # pipe
	fi
	osascript >/dev/null <<EOF
tell application "Reminders"
	tell the default list
		make new reminder with properties {name:"$text"}
	end tell
end tell
EOF
}

# Find in rails directory 
function frails4() {
    cd /Users/tawheedabdul-raheem/.rvm/gems/ruby-2.0.0-p247@rails-4.0/gems
    find . -type d -name "rdoc*" -prune -o -iname "$1" -print
}

# Take me to my ruby source
function rubysource() {
    cd /Users/tawheedabdul-raheem/.rvm/src
}

# what is my ip address
function myip() {
     wget http://ipecho.net/plain -O - -q ; echo
     say "Hey Tawheed your i p is"
     wget http://ipecho.net/plain -O - -q| say
}

# Start mysql process
function toggleMysql() {
  mysql.server $1
}

function phpMyAdminSQL() {
  mysql -h127.0.0.1 -uroot -p --port=3306
}

function copyDrawable() {
  python /Users/tawheedraheem/Engineering/tripBuddy/OpenSource/DrawableCopier/drawable_copier.py $1 $2
}


function weather() {
  curl wttr.in
}

function gitweb() {
  open `git config --get remote.origin.url`
}

# function youtube-rip() {
#   youtube-dl --extract-audio --audio-format mp3 https://www.youtube.com/watch?v=$1
# }

# function youtube-rip-playlist() {
#   youtube-dl -f bestvideo+bestaudio --extract-audio --audio-format mp3 --prefer-avconv --playlist-random https://www.youtube.com/playlist?list=$1
# }

# function youtube-vid() {
#   youtube-dl -f 'bestvideo[ext=mp4]+bestaudio[ext=m4a]/mp4' $1
# }

function xamppSql() {
  mysql -uroot -h127.0.0.1 -P3307
}
