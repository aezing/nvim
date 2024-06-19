local discipline = require("arknet.discipline")

discipline.cowboy()

local keymap = vim.keymap
-- Above line can be set as below to shorten function name
--  local keymap = vim.api.nvim_set_keymap
--
local opts = { noremap = true, silent = true }

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')
keymap.set("n", "<Leader>p", '"0p')
keymap.set("n", "<Leader>P", '"0P')
keymap.set("v", "<Leader>p", '"0p')
keymap.set("n", "<Leader>c", '"_c')
keymap.set("n", "<Leader>C", '"_C')
keymap.set("v", "<Leader>c", '"_c')
keymap.set("v", "<Leader>C", '"_C')
keymap.set("n", "<Leader>d", '"_d')
keymap.set("n", "<Leader>D", '"_D')
keymap.set("v", "<Leader>d", '"_d')
keymap.set("v", "<Leader>D", '"_D')

--  Esc from insert mode
keymap.set("i", "jk", "<ESC>", opts)

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d')

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Disable continuations
keymap.set("n", "<Leader>o", "o<Esc>^Da", opts)
keymap.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)
-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")
keymap.set("n", "<C-w><right>", "<C-w>>")
keymap.set("n", "<C-w><up>", "<C-w>+")
keymap.set("n", "<C-w><down>", "<C-w>-")

-- Move line up and down
keymap.set("n", "<C-j", ":m .+1<CR>==", { noremap = true, silent = true })
keymap.set("n", "<C-k>", ":m .-2<CR>==", { noremap = true, silent = true })
keymap.set("i", "<C-j>", "<Esc>:m .+1<CR>==gi", { noremap = true, silent = true })
keymap.set("i", "<C-k>", "<Esc>:m .-2<CR>==gi", { noremap = true, silent = true })
keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
keymap.set("v", "<C-j>", ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- Diagnostics
keymap.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "<leader>r", function()
  require("arknet.hsl").replaceHexWithHSL()
end)

keymap.set("n", "<leader>i", function()
  require("arknet.lsp").toggleInlayHints()
end)
