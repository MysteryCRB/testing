
-- Unh0ly Hub - Stats Booster with Auto Respawn
(function()
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    
    -- Number formatting function
    local function formatNumber(n)
        if not n then return "0" end
        
        if type(n) == "string" then
            n = tonumber(n)
        end
        
        if not n or n == 0 then return "0" end
        
        local suffixes = {'', 'K', 'M', 'B', 'T', 'Qa', 'Qi'}
        local index = 1
        
        while n >= 1000 and index < #suffixes do
            n = n / 1000
            index = index + 1
        end
        
        if n >= 100 then
            return string.format('%.0f%s', n, suffixes[index])
        elseif n >= 10 then
            return string.format('%.1f%s', n, suffixes[index])
        else
            return string.format('%.2f%s', n, suffixes[index])
        end
    end
    
    -- Load Rayfield UI
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    
    -- Auto Farm Variables
    local AutoFarmBT = false
    local AutoFarmFS = false
    local AutoFarmPP = false
    local AutoFarmJF = false
    local AutoFarmMS = false
    
    local BTLevel = 1
    local FSLevel = 1
    local PPLevel = 1
    local JFLevel = 1
    local MSLevel = 1
    
    -- Detection avoidance variables
    local lastFireTime = 0
    local minDelay = 0.2
    local maxDelay = 0.5
    local levelVariation = 1
    
    local function generateOptions(min, max)
        local options = {}
        for i = min, max do
            table.insert(options, tostring(i))
        end
        return options
    end
    
    -- UI Theme
    local TypeHubTheme = {
        TextColor = Color3.fromRGB(255, 255, 255),
        Background = Color3.fromRGB(26, 26, 26),
        Topbar = Color3.fromRGB(35, 35, 35),
        Shadow = Color3.fromRGB(15, 15, 15),
        NotificationBackground = Color3.fromRGB(26, 26, 26),
        NotificationActionsBackground = Color3.fromRGB(255, 210, 95),
        TabBackground = Color3.fromRGB(40, 40, 40),
        TabStroke = Color3.fromRGB(255, 210, 95),
        TabBackgroundSelected = Color3.fromRGB(255, 210, 95),
        TabTextColor = Color3.fromRGB(255, 255, 255),
        SelectedTabTextColor = Color3.fromRGB(26, 26, 26),
        ElementBackground = Color3.fromRGB(35, 35, 35),
        ElementBackgroundHover = Color3.fromRGB(45, 45, 45),
        SecondaryElementBackground = Color3.fromRGB(30, 30, 30),
        ElementStroke = Color3.fromRGB(255, 210, 95),
        SecondaryElementStroke = Color3.fromRGB(200, 168, 76),
        SliderBackground = Color3.fromRGB(255, 210, 95),
        SliderProgress = Color3.fromRGB(255, 210, 95),
        SliderStroke = Color3.fromRGB(255, 220, 120),
        ToggleBackground = Color3.fromRGB(35, 35, 35),
        ToggleEnabled = Color3.fromRGB(255, 210, 95),
        ToggleDisabled = Color3.fromRGB(100, 100, 100),
        ToggleEnabledStroke = Color3.fromRGB(255, 220, 120),
        ToggleDisabledStroke = Color3.fromRGB(125, 125, 125),
        ToggleEnabledOuterStroke = Color3.fromRGB(200, 168, 76),
        ToggleDisabledOuterStroke = Color3.fromRGB(65, 65, 65),
        DropdownSelected = Color3.fromRGB(45, 45, 45),
        DropdownUnselected = Color3.fromRGB(35, 35, 35),
        InputBackground = Color3.fromRGB(35, 35, 35),
        InputStroke = Color3.fromRGB(255, 210, 95),
        PlaceholderColor = Color3.fromRGB(178, 178, 178)
    }
    
    -- Create Window
    local Window = Rayfield:CreateWindow({
        Name = "Unh0ly Hub - Stats Booster",
        Icon = "zap",
        LoadingTitle = "Loading Stats Booster...",
        LoadingSubtitle = "Loading...",
        Theme = TypeHubTheme,
        ToggleUIKeybind = "K",
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "Unh0lyHub",
            FileName = "StatsBooster_Config"
        }
    })
    
    -- Create Auto Farm Tab
    local AutoFarmTab = Window:CreateTab("Auto Farm", "zap")
    
    -- Helper function to create farm sections
    local function createFarmSection(name, tooltip, maxLevel)
        local section = AutoFarmTab:CreateSection(name .. " Auto Farm")
        
        local dropdown = AutoFarmTab:CreateDropdown({
            Name = name .. " Level",
            Options = generateOptions(1, maxLevel),
            CurrentOption = {"1"},
            MultipleOptions = false,
            Flag = name .. "Level",
            Callback = function(Options)
                _G[name .. "Level"] = tonumber(Options[1])
            end,
        })
        
        local toggle = AutoFarmTab:CreateToggle({
            Name = "Auto Farm " .. name,
            CurrentValue = false,
            Flag = "AutoFarm" .. name,
            Callback = function(Value)
                _G["AutoFarm" .. name] = Value
                if Value then
                    Rayfield:Notify({
                        Title = name .. " Auto Farm Started!",
                        Content = "Auto farming " .. name .. " level " .. _G[name .. "Level"] .. " (±1 variation)",
                        Duration = 3,
                        Image = "zap",
                    })
                else
                    Rayfield:Notify({
                        Title = name .. " Auto Farm Stopped!",
                        Content = "Auto farming has been disabled",
                        Duration = 3,
                        Image = "square",
                    })
                end
            end,
        })
        
        return section, dropdown, toggle
    end
    
    -- Create farm sections with tooltips
    local BTSection, BTDropdown, BTToggle = createFarmSection("BT", "Body Toughness - Increases durability", 9)
    local FSSection, FSDropdown, FSToggle = createFarmSection("FS", "Fist Strength - Increases attack power", 6)
    local PPSection, PPDropdown, PPToggle = createFarmSection("PP", "Psychic Power - Increases mental abilities", 5)
    local JFSection, JFDropdown, JFToggle = createFarmSection("JF", "Jump Force - Increases jump height", 5)
    local MSSection, MSDropdown, MSToggle = createFarmSection("MS", "Movement Speed - Increases speed", 5)
    
    -- Find RemoteEvent dynamically
    local RemoteEvent = nil
    for _, v in pairs(ReplicatedStorage:GetChildren()) do
        if v:IsA("RemoteEvent") then
            RemoteEvent = v
            break
        end
    end
    
    -- Log available RemoteEvents
    local function logRemotes()
        local remotes = {}
        for _, v in pairs(ReplicatedStorage:GetChildren()) do
            if v:IsA("RemoteEvent") then
                remotes[#remotes + 1] = v.Name
            end
        end
        warn("Available RemoteEvents: " .. table.concat(remotes, ", "))
    end
    logRemotes()
    
    -- Setup Auto Respawn
    local function setupAutoRespawn()
        local player = LocalPlayer
        if player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.Died:Connect(function()
                    wait(4)
                    if RemoteEvent then
                        local args = {{"Respawn"}}
                        RemoteEvent:FireServer(unpack(args))
                        warn("Fired: Respawn")
                    end
                end)
            end
        end
        player.CharacterAdded:Connect(function(character)
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.Died:Connect(function()
                wait(4)
                if RemoteEvent then
                    local args = {{"Respawn"}}
                    RemoteEvent:FireServer(unpack(args))
                    warn("Fired: Respawn")
                end
            end)
        end)
    end
    setupAutoRespawn()
    
    -- Auto Farm Loop with detection avoidance
    spawn(function()
        while true do
            wait(math.random(minDelay * 1000, maxDelay * 1000) / 1000)
            
            if not RemoteEvent then 
                Rayfield:Notify({
                    Title = "Error!",
                    Content = "No RemoteEvent found. Check console for available events.",
                    Duration = 5,
                    Image = "alert-circle",
                })
                logRemotes()
                wait(2)
                continue 
            end
            
            local currentTime = tick()
            if currentTime - lastFireTime < minDelay then
                continue
            end
            lastFireTime = currentTime
            
            local function safeFireRemote(prefix, level)
                local success, err = pcall(function()
                    local effectiveLevel = math.random(math.max(1, level - levelVariation), math.min(level + levelVariation, prefix == "+JF" or prefix == "+MS" and 27 or 32))
                    local args = {{prefix .. effectiveLevel}}
                    RemoteEvent:FireServer(unpack(args))
                    warn("Fired: " .. args[1][1])
                end)
                if not success then
                    Rayfield:Notify({
                        Title = "Error!",
                        Content = "Failed to fire: " .. tostring(err),
                        Duration = 5,
                        Image = "alert-circle",
                    })
                    warn("Failed to fire: " .. tostring(err))
                end
            end
            
            if AutoFarmBT then safeFireRemote("+BT", BTLevel) end
            if AutoFarmFS then safeFireRemote("+FS", FSLevel) end
            if AutoFarmPP then safeFireRemote("+PP", PPLevel) end
            if AutoFarmJF then safeFireRemote("+JF", JFLevel) end
            if AutoFarmMS then safeFireRemote("+MS", MSLevel) end
        end
    end)
    
    -- Load Configuration
    Rayfield:LoadConfiguration()
    
end)()
