--[[

=====================================================================
==================== READ THIS BEFORE CONTINUING ====================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||   KICKSTART.NVIM   ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||:Tutor              ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`   ___________      ========
========        /::::::::::|  |::::::::::\  \ no mouse \     ========
========       /:::========|  |==hjkl==:::\  \ required \    ========
========      '""""""""""""'  '""""""""""""'  '""""""""""'   ========
========                                                     ========
=====================================================================
=====================================================================

What is Kickstart?

  Kickstart.nvim is *not* a distribution.

  Kickstart.nvim is a starting point for your own configuration.
    The goal is that you can read every line of code, top-to-bottom, understand
    what your configuration is doing, and modify it to suit your needs.

    Once you've done that, you can start exploring, configuring and tinkering to
    make Neovim your own! That might mean leaving Kickstart just the way it is for a while
    or immediately breaking it into modular pieces. It's up to you!

    If you don't know anything about Lua, I recommend taking some time to read through
    a guide. One possible example which will only take 10-15 minutes:
      - https://learnxinyminutes.com/docs/lua/

    After understanding a bit more about Lua, you can use `:help lua-guide` as a
    reference for how Neovim integrates Lua.
    - :help lua-guide
    - (or HTML version): https://neovim.io/doc/user/lua-guide.html

Kickstart Guide:

  TODO: The very first thing you should do is to run the command `:Tutor` in Neovim.

    If you don't know what this means, type the following:
      - <escape key>
      - :
      - Tutor
      - <enter key>

    (If you already know the Neovim basics, you can skip this step.)

  Once you've completed that, you can continue working through **AND READING** the rest
  of the kickstart init.lua.

  Next, run AND READ `:help`.
    This will open up a help window with some basic information
    about reading, navigating and searching the builtin help documentation.

    This should be the first place you go to look when you're stuck or confused
    with something. It's one of my favorite Neovim features.

    MOST IMPORTANTLY, we provide a keymap "<space>sh" to search the help documentation,
    which is very useful when you're not exactly sure of what you're looking for.

  I have left several `:help X` comments throughout the init.lua
    These are hints about where to find more information about the relevant settings,
    plugins or Neovim features used in Kickstart.

   NOTE: Look for lines like this

    Throughout the file. These are for you, the reader, to help you understand what is happening.
    Feel free to delete them once you know what you're doing, but they should serve as a guide
    for when you are first encountering a few different constructs in your Neovim config.

If you experience any errors while trying to install kickstart, run `:checkhealth` for more info.

I hope you enjoy your Neovim journey,
- TJ

P.S. You can delete this when you're done too. It's your config now! :)
--]]

if vim.loop.os_uname().sysname == 'Windows_NT' then
  vim.env.HOME = 'C:/Users/oney'
  Configpath = 'C:/local/oney/work-exchange/windows-config/nvim/'
end

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.opt.termguicolors = true
-- Set to true if you have a Nerd Font installed and selected in the terminal
vim.g.have_nerd_font = true

-- [[ Setting options ]]
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish!
--  For more options, you can see `:help option-list`

-- Make line numbers default
vim.opt.number = true
-- You can also add relative line numbers, to help with jumping.
--  Experiment for yourself to see if you like it!
-- vim.opt.relativenumber = true

-- Enable mouse mode, can be useful for resizing splits for example!
vim.opt.mouse = 'a'

-- Don't show the mode, since it's already in the status line
vim.opt.showmode = false

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.opt.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250

-- Decrease mapped sequence wait time
-- Displays which-key popup sooner
vim.opt.timeoutlen = 300

-- Configure how new splits should be opened
vim.opt.splitright = true
vim.opt.splitbelow = true

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- Show which line your cursor is on
vim.opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous Diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next Diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic Error messages' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic Quickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<leader>wm', '<C-w>o', { desc = 'Maximize window' })
vim.keymap.set('n', '<leader>ww', '<C-w>w', { desc = 'Move focus to an other window' })

vim.keymap.set({ 'n' }, '<C-c>', '"+y$')
vim.keymap.set({ 'v' }, '<C-c>', '"+y')

vim.keymap.set({ 'v', 'n' }, '<C-y>', '"+p')
vim.keymap.set({ 'i', 'c' }, '<C-y>', '<c-r>+') -- insert from system clipboard
vim.keymap.set({ 'i', 'c' }, '<C-v>', '<c-r>+') -- insert from system clipboard

vim.keymap.set({ 'v', 'n' }, '<leader>fs', function()
  vim.cmd 'write'
end)

vim.keymap.set({ 'n', 'v' }, '<leader>a', ':Gen<CR>')

vim.keymap.set({ 'n', 'v' }, '<leader>ff', '<cmd>Telescope find_files<cr>')
vim.keymap.set({ 'n', 'v' }, '<leader>fr', '<cmd>Telescope oldfiles<cr>')

vim.keymap.set({ 'n', 'v' }, '<leader><leader>', ':')

-- Shortcut for searching your Neovim configuration files
vim.keymap.set('n', '<leader>fed', function()
  vim.cmd('edit ' .. Configpath .. 'init.lua')
end, { desc = 'Open init file' })

vim.keymap.set('n', '<leader>fec', function()
  local builtin = require 'telescope.builtin'
  builtin.find_files { cwd = Configpath }
end, { desc = 'Search config files' })

-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_autocmd('TabNewEntered', {
  group = vim.api.nvim_create_augroup('NeotreeOnNewTab', { clear = true }),
  callback = vim.schedule_wrap(function()
    vim.cmd 'Neotree show reveal_force_cwd'
  end),
})

vim.api.nvim_create_autocmd('VimEnter', {
  pattern = '*',
  group = vim.api.nvim_create_augroup('NeotreeOnOpen', { clear = true }),
  once = true,
  callback = function(_)
    vim.cmd 'Neotree show reveal_force_cwd'
  end,
})

-- open file in last place 
local lastplace = vim.api.nvim_create_augroup("LastPlace", {})
vim.api.nvim_clear_autocmds({ group = lastplace })
vim.api.nvim_create_autocmd("BufReadPost", {
    group = lastplace,
    pattern = { "*" },
    desc = "remember last cursor place",
    callback = function()
        local mark = vim.api.nvim_buf_get_mark(0, '"')
        local lcount = vim.api.nvim_buf_line_count(0)
        if mark[1] > 0 and mark[1] <= lcount then
            pcall(vim.api.nvim_win_set_cursor, 0, mark)
        end
    end,
})

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup({
  -- NOTE: Plugins can be added with a link (or for a github repo: 'owner/repo' link).
  'tpope/vim-sleuth', -- Detect tabstop and shiftwidth automatically

  -- NOTE: Plugins can also be added by using a table,
  -- with the first argument being the link and the following
  -- keys can be used to configure plugin behavior/loading/etc.
  --
  -- Use `opts = {}` to force a plugin to be loaded.
  --
  --  This is equivalent to:
  --    require('Comment').setup({})

  -- "gc" to comment visual regions/lines
  { 'numToStr/Comment.nvim', opts = {} },

  -- Here is a more advanced example where we pass configuration
  -- options to `gitsigns.nvim`. This is equivalent to the following Lua:
  --    require('gitsigns').setup({ ... })
  --
  -- See `:help gitsigns` to understand what the configuration keys do
  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
    },
  },

  -- NOTE: Plugins can also be configured to run Lua code when they are loaded.
  --
  -- This is often very useful to both group configuration, as well as handle
  -- lazy loading plugins that don't need to be loaded immediately at startup.
  --
  -- For example, in the following configuration, we use:
  --  event = 'VimEnter'
  --
  -- which loads which-key before all the UI elements are loaded. Events can be
  -- normal autocommands events (`:help autocmd-events`).
  --
  -- Then, because we use the `config` key, the configuration only runs
  -- after the plugin has been loaded:
  --  config = function() ... end

  -- Useful plugin to show you pending keybinds.
  {
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    config = function() -- This is the function that runs, AFTER loading
      require('which-key').setup()
    end,
  },

  -- NOTE: Plugins can specify dependencies.
  --
  -- The dependencies are proper plugin specifications as well - anything
  -- you do for a plugin at the top level, you can do for a dependency.
  --
  -- Use the `dependencies` key to specify the dependencies of a particular plugin

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
      'nvim-telescope/telescope-fzf-native.nvim',

      -- `build` is used to run some command when the plugin is installed/updated.
      -- This is only run then, not every time Neovim starts up.
      build = 'make',

      -- `cond` is a condition used to determine whether this plugin should be
      -- installed and loaded.
      cond = function()
        return vim.fn.executable 'make' == 1
      end,
    },
    { 'nvim-telescope/telescope-ui-select.nvim' },

    -- Useful for getting pretty icons, but requires a Nerd Font.
    { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
  },
  config = function()
    -- Telescope is a fuzzy finder that comes with a lot of different things that
    -- it can fuzzy find! It's more than just a "file finder", it can search
    -- many different aspects of Neovim, your workspace, LSP, and more!
    --
    -- The easiest way to use Telescope, is to start by doing something like:
    --  :Telescope help_tags
    --
    -- After running this command, a window will open up and you're able to
    -- type in the prompt window. You'll see a list of `help_tags` options and
    -- a corresponding preview of the help.
    --
    -- Two important keymaps to use while in Telescope are:
    --  - Insert mode: <c-/>
    --  - Normal mode: ?
    --
    -- This opens a window that shows you all of the keymaps for the current
    -- Telescope picker. This is really useful to discover what Telescope can
    -- do as well as how to actually do it!

    -- [[ Configure Telescope ]]
    -- See `:help telescope` and `:help telescope.setup()`
    require('telescope').setup {
      -- You can put your default mappings / updates / etc. in here
      --  All the info you're looking for is in `:help telescope.setup()`
      extensions = {
        ['ui-select'] = {
          require('telescope.themes').get_dropdown(),
        },
      },
    }

    -- Enable Telescope extensions if they are installed
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'ui-select')

    -- See `:help telescope.builtin`
    local builtin = require 'telescope.builtin'
    local utils = require 'telescope.utils'
    vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = 'Search Help' })
    vim.keymap.set('n', '<leader>sk', builtin.keymaps, { desc = 'Search Keymaps' })
    vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = 'Search Files' })
    vim.keymap.set('n', '<leader>ss', builtin.builtin, { desc = 'Search Select Telescope' })
    vim.keymap.set('n', '<leader>sw', builtin.grep_string, { desc = 'Search current Word' })
    vim.keymap.set('n', '<leader>sg', builtin.live_grep, { desc = 'Search by Grep' })
    vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = 'Search Diagnostics' })
    vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = 'Search Resume' })
    vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = 'Search Recent Files ("." for repeat)' })

    vim.keymap.set('n', '/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.current_buffer_fuzzy_find {
        require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        },
      }
    end, { desc = '/ fuzzy find current buffer ' })

    -- Slightly advanced example of overriding default behavior and theme
    vim.keymap.set('n', '<leader>/', function()
      -- You can pass additional configuration to Telescope to change the theme, layout, etc.
      builtin.live_grep {
        require('telescope.themes').get_dropdown {
          winblend = 10,
          previewer = false,
        },
        cwd = utils.buffer_dir(),
        grep_open_files = false,
      }
    end, { desc = '[/] live_grep' })

    -- It's also possible to pass additional configuration options.
    --  See `:help telescope.builtin.live_grep()` for information about particular keys

  end,
},
{
  "folke/trouble.nvim",
  cmd = { "Trouble" },
  opts = {
    modes = {
      lsp = {
        win = { position = "right" },
      },
    },
  },
  keys = {
    { "<leader>ht", "<cmd>Trouble diagnostics toggle<cr>", desc = "Diagnostics (Trouble)" },
    { "<leader>hT", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", desc = "Buffer Diagnostics (Trouble)" },
    { "<leader>hl", "<cmd>Trouble lsp toggle<cr>", desc = "LSP references/definitions/... (Trouble)" },
  },
},
-- LSP Configuration & Plugins
{
  'neovim/nvim-lspconfig',
  dependencies = {
    -- Automatically install LSPs and related tools to stdpath for Neovim
    { 'williamboman/mason.nvim', config = true }, -- NOTE: Must be loaded before dependants
        'williamboman/mason-lspconfig.nvim',
        'WhoIsSethDaniel/mason-tool-installer.nvim',

        -- Useful status updates for LSP.
        -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
        { 'j-hui/fidget.nvim', opts = {} },

        -- `neodev` configures Lua LSP for your Neovim config, runtime and plugins
        -- used for completion, annotations and signatures of Neovim apis
        { 'folke/neodev.nvim', opts = {} },
      },
      config = function()
        -- Brief aside: **What is LSP?**
        --
        -- LSP is an initialism you've probably heard, but might not understand what it is.
        --
        -- LSP stands for Language Server Protocol. It's a protocol that helps editors
        -- and language tooling communicate in a standardized fashion.
        --
        -- In general, you have a "server" which is some tool built to understand a particular
        -- language (such as `gopls`, `lua_ls`, `rust_analyzer`, etc.). These Language Servers
        -- (sometimes called LSP servers, but that's kind of like ATM Machine) are standalone
        -- processes that communicate with some "client" - in this case, Neovim!
        --
        -- LSP provides Neovim with features like:
        --  - Go to definition
        --  - Find references
        --  - Autocompletion
        --  - Symbol Search
        --  - and more!
        --
        -- Thus, Language Servers are external tools that must be installed separately from
        -- Neovim. This is where `mason` and related plugins come into play.
        --
        -- If you're wondering about lsp vs treesitter, you can check out the wonderfully
        -- and elegantly composed help section, `:help lsp-vs-treesitter`

        --  This function gets run when an LSP attaches to a particular buffer.
        --    That is to say, every time a new file is opened that is associated with
        --    an lsp (for example, opening `main.rs` is associated with `rust_analyzer`) this
        --    function will be executed to configure the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
          group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
          callback = function(event)
            -- NOTE: Remember that Lua is a real programming language, and as such it is possible
            -- to define small helper and utility functions so you don't have to repeat yourself.
            --
            -- In this case, we create a function that lets us more easily define mappings specific
            -- for LSP related items. It sets the mode, buffer and description for us each time.
            local map = function(keys, func, desc)
              vim.keymap.set('n', keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
            end

            -- Jump to the definition of the word under your cursor.
            --  This is where a variable was first declared, or where a function is defined, etc.
            --  To jump back, press <C-t>.
            map('gd', require('telescope.builtin').lsp_definitions, 'Goto Definition')

            -- Find references for the word under your cursor.
            map('gr', require('telescope.builtin').lsp_references, 'Goto References')

            -- Jump to the implementation of the word under your cursor.
            --  Useful when your language has ways of declaring types without an actual implementation.
            map('gI', require('telescope.builtin').lsp_implementations, 'Goto Implementation')

            -- Jump to the type of the word under your cursor.
            --  Useful when you're not sure what type a variable is and you want to see
            --  the definition of its *type*, not where it was *defined*.
            map('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type Definition')

            -- Fuzzy find all the symbols in your current document.
            --  Symbols are things like variables, functions, types, etc.
            map('<leader>ds', require('telescope.builtin').lsp_document_symbols, 'Document Symbols')

            -- Fuzzy find all the symbols in your current workspace.
            --  Similar to document symbols, except searches over your entire project.
            map('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, 'Workspace Symbols')

            -- Rename the variable under your cursor.
            --  Most Language Servers support renaming across files, etc.
            map('<leader>rn', vim.lsp.buf.rename, 'Rename')

            -- Execute a code action, usually your cursor needs to be on top of an error
            -- or a suggestion from your LSP for this to activate.
            map('<leader>ca', vim.lsp.buf.code_action, 'Code Action')

            -- Opens a popup that displays documentation about the word under your cursor
            --  See `:help K` for why this keymap.
            map('K', vim.lsp.buf.hover, 'Hover Documentation')

            -- WARN: This is not Goto Definition, this is Goto Declaration.
            --  For example, in C this would take you to the header.
            map('gD', vim.lsp.buf.declaration, 'Goto Declaration')

            -- The following two autocommands are used to highlight references of the
            -- word under your cursor when your cursor rests there for a little while.
            --    See `:help CursorHold` for information about when this is executed
            --
            -- When you move your cursor, the highlights will be cleared (the second autocommand).
            local client = vim.lsp.get_client_by_id(event.data.client_id)
            if client and client.server_capabilities.documentHighlightProvider then
              local highlight_augroup = vim.api.nvim_create_augroup('kickstart-lsp-highlight', { clear = false })
              vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
              })

              vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
              })

              vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('kickstart-lsp-detach', { clear = true }),
                callback = function(event2)
                  vim.lsp.buf.clear_references()
                  vim.api.nvim_clear_autocmds { group = 'kickstart-lsp-highlight', buffer = event2.buf }
                end,
              })
            end

            -- The following autocommand is used to enable inlay hints in your
            -- code, if the language server you are using supports them
            --
            -- This may be unwanted, since they displace some of your code
            if client and client.server_capabilities.inlayHintProvider and vim.lsp.inlay_hint then
              map('<leader>th', function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
              end, 'Toggle Inlay Hints')
            end
          end,
        })

        -- LSP servers and clients are able to communicate to each other what features they support.
        --  By default, Neovim doesn't support everything that is in the LSP specification.
        --  When you add nvim-cmp, luasnip, etc. Neovim now has *more* capabilities.
        --  So, we create new capabilities with nvim cmp, and then broadcast that to the servers.
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        capabilities = vim.tbl_deep_extend('force', capabilities, require('cmp_nvim_lsp').default_capabilities())

        -- Enable the following language servers
        --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
        --
        --  Add any additional override configuration in the following tables. Available keys are:
        --  - cmd (table): Override the default command used to start the server
        --  - filetypes (table): Override the default list of associated filetypes for the server
        --  - capabilities (table): Override fields in capabilities. Can be used to disable certain LSP features.
        --  - settings (table): Override the default settings passed when initializing the server.
        --        For example, to see the options for `lua_ls`, you could go to: https://luals.github.io/wiki/settings/
        local servers = {
          -- clangd = {},
          -- gopls = {},
          -- pyright = {},
          -- rust_analyzer = {},
          -- ... etc. See `:help lspconfig-all` for a list of all the pre-configured LSPs
          --
          -- Some languages (like typescript) have entire language plugins that can be useful:
          --    https://github.com/pmizio/typescript-tools.nvim
          --
          -- But for many setups, the LSP (`tsserver`) will work just fine
          -- tsserver = {},
          --

          lua_ls = {
            -- cmd = {...},
            -- filetypes = { ...},
            -- capabilities = {},
            settings = {
              Lua = {
                completion = {
                  callSnippet = 'Replace',
                },
                -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
                -- diagnostics = { disable = { 'missing-fields' } },
              },
            },
          },
        }

        -- Ensure the servers and tools above are installed
        --  To check the current status of installed tools and/or manually install
        --  other tools, you can run
        --    :Mason
        --
        --  You can press `g?` for help in this menu.
        require('mason').setup()

        -- You can add other tools here that you want Mason to install
        -- for you, so that they are available from within Neovim.
        local ensure_installed = vim.tbl_keys(servers or {})
        vim.list_extend(ensure_installed, {
          'stylua', -- Used to format Lua code
        })
        require('mason-tool-installer').setup { ensure_installed = ensure_installed }

        require('mason-lspconfig').setup {
          handlers = {
            function(server_name)
              local server = servers[server_name] or {}
              -- This handles overriding only values explicitly passed
              -- by the server configuration above. Useful when disabling
              -- certain features of an LSP (for example, turning off formatting for tsserver)
              server.capabilities = vim.tbl_deep_extend('force', {}, capabilities, server.capabilities or {})
              require('lspconfig')[server_name].setup(server)
            end,
          },
        }
      end,
    },
    -- Autoformat
    {
      'stevearc/conform.nvim',
      lazy = true,
      keys = {
        {
          '<leader>bf',
          function()
            require('conform').format { async = true, lsp_fallback = true }
          end,
          mode = '',
          desc = 'Format buffer',
        },
      },
      opts = {
        notify_on_error = false,
        format_on_save = function(bufnr)
          -- Disable "format_on_save lsp_fallback" for languages that don't
          -- have a well standardized coding style. You can add additional
          -- languages here or re-enable it for the disabled ones.
          local disable_filetypes = { c = true, cpp = true }
          return {
            timeout_ms = 500,
            lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
          }
        end,
        formatters_by_ft = {
          lua = { 'stylua' },
          -- Conform can also run multiple formatters sequentially
          -- python = { "isort", "black" },
          --
          -- You can use a sub-list to tell conform to run *until* a formatter
          -- is found.
          -- javascript = { { "prettierd", "prettier" } },
        },
      },
    },
    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {
        -- Snippet Engine & its associated nvim-cmp source
        {
          'L3MON4D3/LuaSnip',
          build = (function()
            -- Build Step is needed for regex support in snippets.
            -- This step is not supported in many windows environments.
            -- Remove the below condition to re-enable on windows.
            if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
              return
            end
            return 'make install_jsregexp'
          end)(),
          dependencies = {
            -- `friendly-snippets` contains a variety of premade snippets.
            --    See the README about individual language/framework/plugin snippets:
            --    https://github.com/rafamadriz/friendly-snippets
            -- {
              --   'rafamadriz/friendly-snippets',
              --   config = function()
                --     require('luasnip.loaders.from_vscode').lazy_load()
                --   end,
                -- },
              },
            },
            'saadparwaiz1/cmp_luasnip',

            -- Adds other completion capabilities.
            --  nvim-cmp does not ship with all sources by default. They are split
            --  into multiple repos for maintenance purposes.
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
          },
          config = function()
            -- See `:help cmp`
            local cmp = require 'cmp'
            local luasnip = require 'luasnip'
            luasnip.config.setup {}

            cmp.setup {
              snippet = {
                expand = function(args)
                  luasnip.lsp_expand(args.body)
                end,
              },
              completion = { completeopt = 'menu,menuone,noinsert' },

              -- For an understanding of why these mappings were
              -- chosen, you will need to read `:help ins-completion`
              --
              -- No, but seriously. Please read `:help ins-completion`, it is really good!
              mapping = cmp.mapping.preset.insert {
                -- Select the next item
                ['<C-n>'] = cmp.mapping.select_next_item(),
                -- Select the previous item
                ['<C-p>'] = cmp.mapping.select_prev_item(),

                -- Scroll the documentation window back / forward
                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),

                -- Accept (yes) the completion.
                --  This will auto-import if your LSP supports it.
                --  This will expand snippets if the LSP sent a snippet.
                -- ['<C-y>'] = cmp.mapping.confirm { select = true },

                -- If you prefer more traditional completion keymaps,
                -- you can uncomment the following lines
                ['<CR>'] = cmp.mapping.confirm { select = true },
                ['<Tab>'] = cmp.mapping.select_next_item(),
                --['<S-Tab>'] = cmp.mapping.select_prev_item(),

                -- Manually trigger a completion from nvim-cmp.
                --  Generally you don't need this, because nvim-cmp will display
                --  completions whenever it has completion options available.
                -- ['<C-Space>'] = cmp.mapping.complete {},

                -- Think of <c-l> as moving to the right of your snippet expansion.
                --  So if you have a snippet that's like:
                --  function $name($args)
                --    $body
                --  end
                --
                -- <c-l> will move you to the right of each of the expansion locations.
                -- <c-h> is similar, except moving you backwards.
                ['<C-l>'] = cmp.mapping(function()
                  if luasnip.expand_or_locally_jumpable() then
                    luasnip.expand_or_jump()
                  end
                end, { 'i', 's' }),
                ['<C-h>'] = cmp.mapping(function()
                  if luasnip.locally_jumpable(-1) then
                    luasnip.jump(-1)
                  end
                end, { 'i', 's' }),

                -- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
                --    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
              },
              sources = {
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
                { name = 'path' },
              },
            }
          end,
        },

        { -- You can easily change to a different colorscheme.
        -- Change the name of the colorscheme plugin below, and then
        -- change the command in the config to whatever the name of that colorscheme is.
        --
        -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
        'folke/tokyonight.nvim',
        priority = 1000, -- Make sure to load this before all the other start plugins.
        init = function()
          -- Load the colorscheme here.
          -- Like many other themes, this one has different styles, and you could load
          -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
          vim.cmd.colorscheme 'desert'

          -- You can configure highlights by doing something like:
          vim.cmd.hi 'Comment gui=none'
        end,
      },

      -- Highlight todo, notes, etc in comments
      { 'folke/todo-comments.nvim', event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
      {
        'nvim-orgmode/orgmode',
        event = 'VeryLazy',
        ft = { 'org' },
        config = function()
          -- Setup orgmode
          require('orgmode').setup {
            org_agenda_files = '~/work-exchange/*.org',
            org_default_notes_file = '~/work-exchange/*.org',
          }

          -- NOTE: If you are using nvim-treesitter with ~ensure_installed = "all"~ option
          -- add ~org~ to ignore_install
          -- require('nvim-treesitter.configs').setup({
            --   ensure_installed = 'all',
            --   ignore_install = { 'org' },
            -- })
          end,
        },
        {
          'nvim-neo-tree/neo-tree.nvim',
          branch = 'v3.x',
          dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
            'MunifTanjim/nui.nvim',
            -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
          },
        },
        {
          'David-Kunz/gen.nvim',
          opts = {
            model = 'deepseek-coder-v2', -- The default model to use.
            host = 'localhost', -- The host running the Ollama service.
            port = '11434', -- The port on which the Ollama service is listening.
            quit_map = 'q', -- set keymap for close the response window
            retry_map = '<c-r>', -- set keymap to re-send the current prompt
            init = function(options)
              pcall(io.popen, 'ollama serve > /dev/null 2>&1 &')
            end,
            -- Function to initialize Ollama
            command = function(options)
              local body = { model = options.model, stream = true }
              return 'curl --silent --no-buffer -X POST http://' .. options.host .. ':' .. options.port .. '/api/chat -d $body'
            end,
            -- The command for the Ollama service. You can use placeholders $prompt, $model and $body (shellescaped).
            -- This can also be a command string.
            -- The executed command must return a JSON object with { response, context }
            -- (context property is optional).
            -- list_models = '<omitted lua function>', -- Retrieves a list of model names
            display_mode = 'float', -- The display mode. Can be "float" or "split" or "horizontal-split".
            show_prompt = false, -- Shows the prompt submitted to Ollama.
            show_model = false, -- Displays which model you are using at the beginning of your chat session.
            no_auto_close = false, -- Never closes the window automatically.
            debug = false, -- Prints errors and the command which is run.
          },
        },
        -- add gruvbox
        { 'ellisonleao/gruvbox.nvim' },
        { -- Collection of various small independent plugins/modules
        'echasnovski/mini.nvim',
        config = function()
          -- Better Around/Inside textobjects
          --
          -- Examples:
          --  - va)  - Visually select Around )paren
          --  - yinq - Yank Inside Next 'quote
          --  - ci'  - Change Inside 'quote
          require('mini.ai').setup { n_lines = 500 }

          -- Add/delete/replace surroundings (brackets, quotes, etc.)
          --
          -- - saiw) - Surround Add Inner Word )Paren
          -- - sd'   - Surround Delete 'quotes
          -- - sr)'  - Surround Replace ) '
          require('mini.surround').setup()
          require('mini.align').setup()

          -- Simple and easy statusline.
          --  You could remove this setup call if you don't like it,
          --  and try some other statusline plugin
          local statusline = require 'mini.statusline'
          -- set use_icons to true if you have a Nerd Font
          statusline.setup { use_icons = vim.g.have_nerd_font }

          -- You can configure sections in the statusline by overriding their
          -- default behavior. For example, here we set the section for
          -- cursor location to LINE:COLUMN
          ---@diagnostic disable-next-line: duplicate-set-field
          statusline.section_location = function()
            return '%2l:%-2v'
          end

          -- ... and there is more!
          --  Check out: https://github.com/echasnovski/mini.nvim
        end,
      },
      { -- Highlight, edit, and navigate code
      'nvim-treesitter/nvim-treesitter',
      build = ':TSUpdate',
      opts = {
        ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'vim', 'vimdoc', 'org' },
        -- Autoinstall languages that are not installed
        auto_install = true,
        highlight = {
          enable = true,
          -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
          --  If you are experiencing weird indenting issues, add the language to
          --  the list of additional_vim_regex_highlighting and disabled languages for indent.
          additional_vim_regex_highlighting = { 'ruby' },
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = '<space>v',
            node_incremental = 'v',
            scope_incremental = false,
            node_decremental = 'V',
          },
        },
      },

      config = function(_, opts)
        -- [[ Configure Treesitter ]] See `:help nvim-treesitter`

        -- Prefer git instead of curl in order to improve connectivity in some environments
        require('nvim-treesitter.install').prefer_git = true
        ---@diagnostic disable-next-line: missing-fields
        require('nvim-treesitter.configs').setup(opts)

        -- There are additional nvim-treesitter modules that you can use to interact
        -- with nvim-treesitter. You should go explore a few and see what interests you:
        --
        --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
        --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
        --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
      end,
    },
    {
      "akinsho/bufferline.nvim",
      event = "VeryLazy",
      keys = {
        { "<leader>bo",    "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
        { "<leader>br",    "<Cmd>BufferLineCloseRight<CR>",  desc = "Delete Buffers to the Right" },
        { "<leader>bl",    "<Cmd>BufferLineCloseLeft<CR>",   desc = "Delete Buffers to the Left" },
        { "<leader>bd",    "<Cmd>w|bd<CR>",                  desc = "Delete current buffer" },
        { "<leader><tab>", "<cmd>BufferLineCycleNext<cr>",   desc = "Next Buffer" },
        { "c-<tab>",       "<cmd>BufferLineCycleNext<cr>",   desc = "Next Buffer" },
      },
      opts = {
        options = {
          mode = "buffers", -- set to "tabs" to only show tabpages instead
          themable = true, -- allows highlight groups to be overriden i.e. sets highlights as default
          numbers = "none",
          close_command = "bdelete! %d",       -- can be a string | function, | false see "Mouse actions"
          right_mouse_command = "bdelete! %d", -- can be a string | function | false, see "Mouse actions"
          left_mouse_command = "buffer %d",    -- can be a string | function, | false see "Mouse actions"
          middle_mouse_command = nil,          -- can be a string | function, | false see "Mouse actions"
          indicator = {
            icon = '▎', -- this should be omitted if indicator style is not 'icon'
            style = 'icon',
          },
          buffer_close_icon = 'X',
          modified_icon = '●',
          close_icon = 'X',
          left_trunc_marker = '<',
          right_trunc_marker = '>',
          max_name_length = 18,
          max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
          truncate_names = true, -- whether or not tab names should be truncated
          tab_size = 18,
          diagnostics =  "nvim_lsp",
          diagnostics_update_in_insert = false,
          diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "("..count..")"
          end,
          -- NOTE: this will be called a lot so don't do any heavy processing here
          -- custom_filter = function(buf_number, buf_numbers)
            --     -- filter out filetypes you don't want to see
            --     if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
            --         return true
            --     end
            --     -- filter out by buffer name
            --     if vim.fn.bufname(buf_number) ~= "<buffer-name-I-dont-want>" then
            --         return true
            --     end
            --     -- filter out based on arbitrary rules
            --     -- e.g. filter out vim wiki buffer from tabline in your work repo
            --     if vim.fn.getcwd() == "<work-repo>" and vim.bo[buf_number].filetype ~= "wiki" then
            --         return true
            --     end
            --     -- filter out by it's index number in list (don't show first buffer)
            --     if buf_numbers[1] ~= buf_number then
            --         return true
            --     end
            -- end,
            offsets = {
              {
                filetype = "NvimTree",
                text = "File Explorer" ,
                text_align =  "right",
                separator = true
              }
            },
            -- color_icons = true | false, -- whether or not to add the filetype icon highlights
            get_element_icon = function(element)
              -- element consists of {filetype: string, path: string, extension: string, directory: string}
              -- This can be used to change how bufferline fetches the icon
              -- for an element e.g. a buffer or a tab.
              -- e.g.
              local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
              return icon, hl
            end,
            show_buffer_icons =  false, -- disable filetype icons for buffers
            show_buffer_close_icons = true,
            show_close_icon = true,
            show_tab_indicators = false,
            show_duplicate_prefix = true, -- whether to show duplicate buffer prefix
            duplicates_across_groups = false, -- whether to consider duplicate paths in different groups as duplicates
            persist_buffer_sort = false, -- whether or not custom sorted buffers should persist
            move_wraps_at_ends = false, -- whether or not the move command "wraps" at the first or last position
            -- can also be a table containing 2 custom separators
            -- [focused and unfocused]. eg: { '|', '|' }
            separator_style =  "thick" ,
            enforce_regular_tabs =  true,
            always_show_bufferline =  false,
            auto_toggle_bufferline = true,
            -- hover = {
              --     enabled = true,
              --     delay = 200,
              --     reveal = {'close'}
              -- },
              sort_by = 'insert_after_current' ,
            },
          },
          config = function(_, opts)
            require("bufferline").setup(opts)
            -- Fix bufferline when restoring a session
            -- vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
              --   callback = function()
                --     vim.schedule(function()
                  --       pcall(nvim_bufferline)
                  --     end)
                  --   end,
                  -- })
                end,
              },
              --
              -- The following two comments only work if you have downloaded the kickstart repo, not just copy pasted the
              -- init.lua. If you want these files, they are in the repository, so you can just download them and
              -- place them in the correct locations.

              -- NOTE: Next step on your Neovim journey: Add/Configure additional plugins for Kickstart
              --
              --  Here are some example plugins that I've included in the Kickstart repository.
              --  Uncomment any of the lines below to enable them (you will need to restart nvim).
              --
              -- require 'kickstart.plugins.debug',
              -- require 'kickstart.plugins.indent_line',
              -- require 'kickstart.plugins.lint',
              -- require 'kickstart.plugins.autopairs',
              -- require 'kickstart.plugins.neo-tree',
              -- require 'kickstart.plugins.gitsigns', -- adds gitsigns recommend keymaps

              -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
              --    This is the easiest way to modularize your config.
              --
              --  Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
              --    For additional information, see `:help lazy.nvim-lazy.nvim-structuring-your-plugins`
              -- { import = 'custom.plugins' },
            }, 
            {
              ui = {
                -- If you are using a Nerd Font: set icons to an empty table which will use the
                -- default lazy.nvim defined Nerd Font icons, otherwise define a unicode icons table
                icons = vim.g.have_nerd_font and {} or {
                  cmd = '⌘',
                  config = '🛠',
                  event = '📅',
                  ft = '📂',
                  init = '⚙',
                  keys = '🗝',
                  plugin = '🔌',
                  runtime = '💻',
                  require = '🌙',
                  source = '📄',
                  start = '🚀',
                  task = '📌',
                  lazy = '💤 ',
                },
              },
            })

-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
