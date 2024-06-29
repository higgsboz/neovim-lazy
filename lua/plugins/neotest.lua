return {
  "nvim-neotest/neotest",
  optional = true,
  dependencies = {
    "olimorris/neotest-rspec",
    "nvim-neotest/neotest-jest",
    -- "HiPhish/neotest-busted",
    "nvim-neotest/neotest-plenary",
  },
  keys = {
    {
      "<leader>td",
      desc = "+debug",
    },
    {
      "<leader>tdf",
      function()
        require("neotest").run.run({ vim.fn.expand("%"), strategy = "dap" })
      end,
      desc = "Debug File",
    },
    {
      "<leader>tdn",
      function()
        require("neotest").run.run({ strategy = "dap" })
      end,
      desc = "Debug Nearest",
    },
  },
  opts = {
    adapters = {
      ["neotest-rspec"] = {},
      ["neotest-jest"] = {
        -- jestCommand = "pnpm test --",
        env = { CI = true },
        cwd = function()
          return vim.fn.getcwd()
        end,
        -- jestConfigFile = function(file)
        --   if string.find(file, "/packages/") then
        --     return string.match(file, "(.-/[^/]+/)src") .. "jest.config.ts"
        --   end
        --
        --   return vim.fn.getcwd() .. "/jest.config.ts"
        -- end,
        -- cwd = function(file)
        --   if string.find(file, "/packages/") then
        --     return string.match(file, "(.-/[^/]+/)src")
        --   end
        --   return vim.fn.getcwd()
        -- end,
      },
      ["neotest-plenary"] = {},
    },
    discovery = {
      concurrent = 1,
    },
  },
}
