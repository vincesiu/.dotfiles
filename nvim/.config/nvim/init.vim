" basic tabbing stuff
set expandtab
set shiftwidth=4
set tabstop=4

" set the current directory as the directory of the file
set autochdir

lua << EOF
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

return require('packer').startup(function(user)
    use'wbthomason/packer.nvim'

    
    if packer_boostrap then
        require('packer').sync()
    end
end)
EOF
