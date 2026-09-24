-- Digraphs
--- <C-d>Sx -> ¹²³⁴⁵⁶⁷⁸⁹⁰
--- <C-d>sx -> ₁₂₃₄₅₆₇₈₉₀ 
vim.keymap.set("i", "<C-d>", "<C-k>", { remap = false, desc = "Insert Digraph" })

-- Fix/Standardize Superscript Digraphs (S0 - S9)
vim.fn.digraph_set('S0', '⁰')
vim.fn.digraph_set('S1', '¹')
vim.fn.digraph_set('S2', '²')
vim.fn.digraph_set('S3', '³')
vim.fn.digraph_set('S4', '⁴')
vim.fn.digraph_set('S5', '⁵')
vim.fn.digraph_set('S6', '⁶')
vim.fn.digraph_set('S7', '⁷')
vim.fn.digraph_set('S8', '⁸')
vim.fn.digraph_set('S9', '⁹')
-- Fix/Standardize Subscript Digraphs (s0 - s9)
vim.fn.digraph_set('s0', '₀')
vim.fn.digraph_set('s1', '₁')
vim.fn.digraph_set('s2', '₂')
vim.fn.digraph_set('s3', '₃')
vim.fn.digraph_set('s4', '₄')
vim.fn.digraph_set('s5', '₅')
vim.fn.digraph_set('s6', '₆')
vim.fn.digraph_set('s7', '₇')
vim.fn.digraph_set('s8', '₈')
vim.fn.digraph_set('s9', '₉')


