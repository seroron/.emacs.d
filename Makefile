EMACS_INSTALL_PATH=${HOME}/.emacs.d/emacs-local
EMACS_PACKAGE_NAME=emacs-27.2


.PHONY : all
all: emacs-package emacs-local

.PHONY : clean
clean:
	rm -fr elpa emacs-local $(EMACS_PACKAGE_NAME) backup \
		auto-save-list elpa .recentf eshell history tramp network-security.data

emacs-package:
	emacs --script setup-packages.el

emacs-local:
	wget -c http://ftp.jaist.ac.jp/pub/GNU/emacs/$(EMACS_PACKAGE_NAME).tar.gz
	tar xzvf $(EMACS_PACKAGE_NAME).tar.gz
	cd $(EMACS_PACKAGE_NAME) && \
	  ./configure --prefix=${EMACS_INSTALL_PATH} --without-x && \
	  make && \
	  make install
	rm -fr $(EMACS_PACKAGE_NAME) $(EMACS_PACKAGE_NAME).tar.gz
	mkdir -p ~/.bashrc.d
	cp files/emacs-local.sh ~/.bashrc.d/

lsp-mode-js:
	npm i -g typescript-language-server; npm i -g typescript

lsp-mode-ruby:
	gem install solargraph

lsp-mode-bash:
	npm i -g bash-language-server

vterm:
	sudo apt install cmake libtool libtool-bin
