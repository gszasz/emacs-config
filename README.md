My personal Emacs config
------------------------

The contents of the repo is supposed to be cloned into the `~/.emacs.d`
directory.


```
git clone git@github.com:gszasz/dotemacs.git ~/.emacs.d
```

Remove existing `~/.emacs` file in order to force Emacs to load
`~/.emacs.d/init.el` file instead.

## Compiling

You can also optionally byte compile the lisp code by running `C-u 0 M-x
byte-recompile-directory` on `~/.emacs.d` directory.  Note that you'll need to
recompile files each time you update them.
 
