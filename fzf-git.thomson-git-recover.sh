# The MIT License (MIT)
#
# Copyright (c) 2025 Martijn van den Heuvel
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

#
# Adds bash or zsh key-bindings for searching orphaned git objects, powered by FZF.
#
# Make sure this file is sourced after `fzf-git.sh`, see
# https://github.com/junegunn/fzf-git.sh/
#

[[ $0 = - ]] && return

if [[ $- =~ i ]] || [[ $1 = --run ]]; then

_fzf_git_orphaned() {
  _fzf_git_check || return
  # Use https://github.com/ethomson/git-recover
  # Git-recover sorts hashes by time stamp and prints those for easier identification
  # TODO: perhaps make a version without depending on git-recover
  # git fsck --unreachable --no-reflogs "${FULLNESS}" --no-progress 2>/dev/null | sed -E -ne 's/^unreachable blob |dangling blob //p' |
  #
  # We need to strip the header and a white line:
  git recover | awk 'NR>2' |
  _fzf_git_fzf --ansi --no-sort --bind 'ctrl-s:toggle-sort' \
    --border-label '🥡 Recoverable orphaned git blobs ' \
    --header 'ALT-E (examine in editor) ╱ CTRL-F (full - examine packfiles)' \
    --nth 1,1.. \
    --bind "alt-e:execute:${EDITOR:-vim} <(git show {1}) > /dev/tty" \
    --bind "ctrl-f:reload(git recover --full | awk 'NR>2')" \
    --color hl:underline,hl+:underline \
    --preview "git show --color=$(__fzf_git_color .) {1} | $(__fzf_git_pager)" "$@" |
  cut -d' ' -f1
}

fi

[[ $1 = --run ]] && return

# Register the Ctrl-G-Ctrl-O (Git-Orphaned) keybinding:
[[ $- =~ i ]] && __fzf_git_init orphaned

