local win_snapshots = {}
local closed_stack = {}

local function is_real_buffer(buf)
   return vim.bo[buf].buftype == "" and vim.api.nvim_buf_get_name(buf) ~= ""
end

local function snapshot_current_win()
   local buf = vim.api.nvim_get_current_buf()
   local win = vim.api.nvim_get_current_win()
   if is_real_buffer(buf) then
      win_snapshots[win] = vim.api.nvim_buf_get_name(buf)
   else
      win_snapshots[win] = nil
   end
end

local function on_win_closed(event)
   local win_id = tonumber(event.match)
   if not win_snapshots[win_id] then return end
   table.insert(closed_stack, win_snapshots[win_id])
   win_snapshots[win_id] = nil
end

local function resurrect()
   if #closed_stack == 0 then
      vim.notify("Nothing to resurrect", vim.log.levels.INFO)
      return
   end
   vim.cmd("tabnew " .. vim.fn.fnameescape(table.remove(closed_stack)))
end

local group = vim.api.nvim_create_augroup("resurrect", { clear = true })

vim.api.nvim_create_autocmd({ "WinEnter", "BufEnter" }, {
   group = group,
   callback = snapshot_current_win,
})

vim.api.nvim_create_autocmd("WinClosed", {
   group = group,
   callback = on_win_closed,
})

vim.api.nvim_create_user_command(
   "Resurrect",
   resurrect, { desc = "Resurrect last closed window" }
)
