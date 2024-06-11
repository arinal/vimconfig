require "nvchad.mappings"

local nomap = vim.keymap.del
nomap("i", "<C-l>")
nomap("n", "<C-c>")
nomap("n", "<C-s>")
nomap("n", "<C-n>")
nomap("n", "<leader>fm")

local map = vim.keymap.set

map("i", "jk", "<esc>")
map("n", "<leader>h", "<cmd>NoiceDismiss<cr>:noh<cr>")
map("n", "<leader>s", "<cmd>update<cr>")
map("n", "<leader>q", "<cmd>quit<cr>")
map("t", "<C-u>", "<C-\\><C-n>", { desc = "Terminal normal mode" })

-- telescope
local builtin = require "telescope.builtin"
map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find symbols" })
map("n", "<leader>fS", builtin.lsp_dynamic_workspace_symbols, { desc = "Find dynamic workspace symbols" })
-- map("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Find workspace symbols" })

-- git
map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })
map("n", "<leader>gC", builtin.git_commits, { desc = "Search git commits" })
map("n", "<leader>gc", builtin.git_bcommits, { desc = "Search git commits for buffer" })
map("n", "<leader>gB", builtin.git_branches, { desc = "Go to git branch" })
map("n", "<leader>gd", "<cmd>Gitsigns diffthis<cr>    ", { desc = "Diff against the index" })
map("n", "<leader>gk", "<cmd>Gitsigns prev_hunk<cr>   ", { desc = "Go to the previous hunk" })
map("n", "<leader>gj", "<cmd>Gitsigns next_hunk<cr>   ", { desc = "Go to the next hunk" })
map("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<cr>  ", { desc = "Reset hunk" })
map("n", "<leader>gR", "<cmd>Gitsigns reset_buffer<cr>", { desc = "Reset buffer" })

-- LSP
-- stylua: ignore start
map("n", "gI", "<cmd>:Telescope lsp_implementations<cr>",         { desc = "Go to implementations" })
map("n", "gR", "<cmd>:Telescope lsp_references<cr>",              { desc = "Go to references" })
map("i", "<C-h>", function() vim.lsp.buf.signature_help() end,    { desc = "LSP signature help" })
map("n", "<leader>lj", function() vim.diagnostic.goto_next() end, { desc = "Next error" })
map("n", "<leader>lk", function() vim.diagnostic.goto_prev() end, { desc = "Previous error" })
map("n", "<leader>la", function() vim.lsp.buf.code_action() end,  { desc = "LSP action" })
map("n", "<leader>lr", function() vim.lsp.buf.rename() end,       { desc = "LSP rename" })
map("n", "<leader>lf", function() require("conform").format { lsp_fallback = true } end, { desc = "format files" })
-- stylua: ignore end

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })

-- nvim-tree
local api = require "nvim-tree.api"
map("n", "<leader>e", api.tree.toggle, { desc = "Open file tree" })
map("n", "<leader>E", function()
  api.tree.toggle { find_file = true }
end, { desc = "Reveal current file on tree" })
