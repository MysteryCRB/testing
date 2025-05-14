_G.cum = true
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage.RemoteEvent

-- Initial setup for Fist strength
local args = {
    [1] = {
        [1] = "Fist",
        [2] = "Fist1"
    }
}
RemoteEvent:FireServer(unpack(args))

-- Main loop for strength boosting
while _G.cum do
    -- Send multiple commands per loop for maximum speed
    for i = 1, 25 do  -- Sends 25 commands per loop
        local args = {
            [1] = {
                [1] = "+FS20"
            }
        }
        RemoteEvent:FireServer(unpack(args))
    end
    
    -- Minimal delay for maximum speed
    task.wait(0.00001)  -- Almost instant delay
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