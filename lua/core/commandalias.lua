vim.api.nvim_create_user_command('Prettier', ":%!npx prettier --stdin-filepath %", { desc = "Format with prettier" })
