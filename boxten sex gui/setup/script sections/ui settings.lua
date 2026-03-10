--[[---------------------------------------------------------------------------------------------------------------------------
  __   __     ______     __  __     __     ______     __  __     ______    
 /\ "-.\ \   /\  __ \   /\_\_\_\   /\ \   /\  __ \   /\ \/\ \   /\  ___\   
 \ \ \-.  \  \ \ \/\ \  \/_/\_\/_  \ \ \  \ \ \/\ \  \ \ \_\ \  \ \___  \  
  \ \_\\"\_\  \ \_____\   /\_\/\_\  \ \_\  \ \_____\  \ \_____\  \/\_____\ 
   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/   \/_____/   \/_____/   \/_____/
   
   Made by Team Noxious -- Boxten Sex GUI [Script Information & File sections]
   
---------------------------------------------------------------------------------------------------------------------------]]--

local version = 2

-------------------------------------------------------------------------------------------------------------------------------

-- services & instances
local t, spwn = task.wait, task.spawn
local getmmfromerr = function(userdata, f, test) local ret = nil xpcall(f, function() ret = debug.info(2, "f") end, userdata, nil, 0) if (type(ret) ~= "function") or not test(ret) then return f end return ret end
local randstring = function() local s = "" for i = 1, math.random(8, 15) do if math.random(2) == 2 then s = s .. string.char(math.random(65, 90)) else s = s .. string.char(math.random(97, 122)) end end return s end

local getins = getmmfromerr(game, function(a,b) return a[b] end, function(f) local a = Instance.new("Folder") local b = randstring() a.Name = b return f(a, "Name") == b end)
local FindFirstChildOfClass = getins(game, "FindFirstChildOfClass") 

local ts = FindFirstChildOfClass(game, "TweenService")

local getgenv = getgenv() or _G

local folder = "Bоxten Sеx GUI"
local env = getgenv.BSGUI
local currentversioninfo = env.scriptinfo.script
local olderversioninfo = env.essentials.data.cl.older

-------------------------------------------------------------------------------------------------------------------------------

local section = {
	version = version,

		{ type = "separator", title = "Scaling" },
		{ type = "slider", title = "Mainframe UI scale", desc = "Adjusts the UI sscale of the mainframe.", min = 0.5, max = 2, default = 1, step = 0.1,
			callback = function(value)
				env.gear.general.mainframescale = value
				ts:Create(env.stuf.mainframescale, TweenInfo.new(0.3, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), { Scale = env.gear.general.mainframescale }):Play()
			end
		},
		{ type = "slider", title = "Button UI scale", desc = "Adjusts the UI scale of the buttons.", min = 0.5, max = 2, default = 1, step = 0.1,
			callback = function(value)
				env.gear.general.buttonscale = value
				if env.stuf.setbuttonscale then
					env.stuf.setbuttonscale(value)
				end
			end
		},

		{ type = "separator", title = "Toons" },
		{ type = "toggle", title = "Closed captions", desc = "Enables subtitles for the Toons.", 
			callback = function(state) 
				env.gear.toons.closedcaptions = state
			end
		},
		{ type = "toggle", title = "Alternate Boxten personality", desc = "Changes Boxten's way of speaking and makes him talk like how he actually talks.", 
			callback = function(state) 
				env.gear.toons.nicerboxten = state
			end
		},
		{ type = "button", title = "Switch Boxten with Poppy", desc = "Switches Boxten with Poppy and changes their dialogue.", 
			callback = function() 
			end, 
		},
		{ type = "button", title = "Switch Poppy with Shrimpo", desc = "Switches Poppy with Shrimpo and changes their dialogue.", 
			callback = function() 
			end, 
		},
		{ type = "button", title = "Switch Shrimpo with Boxten", desc = "Switches Shrimpo with Boxten and changes their dialogue.", 
			callback = function() 
			end, 
		},
		{ type = "toggle", title = "Live Poppy reaction", desc = "Allows Poppy to react to your gameplay.", 
			callback = function(state) 
				env.gear.toons.livepoppyreaction = state
			end
		},
		{ type = "toggle", title = "Live Shrimpo reaction", desc = "Allows Shrimpo to react to your gameplay.", 
			callback = function(state) 
				env.gear.toons.liveshrimporeaction = state
			end
		}
}

-------------------------------------------------------------------------------------------------------------------------------

return section

-------------------------------------------------------------------------------------------------------------------------------
