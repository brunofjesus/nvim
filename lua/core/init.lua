require("core.keymaps")
require("core.filetypes")
require("core.options")
require("core.saveactions")
require("core.neovide")
require("core.commandalias")
require("core.github_workflow_picker")
require("core.theme_switch")
require("core.folds")

-- zellij does not support dynamic color scheme changes
-- with osc11, so we enable this theme_watcher that
-- looks at the value on the theme.txt file
local in_zellij = vim.env.ZELLIJ ~= nil
if in_zellij then
  require("core.theme_watcher").setup()
end
