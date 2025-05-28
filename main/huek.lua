-- CRB Hub
(function()
    local HttpService = game:GetService("HttpService")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer
    
    -- Get executor name
    local function getExecutorName()
        if syn then return "Synapse X"
        elseif KRNL_LOADED then return "KRNL"
        elseif getgenv().COMET_LOADED then return "Comet"
        elseif getgenv().EVON_LOADED then return "Evon"
        elseif getgenv().WRD_LOADED then return "WeAreDevs"
        elseif getgenv().OXYGEN_LOADED then return "Oxygen U"
        elseif getgenv().FLUXUS_LOADED then return "Fluxus"
        elseif getgenv().DELTA_LOADED then return "Delta"
        elseif getgenv().WAVE_LOADED then return "Wave"
        elseif identifyexecutor then return identifyexecutor()
        else return "Unknown"
        end
    end
    
    -- Load Rayfield
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
    
    local ESPEnabled = false
    local ESPColor = Color3.fromRGB(255, 210, 95)
    local ESPObjects = {}
    
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
    
    local BoostMode = false
    local BoostMultiplier = 1
    local deathLoop = nil
    local lastLocation = nil
    local player = game.Players.LocalPlayer
    local BoostSpamming = false
    local BoostNotified = false
    local BoostCurrentKey = "H"
    
    local SpherePunchSpamming = false
    local SpherePunchNotified = false
    local SpherePunchCurrentKey = "Q"
    
    local BulletPunchSpamming = false
    local BulletPunchNotified = false
    local BulletPunchCurrentKey = "E"
    
    local WindSliceSpamming = false
    local WindSliceNotified = false
    local WindSliceCurrentKey = "R"
    
    local function generateOptions(min, max)
        local options = {}
        for i = min, max do
            table.insert(options, tostring(i))
        end
        return options
    end
    
    local function getMousePosition()
        local player = game.Players.LocalPlayer
        local mouse = player:GetMouse()
        
        if mouse.Hit then
            return mouse.Hit.Position
        else
            local character = player.Character
            if character and character:FindFirstChild("HumanoidRootPart") then
                local rootPart = character.HumanoidRootPart
                return rootPart.Position + rootPart.CFrame.LookVector * 10
            end
        end
        
        return Vector3.new(0, 0, 0)
    end
    
    local Window = Rayfield:CreateWindow({
        Name = "Unholy Hub",
        Icon = "shield-check",
        LoadingTitle = "Unholy Hub Loading...",
        LoadingSubtitle = "Loading...",
        Theme = TypeHubTheme,
        
        ToggleUIKeybind = "K",
        
        DisableRayfieldPrompts = false,
        DisableBuildWarnings = false,
        
        ConfigurationSaving = {
            Enabled = true,
            FolderName = "UnholyHub",
            FileName = "UnholyHub_Config"
        },
        
        KeySystem = false
    })
    
    Rayfield:Notify({
        Title = "Unholy Hub Authenticated!",
        Content = "Welcome! Your session is secure and protected.",
        Duration = 5,
        Image = "shield-check",
    })
    
    local DashboardTab = Window:CreateTab("Dashboard", "home")
    
    local DashboardSection = DashboardTab:CreateSection("Welcome to Unholy Hub")
    
    local WelcomeParagraph = DashboardTab:CreateParagraph({
        Title = "Welcome to Unholy Hub!",
        Content = "Unholy Hub delivers lightning-fast auto farming solutions with boost mode. Configure your auto farm settings and join our community on Discord for the latest updates and support."
    })
    
    local StatsSection = DashboardTab:CreateSection("Hub Statistics")
    
    local PlayersLabel = DashboardTab:CreateLabel("Players in Server: " .. #game.Players:GetPlayers(), "users")
    local PingLabel = DashboardTab:CreateLabel("Ping: " .. game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue() .. "ms", "wifi")
    local FPSLabel = DashboardTab:CreateLabel("FPS: " .. math.floor(1/game:GetService("RunService").Heartbeat:Wait()), "monitor")
    
    local SystemInfoSection = DashboardTab:CreateSection("System Information")
    
    local ExecutorLabel = DashboardTab:CreateLabel("Executor: " .. getExecutorName(), "cpu")
    local GameLabel = DashboardTab:CreateLabel("Game: " .. game:GetService("MarketplaceService"):GetProductInfo(game.PlaceId).Name, "gamepad-2")
    
    local AuthSection = DashboardTab:CreateSection("Authentication Status")
    
    local AuthStatusLabel = DashboardTab:CreateLabel("Status: AUTHENTICATED", "shield-check")
    local SessionLabel = DashboardTab:CreateLabel("Session: Active", "clock")
    local HWIDLabel = DashboardTab:CreateLabel("HWID: Protected", "key")
    
    local AutoSystemsSection = DashboardTab:CreateSection("Auto Systems Status")
    
    local AutoRespawnLabel = DashboardTab:CreateLabel("Auto Respawn (4s): ACTIVE", "refresh-cw")
    local AntiAFKLabel = DashboardTab:CreateLabel("Anti AFK: ACTIVE", "shield-check")
    local AntiBlurLabel = DashboardTab:CreateLabel("Anti Blur: ACTIVE", "eye-off")
    
    spawn(function()
        while true do
            wait(5)
            PlayersLabel:Set("Players in Server: " .. #game.Players:GetPlayers(), "users")
            PingLabel:Set("Ping: " .. math.floor(game:GetService("Stats").Network.ServerStatsItem["Data Ping"]:GetValue()) .. "ms", "wifi")
            FPSLabel:Set("FPS: " .. math.floor(1/game:GetService("RunService").Heartbeat:Wait()), "monitor")
            
            if isAuthenticated then
                AuthStatusLabel:Set("Status: AUTHENTICATED", "shield-check")
                SessionLabel:Set("Session: Active (" .. math.floor((tick() - lastAuthCheck)/60) .. "m ago)", "clock")
            else
                AuthStatusLabel:Set("Status: EXPIRED", "shield-x")
                SessionLabel:Set("Session: Expired", "x")
            end
        end
    end)
    
    local QuickActionsSection = DashboardTab:CreateSection("Quick Actions")
    
    local RejoinButton = DashboardTab:CreateButton({
        Name = "Rejoin Server",
        Callback = function()
            game:GetService("TeleportService"):Teleport(game.PlaceId, game.Players.LocalPlayer)
        end,
    })
    
    local CopyJobIdButton = DashboardTab:CreateButton({
        Name = "Copy Job ID",
        Callback = function()
            setclipboard(game.JobId)
            Rayfield:Notify({
                Title = "Success!",
                Content = "Job ID copied to clipboard",
                Duration = 3,
                Image = "check",
            })
        end,
    })
    
    local ManualRespawnButton = DashboardTab:CreateButton({
        Name = "Manual Respawn",
        Callback = function()
            local args = {{"Respawn"}}
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            Rayfield:Notify({
                Title = "Respawn Triggered!",
                Content = "Manual respawn command sent",
                Duration = 3,
                Image = "refresh-cw",
            })
        end,
    })
    
    local AutoFarmTab = Window:CreateTab("Auto Farm", "zap")
    
    local BoostSection = AutoFarmTab:CreateSection("Boost Mode")
    
    local BoostStatusLabel = AutoFarmTab:CreateLabel("Boost Status: Disabled", "zap")
    
    local BoostKeybind = AutoFarmTab:CreateKeybind({
        Name = "Rapid Boost (Hold H)",
        CurrentKeybind = "H",
        HoldToInteract = true,
        Flag = "BoostKeybind",
        Callback = function(Keybind)
            if type(Keybind) == "string" then
                BoostCurrentKey = Keybind
            end
            
            BoostSpamming = Keybind
            
            if Keybind and not BoostNotified then
                BoostNotified = true
                Rayfield:Notify({
                    Title = "Rapid Boost Activated!",
                    Content = "Ultra-fast stat gains while holding " .. BoostCurrentKey,
                    Duration = 3,
                    Image = "zap",
                })
            elseif not Keybind and BoostNotified then
                BoostNotified = false
                Rayfield:Notify({
                    Title = "Rapid Boost Deactivated!",
                    Content = "Released " .. BoostCurrentKey .. " key - boost stopped",
                    Duration = 3,
                    Image = "shield-off",
                })
            end
        end,
    })
    
    local BTSection = AutoFarmTab:CreateSection("BT Auto Farm")
    
    local BTDropdown = AutoFarmTab:CreateDropdown({
        Name = "BT Level",
        Options = generateOptions(1, 32),
        CurrentOption = {"1"},
        MultipleOptions = false,
        Flag = "BTLevel",
        Callback = function(Options)
            BTLevel = tonumber(Options[1])
        end,
    })
    
    local BTToggle = AutoFarmTab:CreateToggle({
        Name = "Auto Farm BT",
        CurrentValue = false,
        Flag = "AutoFarmBT",
        Callback = function(Value)
            AutoFarmBT = Value
            if Value then
                Rayfield:Notify({
                    Title = "BT Auto Farm Started!",
                    Content = "Auto farming BT level " .. BTLevel,
                    Duration = 3,
                    Image = "zap",
                })
            else
                Rayfield:Notify({
                    Title = "BT Auto Farm Stopped!",
                    Content = "Auto farming has been disabled",
                    Duration = 3,
                    Image = "square",
                })
            end
        end,
    })
    
    local FSSection = AutoFarmTab:CreateSection("FS Auto Farm")
    
    local FSDropdown = AutoFarmTab:CreateDropdown({
        Name = "FS Level",
        Options = generateOptions(1, 32),
        CurrentOption = {"1"},
        MultipleOptions = false,
        Flag = "FSLevel",
        Callback = function(Options)
            FSLevel = tonumber(Options[1])
            Rayfield:Notify({
                Title = "FS Level Updated!",
                Content = "FS Level set to " .. FSLevel,
                Duration = 3,
                Image = "zap",
            })
        end,
    })
    
    local FSToggle = AutoFarmTab:CreateToggle({
        Name = "Auto Farm FS",
        CurrentValue = false,
        Flag = "AutoFarmFS",
        Callback = function(Value)
            AutoFarmFS = Value
            if Value then
                Rayfield:Notify({
                    Title = "FS Auto Farm Started!",
                    Content = "Auto farming FS level " .. FSLevel,
                    Duration = 3,
                    Image = "zap",
                })
            else
                Rayfield:Notify({
                    Title = "FS Auto Farm Stopped!",
                    Content = "Auto farming has been disabled",
                    Duration = 3,
                    Image = "square",
                })
            end
        end,
    })
    
    local PPSection = AutoFarmTab:CreateSection("PP Auto Farm")
    
    local PPDropdown = AutoFarmTab:CreateDropdown({
        Name = "PP Level",
        Options = generateOptions(1, 32),
        CurrentOption = {"1"},
        MultipleOptions = false,
        Flag = "PPLevel",
        Callback = function(Options)
            PPLevel = tonumber(Options[1])
        end,
    })
    
    local PPToggle = AutoFarmTab:CreateToggle({
        Name = "Auto Farm PP",
        CurrentValue = false,
        Flag = "AutoFarmPP",
        Callback = function(Value)
            AutoFarmPP = Value
            if Value then
                Rayfield:Notify({
                    Title = "PP Auto Farm Started!",
                    Content = "Auto farming PP level " .. PPLevel,
                    Duration = 3,
                    Image = "zap",
                })
            else
                Rayfield:Notify({
                    Title = "PP Auto Farm Stopped!",
                    Content = "Auto farming has been disabled",
                    Duration = 3,
                    Image = "square",
                })
            end
        end,
    })
    
    local JFSection = AutoFarmTab:CreateSection("JF Auto Farm")
    
    local JFDropdown = AutoFarmTab:CreateDropdown({
        Name = "JF Level",
        Options = generateOptions(1, 27),
        CurrentOption = {"1"},
        MultipleOptions = false,
        Flag = "JFLevel",
        Callback = function(Options)
            JFLevel = tonumber(Options[1])
        end,
    })
    
    local JFToggle = AutoFarmTab:CreateToggle({
        Name = "Auto Farm JF",
        CurrentValue = false,
        Flag = "AutoFarmJF",
        Callback = function(Value)
            AutoFarmJF = Value
            if Value then
                Rayfield:Notify({
                    Title = "JF Auto Farm Started!",
                    Content = "Auto farming JF level " .. JFLevel,
                    Duration = 3,
                    Image = "zap",
                })
            else
                Rayfield:Notify({
                    Title = "JF Auto Farm Stopped!",
                    Content = "Auto farming has been disabled",
                    Duration = 3,
                    Image = "square",
                })
            end
        end,
    })
    
    local MSSection = AutoFarmTab:CreateSection("MS Auto Farm")
    
    local MSDropdown = AutoFarmTab:CreateDropdown({
        Name = "MS Level",
        Options = generateOptions(1, 27),
        CurrentOption = {"1"},
        MultipleOptions = false,
        Flag = "MSLevel",
        Callback = function(Options)
            MSLevel = tonumber(Options[1])
        end,
    })
    
    local MSToggle = AutoFarmTab:CreateToggle({
        Name = "Auto Farm MS",
        CurrentValue = false,
        Flag = "AutoFarmMS",
        Callback = function(Value)
            AutoFarmMS = Value
            if Value then
                Rayfield:Notify({
                    Title = "MS Auto Farm Started!",
                    Content = "Auto farming MS level " .. MSLevel,
                    Duration = 3,
                    Image = "zap",
                })
            else
                Rayfield:Notify({
                    Title = "MS Auto Farm Stopped!",
                    Content = "Auto farming has been disabled",
                    Duration = 3,
                    Image = "square",
                })
            end
        end,
    })
    
    local OPTab = Window:CreateTab("OP", "skull")
    
    local OPIntroSection = OPTab:CreateSection("OverPowered Features")
    
    local OPParagraph = OPTab:CreateParagraph({
        Title = "Ultimate Combat Arsenal",
        Content = "Unleash devastating attacks and dominate the battlefield with our advanced combat system. These features are designed for experienced players who want maximum power and control."
    })
    
    local CombatSkillsSection = OPTab:CreateSection("Combat Skills")
    
    local SkillInfoLabel = OPTab:CreateLabel("Sphere Punch - Devastating Area Attack", "target")
    
    local SpherePunchKeybind = OPTab:CreateKeybind({
        Name = "Sphere Punch Spam",
        CurrentKeybind = "Q",
        HoldToInteract = true,
        Flag = "SpherePunchKeybind",
        Callback = function(Keybind)
            if type(Keybind) == "string" then
                SpherePunchCurrentKey = Keybind
            end
            
            SpherePunchSpamming = Keybind
            
            if Keybind and not SpherePunchNotified then
                SpherePunchNotified = true
                Rayfield:Notify({
                    Title = "Sphere Punch Activated!",
                    Content = "Devastating attacks at mouse position while holding " .. SpherePunchCurrentKey,
                    Duration = 3,
                    Image = "zap",
                })
            elseif not Keybind and SpherePunchNotified then
                SpherePunchNotified = false
                Rayfield:Notify({
                    Title = "Sphere Punch Deactivated!",
                    Content = "Released " .. SpherePunchCurrentKey .. " key - combat mode disabled",
                    Duration = 3,
                    Image = "shield-off",
                })
            end
        end,
    })
    
    local BulletPunchDivider = OPTab:CreateDivider()
    
    local BulletSkillInfoLabel = OPTab:CreateLabel("Bullet Punch - Rapid Fire Combo", "crosshair")
    
    local BulletPunchKeybind = OPTab:CreateKeybind({
        Name = "Bullet Punch Spam",
        CurrentKeybind = "E",
        HoldToInteract = true,
        Flag = "BulletPunchKeybind",
        Callback = function(Keybind)
            if type(Keybind) == "string" then
                BulletPunchCurrentKey = Keybind
            elseif type(Keybind) == "boolean" and Keybind then
                BulletPunchCurrentKey = "E"
            end
            
            BulletPunchSpamming = Keybind
            
            if Keybind and not BulletPunchNotified then
                BulletPunchNotified = true
                Rayfield:Notify({
                    Title = "Bullet Punch Activated!",
                    Content = "Rapid fire combo attacks while holding " .. BulletPunchCurrentKey,
                    Duration = 3,
                    Image = "zap",
                })
            elseif not Keybind and BulletPunchNotified then
                BulletPunchNotified = false
                Rayfield:Notify({
                    Title = "Bullet Punch Deactivated!",
                    Content = "Released " .. BulletPunchCurrentKey .. " key - rapid fire stopped",
                    Duration = 3,
                    Image = "shield-off",
                })
            end
        end,
    })
    
    local WindSliceDivider = OPTab:CreateDivider()
    
    local WindSkillInfoLabel = OPTab:CreateLabel("Wind Slice - Cutting Wind Attack", "wind")
    
    local WindSliceKeybind = OPTab:CreateKeybind({
        Name = "Wind Slice Spam",
        CurrentKeybind = "R",
        HoldToInteract = true,
        Flag = "WindSliceKeybind",
        Callback = function(Keybind)
            if type(Keybind) == "string" then
                WindSliceCurrentKey = Keybind
            elseif type(Keybind) == "boolean" and Keybind then
                WindSliceCurrentKey = "R"
            end
            
            WindSliceSpamming = Keybind
            
            if Keybind and not WindSliceNotified then
                WindSliceNotified = true
                Rayfield:Notify({
                    Title = "Wind Slice Activated!",
                    Content = "Cutting wind attacks at mouse position while holding " .. WindSliceCurrentKey,
                    Duration = 3,
                    Image = "zap",
                })
            elseif not Keybind and WindSliceNotified then
                WindSliceNotified = false
                Rayfield:Notify({
                    Title = "Wind Slice Deactivated!",
                    Content = "Released " .. WindSliceCurrentKey .. " key - wind attacks stopped",
                    Duration = 3,
                    Image = "shield-off",
                })
            end
        end,
    })
    
    local CombatStatusSection = OPTab:CreateSection("Combat Status")
    
    local CombatModeLabel = OPTab:CreateLabel("Combat Mode: Inactive", "shield")
    local TargetingLabel = OPTab:CreateLabel("Targeting: Mouse Position", "crosshair")
    local AttackRateLabel = OPTab:CreateLabel("Attack Rate: Variable by skill", "clock")
    
    spawn(function()
        while true do
            wait(1)
            if SpherePunchSpamming or BulletPunchSpamming or WindSliceSpamming then
                CombatModeLabel:Set("Combat Mode: ACTIVE", "shield-check")
            else
                CombatModeLabel:Set("Combat Mode: Inactive", "shield")
            end
        end
    end)
    
    local AdvancedControlsSection = OPTab:CreateSection("Advanced Controls")
    
    local ResetCombatButton = OPTab:CreateButton({
        Name = "Reset Combat System",
        Callback = function()
            SpherePunchSpamming = false
            SpherePunchNotified = false
            BulletPunchSpamming = false
            BulletPunchNotified = false
            WindSliceSpamming = false
            WindSliceNotified = false
            Rayfield:Notify({
                Title = "Combat System Reset!",
                Content = "All combat functions have been reset",
                Duration = 3,
                Image = "refresh-cw",
            })
        end,
    })
    
    local TestAttackButton = OPTab:CreateButton({
        Name = "Test Single Attack",
        Callback = function()
            local targetPosition = getMousePosition()
            local args = {
                {
                    "Skill_SpherePunch",
                    targetPosition
                }
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            
            Rayfield:Notify({
                Title = "Test Attack Fired!",
                Content = "Single Sphere Punch executed",
                Duration = 2,
                Image = "target",
            })
        end,
    })
    
    local PowerLevelSection = OPTab:CreateSection("Power Level")
    
    local PowerMeterLabel = OPTab:CreateLabel("Power Level: MAXIMUM", "trending-up")
    local DamageTypeLabel = OPTab:CreateLabel("Damage Type: Area of Effect", "bomb")
    local RangeLabel = OPTab:CreateLabel("Range: Unlimited", "maximize")
    
    local WarningSection = OPTab:CreateSection("Warning")
    
    local WarningParagraph = OPTab:CreateParagraph({
        Title = "Use Responsibly",
        Content = "These features are extremely powerful and should be used responsibly. Always follow server rules and respect other players. Misuse may result in consequences."
    })
    
    local VisualsTab = Window:CreateTab("Visuals", "eye")
    
    local AntiBlurEnabled = true
    
    local function removeAllBlurEffects()
        for _, effect in pairs(game.Lighting:GetChildren()) do
            if effect:IsA("BlurEffect") then
                effect:Destroy()
            end
        end
        
        local camera = workspace.CurrentCamera
        if camera then
            for _, effect in pairs(camera:GetChildren()) do
                if effect:IsA("BlurEffect") then
                    effect:Destroy()
                end
            end
        end
        
        local playerGui = game.Players.LocalPlayer:FindFirstChild("PlayerGui")
        if playerGui then
            for _, gui in pairs(playerGui:GetDescendants()) do
                if gui:IsA("BlurEffect") then
                    gui:Destroy()
                end
            end
        end
        
        local coreGui = game:GetService("CoreGui")
        for _, gui in pairs(coreGui:GetDescendants()) do
            if gui:IsA("BlurEffect") then
                gui:Destroy()
            end
        end
    end
    
    local function setupAntiBlur()
        removeAllBlurEffects()
        
        game.Lighting.ChildAdded:Connect(function(child)
            if AntiBlurEnabled and child:IsA("BlurEffect") then
                wait(0.1)
                child:Destroy()
            end
        end)
        
        local function monitorCamera(camera)
            if camera then
                camera.ChildAdded:Connect(function(child)
                    if AntiBlurEnabled and child:IsA("BlurEffect") then
                        wait(0.1)
                        child:Destroy()
                    end
                end)
            end
        end
        
        monitorCamera(workspace.CurrentCamera)
        
        workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
            local newCamera = workspace.CurrentCamera
            monitorCamera(newCamera)
            
            if newCamera and AntiBlurEnabled then
                for _, effect in pairs(newCamera:GetChildren()) do
                    if effect:IsA("BlurEffect") then
                        effect:Destroy()
                    end
                end
            end
        end)
        
        local playerGui = game.Players.LocalPlayer:WaitForChild("PlayerGui")
        playerGui.DescendantAdded:Connect(function(descendant)
            if AntiBlurEnabled and descendant:IsA("BlurEffect") then
                wait(0.1)
                descendant:Destroy()
            end
        end)
        
        spawn(function()
            while true do
                wait(2)
                if AntiBlurEnabled then
                    removeAllBlurEffects()
                end
            end
        end)
    end
    
    setupAntiBlur()
    
    local AntiBlurSection = VisualsTab:CreateSection("Anti-Blur System")
    
    local AntiBlurParagraph = VisualsTab:CreateParagraph({
        Title = "Automatic Blur Removal",
        Content = "Automatically removes all blur effects from the game including camera blur, lighting blur, and UI blur effects. Monitors continuously for new blur effects and removes them instantly."
    })
    
    local AntiBlurToggle = VisualsTab:CreateToggle({
        Name = "Enable Anti-Blur",
        CurrentValue = true,
        Flag = "AntiBlurEnabled",
        Callback = function(Value)
            AntiBlurEnabled = Value
            if Value then
                removeAllBlurEffects()
                Rayfield:Notify({
                    Title = "Anti-Blur Enabled!",
                    Content = "All blur effects will be automatically removed",
                    Duration = 3,
                    Image = "eye-off",
                })
            else
                Rayfield:Notify({
                    Title = "Anti-Blur Disabled!",
                    Content = "Blur effects will no longer be automatically removed",
                    Duration = 3,
                    Image = "eye",
                })
            end
        end,
    })
    
    local ClearBlurButton = VisualsTab:CreateButton({
        Name = "Clear All Blur Now",
        Callback = function()
            removeAllBlurEffects()
            Rayfield:Notify({
                Title = "Blur Cleared!",
                Content = "All existing blur effects have been removed",
                Duration = 3,
                Image = "eye-off",
            })
        end,
    })
    
    local ESPSection = VisualsTab:CreateSection("Player ESP")
    
    local ESPParagraph = VisualsTab:CreateParagraph({
        Title = "Player ESP System",
        Content = "Advanced ESP system that highlights players and displays their status from leaderstats. Customize colors and toggle visibility as needed."
    })
    
    local ESPToggle = VisualsTab:CreateToggle({
        Name = "Enable Player ESP",
        CurrentValue = false,
        Flag = "ESPEnabled",
        Callback = function(Value)
            ESPEnabled = Value
            toggleESP()
            if Value then
                Rayfield:Notify({
                    Title = "ESP Enabled!",
                    Content = "Player ESP with status display activated",
                    Duration = 3,
                    Image = "eye",
                })
            else
                Rayfield:Notify({
                    Title = "ESP Disabled!",
                    Content = "Player ESP has been turned off",
                    Duration = 3,
                    Image = "eye-off",
                })
            end
        end,
    })
    
    local ESPColorPicker = VisualsTab:CreateColorPicker({
        Name = "ESP Color",
        Color = Color3.fromRGB(255, 210, 95),
        Flag = "ESPColor",
        Callback = function(Value)
            ESPColor = Value
            updateESPColor()
        end
    })
    
    local ESPControlsSection = VisualsTab:CreateSection("ESP Controls")
    
    local RefreshESPButton = VisualsTab:CreateButton({
        Name = "Refresh ESP",
        Callback = function()
            if ESPEnabled then
                for player, _ in pairs(ESPObjects) do
                    removeESP(player)
                end
                
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer then
                        createESP(player)
                    end
                end
                
                Rayfield:Notify({
                    Title = "ESP Refreshed!",
                    Content = "All ESP elements have been updated",
                    Duration = 3,
                    Image = "refresh-cw",
                })
            else
                Rayfield:Notify({
                    Title = "ESP Not Active!",
                    Content = "Please enable ESP first",
                    Duration = 3,
                    Image = "alert-circle",
                })
            end
        end,
    })
    
    local ClearESPButton = VisualsTab:CreateButton({
        Name = "Clear All ESP",
        Callback = function()
            for player, _ in pairs(ESPObjects) do
                removeESP(player)
            end
            ESPEnabled = false
            ESPToggle:Set(false)
            
            Rayfield:Notify({
                Title = "ESP Cleared!",
                Content = "All ESP elements have been removed",
                Duration = 3,
                Image = "trash-2",
            })
        end,
    })
    
    local ESPInfoSection = VisualsTab:CreateSection("ESP Information")
    
    local ESPStatusLabel = VisualsTab:CreateLabel("ESP Status: Disabled", "info")
    local ESPPlayersLabel = VisualsTab:CreateLabel("Players with ESP: 0", "users")
    
    spawn(function()
        while true do
            wait(2)
            if ESPEnabled then
                ESPStatusLabel:Set("ESP Status: Enabled", "eye")
                local count = 0
                for _ in pairs(ESPObjects) do
                    count = count + 1
                end
                ESPPlayersLabel:Set("Players with ESP: " .. count, "users")
            else
                ESPStatusLabel:Set("ESP Status: Disabled", "eye-off")
                ESPPlayersLabel:Set("Players with ESP: 0", "users")
            end
        end
    end)
    
    local OthersTab = Window:CreateTab("Others", "more-horizontal")
    
    local PlayerInfoSection = OthersTab:CreateSection("Player Information")
    
    local PlayerInfoParagraph = OthersTab:CreateParagraph({
        Title = "Player Statistics",
        Content = "View your current player statistics including aura status, tokens, and various skill levels. All values are automatically formatted for readability."
    })
    
    local FistAuraSection = OthersTab:CreateSection("Fist Aura Status")
    
    local FistAuraLabel = OthersTab:CreateLabel("Fist Aura: Loading...", "star")
    
    local TokensSection = OthersTab:CreateSection("Currency")
    
    local TokensLabel = OthersTab:CreateLabel("Tokens: Loading...", "coins")
    
    local StatsSection = OthersTab:CreateSection("Player Statistics")
    
    local FistStrengthLabel = OthersTab:CreateLabel("Fist Strength: Loading...", "hand")
    local BodyToughnessLabel = OthersTab:CreateLabel("Body Toughness: Loading...", "shield")
    local PsychicPowerLabel = OthersTab:CreateLabel("Psychic Power: Loading...", "brain")
    local JumpForceLabel = OthersTab:CreateLabel("Jump Force: Loading...", "arrow-up")
    local MovementSpeedLabel = OthersTab:CreateLabel("Movement Speed: Loading...", "zap")
    
    local StatsControlsSection = OthersTab:CreateSection("Statistics Controls")
    
    local RefreshStatsButton = OthersTab:CreateButton({
        Name = "Refresh All Stats",
        Callback = function()
            Rayfield:Notify({
                Title = "Stats Refreshed!",
                Content = "All player statistics have been updated",
                Duration = 3,
                Image = "refresh-cw",
            })
        end,
    })
    
    local CopyStatsButton = OthersTab:CreateButton({
        Name = "Copy Stats to Clipboard",
        Callback = function()
            local player = game.Players.LocalPlayer
            if player:FindFirstChild("PrivateStats") then
                local stats = player.PrivateStats
                local statsText = "Type Hub - Player Stats:\n"
                
                if stats:FindFirstChild("FSAuraUnlocked") then
                    statsText = statsText .. "Fist Aura: " .. tostring(getSafeValue(stats.FSAuraUnlocked, "Unknown")) .. "\n"
                end
                
                if stats:FindFirstChild("Tokens") then
                    statsText = statsText .. "Tokens: " .. formatNumber(getSafeValue(stats.Tokens, 0)) .. "\n"
                end
                
                if stats:FindFirstChild("FistStrength") then
                    statsText = statsText .. "Fist Strength: " .. formatNumber(getSafeValue(stats.FistStrength, 0)) .. "\n"
                end
                if stats:FindFirstChild("BodyToughness") then
                    statsText = statsText .. "Body Toughness: " .. formatNumber(getSafeValue(stats.BodyToughness, 0)) .. "\n"
                end
                if stats:FindFirstChild("PsychicPower") then
                    statsText = statsText .. "Psychic Power: " .. formatNumber(getSafeValue(stats.PsychicPower, 0)) .. "\n"
                end
                if stats:FindFirstChild("JumpForce") then
                    statsText = statsText .. "Jump Force: " .. formatNumber(getSafeValue(stats.JumpForce, 0)) .. "\n"
                end
                if stats:FindFirstChild("MovementSpeed") then
                    statsText = statsText .. "Movement Speed: " .. formatNumber(getSafeValue(stats.MovementSpeed, 0)) .. "\n"
                end
                
                setclipboard(statsText)
                Rayfield:Notify({
                    Title = "Stats Copied!",
                    Content = "Player statistics copied to clipboard",
                    Duration = 3,
                    Image = "copy",
                })
            else
                Rayfield:Notify({
                    Title = "Error!",
                    Content = "PrivateStats not found",
                    Duration = 3,
                    Image = "alert-circle",
                })
            end
        end,
    })
    
    local function updatePlayerStats()
        local player = game.Players.LocalPlayer
        if player:FindFirstChild("PrivateStats") then
            local stats = player.PrivateStats
            
            if stats:FindFirstChild("FSAuraUnlocked") then
                local auraValue = getSafeValue(stats.FSAuraUnlocked, "Unknown")
                FistAuraLabel:Set("Fist Aura: " .. tostring(auraValue), "star")
            else
                FistAuraLabel:Set("Fist Aura: Not Available", "x")
            end
            
            if stats:FindFirstChild("Tokens") then
                local tokensValue = getSafeValue(stats.Tokens, 0)
                TokensLabel:Set("Tokens: " .. formatNumber(tokensValue), "coins")
            else
                TokensLabel:Set("Tokens: Not Available", "x")
            end
            
            if stats:FindFirstChild("FistStrength") then
                local fsValue = getSafeValue(stats.FistStrength, 0)
                FistStrengthLabel:Set("Fist Strength: " .. formatNumber(fsValue), "hand")
            else
                FistStrengthLabel:Set("Fist Strength: Not Available", "x")
            end
            
            if stats:FindFirstChild("BodyToughness") then
                local btValue = getSafeValue(stats.BodyToughness, 0)
                BodyToughnessLabel:Set("Body Toughness: " .. formatNumber(btValue), "shield")
            else
                BodyToughnessLabel:Set("Body Toughness: Not Available", "x")
            end
            
            if stats:FindFirstChild("PsychicPower") then
                local ppValue = getSafeValue(stats.PsychicPower, 0)
                PsychicPowerLabel:Set("Psychic Power: " .. formatNumber(ppValue), "brain")
            else
                PsychicPowerLabel:Set("Psychic Power: Not Available", "x")
            end
            
            if stats:FindFirstChild("JumpForce") then
                local jfValue = getSafeValue(stats.JumpForce, 0)
                JumpForceLabel:Set("Jump Force: " .. formatNumber(jfValue), "arrow-up")
            else
                JumpForceLabel:Set("Jump Force: Not Available", "x")
            end
            
            if stats:FindFirstChild("MovementSpeed") then
                local msValue = getSafeValue(stats.MovementSpeed, 0)
                MovementSpeedLabel:Set("Movement Speed: " .. formatNumber(msValue), "zap")
            else
                MovementSpeedLabel:Set("Movement Speed: Not Available", "x")
            end
        else
            FistAuraLabel:Set("Fist Aura: PrivateStats Not Found", "alert-circle")
            TokensLabel:Set("Tokens: PrivateStats Not Found", "alert-circle")
            FistStrengthLabel:Set("Fist Strength: PrivateStats Not Found", "alert-circle")
            BodyToughnessLabel:Set("Body Toughness: PrivateStats Not Found", "alert-circle")
            PsychicPowerLabel:Set("Psychic Power: PrivateStats Not Found", "alert-circle")
            JumpForceLabel:Set("Jump Force: PrivateStats Not Found", "alert-circle")
            MovementSpeedLabel:Set("Movement Speed: PrivateStats Not Found", "alert-circle")
        end
    end
    
    spawn(function()
        wait(2)
        updatePlayerStats()
    end)
    
    spawn(function()
        while true do
            wait(5)
            updatePlayerStats()
        end
    end)
    
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
        Options = {"Type Hub Custom", "Default", "Ocean", "Serenity", "Amethyst"},
        CurrentOption = {"Type Hub Custom"},
        MultipleOptions = false,
        Flag = "Theme",
        Callback = function(Options)
            if Options[1] == "Type Hub Custom" then
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
    
    spawn(function()
        while true do
            wait(0.05)
            
            if SpherePunchSpamming then
                local targetPosition = getMousePosition()
                local args = {
                    {
                        "Skill_SpherePunch",
                        targetPosition
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            end
        end
    end)
    
    spawn(function()
        local isRightPunch = true
        while true do
            wait(0.03)
            
            if BulletPunchSpamming then
                local targetPosition = getMousePosition()
                
                if isRightPunch then
                    local args = {
                        {
                            "Skill_BulletPunch",
                            "Right",
                            777.06396484375,
                            Vector3.new(targetPosition.X, targetPosition.Y, targetPosition.Z)
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                else
                    local args = {
                        {
                            "Skill_BulletPunch",
                            "Left",
                            9948.283203125,
                            Vector3.new(targetPosition.X, targetPosition.Y, targetPosition.Z)
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end
                
                isRightPunch = not isRightPunch
            end
        end
    end)
    
    spawn(function()
        while true do
            wait(0.15)
            
            if WindSliceSpamming then
                local targetPosition = getMousePosition()
                local args = {
                    {
                        "Skill_WindSlice",
                        Vector3.new(targetPosition.X, targetPosition.Y, targetPosition.Z)
                    }
                }
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            end
        end
    end)
    
    spawn(function()
        while true do
            wait(0.01) -- Extremely fast tick rate
            
            if BoostSpamming then
                -- Fire all stat upgrades simultaneously
                if AutoFarmBT then
                    local args = {
                        {
                            "+BT" .. BTLevel
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end
                
                if AutoFarmFS then
                    local args = {
                        {
                            "+FS" .. FSLevel
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end
                
                if AutoFarmPP then
                    local args = {
                        {
                            "+PP" .. PPLevel
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end
                
                if AutoFarmJF then
                    local args = {
                        {
                            "+JF" .. JFLevel
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end
                
                if AutoFarmMS then
                    local args = {
                        {
                            "+MS" .. MSLevel
                        }
                    }
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end
            end
        end
    end)
    
    Rayfield:LoadConfiguration()
    
    local function createESP(player)
        if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then
            return
        end
        
        local character = player.Character
        local humanoidRootPart = character.HumanoidRootPart
        
        local billboardGui = Instance.new("BillboardGui")
        billboardGui.Name = "CRBHubESP_Status"
        billboardGui.Adornee = humanoidRootPart
        billboardGui.Size = UDim2.new(0, 200, 0, 50)
        billboardGui.StudsOffset = Vector3.new(0, 3, 0)
        billboardGui.AlwaysOnTop = true
        billboardGui.Parent = humanoidRootPart
        
        local statusLabel = Instance.new("TextLabel")
        statusLabel.Name = "StatusText"
        statusLabel.Size = UDim2.new(1, 0, 1, 0)
        statusLabel.BackgroundTransparency = 1
        statusLabel.Text = "Loading..."
        statusLabel.TextColor3 = ESPColor
        statusLabel.TextScaled = true
        statusLabel.Font = Enum.Font.GothamBold
        statusLabel.TextStrokeTransparency = 0
        statusLabel.TextStrokeColor3 = Color3.new(0, 0, 0)
        statusLabel.Parent = billboardGui
        
        local function updateStatus()
            if player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Status") then
                statusLabel.Text = player.Name .. "\n[" .. player.leaderstats.Status.Value .. "]"
            else
                statusLabel.Text = player.Name .. "\n[No Status]"
            end
        end
        
        updateStatus()
        
        if player:FindFirstChild("leaderstats") and player.leaderstats:FindFirstChild("Status") then
            player.leaderstats.Status.Changed:Connect(updateStatus)
        end
        
        local highlight = Instance.new("Highlight")
        highlight.Name = "CRBHubESP_Highlight"
        highlight.Adornee = character
        highlight.FillColor = ESPColor
        highlight.OutlineColor = ESPColor
        highlight.FillTransparency = 0.7
        highlight.OutlineTransparency = 0
        highlight.Parent = character
        
        ESPObjects[player] = {
            billboard = billboardGui,
            highlight = highlight,
            statusLabel = statusLabel,
            updateStatus = updateStatus
        }
    end
    
    local function removeESP(player)
        if ESPObjects[player] then
            if ESPObjects[player].billboard then
                ESPObjects[player].billboard:Destroy()
            end
            if ESPObjects[player].highlight then
                ESPObjects[player].highlight:Destroy()
            end
            ESPObjects[player] = nil
        end
    end
    
    local function updateESPColor()
        for player, objects in pairs(ESPObjects) do
            if objects.highlight then
                objects.highlight.FillColor = ESPColor
                objects.highlight.OutlineColor = ESPColor
            end
            if objects.statusLabel then
                objects.statusLabel.TextColor3 = ESPColor
            end
        end
    end
    
    local function toggleESP()
        if ESPEnabled then
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    createESP(player)
                end
            end
            
            game.Players.PlayerAdded:Connect(function(player)
                if ESPEnabled then
                    player.CharacterAdded:Connect(function()
                        wait(1)
                        if ESPEnabled then
                            createESP(player)
                        end
                    end)
                end
            end)
            
            for _, player in pairs(game.Players:GetPlayers()) do
                if player ~= game.Players.LocalPlayer then
                    player.CharacterAdded:Connect(function()
                        wait(1)
                        if ESPEnabled then
                            createESP(player)
                        end
                    end)
                end
            end
            
        else
            for player, _ in pairs(ESPObjects) do
                removeESP(player)
            end
        end
    end
    
    local function setupAutoRespawn()
        local player = game.Players.LocalPlayer
        
        if player.Character then
            local humanoid = player.Character:FindFirstChild("Humanoid")
            if humanoid then
                humanoid.Died:Connect(function()
                    wait(4)
                    local args = {{"Respawn"}}
                    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
                end)
            end
        end
        
        player.CharacterAdded:Connect(function(character)
            local humanoid = character:WaitForChild("Humanoid")
            humanoid.Died:Connect(function()
                wait(4)
                local args = {{"Respawn"}}
                game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer(unpack(args))
            end)
        end)
    end
    
    local function setupAntiAFK()
        local vu = game:GetService("VirtualUser")
        game:GetService("Players").LocalPlayer.Idled:Connect(function()
            vu:Button2Down(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
            wait(1)
            vu:Button2Up(Vector2.new(0,0), workspace.CurrentCamera.CFrame)
        end)
    end
    
    setupAutoRespawn()
    setupAntiAFK()
    
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
    
    -- Function to update last location
    local function updateLastLocation()
        while true do
            if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                lastLocation = player.Character.HumanoidRootPart.Position
            end
            wait(5)
        end
    end
    task.spawn(updateLastLocation)
    
    -- Function to toggle Boost
    local function toggleBoost(enabled)
        if enabled then
            if deathLoop then return end
            deathLoop = task.spawn(function()
                while true do
                    if not player or not player.Character then
                        wait(1)
                        continue
                    end
                    
                    local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
                    if not humanoid then
                        wait(1)
                        continue
                    end
                    
                    -- Kill player immediately
                    pcall(function()
                        humanoid:TakeDamage(humanoid.MaxHealth)
                        humanoid.Health = 0
                    end)
                    
                    -- Wait exactly 5 seconds
                    wait(5)
                end
            end)
        else
            if deathLoop then
                task.cancel(deathLoop)
                deathLoop = nil
            end
        end
    end
    
    -- Function to respawn character after death
    local function respawnLoop()
        while true do
            if not player or not player.Character then
                wait(1)
                continue
            end
            
            local humanoid = player.Character:FindFirstChildOfClass("Humanoid")
            if not humanoid then
                wait(1)
                continue
            end
            
            if humanoid.Health <= 0 then
                wait(1)
                
                -- Respawn process
                pcall(function()
                    local remoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvent")
                    if remoteEvent then
                        remoteEvent:FireServer({[1] = "Respawn"})
                    end
                end)
                
                -- Reset UI settings
                wait(1)
                pcall(function()
                    game.Lighting.Blur.Enabled = false
                    if player.PlayerGui then
                        if player.PlayerGui:FindFirstChild("IntroGui") then
                            player.PlayerGui.IntroGui.Enabled = false
                        end
                        if player.PlayerGui:FindFirstChild("ScreenGui") then
                            player.PlayerGui.ScreenGui.Enabled = true
                        end
                    end
                end)
                
                -- Wait until new character is loaded
                repeat 
                    wait(0.1)
                    if not player or not player.Character then
                        break
                    end
                until player.Character:FindFirstChild("HumanoidRootPart")
                
                -- Teleport to last location
                if lastLocation and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
                    pcall(function()
                        player.Character.HumanoidRootPart.CFrame = CFrame.new(lastLocation)
                    end)
                end
            end
            
            wait(0.1)
        end
    end
    task.spawn(respawnLoop)
    
end)()
