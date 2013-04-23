all: ${HOME}/.vim ${HOME}/.vimrc .submodules

.submodules: .gitmodules
	git submodule init
	git submodule update
	ln -sf powerline/bindings/vim/plugin bundle/powerline/plugin
	touch $@

${HOME}/.vimrc: ${PWD}/vimrc
	ln -sf $< $@

${HOME}/.vim: ${PWD}
	ln -sf $< $@
