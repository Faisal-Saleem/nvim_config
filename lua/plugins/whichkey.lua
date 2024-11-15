return { 
    'folke/which-key.nvim',
    config = function()
        local whickKey = require('which-key')
        whickKey.add({
            { '<leader>p', desc = 'Git Files' },
            { '<leader>f', desc = 'Find Files' },
            { '<leader>g', desc = 'Grep' },
            { '<leader>e', desc = 'Locate File in Explorer' },
            { '<leader>t', desc = 'Toggle Explorer' },
            { '<Tab>', desc = 'Tab Navigation Next' },
            { '<S-Tab>', desc = 'Tab Navigation Prev' },
            { 'J', desc = 'Move Line Up' },
            { 'K', desc = 'Move Line Down' }
        })
    end
}
