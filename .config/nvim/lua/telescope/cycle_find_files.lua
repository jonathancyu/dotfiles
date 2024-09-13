local builtin = require('telescope.builtin')
return require('telescope.cycle')(builtin.git_files, builtin.find_files)

