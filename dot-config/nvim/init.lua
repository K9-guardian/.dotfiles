function ReloadConfig()
   for name, _ in pairs(package.loaded) do
      if name:match('^k9guardian') then
         package.loaded[name] = nil
      end
   end

   dofile(vim.env.MYVIMRC)
end

require("k9guardian.settings")
require("k9guardian.keymaps")
require("k9guardian.autocmds")
require("k9guardian.plugins")
-- require("k9guardian.lazy")
