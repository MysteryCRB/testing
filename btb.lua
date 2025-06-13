_G.cum = true
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage.RemoteEvent

local function fireEvent(args)
    RemoteEvent:FireServer(unpack(args))
end

-- Başlangıçta FireServer işlemi
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
            [1] = "+BT31"
        }
    }
    fireEvent(args)
    
    -- Hızlı ve sunucu dostu işlem için Heartbeat kullanımı
    game:GetService("RunService").Heartbeat:Wait() -- Bu, çok daha hızlı çalışır ve sunucuyu etkilemez
    
    -- Boş parametre ile FireServer işlemi
    args = {
        [1] = {
            [1] = ""
        }
    }
    fireEvent(args)
    
    -- task.wait() kullanımı daha kısa sürede yapılabilir
    task.wait(0.0001) -- Kısa bekleme süresi ile işlem hızlanır
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
