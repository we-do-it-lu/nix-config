# Emacs Editor

- Framework: <https://github.com/doomemacs/doomemacs>
  - key bindings:
    - source code: <https://github.com/doomemacs/doomemacs/blob/master/modules/config/default/%2Bevil-bindings.el>
    - docs: <https://github.com/doomemacs/doomemacs/blob/master/modules/editor/evil/README.org>
  - module index: <https://github.com/doomemacs/doomemacs/blob/master/docs/modules.org>
- Chinese(rime) support: <https://github.com/DogLooksGood/emacs-rime>
- modal editing:
  - <https://github.com/emacs-evil/evil>: evil mode, enabled by default in doom-emacs.
  - <https://github.com/meow-edit/meow>
- LSP Client: <https://github.com/manateelazycat/lsp-bridge>
- Emacs Wiki: <https://www.emacswiki.org/emacs/SiteMap>
- Awesome Emacs: <https://github.com/emacs-tw/awesome-emacs#lsp-client>

## Install or Update

After deploying this nix flake, run the following command to install or update emacs:

```bash
doom sync
```

when in doubt, run `doom sync`!

## Notes

1. we can run any emacs command via `M-x`(Alt + x).

## Why emacs?

1. Explore the unknown, just for fun!
2. Org Mode

## Cheetsheet

Here is the cheetsheet related to my DoomEmacs configs. Please read vim's common cheetsheet at [../README.md](../README.md) before reading the following.

### Basics

> Terminal(vterm) is useful in GUI mode, I use Zellij instead in terminal mode.

| Action                 | Shortcut      |
| ---------------------- | ------------- |
| Popup Terminal(vterm)  | `SPC + o + t` |
| Open Terminal          | `SPC + o + T` |
| Open file tree sidebar | `SPC + o + p` |
| Exit                   | `M-x C-c`     |

### Window Navigation

| Action                                     | Shortcut                                                              |
| ------------------------------------------ | --------------------------------------------------------------------- |
| Split a window vertically and horizontally | `SPC w v/s`                                                           |
| Move to a window in a specific direction   | `Ctrl-w + h/j/k/l`                                                    |
| Move a window to a specific direction      | `Ctrl-w + H/J/K/L`                                                    |
| Move to the next window                    | `SPC w w`                                                             |
| Close the current window                   | `SPC w q`                                                             |
| Rebalance all windows                      | `SPC w =`                                                             |
| Set window's width(columns)                | `80 SPC w \|` (the Vertical line is escaped due to markdown's limits) |
| Set window's height                        | `30 SPC w _ `                                                         |

### File Tree

- treemacs: <https://github.com/Alexander-Miller/treemacs/blob/master/src/elisp/treemacs-mode.el>
- treemacs-evil: <https://github.com/Alexander-Miller/treemacs/blob/master/src/extra/treemacs-evil.el>

| Action                                | Shortcut  |
| ------------------------------------- | --------- |
| Resize Treemacs's window              | `>` & `<` |
| Extra Wide Window                     | `W`       |
| Rename                                | `R`       |
| Delete File/Direcoty                  | `d`       |
| New File                              | `cf`      |
| New Directory                         | `cd`      |
| Go to parent                          | `u`       |
| Run shell command in for current node | `!`       |
| Refresh file tree                     | `gr`      |
| Copy project-path into pasteboard     | `yp`      |
| Copy absolute-path into pasteboard    | `ya`      |
| Copy relative-path into pasteboard    | `yr`      |
| Copy file to another location         | `yf`      |
| Move file to another location         | `m`       |
| quit                                  | `q`       |

And bookmarks:

- Add bookmarks in treemacs: `b`
- Show Bookmark List: `SPC s m`

### Splitting and Buffers

| Action                  | Shortcut          |
| ----------------------- | ----------------- |
| Buffer List             | `<Space> + ,`     |
| Save all buffers(Tab)   | `<Space> + b + S` |
| Kill the current buffer | `<Space> + b + k` |
| Kill all buffers        | `<Space> + b + K` |

### Editing and Formatting

| Action                                     | Shortcut            |
| ------------------------------------------ | ------------------- |
| Format Document                            | `<Space> + cf`      |
| Code Actions                               | `<Space> + ca`      |
| Rename                                     | `<Space> + cr`      |
| Opening LSP symbols                        | `<Space> + cS`      |
| Show all LSP Errors                        | `<Space> + c + x/X` |
| Show infinite undo history(really useful!) | `<Space> + s + u`   |
| Open filepath/URL at cursor                | `gf`                |
| Find files by keyword in path              | `<Space> + <Space>` |
| Grep string in files (vertico + ripgrep)   | `<Space> + sd`      |

### Image Preview(GUI mode only)

Use `-`, `+` to resize the image, `r` to rotate the image.

### Search & replace

```bash
SPC s p foo C-; E C-c C-p :%s/foo/bar/g RET Z Z
```

1. `SPC s p`: search in project
1. `foo`: the keyword to search
1. `C-; E`: exports what you’re looking at into a new buffer in grep-mode
1. `C-c C-p` to run wgrep-change-to-wgrep-mode to make the search results writable.
1. `:%s/foo/bar/g RET`: replace in the current buffer(just like neovim/vim)
1. `Z Z`: to write all the changes to their respective files

### Projects

> easily switch between projects without exit emacs!

| Action                     |               |
| -------------------------- | ------------- |
| Switch between projects    | `SPC + p + p` |
| Browse the current project | `SPC + p + .` |
| Add new project            | `SPC + p + a` |

### Workspaces

> Very useful when run emacs in daemon/client modes

| Action                      |                             |
| --------------------------- | --------------------------- |
| Switch between workspaces   | `M-1/2/3/...`(Alt-1/2/3/..) |
| New Workspace               | `SPC + TAB + n`             |
| New Named Workspace         | `SPC + TAB + N`             |
| Delete Workspace            | `SPC + TAB + d`             |
| Display Workspaces bar blow | `SPC + TAB + TAB`           |
