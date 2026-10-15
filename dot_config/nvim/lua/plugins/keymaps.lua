return {
  {
    "AstroNvim/astrocore",
    opts = {
      mappings = {
        n = {
          ["<Leader>w"] = false,
          ["<Leader>n"] = false,
          ["<Leader>c"] = false,
          ["<Leader>C"] = false,
          ["<Leader>q"] = false,
          ["<Leader>Q"] = false,
          ["<Leader>R"] = false,
          ["<Leader>e"] = false,
          ["<Leader>o"] = false,
          ["<Leader>h"] = false,
          ["<Leader>/"] = false,
          ["<C-S>"] = false,
          ["<C-Q>"] = false,
          ["<C-H>"] = false,
          ["<C-J>"] = false,
          ["<C-K>"] = false,
          ["<C-L>"] = false,
          ["<C-Up>"] = false,
          ["<C-Down>"] = false,
          ["<C-Left>"] = false,
          ["<C-Right>"] = false,
          ["|"] = false,
          ["\\"] = false,
          gco = false,
          gcO = false,

          -- <Leader>f shortcuts
          ["<Leader>ff"] = false, -- Cmd-P
          ["<Leader>fC"] = false, -- Cmd-Shift-P
          ["<Leader>fF"] = false, -- fa: All files
          ["<Leader>fW"] = false, -- fG: Grep all files
          ["<Leader>fo"] = false, -- fr: Recent files
          ["<Leader>fO"] = false, -- fR: Recent files in this directory
          ["<Leader>f'"] = false, -- fM: Marks
          ["<Leader>fa"] = {
            function() require("snacks").picker.files { hidden = true, ignored = true } end,
            desc = "All files",
          },
          ["<Leader>fb"] = { function() require("snacks").picker.buffers() end, desc = "Buffers" },
          ["<Leader>fc"] = {
            function() require("snacks").picker.files { cwd = vim.fn.stdpath "config" } end,
            desc = "Config files",
          },
          ["<Leader>fg"] = { function() require("snacks").picker.grep() end, desc = "Grep text" },
          ["<Leader>fG"] = {
            function() require("snacks").picker.grep { hidden = true, ignored = true } end,
            desc = "Grep text (all files)",
          },
          ["<Leader>fh"] = { function() require("snacks").picker.help() end, desc = "Help" },
          ["<Leader>fk"] = { function() require("snacks").picker.keymaps() end, desc = "Keymaps" },
          ["<Leader>fl"] = { function() require("snacks").picker.lines() end, desc = "Lines" },
          ["<Leader>fm"] = { function() require("snacks").picker.man() end, desc = "Man pages" },
          ["<Leader>fM"] = { function() require("snacks").picker.marks() end, desc = "Marks" },
          ["<Leader>fn"] = { function() require("snacks").picker.notifications() end, desc = "Notifications" },
          ["<Leader>fp"] = false, -- Cmd-O
          ["<Leader>fr"] = { function() require("snacks").picker.recent() end, desc = "Recent files" },
          ["<Leader>fR"] = {
            function() require("snacks").picker.recent { filter = { cwd = true } } end,
            desc = "Recent files (current directory)",
          },
          ["<Leader>fs"] = { function() require("snacks").picker.smart() end, desc = "Smart file search" },
          ["<Leader>ft"] = {
            function()
              require("lazy").load { plugins = { "todo-comments.nvim" } }
              require("snacks").picker.todo_comments()
            end,
            desc = "TODOs",
          },
          ["<Leader>fT"] = { function() require("snacks").picker.colorschemes() end, desc = "Themes" },
          ["<Leader>fu"] = { function() require("snacks").picker.undo() end, desc = "Undo history" },
          ["<Leader>fv"] = { function() require("snacks").picker.git_files() end, desc = "Versioned files" },
          ["<Leader>fw"] = { function() require("snacks").picker.grep_word() end, desc = "Word under cursor" },
          ["<Leader>fy"] = { function() require("snacks").picker.registers() end, desc = "Yank registers" },

          -- <Leader>l shortcuts
          ["<Leader>lD"] = false, -- le: Errors and diagnostics
          ["<Leader>lS"] = false, -- lo: Outline
          ["<Leader>le"] = { function() require("snacks").picker.diagnostics() end, desc = "Errors / diagnostics" },
          ["<Leader>lo"] = { function() require("aerial").toggle() end, desc = "Outline" },

          -- <Leader>g shortcuts
          ["<Leader>gb"] = false,
          ["<Leader>gc"] = false,
          ["<Leader>gC"] = false,
          ["<Leader>gt"] = false,
          ["<Leader>gT"] = false,
          ["<Leader>gg"] = false,
          ["<Leader>go"] = false,
          ["<Leader>g|"] = false,
          ["<Leader>gn"] = false,
          ["<Leader>gnt"] = false,
          ["<Leader>gnc"] = false,
          ["<Leader>gnd"] = false,
          ["<Leader>gnk"] = false,
          ["<Leader>gnf"] = false,
          ["<Leader>gnh"] = false,
          ["<Leader>gnv"] = false,

          -- <Leader>t shortcuts
          ["<Leader>t"] = false,
          ["<Leader>tf"] = false,
          ["<Leader>th"] = false,
          ["<Leader>tv"] = false,
          ["<Leader>tn"] = false,
          ["<Leader>tp"] = false,
          ["<Leader>tl"] = false,
          ["<Leader>tt"] = false,
          ["<Leader>tu"] = false,
          ["<F7>"] = false,
          ["<C-'>"] = false,

          ["<D-n>"] = { "<Cmd>enew<CR>", desc = "New File" },
          ["<D-/>"] = { "gcc", remap = true, desc = "Toggle Comment" },
          ["<D-o>"] = { function() require("snacks").picker.projects() end, desc = "Projects" },
          ["<D-p>"] = {
            function() require("snacks").picker.files() end,
            desc = "Find Files",
          },
          ["<D-S-p>"] = {
            function() require("snacks").picker.commands() end,
            desc = "Find Commands",
          },
          ["<D-w>"] = {
            function() require("astrocore.buffer").close() end,
            desc = "Close Buffer",
          },
          ["<D-b>"] = { "<Cmd>Neotree toggle filesystem<CR>", desc = "Toggle Explorer" },
          ["<D-s>"] = { "<Cmd>update<CR>", desc = "Save" },
          ["<D-g>"] = {
            function() require("gitgraph").draw({}, { all = true, max_count = 5000 }) end,
            desc = "Git Graph",
          },
          ["<D-S-g>"] = { "<Cmd>Neotree toggle git_status<CR>", desc = "Toggle Git Panel" },
          ["<D-j>"] = {
            function() require("snacks").terminal(nil, { count = 1, win = { position = "bottom", height = 0.3 } }) end,
            desc = "Toggle Bottom Terminal",
          },
          ["<D-r>"] = {
            function() require("snacks").terminal(nil, { count = 2, win = { position = "right", width = 0.4 } }) end,
            desc = "Toggle Right Terminal",
          },
          ["<D-Left>"] = { "<Cmd>wincmd h<CR>", desc = "Move to left split" },
          ["<D-Down>"] = { "<Cmd>wincmd j<CR>", desc = "Move to below split" },
          ["<D-Up>"] = { "<Cmd>wincmd k<CR>", desc = "Move to above split" },
          ["<D-Right>"] = { "<Cmd>wincmd l<CR>", desc = "Move to right split" },
        },

        i = {
          ["<F7>"] = false,
          ["<C-'>"] = false,
          ["<D-n>"] = { "<Cmd>enew<CR>", desc = "New File" },
          ["<D-/>"] = { "<C-o>gcc", remap = true, desc = "Toggle Comment" },
          ["<D-o>"] = { function() require("snacks").picker.projects() end, desc = "Projects" },
          ["<D-p>"] = {
            function() require("snacks").picker.files() end,
            desc = "Find Files",
          },
          ["<D-S-p>"] = {
            function() require("snacks").picker.commands() end,
            desc = "Find Commands",
          },
          ["<D-w>"] = {
            function()
              vim.cmd.stopinsert()
              require("astrocore.buffer").close()
            end,
            desc = "Close Buffer",
          },
          ["<D-b>"] = { "<Esc><Cmd>Neotree toggle filesystem<CR>", desc = "Toggle Explorer" },
          ["<D-s>"] = { "<Cmd>update<CR>", desc = "Save" },
          ["<D-g>"] = {
            function()
              vim.cmd.stopinsert()
              require("gitgraph").draw({}, { all = true, max_count = 5000 })
            end,
            desc = "Git Graph",
          },
          ["<D-S-g>"] = { "<Esc><Cmd>Neotree toggle git_status<CR>", desc = "Toggle Git Panel" },
          ["<D-j>"] = {
            function()
              vim.cmd.stopinsert()
              require("snacks").terminal(nil, { count = 1, win = { position = "bottom", height = 0.3 } })
            end,
            desc = "Toggle Bottom Terminal",
          },
          ["<D-r>"] = {
            function()
              vim.cmd.stopinsert()
              require("snacks").terminal(nil, { count = 2, win = { position = "right", width = 0.4 } })
            end,
            desc = "Toggle Right Terminal",
          },
          ["<D-Left>"] = { "<Esc><Cmd>wincmd h<CR>", desc = "Move to left split" },
          ["<D-Down>"] = { "<Esc><Cmd>wincmd j<CR>", desc = "Move to below split" },
          ["<D-Up>"] = { "<Esc><Cmd>wincmd k<CR>", desc = "Move to above split" },
          ["<D-Right>"] = { "<Esc><Cmd>wincmd l<CR>", desc = "Move to right split" },
        },

        x = {
          ["<Leader>/"] = false,
          ["<Leader>go"] = false,
          ["<C-S>"] = false,
          ["<D-/>"] = { "gc", remap = true, desc = "Toggle Comment Selection" },
          ["<D-Left>"] = { "<Esc><Cmd>wincmd h<CR>", desc = "Move to left split" },
          ["<D-Down>"] = { "<Esc><Cmd>wincmd j<CR>", desc = "Move to below split" },
          ["<D-Up>"] = { "<Esc><Cmd>wincmd k<CR>", desc = "Move to above split" },
          ["<D-Right>"] = { "<Esc><Cmd>wincmd l<CR>", desc = "Move to right split" },
        },

        t = {
          ["<F7>"] = false,
          ["<C-'>"] = false,
          ["<C-H>"] = false,
          ["<C-J>"] = false,
          ["<C-K>"] = false,
          ["<C-L>"] = false,
          ["<D-j>"] = {
            function() require("snacks").terminal(nil, { count = 1, win = { position = "bottom", height = 0.3 } }) end,
            desc = "Toggle Bottom Terminal",
          },
          ["<D-r>"] = {
            function() require("snacks").terminal(nil, { count = 2, win = { position = "right", width = 0.4 } }) end,
            desc = "Toggle Right Terminal",
          },
          ["<D-Left>"] = { "<C-\\><C-n><Cmd>wincmd h<CR>", desc = "Move to left split" },
          ["<D-Down>"] = { "<C-\\><C-n><Cmd>wincmd j<CR>", desc = "Move to below split" },
          ["<D-Up>"] = { "<C-\\><C-n><Cmd>wincmd k<CR>", desc = "Move to above split" },
          ["<D-Right>"] = { "<C-\\><C-n><Cmd>wincmd l<CR>", desc = "Move to right split" },
        },
      },
    },
  },

  {
    "AstroNvim/astrolsp",
    opts = {
      mappings = {
        n = {
          ["<Leader>lG"] = false, -- lw: Workspace symbols
          ["<Leader>lh"] = false, -- lp: Parameters
          ["<Leader>lI"] = false, -- ln: Null-ls information
          ["<Leader>lp"] = {
            function() vim.lsp.buf.signature_help() end,
            desc = "Parameters / signature",
            cond = "textDocument/signatureHelp",
          },
          ["<Leader>lw"] = {
            function() vim.lsp.buf.workspace_symbol() end,
            desc = "Workspace symbols",
            cond = "workspace/symbol",
          },
          ["<Leader>lW"] = {
            function() vim.lsp.buf.workspace_diagnostics() end,
            desc = "Workspace diagnostics",
            cond = "workspace/diagnostic",
          },
          ["<Leader>ln"] = {
            "<Cmd>NullLsInfo<CR>",
            desc = "Null-ls information",
            cond = function() return vim.fn.exists ":NullLsInfo" > 0 end,
          },
        },
      },
    },
  },

  {
    "lewis6991/gitsigns.nvim",
    opts = {
      on_attach = function(bufnr)
        require("astrocore").set_mappings({
          n = {
            ["<Leader>g"] = { desc = "Git" },
            ["<Leader>gb"] = { function() require("gitsigns").blame_line() end, desc = "Blame line" },
            ["<Leader>gd"] = { function() require("gitsigns").diffthis() end, desc = "Diff file" },
            ["<Leader>gp"] = { function() require("gitsigns").preview_hunk_inline() end, desc = "Preview hunk" },
            ["<Leader>gs"] = { function() require("gitsigns").stage_hunk() end, desc = "Stage / unstage hunk" },
            ["<Leader>gS"] = { function() require("gitsigns").stage_buffer() end, desc = "Stage file" },
            ["[g"] = { function() require("gitsigns").nav_hunk "prev" end, desc = "Previous Git hunk" },
            ["]g"] = { function() require("gitsigns").nav_hunk "next" end, desc = "Next Git hunk" },
          },
          v = {
            ["<Leader>g"] = { desc = "Git" },
            ["<Leader>gs"] = {
              function() require("gitsigns").stage_hunk { vim.fn.line ".", vim.fn.line "v" } end,
              desc = "Stage selection",
            },
          },
        }, { buffer = bufnr })
      end,
    },
  },

  {
    "akinsho/toggleterm.nvim",
    opts = {
      on_create = function()
        vim.opt_local.foldcolumn = "0"
        vim.opt_local.signcolumn = "no"
      end,
    },
  },

  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        mappings = {
          T = "none",
          Tf = "none",
          Th = "none",
          Tv = "none",
        },
      },
    },
  },

  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix",
    },
  },
}
