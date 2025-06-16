_G.cum = true
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage.RemoteEvent

local function fireEvent(args)
    RemoteEvent:FireServer(unpack(args))
end

-- Başlangıçta FireServer işlemi
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
            [1] = "+PP23"
        }
    }
    fireEvent(args)
    
    -- Daha hızlı ve sunucu dostu işlem için Heartbeat kullanımı
    game:GetService("RunService").Heartbeat:Wait() -- Bu, çok daha hızlı çalışır ve sunucuyu etkilemez
    
    -- Boş parametre ile FireServer işlemi
    args = {
        [1] = {
            [1] = ""
        }
    }
    fireEvent(args)
    
    -- task.wait() ile işlemi hızlandırma
    task.wait(0.001) -- Kısa bekleme süresi ile işlem hızlanır
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
