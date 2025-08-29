return {
  "folke/snacks.nvim",
  priority = 1001,
  lazy = false,
  opts = {
    layouts = {
      select = {
        preview = false,
        layout = {
          backdrop = false,
          width = 0.6,
          min_width = 80,
          height = 0.4,
          min_height = 10,
          box = "vertical",
          border = "rounded",
          title = "{title}",
          title_pos = "center",
          pane_gap = 1,
          { win = "input",   height = 1,          border = "bottom" },
          { win = "list",    border = "none" },
          { win = "preview", title = "{preview}", width = 0.6,      height = 0.4, border = "top" },
        },
      },
      telescope = {
        reverse = false,
        layout = {
          box = "horizontal",
          backdrop = false,
          width = 0.8,
          height = 0.9,
          border = "none",
          pane_gap = 1,
          {
            box = "vertical",
            pane_gap = 1,
            {
              win = "input",
              height = 1,
              border = "rounded",
              title = "{title} {live} {flags}",
              title_pos = "center",
            },
            { win = "list", title = " Results ", title_pos = "center", border = "rounded" },
          },
          {
            win = "preview",
            title = "{preview:Preview}",
            width = 0.50,
            border = "rounded",
            title_pos = "center",
          },
        },
      },
    },
    image = {
      enabled = true,
      doc = {
        float = true,   -- показывать изображения при наведении курсора
        inline = false, -- не показывать изображения inline
        max_width = 50,
        max_height = 30,
        wo = {
          wrap = false,
        },
      },
      convert = {
        notify = true,
        command = "magick", -- конвертер изображений ImageMagick
      },
      img_dirs = {
        "img",
        "images",
        "assets",
        "static",
        "public",
        "media",
        "attachments",
        "Archives/All-Vault-Images/",
        "~/Library",
        "~/Downloads",
      },
    },
    -- dashboard = {
    -- 	enabled = true,
    -- 	sections = {
    -- 		{ section = "header" },
    -- 		{ section = "keys", gap = 1, padding = 1 },
    -- 		{ section = "startup" },
    -- 		{
    -- 			section = "terminal",
    -- 			cmd = "ascii-image-converter ~/personal/rei.JPG -C -c",
    -- -- 			random = 15,
    -- -- 			pane = 2,
    -- -- 			indent = 8,
    -- -- 			height = 27,
    -- 		},
    -- 	},
    -- },
  },
  keys = {
    -- NOTE: Keymaps
    {
      "<leader>lg",
      function()
        require("snacks").lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gl",
      function()
        require("snacks").lazygit.log()
      end,
      desc = "Lazygit Logs",
    },
    {
      "<leader>rN",
      function()
        require("snacks").rename.rename_file()
      end,
      desc = "Fast Rename Current File",
    },
    {
      "<leader>dB",
      function()
        require("snacks").bufdelete()
      end,
      desc = "Delete or Close Buffer (Confirm)",
    },
    -- Snacks Picker
    {
      "<leader>pf",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find Files (Telescope)",
    },
    -- { "<leader>pf", function() require("snacks").picker.files() end, desc = "Find Files (Snacks Picker)" },
    {
      "<leader>pc",
      function()
        require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
      end,
      desc = "Find Config File",
    },
    {
      "<leader>ps",
      function()
        require("snacks").picker.grep()
      end,
      desc = "Grep word",
    },
    {
      "<leader>pws",
      function()
        require("snacks").picker.grep_word()
      end,
      desc = "Search Visual selection or Word",
      mode = { "n", "x" },
    },
    {
      "<leader>pk",
      function()
        require("snacks").picker.keymaps({ layout = "ivy" })
      end,
      desc = "Search Keymaps (Snacks Picker)",
    },
    -- Git Stuff
    {
      "<leader>gbr",
      function()
        require("snacks").picker.git_branches({ layout = "select" })
      end,
      desc = "Pick and Switch Git Branches",
    },
    -- Other Utils
    {
      "<leader>th",
      function()
        require("snacks").picker.colorschemes({ layout = "ivy" })
      end,
      desc = "Pick Color Schemes",
    },
    {
      "<leader>vh",
      function()
        require("snacks").picker.help()
      end,
      desc = "Help Pages",
    },
  },
}
