all: $(HOME)/.vim $(HOME)/.vimrc submodules

.PHONY: submodules

submodules: YouCompleteMe command-t
	git submodule init
	git submodule update

.PHONY: YouCompleteMe

YouCompleteMe: bundle/YouCompleteMe/python/ycm_core.so

bundle/YouCompleteMe/python/ycm_core.so:
	cd bundle/YouCompleteMe && ./install.sh

.PHONY: command-t

command-t: bundle/command-t/ruby/command-t/ext.so

bundle/command-t/ruby/command-t/ext.so:
	cd bundle/command-t/ruby/command-t && (ruby extconf.rb && make)

${HOME}/.vimrc: $(PWD)/vimrc
	ln -sf $< $@

${HOME}/.vim: $(PWD)
	ln -sf $< $@
