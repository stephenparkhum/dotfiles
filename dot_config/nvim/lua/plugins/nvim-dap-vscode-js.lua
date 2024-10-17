return {
	"mxsdev/nvim-dap-vscode-js",
	dependencies = { "mfussenegger/nvim-dap" },
	config = function()
		require("dap-vscode-js").setup({
			adapters = { "pwa-node", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" }, -- which adapters to register in nvim-dap
		})
		for _, language in ipairs({ "typescript", "javascript" }) do
			require("dap").configurations[language] = {
				{
					{
						type = "node-terminal",
						request = "launch",
						command = "npm run dev",
						serverReadyAction = {
							pattern = "started server on .+, url: (https?://.+)",
							uriFormat = "%s",
							action = "debugWithChrome",
						},
						program = "${file}",
						cwd = "${workspaceFolder}",
					},
				},
				{
					{
						type = "pwa-node",
						request = "launch",
						name = "Debug Jest Tests",
						-- trace = true, -- include debugger info
						runtimeExecutable = "node",
						runtimeArgs = {
							"./node_modules/jest/bin/jest.js",
							"--runInBand",
						},
						rootPath = "${workspaceFolder}",
						cwd = "${workspaceFolder}",
						console = "integratedTerminal",
						internalConsoleOptions = "neverOpen",
					},
				},
			}
		end
	end,
}
