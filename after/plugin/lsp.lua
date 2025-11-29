local require_ok, mason = pcall(require, "mason")
if not require_ok then return end

local mason_lspconfig = require("mason-lspconfig")
local lspconfig = require("lspconfig")
local cmp = require("cmp")
local cmp_lsp = require("cmp_nvim_lsp")

-- 1. Setup Mason
mason.setup()

-- 2. Setup Mason-LSPConfig
-- "automatic_enable = true" tells it to call vim.lsp.enable() for you!
mason_lspconfig.setup({
    ensure_installed = {
        "lua_ls",
        "clangd",
        "pyright",
    },
    automatic_enable = true, 
})

-- 3. Define Capabilities (for Autocompletion)
local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    cmp_lsp.default_capabilities()
)

-- 4. Apply Configurations Natively (The 0.11 Way)
-- We loop through installed servers to apply capabilities and custom settings
for _, server in ipairs(mason_lspconfig.get_installed_servers()) do
    local config = {
        capabilities = capabilities,
    }

    -- Custom Settings for specific servers
    if server == "lua_ls" then
        config.settings = {
            Lua = {
                diagnostics = {
                    globals = { "vim" }
                }
            }
        }
    end

    -- Apply the config directly to Neovim
    -- Note: We don't call .setup() anymore!
    vim.lsp.config(server, config)
end

-- 5. Setup Autocompletion (UI)
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-p>'] = cmp.mapping.select_prev_item(),
        ['<C-n>'] = cmp.mapping.select_next_item(),
        ['<C-y>'] = cmp.mapping.confirm({ select = true }),
        ['<C-Space>'] = cmp.mapping.complete(),
    }),
    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }, {
        { name = 'buffer' },
    })
})
-- 6. Setup LSP Keybinds (The "LspAttach" event)
-- This function runs every time an LSP connects to a buffer
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = {buffer = event.buf}

        -- Navigate Code
        vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
        vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
        vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
        vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
        vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
        vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
        vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
        vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
        vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
        vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
    end,
})
