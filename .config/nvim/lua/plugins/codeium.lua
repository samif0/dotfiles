return {
  {
    "Exafunction/codeium.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "hrsh7th/nvim-cmp",
    },
    config = function()
      require("codeium").setup({})
      
      -- Add codeium source to nvim-cmp
      local cmp = require("cmp")
      
      -- Get your existing cmp config
      local cmp_config = cmp.get_config()
      
      -- Add codeium to the sources
      table.insert(cmp_config.sources, {
        name = "codeium",
        priority = 2000,
        group_index = 1,
      })
      
      -- Apply the updated configuration
      cmp.setup(cmp_config)
      
      -- Set up keymaps (optional but recommended)
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true })
      vim.keymap.set('i', '<c-;>', function() return vim.fn['codeium#CycleNext']() end, { expr = true })
      vim.keymap.set('i', '<c-,>', function() return vim.fn['codeium#CyclePrev']() end, { expr = true })
      vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true })
    end
  },
  
  -- Make sure we have codeium binaries
  {
    "Exafunction/codeium.vim",
    event = 'BufEnter'
  },
}