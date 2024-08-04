require "user.set"
require "user.remap"
require "user.lazy_init"

vim.filetype.add({
  pattern = {
    ['.*%.blade%.php'] = 'blade',
  },
})
