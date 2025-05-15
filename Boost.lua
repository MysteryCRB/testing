_G.cum = true
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage.RemoteEvent

-- Initial setup for Psychic power
local args = {
    [1] = {
        [1] = "Psychic",
        [2] = "Psychic3"
    }
}
RemoteEvent:FireServer(unpack(args))

-- Main loop for power boosting
while _G.cum do
    -- Send multiple commands per loop for moderate speed
    for i = 1, 5 do  -- Sends 5 commands per loop
        local args = {
            [1] = {
                [1] = "+PP19"
            }
        }
        RemoteEvent:FireServer(unpack(args))
    end
    
    -- Moderate delay to prevent kicks
    task.wait(0.1)  -- 100ms delay
end

-- Cleanup when stopped
if not _G.cum then
    local args = {
        [1] = {
            [1] = "",
            [2] = ""
        }
    }
    RemoteEvent:FireServer(unpack(args))
end
