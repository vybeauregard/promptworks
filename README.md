# promptworks
Bash prompt optimizations

This is what I use in my `.bash_profile` in my daily work environment. It's based on a unix environment which I connect to via puTTY, so compatibility across terminals will be spotty.

## Highlights

* The `.bash_colors` file sets aliases for the colors I use in my environment. The 0-255 color codes should match up with [this chart](https://jonasjacek.github.io/colors/). For non-puTTY environments, you should be able to uncomment `format_rgb()` and feed it a standard r,g,b format to get the desired color.

* On login, I want to see an ASCII representation of the current weather (using [wttr.in](wttr.in)), which I've aliased to `w` (I don't need the default `w` command; if you do, you can alias it to anything else). This is run immediately after all the aliases have been set.

* `show_git_position()` will try to determine if the current path is inside a git repo. If it is, it will echo the repository name and branch to your prompt.

* `env_finder()` will color code the path in the prompt based on whether it finds the wildcarded strings `beta|dev|test|prod`. If none of these strings exist in the path, it will print the path in your default colors.

* `show_ps1()` is the function that puts all the details together to echo to your prompt.
