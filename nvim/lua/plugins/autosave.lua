return {
  "pocco81/auto-save.nvim",
  config = function()
    require("auto-save").setup({
      enabled = true, -- Habilita o autosave no início
      execution_message = {
        message = function() -- Mensagem que aparece ao salvar
          return ("AutoSave: salvo às " .. vim.fn.strftime("%H:%M:%S"))
        end,
        dim = 0.18, -- Intensidade da cor da mensagem
        cleaning_interval = 1000, -- Tempo (ms) para limpar a mensagem
      },
      trigger_events = { "InsertLeave", "TextChanged" }, -- Eventos que disparam o save
      -- Condições para NÃO salvar (ex: buffers especiais)
      condition = function(buf)
        local fn = vim.fn
        local utils = require("auto-save.utils.data")

        if fn.getbufvar(buf, "&modifiable") == 1 and utils.not_in(fn.getbufvar(buf, "&filetype"), {}) then
          return true -- Se for modificável, salva
        end
        return false -- Não salva se não puder modificar
      end,
      write_all_buffers = false, -- Salva apenas o buffer atual
      debounce_delay = 135, -- Delay para evitar salvar a cada tecla (ms)
    })
  end,
}
