## 1. Basic Vim Commands
*Source: `vimCommands.txt`*

### Modes
| Key | Action |
| :--- | :--- |
| `i` | Insert mode |
| `v` | Visual mode |
| `Ctrl+v` | Visual Block mode |

### Navigation
| Key | Action |
| :--- | :--- |
| `h` `j` `k` `l` | Move Left, Down, Up, Right |
| `w` / `b` | Move forward/backward to next/prev word start |
| `G` / `gg` | Go to End of file / Start of file |
| `{` / `}` | Paragraph moves |
| `_` / `0` | Go to front of line (first non-blank) / Start of line |
| `$` | Go to end of line |
| `f{char}` | Move to next occurrence of char in line |
| `t{char}` | Move to just before next occurrence of char |
| `F{char}` | Jump back to char (inclusive) |
| `T{char}` | Jump back to just after char |
| `;` / `,` | Repeat last f/t/F/T search forward / backward |
| `: {num}` | Go directly to line number |

### Editing
| Key | Action |
| :--- | :--- |
| `A` / `I` | Insert at end of line / start of line |
| `o` / `O` | New line below / above (and enter insert mode) |
| `x` | Delete current char |
| `dd` | Delete (cut) current line |
| `dw` | Delete from cursor to next word start |
| `daw` | Delete a word (inclusive) |
| `caw` | Change a word (delete and enter insert mode) |
| `~` | Swap case |
| `u` | Undo |
| `Ctrl+r` | Redo |

### Visual Mode Operations
| Key | Action |
| :--- | :--- |
| `y` | Copy (yank) |
| `p` | Paste |
| `d` | Delete selected text |
| `c` | Delete then insert |
| `gU` / `gu` | Uppercase / Lowercase |
| `gq` | Format |
| `>` / `<` | Indent / Unindent |
| `Shift+i` | (In Block Mode) Insert to edit multiple lines |

### Window Management
| Key | Action |
| :--- | :--- |
| `Ctrl+w` `s` | Horizontal split |
| `Ctrl+w` `v` | Vertical split |
| `Ctrl+w` `q` | Close current split |
| `Ctrl+w` `o` | Close all other splits |
| `Ctrl+w` `h/j/k/l` | Navigate to Left/Down/Up/Right window |
| `Ctrl+w` `=` | Equalize split sizes |
| `Ctrl+w` `+` / `-` | Increase / Decrease height |
| `Ctrl+w` `>` / `<` | Increase / Decrease width |

---

## 2. Custom Nvim Remaps
*Source: `nvim/lua/dog/remap.lua` and `nvim/after/plugin/*`*

### General
| Key | Action |
| :--- | :--- |
| `<Space>` | **Leader Key** |
| `<leader>pv` | Open file explorer (`:Ex`) |
| `<leader><leader>` | Source current file (`:so`) |
| `i <C-c>` | Escape (avoids InsertLeave hooks) |
| `<leader>x` | Make file executable (`chmod +x`) |

### Movement & Centering
| Key | Action |
| :--- | :--- |
| `J` | Append line below to current line (cursor stays) |
| `<C-d>` | Scroll down half page (centered) |
| `<C-u>` | Scroll up half page (centered) |
| `n` / `N` | Next/Prev search result (centered) |
| `v` `J` / `K` | Move selected text down / up (Visual Mode) |

### Clipboard & Deletion
| Key | Action |
| :--- | :--- |
| `<leader>y` | Yank to system clipboard (`+y`) |
| `<leader>Y` | Yank line to system clipboard (`+Y`) |
| `<leader>d` | Delete to void register (doesn't overwrite clipboard) |
| `x <leader>p` | Paste without overwriting register (void delete selection) |

### LSP (Language Server)
| Key | Action |
| :--- | :--- |
| `gd` | Go to definition |
| `K` | Hover documentation |
| `<leader>vws` | Workspace symbol |
| `<leader>vd` | View diagnostics (float) |
| `[d` / `]d` | Next / Previous diagnostic |
| `<leader>vca` | Code action |
| `<leader>vrr` | References |
| `<leader>vrn` | Rename |
| `i <C-h>` | Signature help |
| `<leader>f` | Format buffer |

### Plugin Specifics
| Key | Action | Plugin |
| :--- | :--- | :--- |
| `<leader>pf` | Find files | Telescope |
| `<C-p>` | Git files | Telescope |
| `<leader>ps` | Grep string (search in files) | Telescope |
| `<leader>a` | Add file to Harpoon | Harpoon |
| `<C-e>` | Toggle Harpoon menu | Harpoon |
| `<C-h/j/k/l>` | Go to Harpoon file 1/2/3/4 | Harpoon |
| `<leader>gs` | Git status | Fugitive |
| `<leader>u` | Toggle Undotree | Undotree |

### Misc
| Key | Action |
| :--- | :--- |
| `<leader>s` | Search & Replace word under cursor |
| `<C-f>` | Open `tmux-sessionizer` |
| `<C-k>` / `<C-j>` | Next/Prev Quickfix item |
| `<leader>k` / `<leader>j` | Next/Prev Location list item |

---

## 3. Tmux Commands
*Prefix Key:* `Ctrl+b` (Default) or `Ctrl+a` (if remapped)
*Assumed Notation:* `<Prefix>`

### Sessions
| Key | Action |
| :--- | :--- |
| `tmux new -s name` | New session with name |
| `tmux ls` | List sessions |
| `tmux a` | Attach to last session |
| `tmux a -t name` | Attach to specific session |
| `<Prefix>` `d` | Detach from session |
| `<Prefix>` `$` | Rename session |
| `<Prefix>` `s` | Select session from list |

### Windows (Tabs)
| Key | Action |
| :--- | :--- |
| `<Prefix>` `c` | Create new window |
| `<Prefix>` `w` | List windows |
| `<Prefix>` `n` | Next window |
| `<Prefix>` `p` | Previous window |
| `<Prefix>` `,` | Rename window |
| `<Prefix>` `&` | Kill window |

### Panes (Splits)
| Key | Action |
| :--- | :--- |
| `<Prefix>` `%` | Split vertical |
| `<Prefix>` `"` | Split horizontal |
| `<Prefix>` `x` | Kill pane |
| `<Prefix>` `z` | Zoom pane (toggle fullscreen) |
| `<Prefix>` `{` / `}` | Swap panes |
| `<Prefix>` `space` | Toggle layouts |

### Copy Mode (Scrollback)
| Key | Action |
| :--- | :--- |
| `<Prefix>` `[` | Enter copy mode |
| `Space` | Start selection |
| `Enter` | Copy selection |
| `q` | Quit copy mode |
| `<Prefix>` `]` | Paste |
