vim.opt.spell = true
vim.opt.spelllang = { "en", "pt" }

-- Add word in a specific language
local function add_word_to_lang(lang)
	-- Find word under cursor
	local word = vim.fn.expand("<cword>")
	if word == "" then
		print("No word under cursor.")
		return
	end

	-- Save original language and spellfile
	local original_lang = vim.opt.spelllang:get()
	local original_spellfile = vim.opt.spellfile

	-- Get the current language file
	local spellfile_path = vim.fn.expand(string.format("~/.config/nvim/spell/%s.utf-8.add", lang))

	-- Temporarily set spelllang to only the desired language
	vim.opt.spelllang = { lang }
	vim.opt.spellfile = spellfile_path

	-- Mark word as good and save spellfile
	vim.cmd("silent! spellgood " .. word)
	vim.cmd("silent! mkspell! " .. spellfile_path)

	-- Restore original settings
	vim.opt.spelllang = original_lang
	vim.opt.spellfile = original_spellfile

	print("Added '" .. word .. "' to " .. lang)
end

local function remove_word_from_lang(lang)
	local word = vim.fn.expand("<cword>")
	if word == "" then
		print("No word under cursor.")
		return
	end

	local original_lang = vim.opt.spelllang:get()
	local original_spellfile = vim.opt.spellfile

	local spellfile_path = vim.fn.expand(string.format("~/.config/nvim/spell/%s.utf-8.add", lang))

	vim.opt.spelllang = { lang }
	vim.opt.spellfile = spellfile_path

	vim.cmd("silent! spellundo " .. word)
	vim.cmd("silent! mkspell! " .. spellfile_path)

	vim.opt.spelllang = original_lang
	vim.opt.spellfile = original_spellfile

	print("Removed '" .. word .. "' from " .. lang)
end

vim.keymap.set("n", "zge", function () add_word_to_lang("en") end, { desc = "Add word to English" })
vim.keymap.set("n", "zgp", function () add_word_to_lang("pt") end, { desc = "Add word to Portuguese" })
vim.keymap.set("n", "zue", function () remove_word_from_lang("en") end, { desc = "Remove word from English" })
vim.keymap.set("n", "zup", function () remove_word_from_lang("pt") end, { desc = "Remove word from Portuguese" })
