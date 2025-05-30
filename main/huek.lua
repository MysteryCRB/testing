-- Unh0ly Hub - Stats Booster
(function()
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    -- Load Rayfield UI
    local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()
    
    -- Number formatting function
    local function formatNumber(n)
        if not n then return "0" end
        
        if type(n) == "string" then
            n = tonumber(n)
        end
        
        if not n or n == 0 then return "0" end
        
        local suffixes = {'', 'K', 'M', 'B', 'T', 'Qa', 'Qi', 'Sx', 'Sp', 'Oc', 'No', 'Dc', 'Ud', 'Dd', 'Td', 'Qad', 'Qid', 'Sxd', 'Spd', 'Ocd', 'Nod', 'Vg', 'Uvg'}
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
    
    local function getSafeValue(obj, default)
        if obj and obj.Value ~= nil then
            return obj.Value
        end
        return default or 0
    end
    
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
    local minDelay = 0.1
    local maxDelay = 0.3
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
                        Content = "Auto farming " .. name .. " level " .. _G[name .. "Level"],
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
    local BTSection, BTDropdown, BTToggle = createFarmSection("BT", "Boost Time - Increases your boost duration", 32)
    local FSSection, FSDropdown, FSToggle = createFarmSection("FS", "Fire Speed - Increases your attack speed", 32)
    local PPSection, PPDropdown, PPToggle = createFarmSection("PP", "Power Points - Increases your overall power", 32)
    local JFSection, JFDropdown, JFToggle = createFarmSection("JF", "Jump Force - Increases your jump height", 27)
    local MSSection, MSDropdown, MSToggle = createFarmSection("MS", "Move Speed - Increases your movement speed", 27)
    
    -- Settings Tab
    local SettingsTab = Window:CreateTab("Settings", "settings")
    
    local UISection = SettingsTab:CreateSection("Interface Settings")
    
    local UIToggleKeybind = SettingsTab:CreateKeybind({
        Name = "Toggle UI Keybind",
        CurrentKeybind = "K",
        HoldToInteract = false,
        Flag = "UIKeybind",
        Callback = function(Keybind)
        end,
    })
    
    local ThemeSection = SettingsTab:CreateSection("Theme Settings")
    
    local ThemeDropdown = SettingsTab:CreateDropdown({
        Name = "UI Theme",
        Options = {"Unh0ly Hub Custom", "Default", "Ocean", "Serenity", "Amethyst"},
        CurrentOption = {"Unh0ly Hub Custom"},
        MultipleOptions = false,
        Flag = "Theme",
        Callback = function(Options)
            if Options[1] == "Unh0ly Hub Custom" then
                Window.ModifyTheme(TypeHubTheme)
            else
                Window.ModifyTheme(Options[1])
            end
        end,
    })
    
    local ConfigSection = SettingsTab:CreateSection("Configuration")
    
    local SaveConfigButton = SettingsTab:CreateButton({
        Name = "Save Configuration",
        Callback = function()
            Rayfield:SaveConfiguration()
            Rayfield:Notify({
                Title = "Configuration Saved!",
                Content = "Your settings have been saved successfully",
                Duration = 3,
                Image = "save",
            })
        end,
    })
    
    -- Auto Farm Loop with detection avoidance
    spawn(function()
        while true do
            -- Random delay between actions
            wait(math.random(minDelay * 1000, maxDelay * 1000) / 1000)
            
            -- Check if RemoteEvent exists
            local RemoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvent")
            if not RemoteEvent then 
                warn("RemoteEvent not found! Waiting for it to appear...")
                wait(1)
                continue 
            end
            
            -- Get current time for rate limiting
            local currentTime = tick()
            if currentTime - lastFireTime < minDelay then
                continue
            end
            
            -- Update last fire time
            lastFireTime = currentTime
            
            -- Function to safely fire remote with error handling
            local function safeFireRemote(prefix, level)
                local success, err = pcall(function()
                    local args = {
                        {
                            prefix .. math.random(math.max(1, level - levelVariation), math.min(level + levelVariation, 32))
                        }
                    }
                    RemoteEvent:FireServer(unpack(args))
                end)
                
                if not success then
                    warn("Failed to fire remote: " .. tostring(err))
                end
            end
            
            -- Check and fire each farm type
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
