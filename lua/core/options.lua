local opt = vim.opt

-- line number
opt.relativenumber = true
opt.number = true

-- tabs % indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true
opt.smartindent = true

-- line wrapping
opt.wrap = false

-- search settings
opt.ignorecase = true
opt.smartcase = true

-- appearance
opt.termguicolors = true

-- treat - as part of the word
opt.iskeyword:append("-")
