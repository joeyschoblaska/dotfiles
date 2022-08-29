-- https://github.com/wyne/awesome-hammerspoon
hs.loadSpoon("AppBindings")

local function pressFn(mods, key)
	if key == nil then
		key = mods
		mods = {}
	end

	return function()
		hs.eventtap.keyStroke(mods, key, 1000)
	end
end

local function tmuxTab()
	hs.eventtap.keyStroke({ "ctrl" }, "a", 1000)
	hs.eventtap.keyStroke({}, "o", 1000)
end

local function remap(mods, key, pressFn)
	hs.hotkey.bind(mods, key, pressFn, nil, pressFn)
end

remap({ "ctrl", "alt" }, "h", pressFn("left"))
remap({ "ctrl", "alt" }, "j", pressFn("down"))
remap({ "ctrl", "alt" }, "k", pressFn("up"))
remap({ "ctrl", "alt" }, "l", pressFn("right"))
remap({ "ctrl", "alt" }, "space", tmuxTab)

-- to prevent 1Password's global shortcut from hijacking other apps
-- set 1Password shortcut to cmd + ctrl + alt + p
spoon.AppBindings:bind("Google Chrome", {
	{ { "cmd" }, "\\", { "cmd", "ctrl", "alt" }, "p" },
})
