local util = require("vim.lsp.util")
local original_apply_text_edits = util.apply_text_edits
util.apply_text_edits = function(text_edits, bufnr, position_encoding, change_annotations)
  local pyright = vim.lsp.get_clients({ bufnr = bufnr, name = "pyright" })[1]

  for _, edit in ipairs(text_edits or {}) do
    if pyright and edit.annotationId then
      edit.annotationId = nil
    end
  end

  return original_apply_text_edits(text_edits, bufnr, position_encoding, change_annotations)
end
