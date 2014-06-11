.PHONY : all
all: emacs-package

.PHONY : clean
clean:
	rm -fr elpa

emacs-package:
	emacs --script setup-packages.el

flycheck:
	gem install rubocop ruby-lint

