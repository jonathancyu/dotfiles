return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  opts = {
    scroll = { enabled = false },
    notifier = { enabled = true },
    rename = { enabled = true },
    indent = { enabled = false, chunk = { only_scope = true, only_current = true } },
    image = { enabled = false },
    scratch = {
      enabled = true,
      win = {
        width = 0.6,
        height = 0.6,
        bo = { buftype = "", buflisted = false, bufhidden = "hide", swapfile = false },
        minimal = false,
        noautocmd = false,
        -- position = "right",
        zindex = 20,
        wo = { winhighlight = "NormalFloat:Normal" },
        border = "rounded",
        title_pos = "center",
        footer_pos = "center",
      },
    },
    statuscolumn = {
      enabled = true,
      left = {
        "sign", -- neotest signs, dapui breakpoints
        "fold",
        "mark", -- vim marks
      },
      right = {
        "git",
      },
      folds = {
        open = false, -- Don't show symbol for folds that aren't closed
        git_hl = true, -- TODO: what does this do?
      },
    },
    styles = {
      zen = {
        width = 150,
        backdrop = {
          transparent = true,
          blend = 40,
        },
        keys = {
          q = "close",
        },
      },
    },
    words = { enabled = true, debounce = 100, notify_jump = true },
    zen = { enabled = true, toggles = { dim = false } },
  },

	-- stylua: ignore
	keys = {
		{ '<leader>ns', function() Snacks.notifier.show_history() end, desc = '[N]otification [S]ummary' },
		{ '<leader>nc', function() Snacks.notifier.hide() end, desc = '[C]lear Notifications' },
		{ '<leader>S', function() Snacks.scratch.select() end, desc = 'Select Scratch Buffer' },
		{ '[k', function() Snacks.words.jump(-1) end, mode = { 'n' }, desc = 'Previous reference' },
		{ ']k', function() Snacks.words.jump(1) end, desc = 'Next reference' },
    -- Picker
    -- Diable <leaaer>f*
    { "<leader>fb", false },
    { "<leader>fB", false },
    { "<leader>fc", false },
    { "<leader>fC", false },
    { "<leader>fe", false },
    { "<leader>fE", false },
    { "<leader>ff", false },
    { "<leader>fF", false },
    { "<leader>fg", false },
    { "<leader>fn", false },
    { "<leader>fr", false },
    { "<leader>fR", false },
    { "<leader>fp", false },
    { "<leader>fP", false },
    { "<leader>ft", false },
    { "<leader>fT", false },
    { "<leader>sf", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
    { "<leader>sF", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },
    { "<leader>sg", function() Snacks.picker.git_files() end, desc = "Find Files (git-files)" },
    { "<leader>sp", LazyVim.pick("oldfiles"), desc = "Previous" },
    { "<leader>sP", function() Snacks.picker.recent({ filter = { cwd = true } }) end, desc = "Previous (cwd)" },
  },
}
