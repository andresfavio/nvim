local wk = require("which-key")

local Terminal = require("toggleterm.terminal").Terminal
local toggle_float = function()
  local float = Terminal:new({ direction = "float" })
  return float:toggle()
end
local toggle_lazygit = function()
  local lazygit = Terminal:new({ cmd = "lazygit", direction = "float" })
  return lazygit:toggle()
end

local mappings = {
  A = { ":new<cr>", "New File" },
  q = { ":q<CR>", "Quit" },
  Q = { ":q!<CR>", "Exit" },
  w = { ":w<CR>", "Save" },
  W = { ":wq<CR>", "Save & Quit" },
  c = { ":bd<CR>", "Close buffer" },
  E = { ":e ~/.config/nvim/<CR>", "Edit Config" },
  e = { ":NvimTreeToggle<CR>", "Open Folder" },
  s = { "/", "Search text" },
  o = { ":LSoutlineToggle<CR>", "Work Tree" },
  --BUFFER
  b = {
    name = "BUFFERS",
    c = { ":BufferLinePickClose<CR>", "Close Buffer" },
    j = { ":BufferLinePick<CR>", "Jump Buffers" },
    C = { ":BDelete all<CR>", "Close All Buffers" },
    n = { ":new ", "New File" },
  },
  --SALTOS DE LINEA
  h = {
    name = "lINE JUMP",
    l = { ":HopChar1CurrentLine<CR>", "Search Line" },
    b = { ":HopPattern<CR>", "Search Global" },
    v = { ":HopLine<CR>", "Search Vertical" },
  },
  --TELESCOPE
  f = {
    name = "SEARCH",
    f = { ":Telescope find_files<cr>", "Search Files" },
    s = { ":Telescope live_grep<cr>", "Live Grep" },
    c = { ":Telescope grep_string<cr>", "Grep String" },
    b = { ":Telescope buffers<cr>", "Search Buffers" },
    h = { ":Telescope help_tags<cr>", "Search Buffers" },
    d = { ":Telescope file_browser<cr>", "Search Directory" },
    p = { ":Telescope projects<cr>", "Search Projects" },
  },
  --TELESCOPE GIT
  g = {
    name = "GIT",
    b = { ":Telescope git_branches<cr>", "Git Branches" },
    c = { ":Telescope git_commits<cr>", "Git Commits" },
    s = { ":Telescope git_status<cr>", "Git Status" },
    f = { ":Telescope git_bcommits<cr>", "Git BCommist" },
  },
  --REINICIAR BUSQUEDA
  n = {
    name = "RESET SEARCH",
    h = { ":nohlsearch<cr>", "Reset" },
  },
  --AUTO SAVE
  a = { ":ASToggle<cr>", "Auto-Save" },
  --TERMINAL
  t = {
    name = "TABS & TERMINAL",
    t = { ":ToggleTerm<cr>", "Split Below" },
    f = { toggle_float, "Floating Terminal" },
    l = { toggle_lazygit, "LazyGit" },
  },
  --LSP
  r = {
    name = "LSP",
    s = { ":LspRestart", "Lsp restart" },
  },
  --PACKER
  l = {
    name = "PACKER",
    s = { ":PackerSync", "Packer Sync" },
    i = { ":PackerInstall", "Packer Install" },
    u = { "PackerUpdate", "Packer Update" },
  },
  B = {
    name = "LIVE SERVER",
    o = { ":BrowserOpen", "Open Browser" },
    p = { ":BrowserPreview", "Browser Preview" },
    s = { ":BrowserSync", "Sincronizar Browser" },
    r = { ":BrowserRestart", "Update Browser" },
    d = { ":BrowserStop", "Browser Stop" },
  },
}

local opts = { prefix = "<leader>" }
wk.register(mappings, opts)
