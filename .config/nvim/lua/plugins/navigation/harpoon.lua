local keys = {
    { '<leader>a', function (buffer)
        require('harpoon.mark').add_file(buffer)
    end, desc = 'Add file to harpoon'},
    { '<C-e>', function ()
        require('harpoon.ui').toggle_quick_menu()
    end, desc = 'Show harpoon'},
}

for i, key in ipairs({'h', 'j', 'k', 'l'}) do
    local mapping = {
        string.format('<C-S-%s>', key),
        function ()
            require('harpoon.ui').nav_file(i)
        end
    }
    table.insert(keys, mapping)
end

return {
    'theprimeagen/harpoon',
    keys = keys,
}
