.PHONY: submodules

all: $(HOME)/.vim $(HOME)/.vimrc submodules bundle/powerline/plugin

submodules: .gitmodules
	git submodule init
	git submodule update

bundle/powerline/plugin: powerline/powerline/bindings/vim/plugin
	mkdir -p bundle/powerline
	ln -sf $(PWD)/powerline/powerline/bindings/vim/plugin bundle/powerline/plugin

${HOME}/.vimrc: $(PWD)/vimrc
	ln -sf $< $@

${HOME}/.vim: $(PWD)
	ln -sf $< $@
