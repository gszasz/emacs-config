# My personal Emacs config

The configuration is valid for GNU Emacs 28.1 installed from RPMs.

## Installation

### RPM Packages

* emacs
* emacs-ansible
* emacs-auctex
* emacs-cython-mode
* emacs-dockerfile-mode
* emacs-gettext
* emacs-goodies
* emacs-jedi
* emacs-json-mode
* emacs-magit
* emacs-rpm-spec-mode
* emacs-yaml-mode

In Fedora 38, you can install all RPMs above by following command:

```shell
sudo dnf -y install emacs emacs-ansible emacs-auctex emacs-cython-mode \
  emacs-dockerfile-mode emacs-gettext emacs-goodies emacs-jedi emacs-json-mode \
  emacs-magit emacs-rpm-spec-mode emacs-yaml-mode
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

* adaptive-wrap
* apache-mode
* csv-mode
* ein
* elpy
* flyspell-correct-ivy
* gnuplot
* ivy-bibtex
* magit-section
* markdown-mode
* olivetti
* org-gtd
* org-remark
* php-mode
* pygn-mode
* stripes
* syslog-mode
* use-package
* visual-fill-column
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
