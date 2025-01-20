-- Function to check if a tab with a given name exists
local function tab_with_name_exists(name)
  local tabs = vim.api.nvim_list_tabpages()
  for _, tab in ipairs(tabs) do
    local tabinfo = vim.fn.gettabinfo(tab)[1]
    if tabinfo.variables and tabinfo.variables.name == name then
      return true
    end
  end
  return false
end

local function setup_tabs()
  if not tab_with_name_exists("Code") then
    vim.fn.settabvar(1, 'name', 'Code')
  end

  if not tab_with_name_exists("Terminal") then
    local is_single_tab = vim.fn.tabpagenr('$') == 1
    if is_single_tab then
      vim.cmd('tabnew')
      vim.cmd('term') -- Open a terminal in the "Terminal" tab
    end
    vim.fn.settabvar(2, 'name', 'Terminal')
  end

  vim.cmd('tabfirst')
end

vim.api.nvim_create_user_command('SetupTabs', setup_tabs, { desc = "Setup tabs for Code and Terminal" })
