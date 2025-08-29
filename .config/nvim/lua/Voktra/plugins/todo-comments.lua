--[[

 ████████╗ ██████╗ ██████╗  ██████╗      ██████╗ ██████╗ ███╗   ███╗███╗   ███╗███████╗███╗   ██╗████████╗███████╗
 ╚══██╔══╝██╔═══██╗██╔══██╗██╔═══██╗    ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔════╝████╗  ██║╚══██╔══╝██╔════╝
    ██║   ██║   ██║██║  ██║██║   ██║    ██║     ██║   ██║██╔████╔██║██╔████╔██║█████╗  ██╔██╗ ██║   ██║   ███████╗
    ██║   ██║   ██║██║  ██║██║   ██║    ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══╝  ██║╚██╗██║   ██║   ╚════██║
    ██║   ╚██████╔╝██████╔╝╚██████╔╝    ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║███████╗██║ ╚████║   ██║   ███████║
    ╚═╝    ╚═════╝ ╚═════╝  ╚═════╝      ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚══════╝╚═╝  ╚═══╝   ╚═╝   ╚══════╝

    ✅ Highlight, list and search todo comments in your projects

    Examples:

     PERF: fully optimised
     HACK: hmmm, this looks a bit funky
     TODO: What else?
     NOTE: adding a note
     FIX: this needs fixing
     WARNING: ???

--]]

return {
	"folke/todo-comments.nvim",
	event = { "BufReadPost", "BufNewFile" },
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
	},
}
