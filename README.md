fzf-git-recover
==========

Search for deleted files with [git-recover][git-recover] in your Git repository, powered by [fzf][fzf]

[fzf]: https://github.com/junegunn/fzf
[git-recover]: https://github.com/ethomson/git-recover

Installation
------------

1. Install the latest version of [fzf][fzf]
2. Install the latest version of [git-recover][git-recover]
3. Source [fzf-git.sh](https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh) file from your .bashrc or .zshrc
4. Source [fzf-git.thomson-git-recover.sh](https://raw.githubusercontent.com/mheuvel-dev/fzf-git-recover/master/fzf-git.thomson-git-recover.sh) from your .bashrc or .zshrc

> [!WARNING]
> [fzf-git.sh](https://raw.githubusercontent.com/junegunn/fzf-git.sh/main/fzf-git.sh) must be sourced prior to [fzf-git.thomson-git-recover.sh](https://raw.githubusercontent.com/mheuvel-dev/fzf-git-recover/master/fzf-git.thomson-git-recover.sh)

Usage
-----

A key-binding allows you to browse through orphaned Git objects populated by [git-recover][git-recover]. 
Select objects in [fzf][fzf], preview them and paste selected identifiers to your command-line.

### List of bindings

* <kbd>CTRL-G</kbd><kbd>CTRL-O</kbd> or <kbd>CTRL-G</kbd><kbd>o</kbd> for **O**rphaned files

### Inside fzf

* <kbd>CTRL-F</kbd> to select a `full` search by [git-recover][git-recover]
* <kbd>ALT-E</kbd> to examine the git-object in your editor
