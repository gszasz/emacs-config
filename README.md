# My personal Emacs config

The configuration is valid for GNU Emacs 25.3.1 compiled from source code and
installed into `/usr/local` prefix.


## Installation

The contents of the repo is supposed to be cloned into the `~/.emacs.d`
directory.

```
git clone git@github.com:gszasz/dotemacs.git ~/.emacs.d
```

Remove existing `~/.emacs` file in order to force Emacs to load
`~/.emacs.d/init.el` file instead.


### X resources

It was quite annoying to see glitching during Emacs startup, when I was able to
see menubar, toolbar scrollbar and light backround for a fraction of second
before reading my `~/.emacs.d/init.el` file where those GUI elements were set up
properly.  I figured out that the only way how to tell Emacs to turn off
menubar, toolbar and scroll bar 'prior' reading my initialization config file is
to do it via X resources.  My `Xresources` file matches `deeper-blue` theme and
indeed my Emacs starts without any glitching.

You might want to put those settings into your `~/.Xresources` file.

```
cat ~/.emacs.d/Xresources >> ~/.Xresources
```

I am having these settings integrated in my [.i3/Xresources](doti3/blob/master/Xresources).


### Emacs daemon

The best practice how to optimize Emacs startup is to start it as a daemon.  I
prefer to start Emacs daemon as `systemd` service, because then it is very easy
to reload new configuration.

If you want to start Emacs daemon as systemd service, just copy the unit file to
`~/.config/systemd/user` directory.  It is very important to copy it, because
systemd does not follow symbolic links.

```
cp ~/.emacs.d/emacs.service ~/.config/systemd/user/
systemctl --user enable emacs
systemctl --user start emacs
```

## Installed MELPA Packages

I currently use the following MELPA packages.

* auctex
* auctex-latexmk
* auto-complete
* auto-complete-auctex
* csv-mode
* ebib
* elpy
* fill-column-indicator
* gnuplot-mode
* logview
* magit
* magit-gerrit
* markdown-mode
* mediawiki
* php-mode
* yaml-mode
