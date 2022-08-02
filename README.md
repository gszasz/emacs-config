# My personal Emacs config

The configuration is valid for GNU Emacs 28.1 installed from RPMs.

## Installation

### RPM Packages

* emacs
* emacs-filesystem
* emacs-dash
* emacs-deferred
* emacs-with-editor
* emacs-async
* emacs-ctable
* emacs-epc
* emacs-epl
* emacs-pkg-info
* emacs-flycheck
* emacs-json-reformat
* emacs-json-snatcher
* emacs-popup
* emacs-auto-complete
* emacs-s
* emacs-python-environment
* emacs-auctex
* emacs-jedi
* emacs-magit
* emacs-dockerfile-mode
* emacs-json-mode
* emacs-flycheck-pycheckers
* emacs-cython-mode
* emacs-gettext
* emacs-goodies
* emacs-rpm-spec-mode
* emacs-yaml-mode

In Fedora 36, you can install all RPMs above by following command:

```shell
sudo dnf -y install emacs emacs-filesystem emacs-dash emacs-deferred \
  emacs-with-editor emacs-async emacs-ctable emacs-epc emacs-epl \
  emacs-pkg-info emacs-flycheck emacs-json-reformat emacs-json-snatcher \
  emacs-popup emacs-auto-complete emacs-s emacs-python-environment \
  emacs-auctex emacs-jedi emacs-magit emacs-dockerfile-mode emacs-json-mode \
  emacs-flycheck-pycheckers emacs-cython-mode emacs-gettext emacs-goodies \
  emacs-rpm-spec-mode emacs-yaml-mode
```

### Configuration files

The contents of the repo is supposed to be cloned into the `~/.emacs.d`
directory and remove existing `~/.emacs` file to force Emacs to load
`~/.emacs.d/init.el` file instead.

```shell
git clone git@github.com:gszasz/emacs-config.git ~/.emacs.d
rm ~/.emacs
```

### MELPA packages

* apache-mode
* csv-mode
* dap-mode
* ein
* eldoc
* elpy
* flycheck-grammarly
* logview
* org-gtd
* php-mode
* pygn-mode
* syslog-mode
* use-package
* whitespace-cleanup-mode
* yascroll

You can launch Emacs now and run to install all required MELPA packages
`M-x package-install-selected-packages<RET>`


### Emacs daemon

The only convenient use of Emacs is to use its built-in client-server
architecture.  I strongly recommend to enable and start Emacs daemon and then
use `emacsclient` command instead of `emacs`.

```shell
systemctl --user enable emacs
systemctl --user start emacs
```

Note you need to run following command each time you alter configuration to
convince yourself that you did not break anything.

```shell
systemctl --user restart emacs
```

## License

This file is not part of GNU Emacs.

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <https://www.gnu.org/licenses/>.
