return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        pyright = {},
        intelephense = {},
        kotlin_language_server = {},
        jdtls = {},
        nil_ls = { mason = false },
        jsonls = {
          settings = {
            json = {
              format = {
                enable = false,
              },
              validate = { enable = true },
            },
          },
        },
      },
    },
  },
}
