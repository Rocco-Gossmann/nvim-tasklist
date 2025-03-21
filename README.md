# Nvim-TaskList
This plugin aims to make managing your task a bit easier, by providing tools, that make
handling Check-Lists easier.

# Demo
https://github.com/user-attachments/assets/a7a8abde-f96c-4e63-a885-3aa9e69666cf



# Installation
## Lazy.nvim
```lua
{
	"rocco-gossmann/nvim-tasklist",
	init = function()
		require("nvim-tasklist").setup()
	end
}
```
( feel free to add instructions for other Packagemanagers via PR 😉 )

# New Commands
You get 5 new Commands to work with

## `:TaskNew`
Add as Checkbox to the current or highlighted line(s)

## `:TaskReset`
removes the checkbox and added Task-Info from the current or highlighted line(s)

## `:TaskStart`
adds a `@started` timestamp to the current or highlighted line(s)

## `:TaskCancel`
adds a `@canceled` timestamp to the current or highlighted line(s)

## `:TaskDone`
adds a `@canceled` timestamp to the current or highlighted line(s)

# Disclaimer:
To adress the Elephant in the Room.
This plugin is very much inspired by the "Todo+" VSCode-Plugin by @fabiospampinato (https://github.com/fabiospampinato/vscode-todo-plus)
I just like the way he's handling the Checklists, and wanted something similar for NeoVim.
