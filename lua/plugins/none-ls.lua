return {
  "nvimtools/none-ls.nvim",
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      debug = true,
      sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.phpcsfixer.with({
          extra_args = { "--config", "./.php-cs-fixer.dist.php", "--using-cache=no" }--allow-risky=yes},
        }),
        null_ls.builtins.formatting.prettier,
      },
    })

    vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
    vim.keymap.set("v", "<leader>fm", vim.lsp.buf.format, {})
  end,
}
