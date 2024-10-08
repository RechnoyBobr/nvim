return {
    "telescope.nvim",
    dependencies = {
        "nvim-telescope/telescope-file-browser.nvim",
        "nvim-telescope/telescope-project.nvim",
    },
    keys = {
        {
            "\\P",
            function()
                require("telescope.builtin").find_files({
                    cwd = require("lazy.core.config").options.root,
                })
            end,
            desc = "Find Plugin File",
        },
        {
            "\\f",
            desc = "Telescope find files",
            function()
                local builtin = require("telescope.builtin")
                builtin.find_files({
                    no_ignore = false,
                    hidden = true,
                })
            end,
        },
        {
            "\\r",
            desc = "live grep",
            function()
                local builtin = require("telescope.builtin")
                builtin.live_grep()
            end,
        },
        {
            "\\\\",
            desc = "Telescope buffers",
            function()
                local builtin = require("telescope.builtin")
                builtin.buffers()
            end,
        },
        {
            "\\t",
            desc = "Open help tags",
            function()
                local builtin = require("telescope.builtin")
                builtin.help_tags()
            end,
        },
        {
            "\\[",
            desc = "Telescope resume",
            function()
                local builtin = require("telescope.builtin")
                builtin.resume()
            end,
        },
        {
            "\\e",
            desc = "Telescope diagnostic",
            function()
                local builtin = require("telescope.builtin")
                builtin.diagnostics()
            end,
        },
        {
            "\\s",
            desc = "Telescope treesitter",
            function()
                local builtin = require("telescope.builtin")
                builtin.treesitter()
            end,
        },
        {
            "\\f",
            function()
                local telescope = require("telescope")
                local function telescope_buffer_dir()
                    return vim.fn.expand("%:p:h")
                end
                telescope.extensions.file_browser.file_browser({
                    path = "%:p:h",
                    cwd = telescope_buffer_dir(),
                    respect_gitignore = false,
                    hidden = true,
                    grouped = true,
                    previewer = false,
                    initial_mode = "normal",
                    layout_config = { height = 40 },
                })
            end,
        },
    },
    config = function(_, opts)
        local telescope = require("telescope")
        local actions = require("telescope.actions")
        local fb_actions = require("telescope").extensions.file_browser.actions
        opts.defaults = vim.tbl_deep_extend("force", opts.defaults, {
            wrap_results = true,
            layout_strategy = "horizontal",
            layout_config = { prompt_position = "top" },
            sorting_strategy = "ascending",
            winblend = 0,
            mappings = {
                n = {},
            },
        })
        opts.pickers = {
            diagnostics = {
                theme = "ivy",
                initial_mode = "normal",
                layout_config = {
                    preview_cutoff = 9999,
                },
            },
        }
        local project_actions = require("telescope._extensions.project.actions")
        opts.extensions = {
            project = {
                base_dirs = {
                    "~/OS-course/",
                    "~/.config/nvim/",
                    "~/hse-cpp-course/",
                    "~/backend_academy_2024_project_1-java-RechnoyBobr/",
                },
                hidden_files = true,
                theme = "dropdown",
                sync_with_nvim_tree = true,
            },
            theme = "dropdown",
            hijack_netrw = true,
            mappings = {
                ["n"] = {
                    ["N"] = fb_actions.create,
                    ["h"] = fb_actions.goto_parent_dir,
                    ["/"] = function()
                        vim.cmd("startinsert")
                    end,
                    ["<C-u>"] = function(prompt_bufnr)
                        for i = 1, 10 do
                            actions.move_selection_previous(prompt_bufnr)
                        end
                    end,
                    ["<C-d>"] = function(prompt_bufnr)
                        for i = 1, 10 do
                            actions.move_selection_next(prompt_bufnr)
                        end
                    end,
                    ["PageUp"] = actions.preview_scrolling_up,
                    ["PageDown"] = actions.preview_scrolling_down,
                },
            },
        }
        telescope.setup(opts)
        require("telescope").load_extension("fzf")
        require("telescope").load_extension("file_browser")
    end,
}
