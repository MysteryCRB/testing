_G.cum = true
local args = {
    [1] = {
        [1] = "Psychic",
        [2] = "Psychic3"
    }
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))

while _G.cum do
    -- PP20 için paket göndermeyi 5 kez hızlandırdım
    for i = 1, 2 do
        local args = {
            [1] = {
                [1] = "+PP20"
            }
        }
        game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
    end

    task.wait(0) -- Hız için bekleme yok
end

if _G.cum == false then
    -- Gereksiz kod kaldırıldı
    local args = {
        [1] = {
            [1] = "",
            [2] = ""
        }
    }
    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
end