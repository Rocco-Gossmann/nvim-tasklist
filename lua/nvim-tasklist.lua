local M = {}

local function prepTaskLine(ln)
	vim.cmd.norm(ln .. "gg<cr>");

	vim.cmd [[

		s/^\(\s*\)--- /\1/e
		s/^\(\s*\)\[[ x]\] /\1/&

	]]
end

function M.setup()

	vim.api.nvim_create_user_command("TaskNew", function(opts)
		for a = opts.line1, opts.line2 do
			prepTaskLine(a)
			vim.cmd [[

					s/\s*@.*$//e
					s/^\(\s*\)\(.*\)$/\1[ ] \2/&

				]]
		end
	end, { range = true });

	vim.api.nvim_create_user_command("TaskStart", function(opts)
		for a = opts.line1, opts.line2 do
			prepTaskLine(a)
			vim.cmd [[

				s/\s*@.*$//e
				s/^\(\s*\)\(.*\)$/\1[ ] \2/&
				s/\s*$/ @started/&
				pu=strftime('%Y-%m-%d %H:%M:%S')
				norm kJ

			]]
		end
	end, { range = true });

	vim.api.nvim_create_user_command("TaskDone", function(opts)
		for a = opts.line1, opts.line2 do
			prepTaskLine(a)
			vim.cmd [[

				s/^\(\s*\)\(.*\)$/\1[x] \2/e
				s/\s*$/ @done/&
				pu=strftime('%Y-%m-%d %H:%M:%S')
				norm kJ

			]]
		end
	end, { range = true });

	vim.api.nvim_create_user_command("TaskCancel", function(opts)
		for a = opts.line1, opts.line2 do
			prepTaskLine(a)
			vim.cmd [[

				s/^\(\s*\)\(.*\)$/\1--- \2/e
				s/\s*$/ @canceled/&
				pu=strftime('%Y-%m-%d %H:%M:%S')
				norm kJ

			]]
	end
	end, { range = true });

	vim.api.nvim_create_user_command("TaskReset", function(opts)
		for a = opts.line1, opts.line2 do
			prepTaskLine(a)
			vim.cmd [[

				s/\s*@.*$//e

			]]
		end
	end, { range = true });

	vim.filetype.add({ extension = { todo = "todo" } })

end

return M
