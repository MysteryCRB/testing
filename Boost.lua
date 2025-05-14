_G.cum = true
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage.RemoteEvent

local function fireEvent(args)
    RemoteEvent:FireServer(unpack(args))
end

-- Initial FireServer operation
local args = {
    [1] = {
        [1] = "Psychic",
        [2] = "Psychic3"
    }
}
fireEvent(args)

while _G.cum do
    local args = {
        [1] = {
            [1] = "+PP20"
        }
    }
    fireEvent(args)
    
    -- Using Heartbeat for faster and server-friendly operation
    game:GetService("RunService").Heartbeat:Wait() -- This runs much faster and doesn't affect the server
    
    -- FireServer operation with empty parameters
    args = {
        [1] = {
            [1] = ""
        }
    }
    fireEvent(args)
    
    -- Speed up the operation with task.wait()
    task.wait(0.001) -- Operation speeds up with short wait time
end

if not _G.cum then
    local args = {
        [1] = {
            [1] = "",
            [2] = ""
        }
    }
    fireEvent(args)
end