_Copyright © 2016-2017, 2022-2024 Gabriel Szász; see the end of the file for
license conditions._

# My personal Emacs config

The configuration is valid for GNU Emacs 29.3 installed from RPMs.

## Installation

### RPM Packages

* emacs
* emacs-ansible
* emacs-auctex
* emacs-dockerfile-mode
* emacs-gettext
* emacs-goodies
* emacs-jedi
* emacs-json-mode
* emacs-magit
* emacs-rpm-spec-mode
* emacs-yaml-mode

In Fedora 40, you can install all RPMs above by following command:

```shell
sudo dnf -y install emacs emacs-ansible emacs-auctex emacs-dockerfile-mode \
  emacs-gettext emacs-goodies emacs-jedi emacs-json-mode emacs-magit \
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

* ada-mode
* adaptive-wrap
* apache-mode
* counsel-projectile
* csv-mode
* cython-mode
* elpy
* flycheck-hledger
* flyspell-correct-ivy
* git-modes
* gnuplot
* hledger-mode
* ivy-bibtex
* magit-section
* markdown-mode
* ob-async
* org-gtd
* php-mode
* pkg-info
* projectile
* pygn-mode
* stripes
* syslog-mode
* visual-fill-column
* whitespace-cleanup-mode
* yascroll

You can launch Emacs now and run to install all required MELPA packages `M-x
package-install-selected-packages<RET>`

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

# Note on copyright years

In copyright notices where the copyright holder is Gabriel Szász, then where a
range of years appears, this is an inclusive range that applies to every year
in the range.  For example: 2005-2008 represents the years 2005, 2006, 2007,
and 2008.

# License conditions

This program is free software: you can redistribute it and/or modify it under
the terms of the GNU General Public License as published by the Free Software
Foundation, either version 3 of the License, or (at your option) any later
version.

This program is distributed in the hope that it will be useful, but WITHOUT ANY
WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A
PARTICULAR PURPOSE.  See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with
this program.  If not, see <https://www.gnu.org/licenses/>.
