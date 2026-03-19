--[[---------------------------------------------------------------------------------------------------------------------------
    ______                        _   __           _                 
   /_  __/__  ____ _____ ___     / | / /___  _  __(_)___  __  _______
    / / / _ \/ __ `/ __ `__ \   /  |/ / __ \| |/_/ / __ \/ / / / ___/
   / / /  __/ /_/ / / / / / /  / /|  / /_/ />  </ / /_/ / /_/ (__  ) 
  /_/  \___/\__,_/_/ /_/ /_/  /_/ |_/\____/_/|_/_/\____/\__,_/____/  

  Made by unable | Boxten Sex GUI (Changelogs section)
   
---------------------------------------------------------------------------------------------------------------------------]]--

local version = 4

-------------------------------------------------------------------------------------------------------------------------------

-- services & instances
local getgenv = getgenv() or _G

local folder = "Bоxten Sеx GUI"
local env = getgenv.BSGUI
local currentversioninfo = env.scriptinfo.script
local olderversioninfo = env.essentials.data.cl.older

-------------------------------------------------------------------------------------------------------------------------------

local section = {
	version = version,

  { type = "separator", title = "Current version" },
  { type = "label", title = "Version " .. currentversioninfo.version, desc = "Sub-version: " .. currentversioninfo.subversion .. ". Last updated: " .. currentversioninfo.lastupdated, content = currentversioninfo.changelog },

  { type = "separator", title = "Older versions" },
  { type = "label", title = "Version " .. olderversioninfo["1.2.9"].version, desc = "Sub-versions: " .. olderversioninfo["1.2.9"].subversions .. ". Final release: " .. olderversioninfo["1.2.9"].finaldate, content = olderversioninfo["1.2.9"].changelog },
}

-------------------------------------------------------------------------------------------------------------------------------

return section

-------------------------------------------------------------------------------------------------------------------------------