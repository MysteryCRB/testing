-- SPTS Classic All-In-One Exploit Script
-- Local Lua UI Implementation (No External Dependencies)

local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local playerGui = player:WaitForChild("PlayerGui")

-- Create main GUI
local screenGui = Instance.new("ScreenGui")
screenGui.Name = "SPTSExploitGUI"
screenGui.Parent = playerGui

-- Create main frame
local mainFrame = Instance.new("Frame")
mainFrame.Name = "MainFrame"
mainFrame.Size = UDim2.new(0, 400, 0, 500)
mainFrame.Position = UDim2.new(0.5, -200, 0.5, -250)
mainFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
mainFrame.BorderSizePixel = 0
mainFrame.Parent = screenGui

-- Make frame draggable
local dragging
local dragInput
local dragStart
local startPos

local function updateInput(input)
    local delta = input.Position - dragStart
    local position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
    mainFrame.Position = position
end

mainFrame.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = mainFrame.Position
        
        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

mainFrame.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        updateInput(input)
    end
end)

-- Create title
local titleLabel = Instance.new("TextLabel")
titleLabel.Name = "TitleLabel"
titleLabel.Size = UDim2.new(1, 0, 0, 40)
titleLabel.Position = UDim2.new(0, 0, 0, 0)
titleLabel.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
titleLabel.BorderSizePixel = 0
titleLabel.Text = "SPTS Classic Exploit"
titleLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
titleLabel.TextScaled = true
titleLabel.Font = Enum.Font.SourceSansBold
titleLabel.Parent = mainFrame

-- Create close button
local closeButton = Instance.new("TextButton")
closeButton.Name = "CloseButton"
closeButton.Size = UDim2.new(0, 30, 0, 30)
closeButton.Position = UDim2.new(1, -35, 0, 5)
closeButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
closeButton.BorderSizePixel = 0
closeButton.Text = "X"
closeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
closeButton.TextScaled = true
closeButton.Font = Enum.Font.SourceSansBold
closeButton.Parent = mainFrame

closeButton.MouseButton1Click:Connect(function()
    screenGui:Destroy()
end)

-- Create tab buttons
local tabButtons = {}
local tabFrames = {}
local currentTab = nil

local function createTab(name, color)
    local tabButton = Instance.new("TextButton")
    tabButton.Name = name .. "Tab"
    tabButton.Size = UDim2.new(0.25, -5, 0, 30)
    tabButton.Position = UDim2.new(#tabButtons * 0.25, 0, 0, 45)
    tabButton.BackgroundColor3 = color
    tabButton.BorderSizePixel = 0
    tabButton.Text = name
    tabButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    tabButton.TextScaled = true
    tabButton.Font = Enum.Font.SourceSans
    tabButton.Parent = mainFrame
    
    local tabFrame = Instance.new("ScrollingFrame")
    tabFrame.Name = name .. "Frame"
    tabFrame.Size = UDim2.new(1, -10, 1, -80)
    tabFrame.Position = UDim2.new(0, 5, 0, 75)
    tabFrame.BackgroundColor3 = Color3.fromRGB(35, 35, 35)
    tabFrame.BorderSizePixel = 0
    tabFrame.ScrollBarThickness = 6
    tabFrame.Visible = false
    tabFrame.Parent = mainFrame
    
    tabButton.MouseButton1Click:Connect(function()
        -- Hide all tab frames
        for _, frame in pairs(tabFrames) do
            frame.Visible = false
        end
        
        -- Show selected tab frame
        tabFrame.Visible = true
        currentTab = name
    end)
    
    table.insert(tabButtons, tabButton)
    tabFrames[name] = tabFrame
    
    return tabFrame
end

-- Create tabs
local btTab = createTab("BT", Color3.fromRGB(255, 100, 100))
local fsTab = createTab("FS", Color3.fromRGB(100, 255, 100))
local msTab = createTab("MS", Color3.fromRGB(100, 100, 255))
local psTab = createTab("PS", Color3.fromRGB(255, 255, 100))

-- Show first tab by default
btTab.Visible = true
currentTab = "BT"

-- Function to create toggle buttons
local function createToggle(parent, name, callback)
    local toggleFrame = Instance.new("Frame")
    toggleFrame.Name = name .. "Toggle"
    toggleFrame.Size = UDim2.new(1, -10, 0, 40)
    toggleFrame.Position = UDim2.new(0, 5, 0, #parent:GetChildren() * 45)
    toggleFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
    toggleFrame.BorderSizePixel = 0
    toggleFrame.Parent = parent
    
    local toggleButton = Instance.new("TextButton")
    toggleButton.Name = "ToggleButton"
    toggleButton.Size = UDim2.new(1, 0, 1, 0)
    toggleButton.Position = UDim2.new(0, 0, 0, 0)
    toggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
    toggleButton.BorderSizePixel = 0
    toggleButton.Text = name
    toggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
    toggleButton.TextScaled = true
    toggleButton.Font = Enum.Font.SourceSans
    toggleButton.Parent = toggleFrame
    
    local isToggled = false
    
    toggleButton.MouseButton1Click:Connect(function()
        isToggled = not isToggled
        if isToggled then
            toggleButton.BackgroundColor3 = Color3.fromRGB(0, 255, 0)
            callback(true)
        else
            toggleButton.BackgroundColor3 = Color3.fromRGB(70, 70, 70)
            callback(false)
        end
    end)
    
    return toggleButton
end

-- BT Functions
local function createBTFunction(number)
    return function(enabled)
        _G.cum = enabled
        if enabled then
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
                        [1] = "+BT" .. number
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
end

-- FS Functions
local function createFSFunction(number)
    return function(enabled)
        _G.cum = enabled
        if enabled then
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
                        [1] = "+FS" .. number
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
end

-- MS Functions
local function createMSFunction(number)
    return function(enabled)
        _G.cum = enabled
        if enabled then
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
                        [1] = "+MS" .. number
                    }
                }

                game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
                wait(1)
                local args = {
                    [1] = {
                        [1] = "+JF" .. number
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
end

-- PS Functions
local function createPSFunction(number)
    return function(enabled)
        _G.cum = enabled
        if enabled then
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
                        [1] = "+PP" .. number
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
end

-- Create BT toggles
for i = 1, 9 do
    createToggle(btTab, "BT" .. i, createBTFunction(i))
end

-- Create FS toggles
for i = 1, 6 do
    createToggle(fsTab, "FS" .. i, createFSFunction(i))
end

-- Create MS toggles
for i = 1, 5 do
    createToggle(msTab, "MS" .. i, createMSFunction(i))
end

-- Create PS toggles
for i = 1, 5 do
    createToggle(psTab, "PS" .. i, createPSFunction(i))
end

-- Add info label
local infoLabel = Instance.new("TextLabel")
infoLabel.Name = "InfoLabel"
infoLabel.Size = UDim2.new(1, -10, 0, 60)
infoLabel.Position = UDim2.new(0, 5, 1, -65)
infoLabel.BackgroundColor3 = Color3.fromRGB(40, 40, 40)
infoLabel.BorderSizePixel = 0
infoLabel.Text = "SPTS Classic Exploit\nUse at your own risk. Educational purposes only."
infoLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
infoLabel.TextScaled = true
infoLabel.Font = Enum.Font.SourceSans
infoLabel.Parent = mainFrame

print("SPTS Classic Exploit GUI loaded successfully!")
print("Use the GUI to activate different abilities.") 
