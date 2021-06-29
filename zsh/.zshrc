autoload -U colors && colors
PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg[yellow]%}%~ %{$reset_color%}%% "

# tunnel localhost to site
forward () {
  ssh -R 8888:localhost:$1 root@site.stantriepels.com
}

# stop all docker containers
docker_stop () {
  docker stop $(docker ps -a -q)
}

# i3 external screen
ext () {
  xrandr --output HDMI-0 --auto
  xrandr --output eDP --off
}

# i3 laptop only
lap () {
  xrandr --output eDP --auto
  xrandr --output HDMI-0 --off
}
