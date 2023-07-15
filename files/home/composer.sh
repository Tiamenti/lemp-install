
# set PATH so it includes composer bin if it exists
if [ -d "$HOME/.config/composer/vendor/bin" ] ; then
    PATH="$HOME/.config/composer/vendor/bin:$PATH"
fi
