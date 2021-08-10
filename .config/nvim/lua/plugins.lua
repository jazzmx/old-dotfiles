-- Packer bootstrap
-- Install packer if not installed
local execute = vim.api.nvim_command
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
print(install_path)
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "https://github.com/wbthomason/packer.nvim", install_path})
  execute 'packadd packer.nvim'
end

return require('packer').startup {
  function(use)
  use 'wbthomason/packer.nvim'
  -------------------------------------------
  -- THEMES
  use 'sainnhe/gruvbox-material'                          -- Gruvbox implementation with treesitter support
  use 'itchyny/lightline.vim'
  use 'voldikss/vim-floaterm'                             -- Floating terminal
  use 'simeji/winresizer'
  -------------------------------------------
  -- GENERAL
  use 'tpope/vim-repeat'                                  -- Enable repeating supported plugin maps with .
  use 'tpope/vim-endwise'                                 -- wisely add end statements i.e. endif
  use 'tpope/vim-unimpaired'                              -- Pairs of handy bracket mappings
  use 'machakann/vim-sandwich'                            -- Change/delete/add surrounding (quotes,parentheses...)
  use 'kevinhwang91/nvim-bqf'                             -- Better quickfix
  use {
    'mhinz/vim-sayonara',                                -- Buffer management
    cmd = 'Sayonara'
  }
  ------------------------------------------
  -- FUZZY FIND, SEARCH & REPLACE
  use 'mhinz/vim-grepper'
  ------------------------------------------
  use {
    "nvim-telescope/telescope.nvim",
    cmd = "Telescope",
    requires = {
      {"nvim-lua/popup.nvim"},
      {"nvim-lua/plenary.nvim"},
      {"nvim-telescope/telescope-fzy-native.nvim"}
      -- {"nvim-telescope/telescope-project.nvim"}
    },
    config = function()
      require('config.telescope').setup()
    end
    -- setup = "require('config.telescope_setup')",
  }
  ------------------------------------------
  -- CODE EDITOR
  ------------------------------------------
  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      'nvim-treesitter/nvim-treesitter-refactor',
      'nvim-treesitter/nvim-treesitter-textobjects'
    },
    config = function()
      require('config.treesitter').setup()
    end,
    run = ':TSUpdate'
  }
  use 'editorconfig/editorconfig-vim'
  use 'lukas-reineke/indent-blankline.nvim'
  use {
    'terrortylor/nvim-comment',
    config = function()
      require('nvim_comment').setup({
        line_mapping = "<leader>cl",
        operator_mapping = "<leader>c"
      })
    end
  }
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  end,

  config = {
    display = {
      open_fn = function()
        return require('packer.util').float({ border = 'single' })
      end
    }
  }
}

  -------------------------------------------
  -- THEMES
  -- use {
  --   -- 'tjdevries/colorbuddy.nvim,'
  --   -- 'npxbr/gruvbox.nvim',                                            -- LUA Gruvbox implementation with treesitter support
  --   -- 'mhinz/vim-startify',                                             -- Fancy vim start screen
  --   -- 'glepnir/dashboard-nvim'
  -- }
  -------------------------------------------
  -- GENERAL
  -- use {
  --   -- 'tpope/vim-eunuch',                                             -- Helpers for UNIX shell commands
  --   -- 'tpope/vim-surround',                                           -- Change/delete/add surrounding (quotes,parentheses...)
  --   -- {'andymass/vim-matchup', setup = [[require('config.matchup')]], event = 'BufEnter'}
  --   -- 'moll/vim-bbye',                                                -- Close buffers
  --   -- 'chaoren/vim-wordmotion',                                       -- Finer grained word motions
  --   -- 'Olical/vim-enmasse',                                           -- Edit quickfix list
  --   -- 'ptzz/lf.vim'                                                   -- Lf floaterm
  --   -- use 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
  -- }
  ------------------------------------------
  -- MAKE / TEST / RUN
  -- use 'skywind3000/asyncrun.vim'
  -- use 'skywind3000/asynctasks.vim'
  -- use 'neomake/neomake'
  ------------------------------------------
  -- FUZZY FIND, SEARCH & REPLACE
  -- use '~/.fzf'
  -- use 'junegunn/fzf.vim'                                              -- Fuzzy finder
  -- use 'qalshidi/vim-bettergrep'
  -- use 'dkprice/vim-easygrep'
  -- use 'wincent/loupe'                                                  -- Enhanced in-file search
  -- use 'wincent/ferret'                                                 -- Enhanced multi-file search
  -------------------------------------------
  -- GIT
  -- use {
  --   'tpope/vim-fugitive',
  --   cmd = {'Git', 'Gstatus', 'Gblame', 'Gpush', 'Gpull'}
  -- },
  -- use {
  --   'lewis6991/gitsigns.nvim',
  --   requires = {
  --     'nvim-lua/plenary.nvim'
  --   },
  --   config = function()
  --     require('config.gitsigns').setup()
  --   end
  -- }
  -- use 'mhinz/vim-signify'                                              -- Show diff status in sign column
  -------------------------------------------
  -- SYNTAX
  -- use 'sheerun/vim-polyglot'                                           -- A solid language pack
  -- use 'chrisbra/vim-kconfig'                                           -- kconfig
  -- use 'vimwiki/vimwiki'
  -------------------------------------------
  -- TREESITTER
  -- use {
  --   'nvim-treesitter/nvim-treesitter',
  --   requires = {
  --     'nvim-treesitter/nvim-treesitter-refactor',
  --     'nvim-treesitter/nvim-treesitter-textobjects'
  --   },
  --   config = function()
  --     require('config.treesitter').setup()
  --   end,
  --   run = ':TSUpdate'
  -- }

  -- use {
  --   'windwp/nvim-ts-autotag',
  --   ft = {
  --     'html', 'javascript', 'javascriptreact', 'typescriptreact', 'vue'
  --   },
  --   config = function()
  --     require('nvim-ts-autotag').setup()
  --   end
  -- }

  -- use {"windwp/nvim-autopairs", opt = true}
  -------------------------------------------
  -- CODE EDITOR
  -- use {
  --   'mattn/emmet-vim',
  --   ft = {
  --     'html','css','javascript', 'javascriptreact','typescriptreact','vue'
  --   }
  -- }
  -- use 'rstacruz/vim-hyperstyle'                                        -- Shortcut for writing CSS
  -- use 'vim-scripts/taglist.vim'
  -- use 'iamcco/markdown-preview.nvim', { 'do': 'cd app & npm install'  }
  -- use 'AndrewRadev/splitjoin.vim'

  -- use 'tpope/vim-commentary'                                           -- Comment stuff out
  -- use {
  --   -- 'b3nj5m1n/kommentary', {'branch':'main'}                         " (Lua) comment
  --   'terrortylor/nvim-comment',
  --   'JoosepAlviste/nvim-ts-context-commentstring'
  -- }
  -- use {
  --   'norcalli/nvim-colorizer.lua',
  --   ft = {'css', 'javascript', 'vim', 'html'},
  --   config = function()
  --     require('colorizer').setup {
  --       'css', 'javascript', 'vim', 'html'
  --     }
  --   end
  -- }
  -------------------------------------------
  -- LUA
  -- use 'svermeulen/vimpeccable'                                         -- init.lua helper
  -------------------------------------------
  -- TELESCOPE
  -- use {
  --   "nvim-telescope/telescope.nvim",
  --   cmd = "Telescope",
  --   requires = {
  --     {"nvim-lua/popup.nvim"},
  --     {"nvim-lua/plenary.nvim"},
  --     {"nvim-telescope/telescope-fzy-native.nvim"},
  --     -- {"nvim-telescope/telescope-project.nvim"},
  --   },
  --   config = function()
  --     require('config.telescope').setup()
  --   end
  --   -- setup = "require('config.telescope_setup')",
  -- }

  -------------------------------------------
  -- LSP
  -- use {
  --   'neovim/nvim-lspconfig',
  --   "onsails/lspkind-nvim",
  --   {
  --     'glepnir/lspsaga.nvim',
  --     cmd = "Lspsaga",
  --     requires = {'neovim/nvim-lspconfig'}
  --   }
  -- }
  -------------------------------------------
  -- COMPLETION
  -- use {
  --   -- 'nvim-lua/completion-nvim',
  --   {
  --     'hrsh7th/nvim-compe',
  --     event = 'InsertEnter',
  --     config = function() require('config.compe') end
  --   },
  --   {
  --     'hrsh7th/vim-vsnip',
  --     after = 'nvim-compe'
  --   },
  --   'hrsh7th/vim-vsnip-integ',
  --   {
  --     'rafamadriz/friendly-snippets',
  --     after = 'nvim-compe'
  --   },
  -- -- use 'norcalli/snippets.nvim'
  -- }
  --
  -- use {
  --   "folke/trouble.nvim",
  --   cmd = {
  --     "Trouble", "TroubleClose", "TroubleToggle", "TroubleRefresh"
  --   },
  --   ft = "dashboard",
  --   event = { "BufEnter" },
  --   requires = "kyazdani42/nvim-web-devicons"
  -- }

  -------------------------------------------
  -- TMUX
  -- use {
  --  'christoomey/vim-tmux-navigator',
  --  'wincent/terminus',
  --  'benmills/vimux'                                               -- Launch tasks in tmux pane
  --  'edkolev/tmuxline.vim', { 'on': ['Tmuxline', 'TmuxlineSnapshot'] },
  -- }
  -------------------------------------------
