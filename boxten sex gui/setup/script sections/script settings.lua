--[[---------------------------------------------------------------------------------------------------------------------------
  __   __     ______     __  __     __     ______     __  __     ______    
 /\ "-.\ \   /\  __ \   /\_\_\_\   /\ \   /\  __ \   /\ \/\ \   /\  ___\   
 \ \ \-.  \  \ \ \/\ \  \/_/\_\/_  \ \ \  \ \ \/\ \  \ \ \_\ \  \ \___  \  
  \ \_\\"\_\  \ \_____\   /\_\/\_\  \ \_\  \ \_____\  \ \_____\  \/\_____\ 
   \/_/ \/_/   \/_____/   \/_/\/_/   \/_/   \/_____/   \/_____/   \/_____/

   Made by unable | Boxten Sex GUI (Script Settings section)

---------------------------------------------------------------------------------------------------------------------------]]--

local version = 3

-------------------------------------------------------------------------------------------------------------------------------

-- services & instances
local t, spwn = task.wait, task.spawn
local getmmfromerr = function(userdata, f, test) local ret = nil xpcall(f, function() ret = debug.info(2, "f") end, userdata, nil, 0) if (type(ret) ~= "function") or not test(ret) then return f end return ret end
local randstring = function() local s = "" for i = 1, math.random(8, 15) do if math.random(2) == 2 then s = s .. string.char(math.random(65, 90)) else s = s .. string.char(math.random(97, 122)) end end return s end

local getins = getmmfromerr(game, function(a,b) return a[b] end, function(f) local a = Instance.new("Folder") local b = randstring() a.Name = b return f(a, "Name") == b end)
local FindFirstChildOfClass = getins(game, "FindFirstChildOfClass") 

local ts = FindFirstChildOfClass(game, "TweenService")

local getgenv = getgenv() or _G
local queueotp = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)

local folder = "Bоxten Sеx GUI"
local env = getgenv.BSGUI
local currentversioninfo = env.scriptinfo.script
local olderversioninfo = env.essentials.data.cl.older

-------------------------------------------------------------------------------------------------------------------------------

queueconn = nil
function queuescript(state)
	if not queueotp then return end
	if state then
		queueconn = env.stuf.plr.OnTeleport:Connect(function()
			queueotp("")
		end)
	else
		if queueconn then queueconn:Disconnect() queueconn = nil end
	end
end

-------------------------------------------------------------------------------------------------------------------------------

local section = {
	version = version,

  { type = "separator", title = "Script settings" },
  { type = "binder", title = "Toggle interface keybind", desc = "Sets the keybind that will toggle the visibility of the interface.", 
    default = "N",

		callback = function(key)
  		env.gear.general.defaultkeybind = key
		end
  },
  { type = "toggle", title = "Debug mode", desc = "Toggles debug mode. Output visible in the Roblox Developer Console.", 
		default = true,

		callback = function(state) 
  		env.gear.general.debugmode = state
		end
  },
  { type = "toggle", title = "Keep on server switch", desc = "Re-executes the script upon switching experiences.", 

		callback = function(state) 
		env.gear.general.queueteleport = state
  		queuescript(state)
		end
  },
  { type = "toggle", title = "Ignore full Research Twisteds", desc = "Ignores every single Twisted in which you already have full Research on when encountering all Twisteds.", 

		callback = function(state) 
  		env.gear.general.ignoreresearchcompleted = state
		end
  },
  { type = "slider", title = "Item teleport Y offset", desc = "Sets the Y offset of the target item teleport position (In studs).", min = -5, max = 5, default = -2.5, step = 0.5,

		callback = function(value)
  		env.gear.general.itemtpposyoffset = value
		end
  },
  { type = "toggle", title = "Force stop extraction when teleporting to machine", desc = "Forcefully quits machine extraction when teleporting to a random generator.",

		callback = function(state) 
  		env.gear.general.forcequitwhenteleportingtomach = state
		end
  },

  { type = "separator", title = "Blacklists" },
	{ type = "dropdown", title = "Item pick up blacklist", desc = "Blacklists the selected items from being picked up when using \"Pick up all...\" functions.", 
		options = {"Air Horn", "Bandage", "Bonbon", "Bottle o' Pop", "Box o' Chocolates", 
			"Chocolate", "Eject Button", "Extraction Speed Candy", "Event Currency", "Gumballs", 
			"Health Kit", "Jawbreaker", "Jumper Cable", "Pop", "Protein Bar", "Research Capsule", 
			"Skill Check Candy", "Smoke Bomb", "Speed Candy", "Stealth Candy", "Tape"},
		multiselect = true,

		callback = function(selected)
			env.gear.general.itempickupblacklist = selected
		end 
	},
  { type = "dropdown", title = "Twisted encounter blacklist", desc = "Blacklists the selected Twisteds from being encountered.", 
		options = {"Twisted Astro", "Twisted Bassie", "Twisted Blot", "Twisted Bobette", "Twisted Boxten", "Twisted Brightney", "Twisted Brusha",
  		"Twisted Coal", "Twisted Cocoa", "Twisted Connie", "Twisted Cosmo",
  		"Twisted Dandy", "Twisted Dazzle", "Twisted Dyle",
			"Twisted Eggson", "Twisted Eclipse",
			"Twisted Finn", "Twisted Flutter", "Twisted Flyte",
			"Twisted Gigi", "Twisted Ginger", "Twisted Glisten", "Twisted Goob", "Twisted Gourdy",
			"Twisted Looey",
			"Twisted Pebble", "Twisted Poppy",
			"Twisted Razzle", "Twisted Ribecca", "Twisted Rodger", "Twisted Rudie",
			"Twisted Scraps", "Twisted Shelly", "Twisted Shrimpo", "Twisted Soulvester", "Twisted Sprout",
			"Twisted Teagan", "Twisted Tisha", "Twisted Toodles",
			"Twisted Vee",
			"Twisted Yatta"},
		multiselect = true,

		callback = function(selected) 
  		env.gear.general.encountertwistedblacklist = selected
		end 
  }
}

-------------------------------------------------------------------------------------------------------------------------------

return section

-------------------------------------------------------------------------------------------------------------------------------
