autoload -U colors && colors

# tunnel localhost to site
forward () {
  ssh -R 8888:localhost:$1 root@site.stantriepels.com
}

# stop all docker containers
docker_stop () {
  docker stop $(docker ps -a -q)
}
# delete all containers
docker_delete () {
  docker rm -f $(docker ps -a -q)
}
# i3 external screen
ext () {
  xrandr --output HDMI-0 --auto
  xrandr --output eDP --off
}

# i3 laptop only
lap () {
  xrandr --output eDP --auto
  xrandr --output eDP --brightness 0.4
  xrandr --output HDMI-0 --off
}

# Enable vi mode
bindkey -v

autoload -Uz vcs_info
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_ 
zstyle ':vcs_info:git:*' formats '%b'

PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg[yellow]%}%~ %{$reset_color%}% %% "
# '%D{%k:%M:%S}'
