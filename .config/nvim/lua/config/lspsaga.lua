
require 'lspsaga'.init_lsp_saga {
  code_action_icon = '💡',
  code_action_keys = { quit = {'q', '<ESC>'}, exec = '<CR>' },
  code_action_prompt = {
    enable = true,
    sign = true,
    sign_priority = 20,
    virtual_text = false,
  },
  border_style = 2,
}
