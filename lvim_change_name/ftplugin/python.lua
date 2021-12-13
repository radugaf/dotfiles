-- python
-- lvim.lang.python.formatters = {
--   {
--     exe = "black",
--   },
-- }

-- lvim.lang.python.linters = {
--   {
--     exe = "flake8",
--   },
-- }
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup({{exe = "black", filetypes = {"python"} }})

local function get_python_path(workspace)
  local path = require("lspconfig/util").path

  -- Use activated virtualenv.
  if vim.env.VIRTUAL_ENV then
    return path.join(vim.env.VIRTUAL_ENV, "bin", "python")
  end

  -- Find and use virtualenv from pipenv in workspace directory.
  local match = vim.fn.glob(path.join(workspace, "Pipfile"))
  if match ~= "" then
    local venv = vim.fn.trim(vim.fn.system("PIPENV_PIPFILE=" .. match .. " pipenv --venv"))
    return path.join(venv, "bin", "python")
  end

  -- Find and use virtualenv via poetry in workspace directory.
  match = vim.fn.glob(path.join(workspace, "poetry.lock"))
  if match ~= "" then
    local venv = vim.fn.trim(vim.fn.system("poetry env info -p"))
    return path.join(venv, "bin", "python")
  end

  -- Find and use virtualenv in workspace directory.
  for _, pattern in ipairs({ "*", ".*" }) do
    match = vim.fn.glob(path.join(workspace, pattern, "pyvenv.cfg"))
    if match ~= "" then
      if string.find(match, "\n") then
        match = vim.gsplit(match, "\n")()
      end

      return path.join(path.dirname(match), "bin", "python")
    end
  end

  -- !! Add logic for plz.build here !!

  -- Fallback to system Python.
  return vim.fn.exepath("python3") or vim.fn.exepath("python") or "python"
end

local opts = {
  before_init = function(_, config)
    config.settings.python.pythonPath = get_python_path(config.root_dir or vim.fn.getcwd())
  end,
}

-- guard might be unnecessary
if not vim.g.__lsp_python then
  require("lvim.lsp.manager").setup("pyright", opts)
  vim.g.__lsp_python = true
end
