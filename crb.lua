-- SPTS Classic All-In-One Exploit Script
-- Rayfield UI Implementation

local success, Rayfield = pcall(function()
    return loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()
end)

if not success then
    -- Fallback to alternative UI library
    Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
end

local Window = Rayfield:CreateWindow("SPTS Classic Exploit", "All-In-One Script")

-- BT Section (Body Techniques)
local BT_Tab = Window:CreateTab("Body Techniques", 4483362458)

-- BT1
BT_Tab:CreateToggle({
   Name = "BT1",
   CurrentValue = false,
   Flag = "BT1Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Body",
                    [2] = "Body2"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+BT1"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- BT2
BT_Tab:CreateToggle({
   Name = "BT2",
   CurrentValue = false,
   Flag = "BT2Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Body",
                    [2] = "Body2"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+BT2"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- BT3
BT_Tab:CreateToggle({
   Name = "BT3",
   CurrentValue = false,
   Flag = "BT3Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Body",
                    [2] = "Body2"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+BT3"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- BT4
BT_Tab:CreateToggle({
   Name = "BT4",
   CurrentValue = false,
   Flag = "BT4Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Body",
                    [2] = "Body2"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+BT4"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- BT5
BT_Tab:CreateToggle({
   Name = "BT5",
   CurrentValue = false,
   Flag = "BT5Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Body",
                    [2] = "Body2"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+BT5"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- BT6
BT_Tab:CreateToggle({
   Name = "BT6",
   CurrentValue = false,
   Flag = "BT6Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Body",
                    [2] = "Body2"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+BT6"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- BT7
BT_Tab:CreateToggle({
   Name = "BT7",
   CurrentValue = false,
   Flag = "BT7Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Body",
                    [2] = "Body2"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+BT7"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- BT8
BT_Tab:CreateToggle({
   Name = "BT8",
   CurrentValue = false,
   Flag = "BT8Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Body",
                    [2] = "Body2"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+BT8"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- BT9
BT_Tab:CreateToggle({
   Name = "BT9",
   CurrentValue = false,
   Flag = "BT9Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Body",
                    [2] = "Body2"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+BT9"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- FS Section (Fist Skills)
local FS_Tab = Window:CreateTab("Fist Skills", 4483362458)

-- FS1
FS_Tab:CreateToggle({
   Name = "FS1",
   CurrentValue = false,
   Flag = "FS1Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Fist",
                    [2] = "Fist1"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+FS1"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- FS2
FS_Tab:CreateToggle({
   Name = "FS2",
   CurrentValue = false,
   Flag = "FS2Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Fist",
                    [2] = "Fist1"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+FS2"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- FS3
FS_Tab:CreateToggle({
   Name = "FS3",
   CurrentValue = false,
   Flag = "FS3Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Fist",
                    [2] = "Fist1"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+FS3"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- FS4
FS_Tab:CreateToggle({
   Name = "FS4",
   CurrentValue = false,
   Flag = "FS4Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Fist",
                    [2] = "Fist1"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+FS4"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- FS5
FS_Tab:CreateToggle({
   Name = "FS5",
   CurrentValue = false,
   Flag = "FS5Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Fist",
                    [2] = "Fist1"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+FS5"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- FS6
FS_Tab:CreateToggle({
   Name = "FS6",
   CurrentValue = false,
   Flag = "FS6Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

            local args = {
                [1] = {
                    [1] = "Fist",
                    [2] = "Fist1"
                }
            }
            fireEvent(args)

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+FS6"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- MS Section (Mind Skills)
local MS_Tab = Window:CreateTab("Mind Skills", 4483362458)

-- MS1
MS_Tab:CreateToggle({
   Name = "MS1",
   CurrentValue = false,
   Flag = "MS1Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local args = {
                [1] = {
                    [1] = "Weight",
                    [2] = "Weight4"
                }
            }

            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+MS1"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                wait(1)
                local args = {
                    [1] = {
                        [1] = "+JF1"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                task.wait()
            end
            
            if _G.cum == false then
                local args = {
                    [1] = {
                        [1] = "Weight",
                        [2] = "Unequip"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            end
        end
   end,
})

-- MS2
MS_Tab:CreateToggle({
   Name = "MS2",
   CurrentValue = false,
   Flag = "MS2Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local args = {
                [1] = {
                    [1] = "Weight",
                    [2] = "Weight4"
                }
            }

            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+MS2"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                wait(1)
                local args = {
                    [1] = {
                        [1] = "+JF2"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                task.wait()
            end
            
            if _G.cum == false then
                local args = {
                    [1] = {
                        [1] = "Weight",
                        [2] = "Unequip"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            end
        end
   end,
})

-- MS3
MS_Tab:CreateToggle({
   Name = "MS3",
   CurrentValue = false,
   Flag = "MS3Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local args = {
                [1] = {
                    [1] = "Weight",
                    [2] = "Weight4"
                }
            }

            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+MS3"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                wait(1)
                local args = {
                    [1] = {
                        [1] = "+JF3"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                task.wait()
            end
            
            if _G.cum == false then
                local args = {
                    [1] = {
                        [1] = "Weight",
                        [2] = "Unequip"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            end
        end
   end,
})

-- MS4
MS_Tab:CreateToggle({
   Name = "MS4",
   CurrentValue = false,
   Flag = "MS4Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local args = {
                [1] = {
                    [1] = "Weight",
                    [2] = "Weight4"
                }
            }

            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+MS4"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                wait(1)
                local args = {
                    [1] = {
                        [1] = "+JF4"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                task.wait()
            end
            
            if _G.cum == false then
                local args = {
                    [1] = {
                        [1] = "Weight",
                        [2] = "Unequip"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            end
        end
   end,
})

-- MS5
MS_Tab:CreateToggle({
   Name = "MS5",
   CurrentValue = false,
   Flag = "MS5Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local args = {
                [1] = {
                    [1] = "Weight",
                    [2] = "Weight4"
                }
            }

            game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

            while _G.cum do
                local args = {
                    [1] = {
                        [1] = "+MS5"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                wait(1)
                local args = {
                    [1] = {
                        [1] = "+JF5"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                task.wait()
            end
            
            if _G.cum == false then
                local args = {
                    [1] = {
                        [1] = "Weight",
                        [2] = "Unequip"
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
            end
        end
   end,
})

-- PS Section (Psychic Skills)
local PS_Tab = Window:CreateTab("Psychic Skills", 4483362458)

-- PS1
PS_Tab:CreateToggle({
   Name = "PS1",
   CurrentValue = false,
   Flag = "PS1Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

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
                        [1] = "+PP1"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- PS2
PS_Tab:CreateToggle({
   Name = "PS2",
   CurrentValue = false,
   Flag = "PS2Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

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
                        [1] = "+PP2"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- PS3
PS_Tab:CreateToggle({
   Name = "PS3",
   CurrentValue = false,
   Flag = "PS3Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

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
                        [1] = "+PP3"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- PS4
PS_Tab:CreateToggle({
   Name = "PS4",
   CurrentValue = false,
   Flag = "PS4Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

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
                        [1] = "+PP4"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- PS5
PS_Tab:CreateToggle({
   Name = "PS5",
   CurrentValue = false,
   Flag = "PS5Toggle",
   Callback = function(Value)
        _G.cum = Value
        if Value then
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            local RemoteEvent = ReplicatedStorage.RemoteEvent

            local function fireEvent(args)
                RemoteEvent:FireServer(unpack(args))
            end

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
                        [1] = "+PP5"
                    }
                }
                fireEvent(args)
                game:GetService("RunService").Heartbeat:Wait()
                
                args = {
                    [1] = {
                        [1] = ""
                    }
                }
                fireEvent(args)
                task.wait(1)
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
        end
   end,
})

-- Info Tab
local Info_Tab = Window:CreateTab("Info", 4483362458)

Info_Tab:CreateSection("SPTS Classic All-In-One Exploit")

Info_Tab:CreateLabel("This script contains all exploit codes organized by category:")
Info_Tab:CreateLabel("• Body Techniques (BT1-BT9)")
Info_Tab:CreateLabel("• Fist Skills (FS1-FS6)")
Info_Tab:CreateLabel("• Mind Skills (MS1-MS5)")
Info_Tab:CreateLabel("• Psychic Skills (PS1-PS5)")

Info_Tab:CreateSection("Instructions")
Info_Tab:CreateLabel("1. Select the desired category tab")
Info_Tab:CreateLabel("2. Toggle the specific ability you want to use")
Info_Tab:CreateLabel("3. Only one ability can be active at a time")
Info_Tab:CreateLabel("4. Toggle off to stop the exploit")

Info_Tab:CreateSection("Warning")
Info_Tab:CreateLabel("Use at your own risk. This is for educational purposes only.") 
