local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/newmenu'))()

local player = game.Players.LocalPlayer

-- Key system removed, directly create Rayfield menu
local Window = Rayfield:CreateWindow({
    Name = "SPTS:MODDED Script by CRB👿",
    Icon = "atom", -- Icon in Topbar
    LoadingTitle = "CRB Script",
    LoadingSubtitle = "by CRB👿",
    Theme = "DarkBlue", -- Theme
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,

    ConfigurationSaving = {
        Enabled = true,
        FolderName = nil,
        FileName = "Big Hub"
    },

    Discord = {
        Enabled = true,
        Invite = "gjeuUAgkQz",
        RememberJoins = false
    },

    KeySystem = false, -- Key system disabled
})

local MainTab = Window:CreateTab("👑Main", 0) -- Title, Image
local OtherTab = Window:CreateTab("👺Other", 0) -- Title, Image
local MiscTab = Window:CreateTab("💎Misc", 0) -- Title, Image
local RageTab = Window:CreateTab("👽Rage", 0) -- Title, Image
local MainSection = MainTab:CreateSection("Main")
local OtherSection = OtherTab:CreateSection("Other")
local MiscSection = MiscTab:CreateSection("Misc")
local RageSection = RageTab:CreateSection("Rage")

local Label = MainTab:CreateLabel("Last Training Areas (Faster)", 0, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme

local Button = MainTab:CreateButton({
    Name = "Fist(10X-15X)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/asdasdasd/refs/heads/main/ASDASD", true))()
    end,
})
local Button = MainTab:CreateButton({
    Name = "Body(8X-12X)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/asdasdasd/refs/heads/main/ASDASDFEGHWER", true))()
    end,
})
local Button = MainTab:CreateButton({
    Name = "Psychic(10X-15X)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/luadevmodded/refs/heads/main/PS", true))()
    end,
})
local Button = MainTab:CreateButton({
    Name = "MS/JF(5X-10X)",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/massthix/refs/heads/main/speed", true))()
    end,
})
local Button = MiscTab:CreateButton({
    Name = "ESP",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/esp", true))()
    end,
})
local Label = RageTab:CreateLabel("Soon!!", 0, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme
local Button = RageTab:CreateButton({
    Name = "Rage(Soul-Attack)",
    Callback = function()
    end,
})
local Button = RageTab:CreateButton({
    Name = "Rage(PS-VERYLAGGY)",
    Callback = function()
    end,
})
local Button = RageTab:CreateButton({
    Name = "Rage(Grim-Reaper)",
    Callback = function()
    end,
})
local Button = MiscTab:CreateButton({
    Name = "FPS BOOSTER",
    Callback = function()
        --Made by Massthix
        _G.Settings = {
            Players = {
                ["Ignore Me"] = true, -- Ignore your Character
                ["Ignore Others"] = true -- Ignore other Characters
            },
            Meshes = {
                Destroy = false, -- Destroy Meshes
                LowDetail = true -- Low detail meshes (NOT SURE IT DOES ANYTHING)
            },
            Images = {
                Invisible = true, -- Invisible Images
                LowDetail = false, -- Low detail images (NOT SURE IT DOES ANYTHING)
                Destroy = false, -- Destroy Images
            },
            ["No Particles"] = true, -- Disables all ParticleEmitter, Trail, Smoke, Fire and Sparkles
            ["No Camera Effects"] = true, -- Disables all PostEffect's (Camera/Lighting Effects)
            ["No Explosions"] = true, -- Makes Explosion's invisible
            ["No Clothes"] = true, -- Removes Clothing from the game
            ["Low Water Graphics"] = true, -- Removes Water Quality
            ["No Shadows"] = true, -- Remove Shadows
            ["Low Rendering"] = true, -- Lower Rendering
            ["Low Quality Parts"] = true -- Lower quality parts
        }
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/fps"))()
    end,
})

local deathreturnactive = true
local player = game:GetService("Players").LocalPlayer
local lastlocation = nil
local deathLoop = nil -- AutoDeath loop control variable

-- Function to update last location
local function updateLastLocation()
    while true do
        if player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            lastlocation = player.Character.HumanoidRootPart.Position
        end
        wait(5)
    end
end
task.spawn(updateLastLocation) -- Run in infinite loop

-- Toggle AutoDeath function
local function toggleAutoDeath(enabled)
    if enabled then
        if deathLoop then return end -- Don't start if already running
        print("AutoDeath started.") -- Control message
        deathLoop = task.spawn(function()
            while true do
                -- Wait for character to spawn
                repeat wait() until player.Character and player.Character:FindFirstChildOfClass("Humanoid")

                local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

                -- Wait until Humanoid is fully loaded
                repeat wait() until humanoid and humanoid.Health > 0

                -- Make sure player dies
                while humanoid.Health > 0 do
                    humanoid:TakeDamage(humanoid.MaxHealth) -- Kill by dealing damage
                    humanoid.Health = 0 -- Set to zero to be sure
                    wait(0.1)
                end

                wait(9) -- Loop duration
            end
        end)
    else
        if deathLoop then
            task.cancel(deathLoop)
            deathLoop = nil
            print("AutoDeath stopped.") -- Control message
        end
    end
end

-- Function to respawn character after death
local function respawnLoop()
    while true do
        -- Wait for character to spawn
        repeat wait() until player.Character and player.Character:FindFirstChildOfClass("Humanoid")

        local humanoid = player.Character:FindFirstChildOfClass("Humanoid")

        if humanoid and humanoid.Health <= 0 then
            wait(1)

            -- Respawn process
            local remoteEvent = game:GetService("ReplicatedStorage"):FindFirstChild("RemoteEvent")
            if remoteEvent then
                remoteEvent:FireServer({[1] = "Respawn"})
            end

            -- Reset UI settings
            wait(1)
            game.Lighting.Blur.Enabled = false
            game.Players.LocalPlayer.PlayerGui.IntroGui.Enabled = false
            game.Players.LocalPlayer.PlayerGui.ScreenGui.Enabled = true

            -- Wait until new character is loaded
            repeat wait(0.1) until player.Character and player.Character:FindFirstChild("HumanoidRootPart")

            -- Teleport to last location
            if deathreturnactive and lastlocation then
                player.Character.HumanoidRootPart.CFrame = CFrame.new(lastlocation)
            end
        end

        wait(0.1)
    end
end
task.spawn(respawnLoop) -- Run in infinite loop

-- 📌 **TOGGLE BUTONU**
local Toggle = MiscTab:CreateToggle({
    Name = "StackX 💀",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        toggleAutoDeath(Value) -- AutoDeath aç/kapat
    end
}) -- 🔴 **HATA YOK! `})` ile düzgün kapanıyor.**

local ScreenGui -- Burada global bir değişken olarak tanımladık

local Toggle = MiscTab:CreateToggle({
    Name = "New NoLag",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        if Value then
            -- Statları göstermek için gerekli servisleri al
            local Players = game:GetService("Players")
            local LocalPlayer = Players.LocalPlayer
            local PlayerStats = LocalPlayer.PrivateStats

            -- Eğer Screen Literalist ile oluşturuldu: 30 Ekim 2024 Çarşamba, 00:05:35 WIB

            -- Eğer ScreenGui oluşturulmadıysa, oluşturuyoruz
            if not ScreenGui then
                ScreenGui = Instance.new("ScreenGui")
                ScreenGui.Parent = game.CoreGui

                -- Statları göstermek için bir Frame oluştur
                local StatsFrame = Instance.new("Frame")
                StatsFrame.Size = UDim2.new(0, 600, 0, 350)
                StatsFrame.Position = UDim2.new(0, 10, 0.5, -75) -- Sol orta
                StatsFrame.BackgroundColor3 = Color3.new(0.1, 0.1, 0.1)
                StatsFrame.BackgroundTransparency = 1
                StatsFrame.Parent = ScreenGui

                -- Statları göstermek için TextLabel'lar oluştur
                local FistLabel = Instance.new("TextLabel")
                FistLabel.Size = UDim2.new(1, 0, 0, 30)
                FistLabel.Position = UDim2.new(0, 100, 0, 0)
                FistLabel.BackgroundTransparency = 1
                FistLabel.TextColor3 = Color3.new(0, 0, 139)
                FistLabel.TextSize = 20
                FistLabel.Font = Enum.Font.GothamBold  -- Font değişikliği
                FistLabel.Parent = StatsFrame

                local BodyLabel = Instance.new("TextLabel")
                BodyLabel.Size = UDim2.new(1, 0, 0, 30)
                BodyLabel.Position = UDim2.new(0, 100, 0, 30)
                BodyLabel.BackgroundTransparency = 1
                BodyLabel.TextColor3 = Color3.new(0, 0, 139)
                BodyLabel.TextSize = 20
                BodyLabel.Font = Enum.Font.GothamBold  -- Font değişikliği
                BodyLabel.Parent = StatsFrame

                local PsychicLabel = Instance.new("TextLabel")
                PsychicLabel.Size = UDim2.new(1, 0, 0, 30)
                PsychicLabel.Position = UDim2.new(0, 100, 0, 60)
                PsychicLabel.BackgroundTransparency = 1
                PsychicLabel.TextColor3 = Color3.new(0, 0, 139)
                PsychicLabel.TextSize = 20
                PsychicLabel.Font = Enum.Font.GothamBold  -- Font değişikliği
                PsychicLabel.Parent = StatsFrame

                local SpeedLabel = Instance.new("TextLabel")
                SpeedLabel.Size = UDim2.new(1, 0, 0, 30)
                SpeedLabel.Position = UDim2.new(0, 100, 0, 90)
                SpeedLabel.BackgroundTransparency = 1
                SpeedLabel.TextColor3 = Color3.new(0, 0, 139)
                SpeedLabel.TextSize = 20
                SpeedLabel.Font = Enum.Font.GothamBold  -- Font değişikliği
                SpeedLabel.Parent = StatsFrame

                local JumpLabel = Instance.new("TextLabel")
                JumpLabel.Size = UDim2.new(1, 0, 0, 30)
                JumpLabel.Position = UDim2.new(0, 100, 0, 120)
                JumpLabel.BackgroundTransparency = 1
                JumpLabel.TextColor3 = Color3.new(0, 0, 139)
                JumpLabel.TextSize = 20
                JumpLabel.Font = Enum.Font.GothamBold  -- Font değişikliği
                JumpLabel.Parent = StatsFrame

                -- Sayıları kısaltmak için fonksiyon
                function converttoletter(num)
                    if num >= 1e21 then
                        return string.format("%.2f Sx", num / 1e21)
                    elseif num >= 1e18 then
                        return string.format("%.2f Qi", num / 1e18)
                    elseif num >= 1e15 then
                        return string.format("%.2f Qa", num / 1e15)
                    elseif num >= 1e12 then
                        return string.format("%.2f T", num / 1e12)
                    elseif num >= 1e9 then
                        return string.format("%.2f B", num / 1e9)
                    elseif num >= 1e6 then
                        return string.format("%.2f M", num / 1e6)
                    elseif num >= 1e3 then
                        return string.format("%.2f K", num / 1e3)
                    else
                        return tostring(num)
                    end
                end

                -- Statları hızlı güncelleyen fonksiyon
                local function updateStats()
                    local FistValue = PlayerStats.FistStrength.Value
                    local BodyValue = PlayerStats.BodyToughness.Value
                    local PsychicValue = PlayerStats.PsychicPower.Value
                    local SpeedValue = PlayerStats.MovementSpeed.Value
                    local JumpValue = PlayerStats.JumpForce.Value

                    -- Statları hemen güncellemeye başla
                    FistLabel.Text = "Fist: " .. converttoletter(FistValue)
                    BodyLabel.Text = "Body: " .. converttoletter(BodyValue)
                    PsychicLabel.Text = "Psychic: " .. converttoletter(PsychicValue)
                    SpeedLabel.Text = "Speed: " .. converttoletter(SpeedValue)
                    JumpLabel.Text = "Jump: " .. converttoletter(JumpValue)
                end

                -- Statları hızlı bir şekilde güncellemeye başla
                game:GetService("RunService").Heartbeat:Connect(function()
                    updateStats()
                end)
            end
        else
            -- Ekranı ve ScreenGui'yi kaldırarak kapat
            if ScreenGui then
                ScreenGui:Destroy() -- ScreenGui'yi yok et
                ScreenGui = nil -- Referansı sıfırla
            end
            print("Statlar kapatıldı")
        end
    end,
})

local Button = MiscTab:CreateButton({
    Name = "Anti AFK",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/AFK", true))()
    end,
})
local Label = OtherTab:CreateLabel("Fist", 0, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme,
local Button = OtherTab:CreateButton({
    Name = "Fist100B",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS5", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist10T",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS6", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist1Qa",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS7", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist150Qa",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS8", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist15Qi",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS9", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist2.55Sx",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS10", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist1Sp",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS11", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist500Sp",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS12", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist250Oc",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS13", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist150No",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS14", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist55.5DC",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS15", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist30Ud",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS16", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist11Dd",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS17", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist4Td",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS18", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist3Qad",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/FS19", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Fist1.8Qid",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MysteryCRB/testing/refs/heads/main/FSBoost.lua", true))()
    end,
})
local Label = OtherTab:CreateLabel("Body", 0, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme
local Button = OtherTab:CreateButton({
    Name = "Body10T",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT10", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body1Qa",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT11", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body50Qa",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT12", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body450Qi",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT13", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body40Sx",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT14", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body3Sp",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT15", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body250Sp",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT16", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body20Oc",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT17", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body2No",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT18", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body200No",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT19", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body15Dc",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT20", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body1Ud",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT21", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body250Ud",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT22", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body10Dd",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT23", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body1Td",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT24", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body100Td",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT25", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body15Qad",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT26", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body2Qid",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT27", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Body250Qid",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/BT28", true))()
    end,
})
local Label = OtherTab:CreateLabel("Psychic", 0, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme
local Button = OtherTab:CreateButton({
    Name = "Psy1Qa",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS6", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy333Qa",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS7", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy111Qi",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS8", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy33.3Sx",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS9", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy11.1Sp",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS10", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy3.36Oc",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS11", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy1.1No",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS12", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy444No",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS13", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy111Dc",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS14", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy55.5Ud",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS15", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy22.2Dd",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS16", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy7.7Td",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS17", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy3.3Qad",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MysteryCRB/testing/refs/heads/main/PS18.lua", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy1.1Qid",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/PS19", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy444Qid",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MysteryCRB/testing/refs/heads/main/PS20.lua", true))()
    end,
})
local Button = OtherTab:CreateButton({
    Name = "Psy1.1Qid Boost",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/MysteryCRB/testing/refs/heads/main/Boost.lua", true))()
    end,
})
local Label = OtherTab:CreateLabel("MSJF", 0, Color3.fromRGB(255, 255, 255), false) -- Title, Icon, Color, IgnoreTheme
local Dropdown = OtherTab:CreateDropdown({
    Name = "MSJF",
    Options = {"10Td", "10Dc", "10No", "10Oc", "10Sp", "100Sx"},
    CurrentOption = {""}, -- Başlangıçta seçili olan seçenek
    MultipleOptions = false, -- Birden fazla seçeneği aynı anda seçebilmek için
    Flag = "Dropdown1",
    Callback = function(Options)
        -- Seçili tüm seçenekleri ekrana yazdır (debug amaçlı)
        print("Seçili seçenekler: ", table.concat(Options, ", "))
        -- Eğer "10Td" seçildiyse scripti çalıştır
        if table.find(Options, "10Td") then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/MS23", true))()
        end
        -- Eğer "10Dc" seçildiyse scripti çalıştır
        if table.find(Options, "10Dc") then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/MS22", true))()
        end
        -- Eğer "10No" seçildiyse scripti çalıştır
        if table.find(Options, "10No") then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/MS21", true))()
        end
        -- Eğer "10Oc" seçildiyse scripti çalıştır
        if table.find(Options, "10Oc") then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/MS20", true))()
        end
        -- Eğer "10Sp" seçildiyse scripti çalıştır
        if table.find(Options, "10Sp") then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/MS19", true))()
        end
        -- Eğer "100Sx" seçildiyse scripti çalıştır
        if table.find(Options, "100Sx") then
            loadstring(game:HttpGet("https://raw.githubusercontent.com/massthix/testttt/refs/heads/main/MS18", true))()
        end
    end,
})