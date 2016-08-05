My personal Emacs config
------------------------

The contents of the repo is supposed to be cloned into the `~/.emacs.d`
directory.


```
git clone git@github.com:gszasz/dotemacs.git ~/.emacs.d
```

Remove existing `~/.emacs` file in order to force Emacs to load
`~/.emacs.d/init.el` file instead.  Note that Emacs starts `~/.emacs/init.elc`
if it exists, so don't forget to recompile `~/.emacs.d/init.el` everytime when
the file is being changed.
