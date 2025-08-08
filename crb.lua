-- SPTS Classic All-In-One Exploit Script (Backup Version)
-- Using Orion UI Library

local OrionLib = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Orion/main/source'))()

local Window = OrionLib:MakeWindow({Name = "SPTS Classic Exploit", HidePremium = false, SaveConfig = true, ConfigFolder = "SPTSConfig"})

-- BT Section (Body Techniques)
local BT_Tab = Window:MakeTab({
	Name = "Body Techniques",
	Icon = "rbxassetid://4483362458",
	PremiumOnly = false
})

-- BT1
BT_Tab:AddToggle({
	Name = "BT1",
	Default = false,
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
	end
})

-- BT2
BT_Tab:AddToggle({
	Name = "BT2",
	Default = false,
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
	end
})

-- BT3
BT_Tab:AddToggle({
	Name = "BT3",
	Default = false,
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
	end
})

-- BT4
BT_Tab:AddToggle({
	Name = "BT4",
	Default = false,
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
	end
})

-- BT5
BT_Tab:AddToggle({
	Name = "BT5",
	Default = false,
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
	end
})

-- BT6
BT_Tab:AddToggle({
	Name = "BT6",
	Default = false,
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
	end
})

-- BT7
BT_Tab:AddToggle({
	Name = "BT7",
	Default = false,
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
	end
})

-- BT8
BT_Tab:AddToggle({
	Name = "BT8",
	Default = false,
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
	end
})

-- BT9
BT_Tab:AddToggle({
	Name = "BT9",
	Default = false,
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
	end
})

-- FS Section (Fist Skills)
local FS_Tab = Window:MakeTab({
	Name = "Fist Skills",
	Icon = "rbxassetid://4483362458",
	PremiumOnly = false
})

-- FS1
FS_Tab:AddToggle({
	Name = "FS1",
	Default = false,
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
	end
})

-- FS2
FS_Tab:AddToggle({
	Name = "FS2",
	Default = false,
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
	end
})

-- FS3
FS_Tab:AddToggle({
	Name = "FS3",
	Default = false,
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
	end
})

-- FS4
FS_Tab:AddToggle({
	Name = "FS4",
	Default = false,
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
	end
})

-- FS5
FS_Tab:AddToggle({
	Name = "FS5",
	Default = false,
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
	end
})

-- FS6
FS_Tab:AddToggle({
	Name = "FS6",
	Default = false,
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
	end
})

-- MS Section (Mind Skills)
local MS_Tab = Window:MakeTab({
	Name = "Mind Skills",
	Icon = "rbxassetid://4483362458",
	PremiumOnly = false
})

-- MS1
MS_Tab:AddToggle({
	Name = "MS1",
	Default = false,
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
	end
})

-- MS2
MS_Tab:AddToggle({
	Name = "MS2",
	Default = false,
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
	end
})

-- MS3
MS_Tab:AddToggle({
	Name = "MS3",
	Default = false,
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
	end
})

-- MS4
MS_Tab:AddToggle({
	Name = "MS4",
	Default = false,
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
	end
})

-- MS5
MS_Tab:AddToggle({
	Name = "MS5",
	Default = false,
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
	end
})

-- PS Section (Psychic Skills)
local PS_Tab = Window:MakeTab({
	Name = "Psychic Skills",
	Icon = "rbxassetid://4483362458",
	PremiumOnly = false
})

-- PS1
PS_Tab:AddToggle({
	Name = "PS1",
	Default = false,
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
	end
})

-- PS2
PS_Tab:AddToggle({
	Name = "PS2",
	Default = false,
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
	end
})

-- PS3
PS_Tab:AddToggle({
	Name = "PS3",
	Default = false,
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
	end
})

-- PS4
PS_Tab:AddToggle({
	Name = "PS4",
	Default = false,
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
	end
})

-- PS5
PS_Tab:AddToggle({
	Name = "PS5",
	Default = false,
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
	end
})

-- Info Tab
local Info_Tab = Window:MakeTab({
	Name = "Info",
	Icon = "rbxassetid://4483362458",
	PremiumOnly = false
})

Info_Tab:AddSection("SPTS Classic All-In-One Exploit")
Info_Tab:AddParagraph("Description", "This script contains all exploit codes organized by category:\n• Body Techniques (BT1-BT9)\n• Fist Skills (FS1-FS6)\n• Mind Skills (MS1-MS5)\n• Psychic Skills (PS1-PS5)")

Info_Tab:AddSection("Instructions")
Info_Tab:AddParagraph("Usage", "1. Select the desired category tab\n2. Toggle the specific ability you want to use\n3. Only one ability can be active at a time\n4. Toggle off to stop the exploit")

Info_Tab:AddSection("Warning")
Info_Tab:AddParagraph("Disclaimer", "Use at your own risk. This is for educational purposes only.")

OrionLib:Init() 
