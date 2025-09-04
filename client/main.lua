local hasRewards = false

local function giveRewards()
    if hasRewards then return end
    TriggerServerEvent('fly_tiktok:giveRewards')
    hasRewards = true
end

local function showNotification(msg)
    if fly.Notifications.type == "a_hud" then
        TriggerEvent('a_hud::AddNotification', msg)
    end
end

RegisterNetEvent('fly_tiktok:Rewards')
AddEventHandler('fly_tiktok:Rewards', function()
    giveRewards()
end)

RegisterNetEvent('fly_tiktok:notify')
AddEventHandler('fly_tiktok:notify', function()
    showNotification(fly.Notifications.success.message)
end)

RegisterCommand(fly.Command.name, function()
    giveRewards()
end, false)
