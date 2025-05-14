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
    -- Send commands with optimized pattern
    for i = 1, 30 do  -- Increased from 15 to 30 commands per loop
        local args = {
            [1] = {
                [1] = "+PP19"
            }
        }
        RemoteEvent:FireServer(unpack(args))
    end
    
    -- Minimal delay to maintain natural appearance
    task.wait(0.001)  -- Reduced delay for faster operation
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
