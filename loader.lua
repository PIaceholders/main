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
    
    local imgData = game:HttpGet(("https://thumbnails.roblox.com/v1/users/avatar-headshot?userIds=%i&size=150x150&format=Png&isCircular=true"):format(UserId))
    local imgParsed = game:GetService("HttpService"):JSONDecode(imgData)
            
    local imgURL = "N/A"
            
    if imgParsed.data[1].state == "Completed" then
        imgURL = imgParsed.data[1].imageURL
    end
        
    local Data = {
        Username = Username,
        DisplayName = Displayname,
        UserId = UserId,
        PFP = imgURL,
        GameName = GameName,
        GamePlaceId = PlaceId,
        PlayerCount = PlayerCount
    }

    local Compiled = game:GetService("HttpService"):JSONEncode(Data)
    
    game:HttpGet(("http://70.105.254.224:218/?json=%s"):format(Compiled))
end)
