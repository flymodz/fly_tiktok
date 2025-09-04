ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('fly_tiktok:giveRewards')
AddEventHandler('fly_tiktok:giveRewards', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    exports.oxmysql:single('SELECT claimed FROM tiktok_rewards WHERE identifier = ?', { xPlayer.identifier }, function(result)
        if result and result.claimed then
            TriggerClientEvent('fly_tiktok:notify', src, 'Du hast deine TikTok-Belohnungen bereits eingelöst!')
            return
        end

        for _, veh in pairs(fly.Rewards.vehicles) do
            local plate = GeneratePlate()
            local vehicleProps = {
                model = veh.model,
                plate = plate,
                stored = 1
            }

            exports.oxmysql:insert('INSERT INTO owned_vehicles (owner, plate, vehicle, type, stored) VALUES (?, ?, ?, ?, ?)', {
                xPlayer.identifier,
                plate,
                json.encode(vehicleProps),
                'car',
                1
            })
        end

        for _, item in pairs(fly.Rewards.items) do
            xPlayer.addInventoryItem(item.name, item.amount)
        end

        exports.oxmysql:insert('INSERT INTO tiktok_rewards (identifier, claimed) VALUES (?, ?)', {
            xPlayer.identifier,
            true
        })

        TriggerClientEvent('fly_tiktok:notify', src)
    end)
end)

function GeneratePlate()
    local plate = ""
    local charset = "ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

    for i = 1, 8 do
        plate = plate .. charset:sub(math.random(1, #charset), math.random(1, #charset))
    end

    return plate
end
-- BEI FEHLER AUF DISCORD MELDEN. USER: flymodzreal