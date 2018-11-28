shopt -s expand_aliases
source ~/.bash_aliases
source ~/.bash_colors
export PATH="$PATH:$HOME/.composer/vendor/bin"

show_git_position() {
        local current_git_repo=$(git config --get remote.origin.url | sed 's/.git//g' | sed 's/.*\///')
        local current_git_branch=$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/\1/')
        case ${current_git_repo} in
        "" )
                return ;;
        * )
                printf "${COLOR_ORANGE}${COLOR_BLACK_BG}${current_git_repo}${COLOR_GREEN}.${current_git_branch}${COLOR_DEFAULT}";;
        esac
}
env_finder() {
        local path_color;
        local opposite_color;
    case $PWD in
        *beta* )
            path_color="COLOR_BLUE_BG"
                opposite_color="COLOR_BLUE";;
        *dev* )
                path_color="COLOR_GREEN_BG"
                opposite_color="COLOR_GREEN";;
        *test* )
                path_color="COLOR_ORANGE_BG"
                opposite_color="COLOR_ORANGE";;
        *prod* )
                path_color="COLOR_RED_BG"
                opposite_color="COLOR_RED";;
        * )
                return ;;
    esac
    printf "${!opposite_color}◄${COLOR_DEFAULT}${!path_color}${PWD##*/}${COLOR_DEFAULT}${!opposite_color}►${COLOR_DEFAULT}"
}
current_dir() {
        local color_change=$(env_finder)
        if [ $PWD == $HOME ]
        then
                printf '~'
        else
                if [ $color_change ]
                then
                        printf "${color_change}"
                else
                        printf "${PWD##*/}•"
                fi
        fi
}
show_ps1 () {
        local user="${COLOR_CYAN_BG}${COLOR_BLACK}\u${COLOR_DEFAULT}"
        local host="${COLOR_ORANGE_BG}${COLOR_BLACK}\h${COLOR_DEFAULT}"
        local dir="\$(current_dir)\$(show_git_position)"
        printf "${user}@${host}${dir}\$ "
}
w() {
     local zip_code = 90210
     curl http://wttr.in/{!zip_code}?0?Q
}

PS1=$(show_ps1)
w
