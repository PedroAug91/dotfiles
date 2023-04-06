-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({
        'rose-pine/neovim',
        as = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use('jiangmiao/auto-pairs')

    use({
        'mattn/emmet-vim',
        as = 'emmet-vim',
        config = function()
            vim.cmd([[
            let g:user_emmet_mode='a'
            let g:user_emmet_install_global = 0
            autocmd FileType html,css EmmetInstall
            let g:user_emmet_leader_key=','
            ]])
        end
    })

    use({
        'alexghergh/nvim-tmux-navigation',
        config = function()
            require('nvim-tmux-navigation').setup({
                disable_when_zoomed = true,
                keybindings = {
                    left = "<C-h>",
                    down = "<C-j>",
                    up = "<C-k>",
                    right = "<C-l>",
                    last_active = "<C-\\>",
                    next = "<C-Space>",
                }
            })
        end
    })
end)
