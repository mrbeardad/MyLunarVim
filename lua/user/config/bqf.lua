local M = {}

M.config = function()
	require("bqf").setup({
		auto_resize_height = true,
		preview = {
			auto_preview = true,
			should_preview_cb = function(bufnr)
				local ret = true
				local filename = vim.api.nvim_buf_get_name(bufnr)
				local fsize = vim.fn.getfsize(filename)
				-- file size greater than 10k can't be previewed automatically
				if fsize > 100 * 1024 then
					ret = false
				end
				return ret
			end,
		},
	})
end

return M
