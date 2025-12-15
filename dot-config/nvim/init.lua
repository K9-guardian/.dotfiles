-- Source - https://stackoverflow.com/a
-- Posted by Yanis.F
-- Retrieved 2025-12-15, License - CC BY-SA 4.0

--- Reload the entire configuration
function ReloadConfig()
   -- Reload k9guardian/ directory
   for name, _ in pairs(package.loaded) do
      if name:match('^k9guardian') then
         package.loaded[name] = nil
      end
   end

   dofile(vim.env.MYVIMRC)

   -- Reload after/ directory
   local glob = vim.fn.stdpath('config') .. '/after/**/*.lua'
   local after_lua_filepaths = vim.fn.glob(glob, true, true)
   for _, filepath in ipairs(after_lua_filepaths) do
      dofile(filepath)
   end

   vim.notify("Nvim configuration reloaded!", vim.log.levels.INFO)
end

require("k9guardian.settings")
require("k9guardian.keymaps")
require("k9guardian.autocmds")
require("k9guardian.plugins")
