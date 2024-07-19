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
			}
		})
	end,
}
