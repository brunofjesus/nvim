vim.api.nvim_create_user_command("Prettier", function()
	local view = vim.fn.winsaveview()
	vim.cmd(":%!npx prettier --stdin-filepath " .. vim.fn.expand("%"))
	vim.fn.winrestview(view)
end, { desc = "Format with prettier" })

vim.api.nvim_create_user_command(
	"AnsibleVaultDecrypt",
	"!ansible-vault decrypt --vault-password-file=~/.vault_pass %",
	{ desc = "Decrypt ansible vault file" }
)
vim.api.nvim_create_user_command(
	"AnsibleVaultEncrypt",
	"!ansible-vault encrypt --vault-password-file=~/.vault_pass %",
	{ desc = "Encrypt ansible vault file" }
)
