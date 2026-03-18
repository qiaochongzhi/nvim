local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

-- ====================
-- Basic operations
-- ====================

keymap("n", "<leader>w", "<cmd>w<CR>", vim.tbl_extend("force", opts, { desc = "Write file" }))
keymap("n", "<leader>q", "<cmd>q<CR>", vim.tbl_extend("force", opts, { desc = "Quit window" }))
-- Clear search highlight
keymap("n", "<leader>h", "<cmd>nohlsearch<CR>", vim.tbl_extend("force", opts, { desc = "Clear search highlight" }))

-- Exit insert mode quickly
keymap("i", "jk", "<Esc>", vim.tbl_extend("force", opts, { desc = "Exit insert mode" }))

-- ====================
-- Window navigation
-- ====================

keymap("n", "<C-h>", "<C-w>h", vim.tbl_extend("force", opts, { desc = "Go to left window" }))
keymap("n", "<C-j>", "<C-w>j", vim.tbl_extend("force", opts, { desc = "Go to lower window" }))
keymap("n", "<C-k>", "<C-w>k", vim.tbl_extend("force", opts, { desc = "Go to upper window" }))
keymap("n", "<C-l>", "<C-w>l", vim.tbl_extend("force", opts, { desc = "Go to right window" }))

-- ====================
-- Split management
-- ====================

-- Create splits
keymap("n", "<leader>sv", "<cmd>vsplit<CR>", vim.tbl_extend("force", opts, { desc = "Vertical split" }))
keymap("n", "<leader>sh", "<cmd>split<CR>", vim.tbl_extend("force", opts, { desc = "Horizontal split" }))

-- Close / equalize splits
keymap("n", "<leader>sc", "<C-w>c", vim.tbl_extend("force", opts, { desc = "Close split" }))
keymap("n", "<leader>se", "<C-w>=", vim.tbl_extend("force", opts, { desc = "Equalize splits" }))

-- ====================
-- Resize windows
-- ====================

keymap("n", "<Up>", "<cmd>resize +3<CR>", vim.tbl_extend("force", opts, { desc = "Increase window height" }))
keymap("n", "<Down>", "<cmd>resize -3<CR>", vim.tbl_extend("force", opts, { desc = "Decrease window height" }))
keymap("n", "<Left>", "<cmd>vertical resize -3<CR>", vim.tbl_extend("force", opts, { desc = "Decrease window width" }))
keymap("n", "<Right>", "<cmd>vertical resize +3<CR>", vim.tbl_extend("force", opts, { desc = "Increase window width" }))

-- ====================
-- Emacs-style keybindings (insert mode only)
-- ====================

keymap("i", "<C-a>", "<Esc>I", vim.tbl_extend("force", opts, { desc = "Move to line start" }))
keymap("i", "<C-e>", "<End>", vim.tbl_extend("force", opts, { desc = "Move to line end" }))
keymap("i", "<C-b>", "<Left>", vim.tbl_extend("force", opts, { desc = "Move backward" }))
keymap("i", "<C-f>", "<Right>", vim.tbl_extend("force", opts, { desc = "Move forward" }))
keymap("i", "<C-d>", "<Del>", vim.tbl_extend("force", opts, { desc = "Delete forward" }))
keymap("i", "<C-h>", "<BS>", vim.tbl_extend("force", opts, { desc = "Delete backward" }))
keymap("i", "<C-k>", "<Esc>Da", vim.tbl_extend("force", opts, { desc = "Delete to line end" }))
keymap("i", "<C-u>", "<Esc>d0i", vim.tbl_extend("force", opts, { desc = "Delete to line start" }))
keymap("i", "<C-y>", "<Esc>pa", vim.tbl_extend("force", opts, { desc = "Paste after cursor" }))

-- ====================
-- Buffer navigation
-- ====================

-- Switch buffer
keymap("n", "<leader>bn", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap("n", "<leader>bp", "<cmd>bprevious<CR>", { desc = "Previous buffer" })

-- Delete buffer
keymap("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })

-- New empty buffer
keymap("n", "<leader>bb", "<cmd>enew<CR>", { desc = "New buffer" })

-- List buffers (native)
keymap("n", "<leader>bl", "<cmd>ls<CR>", { desc = "List buffers" })

-- ====================
-- Tab management
-- ====================

keymap("n", "<leader>to", "<cmd>tabnew<CR>", vim.tbl_extend("force", opts, { desc = "Open new tab" }))
keymap("n", "<leader>tn", "<cmd>tabnext<CR>", vim.tbl_extend("force", opts, { desc = "Next tab" }))
keymap("n", "<leader>tp", "<cmd>tabprevious<CR>", vim.tbl_extend("force", opts, { desc = "Previous tab" }))
keymap("n", "<leader>tc", "<cmd>tabclose<CR>", vim.tbl_extend("force", opts, { desc = "Close tab" }))

-- ====================
-- Toggles
-- ====================

-- Toggle spell checking
keymap("n", "<leader>us", "<cmd>set spell!<CR>", vim.tbl_extend("force", opts, { desc = "Toggle spell check" }))

-- ====================
-- Run / Compile
-- ====================

keymap("n", "<leader>r", function()
  _G.CompileRunGcc()
end, vim.tbl_extend("force", opts, { desc = "Run current file" }))

-- ====================
-- Undo tree
-- ====================

keymap("n", "<leader>uu", "<cmd>UndotreeToggle<CR>", vim.tbl_extend("force", opts, { desc = "Toggle undo tree" }))

-- ====================
-- Git
-- ====================

keymap("n", "<leader>gb", "<cmd>Gitsigns blame_line<CR>", vim.tbl_extend("force", opts, { desc = "Blame line" }))
keymap("n", "<leader>gp", "<cmd>Gitsigns preview_hunk<CR>", vim.tbl_extend("force", opts, { desc = "Preview hunk" }))
keymap("n", "<leader>gr", "<cmd>Gitsigns reset_hunk<CR>", vim.tbl_extend("force", opts, { desc = "Reset hunk" }))
keymap("n", "<leader>gn", "<cmd>Gitsigns next_hunk<CR>", vim.tbl_extend("force", opts, { desc = "Next hunk" }))
keymap("n", "<leader>gN", "<cmd>Gitsigns prev_hunk<CR>", vim.tbl_extend("force", opts, { desc = "Previous hunk" }))
