local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		filter = function(client)
			-- apply whatever logic you want (in this example, we'll only use null-ls)
			return client.name == "null-ls"
		end,
		bufnr = bufnr,
	})
end

-- if you want to set up formatting on save, you can use this as a callback
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

-- add to your shared on_attach callback
local on_attach = function(client, bufnr)
	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				lsp_formatting(bufnr)
			end,
		})
	end
end

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			debug = true,
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.pint,
				null_ls.builtins.formatting.prettier,
				null_ls.builtins.formatting.blade_formatter.with({
					generator_opts = {
						command = "blade-formatter",
						args = function(params)
							return {
								"--write",
								params.temp_path:gsub("\\", "/"), -- Fix filepath for Windows
							}
						end,
					},
					to_stdin = false,
					to_temp_file = true,
				}),
			},
			on_attach = on_attach,
			default_timeout = 5000,
		})

		vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, {})
		vim.keymap.set("v", "<leader>fm", vim.lsp.buf.format, {})
	end,
}
