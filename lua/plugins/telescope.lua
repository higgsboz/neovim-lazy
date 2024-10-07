return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        "benfowler/telescope-luasnip.nvim",
      },
    },
    opts = function(_, opts)
      local lga_actions = require("telescope-live-grep-args.actions")
      opts.extensions = {
        live_grep_args = {
          auto_quoting = true, -- enable/disable auto-quoting
          -- define mappings, e.g.
          mappings = { -- extend mappings
            i = {
              ["<C-k>"] = lga_actions.quote_prompt(),
              ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
            },
          },
        },
      }

      opts.defaults = vim.tbl_extend("force", opts.defaults, {
        layout_strategy = "vertical",
        mappings = {
          i = {
            ["<C-o>"] = function(prompt_bufnr)
              require("telescope.actions").select_default(prompt_bufnr)
              require("telescope.builtin").resume()
            end,
          },
        },
      })
    end,
    keys = {
      {
        "<leader>/",
        "<cmd>lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        desc = "Grep (root dir)",
      },
      {
        "<leader>fs",
        "<cmd>Telescope luasnip<CR>",
        desc = "Find snippets",
      },
    },
    config = function(_, opts)
      local tele = require("telescope")
      tele.setup(opts)
      tele.load_extension("live_grep_args")
      tele.load_extension("luasnip")
    end,
  },
}
