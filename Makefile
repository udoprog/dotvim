all: ${HOME}/.vim ${HOME}/.vimrc

${HOME}/.vimrc: ${PWD}/vimrc
	ln -sf $< $@

${HOME}/.vim: ${PWD}
	ln -sf $< $@
