
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Set timeout for key sequences
vim.opt.timeout = true
vim.opt.timeoutlen = 300 

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlights text when yanking",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- Copy current line or selection to Windows clipboard with 'wy'
-- Normal mode: copy current line
vim.keymap.set('n', 'wy', '"+yy', { noremap = true, silent = true, desc = "Copy line to Windows clipboard" })

-- Visual mode: copy selection
vim.keymap.set('v', 'wy', '"+y', { noremap = true, silent = true, desc = "Copy selection to Windows clipboard" })

-- tab remappings in nvim
-- vim.keymap.set("n", "<Tab>", "gt", { silent = true })
-- vim.keymap.set("n", "<S-Tab>", "gT", { silent = true })
-- vim.keymap.set("n", "T", ":tabclose<CR>", { silent = true })

-- split remappings in nvim
-- vim.keymap.set("n", "S", "<C-w>v", { silent = true })
vim.keymap.set("n", "SH", "<C-w>h", { silent = true })
vim.keymap.set("n", "SL", "<C-w>l", { silent = true })
vim.keymap.set("n", "SK", "<C-w>k", { silent = true })
vim.keymap.set("n", "SJ", "<C-w>j", { silent = true })
vim.keymap.set("n", "SW", "<C-w>w", { silent = true })
vim.keymap.set("n", "SQ", "<C-w>q", { silent = true })
vim.keymap.set("n", "SO", "<C-w>o", { silent = true })
