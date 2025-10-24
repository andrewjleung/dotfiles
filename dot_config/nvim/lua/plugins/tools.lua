return {
  {
    "codethread/qmk.nvim",
    config = function()
      --@type qmk.UserConfig
      local conf = {
        name = "LAYOUT_glove80",
        variant = "zmk",
        layout = {
          "x x x x x _ _ _ _ _ _ _ _ _ x x x x x",
          "x x x x x x _ _ _ _ _ _ _ x x x x x x",
          "x x x x x x _ _ _ _ _ _ _ x x x x x x",
          "x x x x x x _ _ _ _ _ _ _ x x x x x x",
          "x x x x x x x x x _ x x x x x x x x x",
          "x x x x x _ x x x _ x x x _ x x x x x",
        },
      }
      require("qmk").setup(conf)
    end,
  },
  {
    "Wansmer/treesj",
    keys = {
      { "<leader>tt", "<cmd>TSJToggle<cr>", desc = "Toggle split/join for node under cursor" },
      { "<leader>ts", "<cmd>TSJSplit<cr>", desc = "Split node under cursor" },
      { "<leader>tj", "<cmd>TSJJoin<cr>", desc = "Join node under cursor" },
    },
    dependencies = { "nvim-treesitter/nvim-treesitter" }, -- if you install parsers with `nvim-treesitter`
    config = function()
      require("treesj").setup({--[[ your config ]]
        max_join_length = 300,
        use_default_keymaps = false,
      })
    end,
  },
  {
    "cbochs/grapple.nvim",
    opts = {
      scope = "git", -- also try out "git_branch"
    },
    event = { "BufReadPost", "BufNewFile" },
    cmd = "Grapple",
    keys = {
      { "<leader>m", "<cmd>Grapple toggle<cr>", desc = "Grapple toggle tag" },
      { "<leader>M", "<cmd>Grapple toggle_tags<cr>", desc = "Grapple open tags window" },
      { "<leader>n", "<cmd>Grapple cycle_tags next<cr>", desc = "Grapple cycle next tag" },
      { "<leader>p", "<cmd>Grapple cycle_tags prev<cr>", desc = "Grapple cycle previous tag" },
    },
  },

  {
    "OXY2DEV/markview.nvim",
    lazy = false,
    dependencies = {
      "loctvl842/monokai-pro.nvim",
      "saghen/blink.cmp",
    },
  },
  {
    "MeanderingProgrammer/render-markdown.nvim",
    enabled = false,
  },
  {
    "hedyhli/markdown-toc.nvim",
    ft = "markdown", -- Lazy load on markdown filetype
    cmd = { "Mtoc" }, -- Or, lazy load on "Mtoc" command
    opts = {
      -- Your configuration here (optional)
    },
    config = function()
      require("mtoc").setup({})
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    lazy = true,
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { "<leader>lg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
    },
  },
}
