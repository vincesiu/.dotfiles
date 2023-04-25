-- DOCS START HERE
-- Run `:PackerCompile`
-- Then run :PackerUpdate

-- some bootstrapping for packer
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd 'packadd packer.nvim'
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

packer = require('packer')
packer.startup(function(user)
    use 'wbthomason/packer.nvim'
    if packer_boostrap then
        require('packer').sync()
    end


    -- this is for lsp
    use 'neovim/nvim-lspconfig'
    -- this is for the file/directory explorer
    use 'nvim-tree/nvim-tree.lua'
     
end)

require('lspconfig').gopls.setup{}

-- disable netrw, the default file/directory explorer
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.termguicolors = true
require("nvim-tree").setup()

