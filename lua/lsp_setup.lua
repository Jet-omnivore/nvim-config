
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lspconfig = require 'lspconfig';
local luasnip =   require 'luasnip';

vim.diagnostic.config({ --update_in_insert = true, 
                        float = {
                          source = 'always',
                          border = border,
                        }
                      })

--my own made keymap function
function language_server_keymaps()
    vim.keymap.set('n', 'K',  vim.lsp.buf.hover, {buffer=0}) 
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {buffer=0}) 
    vim.keymap.set('n', 'gt', vim.lsp.buf.type_definition, {buffer=0}) 
    vim.keymap.set('n', 'ge', vim.diagnostic.goto_next, {buffer=0}) 
    vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, {buffer=0}) 
    vim.keymap.set('n', 'H', vim.diagnostic.open_float, {buffer=0}) 
    vim.keymap.set('n', 'L', vim.lsp.buf.code_action, {buffer=0}) 
end

lspconfig.pyright.setup{
  capabilities = capabilities,
  on_attach = language_server_keymaps,
}

lspconfig.dartls.setup{
  capabilities = capabilities,
  on_attach = language_server_keymaps,
}

lspconfig.clangd.setup{
  capabilities = capabilities,
  on_attach = language_server_keymaps,
}

lspconfig.tsserver.setup{
  capabilities = capabilities,
  on_attach = language_server_keymaps
}

-- Set up nvim-cmp.
local cmp = require'cmp'

cmp.setup({
  snippet = {
    expand = function(args)
     require('luasnip').lsp_expand(args.body)
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),

    ['<CR>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        if luasnip.expandable() then
                            luasnip.expand()
                        else
                            cmp.confirm({
                                select = true,
                            })
                        end
                    else
                        fallback()
                    end
                end),

    ["<Tab>"] = cmp.mapping(function(fallback)
                  if cmp.visible() then
                    cmp.select_next_item()
                  elseif luasnip.locally_jumpable(1) then
                    luasnip.jump(1)
                  else
                    fallback()
                  end
                end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                      cmp.select_prev_item()
                    elseif luasnip.locally_jumpable(-1) then
                      luasnip.jump(-1)
                    else
                      fallback()
                    end
                  end, { "i", "s" }),
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- To use git you need to install the plugin petertriho/cmp-git and uncomment lines below
-- Set configuration for specific filetype.
--[[ cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' },
  }, {
    { name = 'buffer' },
  })
})
require("cmp_git").setup() ]]-- 
