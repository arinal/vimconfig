require "nvchad.mappings"

local nomap = vim.keymap.del
nomap("i", "<C-l>")
nomap("n", "<C-c>")
nomap("n", "<C-s>")
nomap("n", "<C-n>")

local map = vim.keymap.set

map("i", "jk", "<esc>")
map("n", "<leader>h", "<cmd>NoiceDismiss<cr>:noh<cr>")
map("n", "<leader>s", "<cmd>update<cr>")
map("n", "<leader>q", "<cmd>quit<cr>")

-- telescope
local builtin = require("telescope.builtin")
map("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Find symbols" })
map("n", "<leader>fS", builtin.lsp_workspace_symbols, { desc = "Find workspace symbols" })

-- git
map("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Neogit" })
map("n", "<leader>gC", builtin.git_commits, { desc = "Search git commits" })
map("n", "<leader>gc", builtin.git_bcommits, { desc = "Search git commits for buffer" })

-- LSP
map("n", "gI", "<cmd>:Telescope lsp_implementations<cr>", { desc = "Go to implementations" })
map("n", "gR", "<cmd>:Telescope lsp_references<cr>", { desc = "Go to references" })
map("n", "<leader>lj", function() vim.diagnostic.goto_next() end, { desc = "Next error" })
map("n", "<leader>lk", function() vim.diagnostic.goto_prev() end, { desc = "Previous error" })
map("n", "<leader>la", function() vim.lsp.buf.code_action() end, { desc = "LSP action" })
map("n", "<leader>lr", function() vim.lsp.buf.rename() end, { desc = "LSP rename" })
map("i", "<C-h>", function() vim.lsp.buf.signature_help() end, { desc = "LSP signature help" })

map("i", "<C-l>", function()
  vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", replace_keycodes = true, nowait = true, silent = true, expr = true, noremap = true })
