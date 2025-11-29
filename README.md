--------------------------------------------------------------------------------
1. BASIC VIM COMMANDS (Source: vimCommands.txt)
--------------------------------------------------------------------------------
[ Modes ]
  i           : Insert mode
  v           : Visual mode
  Ctrl+v      : Visual Block mode

[ Navigation ]
  h j k l     : Move Left, Down, Up, Right
  w / b       : Move forward/backward to next/prev word start
  G / gg      : Go to End of file / Start of file
  { / }       : Paragraph moves
  _ / 0       : Go to front of line (first non-blank) / Start of line
  $           : Go to end of line
  f(char)     : Move to next occurrence of char in line
  t(char)     : Move to just before next occurrence of char
  F(char)     : Jump back to char (inclusive)
  T(char)     : Jump back to just after char
  ; / ,       : Repeat last f/t/F/T search forward / backward
  : (num)     : Go directly to line number

[ Editing ]
  A / I       : Insert at end of line / start of line
  o / O       : New line below / above (and enter insert mode)
  x           : Delete current char
  dd          : Delete (cut) current line
  dw          : Delete from cursor to next word start
  daw         : Delete a word (inclusive)
  caw         : Change a word (delete and enter insert mode)
  ~           : Swap case
  u           : Undo
  Ctrl+r      : Redo
  :! (cmd)    : Execute command in terminal

[ Visual Mode Operations ]
  y           : Copy (yank)
  p           : Paste
  d           : Delete selected text
  c           : Delete then insert
  gU / gu     : Uppercase / Lowercase
  gq          : Format
  > / <       : Indent / Unindent
  Shift+i     : Insert (in Visual Block mode) to edit multiple lines (add text + Esc)

[ Search ]
  /(char)     : Search forward
  ?(char)     : Search backward
  n / N       : Next / Previous occurrence
  zz          : Center the view on cursor

[ File & System ]
  :w          : Save
  :q          : Quit (fails if unsaved)
  :q!         : Quit forcefully
  :wq / :x    : Save and quit
  %           : Create new file in current dir
  d           : Create new directory in current dir

[ Window Management ]
  Ctrl-w s    : Horizontal split
  Ctrl-w v    : Vertical split
  Ctrl-w q    : Close current split
  Ctrl-w o    : Close all other splits
  Ctrl-w h/j/k/l : Navigate to Left/Down/Up/Right window
  Ctrl-w =    : Equalize split sizes
  Ctrl-w + / -: Increase / Decrease height
  Ctrl-w > / <: Increase / Decrease width

--------------------------------------------------------------------------------
2. CUSTOM NVIM REMAPS (Source: nvim/lua & nvim/after)
--------------------------------------------------------------------------------
[ General ]
  <Space>     : Leader Key
  <leader>pv  : Open file explorer (:Ex)
  <leader><leader> : Source current file (:so)
  Q           : <nop> (Disabled)
  i <C-c>     : Escape (avoids InsertLeave hooks?)
  <leader>x   : Make file executable (chmod +x)

[ Movement & View ]
  J           : Append line below to current line (cursor stays)
  <C-d>       : Scroll down half page (centered)
  <C-u>       : Scroll up half page (centered)
  n / N       : Next/Prev search result (centered)

[ Visual Mode Moving ]
  v J         : Move selected text down
  v K         : Move selected text up

[ Clipboard & Deletion ]
  <leader>y   : Yank to system clipboard (+y) (Normal/Visual)
  <leader>Y   : Yank line to system clipboard (+Y)
  <leader>d   : Delete to void register (doesn't overwrite clipboard)
  x <leader>p : Paste without overwriting register (void delete selection)

[ LSP (Language Server) ]
  gd          : Go to definition
  K           : Hover documentation
  <leader>vws : Workspace symbol
  <leader>vd  : View diagnostics (float)
  [d / ]d     : Next / Previous diagnostic
  <leader>vca : Code action
  <leader>vrr : References
  <leader>vrn : Rename
  i <C-h>     : Signature help
  <leader>f   : Format buffer

[ Telescope (Fuzzy Finder) ]
  <leader>pf  : Find files
  <C-p>       : Git files
  <leader>ps  : Grep string (search in files)

[ Harpoon ]
  <leader>a   : Add file to Harpoon
  <C-e>       : Toggle Harpoon menu
  <C-h>       : Go to file 1
  <C-j>       : Go to file 2
  <C-k>       : Go to file 3
  <C-l>       : Go to file 4

[ Git & Undo ]
  <leader>gs  : Git status (Fugitive)
  <leader>u   : Toggle Undotree

[ Misc ]
  <leader>s   : Search & Replace word under cursor
  <C-f>       : Open tmux-sessionizer
  <C-k/j>     : Next/Prev Quickfix item
  <leader>k/j : Next/Prev Location list item
  <leader>mr  : Cellular Automaton (Make it Rain)

--------------------------------------------------------------------------------
3. TMUX COMMANDS (General Cheat Sheet)
--------------------------------------------------------------------------------
Prefix key is usually Ctrl+b (default) or Ctrl+a (common remap).
Assumed Prefix: <Prefix>

[ Sessions ]
  tmux new -s [name]   : New session with name
  tmux ls              : List sessions
  tmux a               : Attach to last session
  tmux a -t [name]     : Attach to specific session
  <Prefix> d           : Detach from session
  <Prefix> $           : Rename session
  <Prefix> s           : Select session from list

[ Windows (Tabs) ]
  <Prefix> c           : Create new window
  <Prefix> w           : List windows
  <Prefix> n           : Next window
  <Prefix> p           : Previous window
  <Prefix> ,           : Rename window
  <Prefix> &           : Kill window

[ Panes (Splits) ]
  <Prefix> %           : Split vertical
  <Prefix> "           : Split horizontal
  <Prefix> x           : Kill pane
  <Prefix> z           : Zoom pane (toggle fullscreen)
  <Prefix> arrow       : Switch to pane
  <Prefix> { or }      : Swap panes
  <Prefix> space       : Toggle layouts

[ Copy Mode (Scrollback) ]
  <Prefix> [           : Enter copy mode
  Space                : Start selection
  Enter                : Copy selection
  q                    : Quit copy mode
  <Prefix> ]           : Paste
