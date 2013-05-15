.PHONY: submodules

all: $(HOME)/.vim $(HOME)/.vimrc submodules

submodules: .gitmodules
	git submodule init
	git submodule update

${HOME}/.vimrc: $(PWD)/vimrc
	ln -sf $< $@

${HOME}/.vim: $(PWD)
	ln -sf $< $@
