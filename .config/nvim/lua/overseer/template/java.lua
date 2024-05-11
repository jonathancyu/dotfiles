-- /home/stevearc/.config/nvim/lua/overseer/template/user/cpp_build.lua
return {
    name = "run python",
    builder = function()
        -- Full path to current file (see :help expand())
        local file = vim.fn.expand("%:p")
        return {
            cmd = { "python" },
            args = { file },
            components = { { "on_output_quickfix", open = true }, "default" },
        }
    end,
    condition = {
        filetype = { "py" },
    },
}
