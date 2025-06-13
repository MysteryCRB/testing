_G.cum = true
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
        [1] = "+MS25"
    }
}

game:GetService("ReplicatedStorage").RemoteEvent:FireServer(unpack(args))
wait()
local args = {
    [1] = {
        [1] = "+JF25"
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
