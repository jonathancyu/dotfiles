return {
    "tamton-aquib/duck.nvim",

    config = function()
        local animal = '🐄'
        vim.keymap.set("n", "<leader>dd", function()
            require("duck").hatch(animal)
        end, {})
        vim.keymap.set("n", "<leader>dk", function()
            require("duck").cook()
        end, {})
        vim.keymap.set("n", "<leader>da", function()
            require("duck").cook_all()
        end, {})
    end,
}
