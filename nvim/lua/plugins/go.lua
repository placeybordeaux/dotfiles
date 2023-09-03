return {
  -- Go
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {},
      },
    },
  },
  {
    "crispgm/nvim-go",
    ft = "go",
    config = function()
      -- import packages automatically
      local go = require("go")
      go.setup({
        -- notify: use nvim-notify
        notify = false,
        -- auto commands
        auto_format = false,
        auto_lint = true,
        -- lint_prompt_style: qf (quickfix), vt (virtual text)
        lint_prompt_style = "qf",
        -- linters: revive, errcheck, staticcheck, golangci-lint
        linter = "golangci-lint",
        -- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
        -- formatter: goimports, gofmt, gofumpt, lsp
        formatter = "goimports",
      })
      go.config.update_tool("quicktype", function(tool)
        tool.pkg_mgr = "pnpm"
      end)
    end,
  },
}
