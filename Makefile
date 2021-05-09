EMACS_INSTALL_PATH=${HOME}/.emacs.d/emacs-local
EMACS_PACKAGE_NAME=emacs-27.2


.PHONY : all
all: elpa emacs-local

.PHONY : clean
clean:
	rm -fr elpa emacs-local $(EMACS_PACKAGE_NAME) backup \
		auto-save-list var .recentf eshell history tramp network-security.data

elpa: emacs-local
	emacs --script init.el

emacs-local:
	wget -c http://ftp.jaist.ac.jp/pub/GNU/emacs/$(EMACS_PACKAGE_NAME).tar.gz
	tar xzvf $(EMACS_PACKAGE_NAME).tar.gz
	cd $(EMACS_PACKAGE_NAME) && \
	  ./configure --prefix=${EMACS_INSTALL_PATH} --without-x --with-json && \
	  make -j && \
	  make install
	rm -fr $(EMACS_PACKAGE_NAME) $(EMACS_PACKAGE_NAME).tar.gz
	mkdir -p ~/.bashrc.d
	cp files/emacs-local.sh ~/.bashrc.d/

# コンパイルしても起動速度変わらなかった
# init.elc: init.el
#	emacs -batch -f batch-byte-compile init.el

lsp-mode-js:
	npm i -g typescript-language-server; npm i -g typescript

lsp-mode-ruby:
	gem install solargraph

lsp-mode-bash:
	npm i -g bash-language-server

vterm:
	sudo apt install cmake libtool libtool-bin


REDHATOS      := $(wildcard /etc/redhat-release*)
DEBIANOS      := $(wildcard /etc/debian_version*)
os-packages:
ifneq ($(DEBIANOS),)
	sudo -E apt install -y build-essential libncurses5-dev libxml2-dev libssl-dev libreadline-dev libevent-dev libgnutls28-dev libjansson-dev
else
	sudo -E yum groupinstall -y "Development Tools"
	sudo -E yum install -y ncurses-devel wget gnutls-devel libxml2-devel openssl-devel readline-devel libevent-devel jansson-devel
endif
