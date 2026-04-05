local M = {}

M.gh = function(x) return 'https://github.com/' .. x end
M.augroup = function(name) return vim.api.nvim_create_augroup('kickstart_' .. name, { clear = true }) end
M.map = vim.keymap.set

M.on_install_or_update = function(src, callback)
  vim.api.nvim_create_autocmd('PackChanged', {
    callback = function(event)
      local name, kind = event.data.spec.name, event.data.kind
      if name == src:gsub('.*%/.', '') and (kind == 'install' or kind == 'update') then
        vim.notify('Executing install/update hook for ' .. name)
        callback(event)
      end
    end,
  })
end

return M
