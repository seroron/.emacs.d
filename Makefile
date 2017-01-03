EMACS_INSTALL_PATH=${HOME}/.emacs.d/emacs-local
EMACS_PACKAGE_NAME=emacs-24.5


.PHONY : all
all: emacs-package

.PHONY : clean
clean:
	rm -fr elpa emacs-local $(EMACS_PACKAGE_NAME) 

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
	echo "#!/bin/sh" > ~/.bashrc.d/emacs-local.sh
	echo "export PATH=$(EMACS_INSTALL_PATH)/bin:\$$PATH" >> ~/.bashrc.d/emacs-local.sh

