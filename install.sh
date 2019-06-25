#!/bin/sh

fail=0

for path in "$HOME"/.dotfiles/home/*; do
    [ -e "$path" ] || continue
    filename=$(basename "$path")

		if [ -L "$HOME/.$filename" ]; then
      echo "Symlink for $HOME/.$filename found"
			continue
    else
			echo "Symlink for $HOME/.$filename not found"

			if [ -e "$HOME/.$filename" ]; then
				echo "Error: File found in place of symlink: $HOME/.$filename"
				fail=1
				continue
			fi

			echo "Creating symlink for $HOME/.$filename"
      ln -s "$HOME/.dotfiles/home/$filename" "$HOME/.$filename"
    fi
done

exit $fail
