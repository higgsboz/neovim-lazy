return {
  "nvim-neotest/neotest-jest",
  config = function()
    require("neotest").setup({
      adapters = {
        require("neotest-jest")({
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
        }),
      },
    })
  end,
}
