--[[ 💥✨🌈 Auto Bonds Script - Edited by long dzz 🌈✨💥 ]]--

-- Rainbow effect for UI
spawn(function()
    while wait() do
        local h = tick() % 5 / 5
        local color = Color3.fromHSV(h, 1, 1)
        if game.Players.LocalPlayer:FindFirstChild("PlayerGui") and game.Players.LocalPlayer.PlayerGui:FindFirstChild("Main") then
            local gui = game.Players.LocalPlayer.PlayerGui.Main
            if gui:FindFirstChild("Title") then
                gui.Title.TextColor3 = color
            end
        end
    end
end)

-- Auto Bonds core logic
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local CommF_ = ReplicatedStorage:WaitForChild("Remotes"):WaitForChild("CommF_")

-- GUI Frame (màu mè)
local ScreenGui = Instance.new("ScreenGui", game.CoreGui)
local Frame = Instance.new("Frame", ScreenGui)
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.Position = UDim2.new(0.5, -100, 0.1, 0)
Frame.BackgroundColor3 = Color3.fromRGB(50, 50, 255)
Frame.BackgroundTransparency = 0.3
Frame.BorderSizePixel = 2

local Label = Instance.new("TextLabel", Frame)
Label.Size = UDim2.new(1, 0, 1, 0)
Label.Text = "Auto Bonds by long dzz"
Label.TextScaled = true
Label.TextColor3 = Color3.fromRGB(255, 255, 255)
Label.BackgroundTransparency = 1

-- Kích hoạt Bonds nếu chưa
local function activateBonds()
    local status = LocalPlayer:WaitForChild("Data"):WaitForChild("Bonds").Value
    if status ~= "Activated" then
        CommF_:InvokeServer("ActivateBonds")
        print("💥 Bonds activated!")
    end
end

-- Vòng lặp tự động kiểm tra và kích hoạt Bonds
spawn(function()
    while wait(1) do
        activateBonds()
    end
end)

-- Bổ sung: chỉ cho người chơi tên là "long dzz"
if LocalPlayer.Name == "long dzz" then
    print("✨ Welcome, long dzz! Auto Bonds is running!")
end

--[[ 🌟 Script ends here 🌟 ]]--
