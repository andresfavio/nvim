-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

------ ------------
-- General Keymaps
---------------------
--pegar abajo

keymap.set("n", "<leader>p", "o<Esc>P")

--bufferline
-- keymap.set("n", "<>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true }) --siguente buffer
keymap.set("n", "<S-TAB>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true }) --anterior buffer
keymap.set("n", "<TAB>", ":ReachOpen buffers<CR>", { noremap = true, silent = true })

--ejemplo
keymap.set("n", "va", "%a'<esc>%%i'<esc>")
keymap.set("n", "<Alt>2", "cs(")
--DELETE
keymap.set("n", "dw", "vbd")

--SELECT ONE TEXT
keymap.set("n", "va", "bve")

--DELETE TEXT
keymap.set("n", "da", "bvedi")

--SELECT ALL
keymap.set("n", "<C-a>", "gg<S-v>G")

--terminal
keymap.set("n", "<leader>1", ":ToggleTerm direction=float<CR>")

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { noremap = true, silent = true })
keymap.set("i", "kj", "<ESC>", { noremap = true, silent = true })
-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { noremap = true, silent = true })
keymap.set("n", "<leader>w", ":w<CR>") -- guardar
keymap.set("n", "<leader>q", ":q<CR>", { noremap = true, silent = true }) -- salir
keymap.set("n", "<leader>s", "/", { noremap = true, silent = false }) -- buscar

-- delete single character without copying into register
keymap.set("n", "x", '"_x')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>") -- incrementvim.keymap.set("n", "<leader>rn", ":IncRename ")
keymap.set("n", "<leader>-", "<C-x>") -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v") -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s") -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=") -- make split windows equal width & height
keymap.set("n", "<leader>sx", ":close<CR>") -- close current split window

keymap.set("n", "<leader>to", ":tabnew<CR>", { noremap = true, silent = true }) -- open new tab
keymap.set("n", "<leader>tx", ":tabclose<CR>", { noremap = true, silent = true }) -- close current tab
keymap.set("n", "<leader>tn", ":tabn<CR>", { noremap = true, silent = true }) --  go to next tab
keymap.set("n", "<leader>tp", ":tabp<CR>", { noremap = true, silent = true }) --  go to previous tab
----------------------
-- Plugin Keybinds
----------------------

-- vim-maximizer
keymap.set("n", "<leader>sm", ":MaximizerToggle<CR>", { noremap = true, silent = true }) -- toggle split window maximization

-- nvim-tree
keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { noremap = true, silent = true }) -- toggle file explorer

-- telescope
--keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { noremap = true, silent = true }) -- find files within current working directory, respects .gitignore
--keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { noremap = true, silent = true }) -- find string in current working directory as you type
--keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { noremap = true, silent = true }) -- find string under cursor in current working directory
--keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { noremap = true, silent = true }) -- list open buffers in current neovim instance
--keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { noremap = true, silent = true }) -- list available help tags

-- telescope git commands (not on youtube nvim video)
keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { noremap = true, silent = true }) -- list all git commits (use <cr> to checkout) ["gc" for git commits]
keymap.set("n", "<leader>gfc", "<cmd>Telescope git_bcommits<cr>", { noremap = true, silent = true }) -- list git commits for current file/buffer (use <cr> to checkout) ["gfc" for git file commits]
keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { noremap = true, silent = true }) -- list git branches (use <cr> to checkout) ["gb" for git branch]
keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { noremap = true, silent = true }) -- list current changes per file with diff preview ["gs" for git status]

-- restart lsp server (not on youtube nvim video)
keymap.set("n", "<leader>rs", ":LspRestart<CR>") -- mapping to restart lsp if necessary
