nvim-go:
	curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim.appimage
	chmod u+x nvim.appimage
	sudo mv ./nvim.appimage /usr/local/bin/nvim
	git config --global core.editor "nvim"
