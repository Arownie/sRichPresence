local APP_ID = '1055054296200261674'
local IMAGE_1 = 'logo.png'
local IMAGE_2 = 'logo.png'
local prevPlayerCount, prevAssetText = nil, nil

Citizen.CreateThread(function()
  while true do
    Citizen.Wait(1000)

    local player = PlayerId()
    local name = GetPlayerName(player)
    local id = GetPlayerServerId(player)

    SetDiscordAppId(APP_ID)
    SetDiscordRichPresenceAsset(IMAGE_1)
    SetDiscordRichPresenceAssetSmall(IMAGE_2)

    if NetworkIsPlayerActive(player) then
      local activePlayers = GetActivePlayers()
      local playerCount = #activePlayers

      if playerCount ~= prevPlayerCount then
        SetRichPresence("Nom: " .. name .. " | ID: " .. id .. " | Joueurs: " .. playerCount)
        prevPlayerCount = playerCount
      end

      if prevAssetText ~= 'discord.gg/GmRBujJB45' then
        SetDiscordRichPresenceAssetText('discord.gg/GmRBujJB45')
        prevAssetText = 'discord.gg/GmRBujJB45'
      end
      
      SetDiscordRichPresenceAction(0, "Discord!", "https://discord.gg/GmRBujJB45")
      SetDiscordRichPresenceAction(1, "FiveM!", "fivem://connect/136.243.169.154:30507")
    end
  end
end)
