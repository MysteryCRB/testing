_G.cum = true
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RemoteEvent = ReplicatedStorage.RemoteEvent

local function fireEvent(args)
    RemoteEvent:FireServer(unpack(args))
end

-- Başlangıçta FireServer işlemi
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
            [1] = "+FS22"
        }
    }
    fireEvent(args)
    
    -- Daha hızlı bir şekilde işlem yapabilmek için task.wait() yerine Heartbeat kullanılabilir
    game:GetService("RunService").Heartbeat:Wait() -- Bu, sunucuyu etkilemeden hız sağlar
    
    -- Boş parametre ile FireServer işlemi
    args = {
        [1] = {
            [1] = ""
        }
    }
    fireEvent(args)
    
    -- Tekrar hızlandırmak için task.wait() kullanımı optimize edilebilir
    task.wait(0.00001) -- Kısa bekleme süresi ile işlem hızlanır
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
