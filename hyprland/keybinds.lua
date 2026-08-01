-- settings app (end4-pC)
hl.bind("SUPER + I", hl.dsp.global("quickshell:settingsToggle"), { description = "App: Settings" })

-- tmux launch
hl.bind("SUPER + ALT + Return", hl.dsp.exec_cmd("kitty -e tmux new-session -A -s 0"), { description = "App: Tmux" })

-- toggle window transparency
hl.bind(
	"SUPER + Backspace",
	hl.dsp.window.set_prop({ prop = "opaque", value = "toggle" }),
	{ description = "Window: Toggle transparency" }
)

-- Send to workspace: SUPER + SHIFT + number
for i = 1, 10 do
	hl.bind("SUPER + SHIFT + " .. (i % 10), function()
		hl.dispatch(hl.dsp.window.move({ workspace = workspace_in_group(i), follow = false }))
	end, { description = "Window: Send to workspace " .. i })
end
-- keypad numbers
for i = 1, 10 do
	local numpadkey = { 87, 88, 89, 83, 84, 85, 79, 80, 81, 90 }
	hl.bind("SUPER + SHIFT + code:" .. numpadkey[i], function()
		hl.dispatch(hl.dsp.window.move({ workspace = workspace_in_group(i), follow = false }))
	end)
end
