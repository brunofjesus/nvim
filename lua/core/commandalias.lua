vim.api.nvim_create_user_command('Prettier', ":%!npx prettier --stdin-filepath %", { desc = "Format with prettier" })
vim.api.nvim_create_user_command('AnsibleVaultDecrypt', "!ansible-vault decrypt --vault-password-file=~/.vault_pass %", { desc = "Decrypt ansible vault file" })
vim.api.nvim_create_user_command('AnsibleVaultEncrypt', "!ansible-vault encrypt --vault-password-file=~/.vault_pass %", { desc = "Encrypt ansible vault file" })
