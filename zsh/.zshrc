autoload -U colors && colors

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
  xrandr --output eDP --brightness 0.4
  xrandr --output HDMI-0 --off
}

# Enable vi mode
bindkey -v

# credits: https://www.themoderncoder.com/add-git-branch-information-to-your-zsh-prompt/
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats '%b'
 
# Set up the prompt (with git branch name)
setopt PROMPT_SUBST

PS1="%{$fg[green]%}%n%{$reset_color%}@%{$fg[green]%}%m %{$fg[yellow]%}%~ %{$reset_color%}% (${vcs_info_msg_0_}) %% "
