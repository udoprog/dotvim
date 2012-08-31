all: ${HOME}/.vim ${HOME}/.vimrc .submodules

.submodules: .gitmodules
	git submodule init
	git submodule update
	touch $@

${HOME}/.vimrc: ${PWD}/vimrc
	ln -sf $< $@

${HOME}/.vim: ${PWD}
	ln -sf $< $@
