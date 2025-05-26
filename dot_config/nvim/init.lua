local Plug = vim.fn['plug#']

vim.call('plug#begin')

-- status line
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'

-- telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
-- $ sudo apt install ripgrep

vim.call('plug#end')


-- clipboard共有
vim.opt.clipboard = "unnamedplus"

-- 行番号
vim.opt.number = true
vim.opt.relativenumber = true

-- status line
require('lualine').setup {
  options = {
    theme = 'nord'
  }
}

-- 削除系のコマンドでレジスタが上書きされないようにする
vim.keymap.set('n', 'd', '"_d')
vim.keymap.set('n', 'D', '"_D')
vim.keymap.set('x', 'd', '"_d')
vim.keymap.set('n', 'c', '"_c')
vim.keymap.set('n', 'C', '"_C')
vim.keymap.set('n', 's', '"_s')
vim.keymap.set('n', 'S', '"_S')
vim.keymap.set('x', 'c', '"_c')
vim.keymap.set('x', 'C', '"_C')

-- xをdに置き換え(xはdlで置き換え)
vim.keymap.set('n', 'x', 'd')
vim.keymap.set('n', 'xx', 'dd')
vim.keymap.set('n', 'X', 'D')
vim.keymap.set('x', 'x', 'd')

-- telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<D-p>', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-f>', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<D-f>', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', 'fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', 'fh', builtin.help_tags, { desc = 'Telescope help tags' })

-- /usr/local/bin/zenhanにzenhan.exeをコピーしておく
if vim.fn.executable("zenhan") == 1 then
  local function set_zenhan_off()
    vim.fn.system("zenhan 0")
  end

  vim.api.nvim_create_autocmd("InsertLeave", {
    pattern = "*",
    callback = set_zenhan_off,
  })

  vim.api.nvim_create_autocmd("CmdlineLeave", {
    pattern = "*",
    callback = set_zenhan_off,
  })
end

