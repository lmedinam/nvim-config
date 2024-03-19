vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9

vim.cmd("nnoremap   <silent>   <F7>    :FloatermNew<CR>")
vim.cmd("tnoremap   <silent>   <F7>    <C-\\><C-n>:FloatermNew<CR>")
vim.cmd("nnoremap   <silent>   <F8>    :FloatermPrev<CR>")
vim.cmd("tnoremap   <silent>   <F8>    <C-\\><C-n>:FloatermPrev<CR>")
vim.cmd("nnoremap   <silent>   <F9>    :FloatermNext<CR>")
vim.cmd("tnoremap   <silent>   <F9>    <C-\\><C-n>:FloatermNext<CR>")
vim.cmd("nnoremap   <silent>   <F12>   :FloatermToggle<CR>")
vim.cmd("tnoremap   <silent>   <F12>   <C-\\><C-n>:FloatermToggle<CR>")

