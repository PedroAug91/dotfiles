vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = { {'nvim-lua/plenary.nvim'} }
    }


    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

    use('jiangmiao/auto-pairs')

    use({
        'mattn/emmet-vim',
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
        as = 'nvim-tmux-navigation',
    })


    use({
        'maxmx03/FluoroMachine.nvim',
        as = 'fluoromachine',
    })

    use({
        'nvim-lualine/lualine.nvim',
        as = 'lualine',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true}
    })

    use({
        'barrett-ruth/live-server.nvim',
        as = 'live-server',
        config = function()
            require('live-server').setup(opts)
        end
    })

    use({
        'cvigilv/esqueleto.nvim',
        as = 'esqueleto',
        config = function()
            require('esqueleto').setup({
                directories = {"~/.config/nvim/skeletons/"},
                patterns = {"cpp"},
                autouse = true,
            })
        end
    })
end)

