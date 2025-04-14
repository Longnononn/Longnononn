-- GUI đơn giản
local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local Button = Instance.new("TextButton")

ScreenGui.Parent = game.CoreGui
ScreenGui.Name = "DeadRailAutoGUI"

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.new(0.2, 0.2, 0.2)
Frame.Position = UDim2.new(0.4, 0, 0.4, 0)
Frame.Size = UDim2.new(0, 200, 0, 100)
Frame.BorderSizePixel = 0

Button.Parent = Frame
Button.BackgroundColor3 = Color3.new(0.3, 0.3, 0.3)
Button.Position = UDim2.new(0.1, 0, 0.3, 0)
Button.Size = UDim2.new(0.8, 0, 0.4, 0)
Button.Text = "Auto Farm Trái Phiếu"
Button.TextColor3 = Color3.new(1, 1, 1)
Button.TextScaled = true
Button.BorderSizePixel = 0

-- Hàm chính
Button.MouseButton1Click:Connect(function()
    -- Bay đến các địa điểm cụ thể để nhặt Trái Phiếu

    -- 1. Lâu đài
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-132, 123, -245))
    wait(2)
    -- Nhặt Trái Phiếu tại lâu đài
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "Trái Phiếu" and v:IsA("TouchTransmitter") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            wait()
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end

    wait(2)

    -- 2. Khu trại quân đội
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(110, 170, 900))
    wait(2)
    -- Nhặt Trái Phiếu tại khu trại quân đội
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "Trái Phiếu" and v:IsA("TouchTransmitter") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            wait()
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end

    wait(2)

    -- 3. Chặng 80km cuối
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(2150, 305, 6700))
    wait(2)
    -- Nhặt Trái Phiếu tại chặng cuối
    for _, v in pairs(game:GetService("Workspace"):GetDescendants()) do
        if v.Name == "Trái Phiếu" and v:IsA("TouchTransmitter") then
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 0)
            wait()
            firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v.Parent, 1)
        end
    end

    wait(2)

    -- 4. Auto sang ván mới
    game:GetService("ReplicatedStorage").RemoteEvents.Matchmaking.LeaveMatch:FireServer()
    wait(3)

    -- Bay đến chỗ vào ván
    game.Players.LocalPlayer.Character:MoveTo(Vector3.new(110, 150, 190))
    wait(2)

    -- Chọn chế độ Norman
    local Rep = game:GetService("ReplicatedStorage")
    Rep.RemoteEvents.Matchmaking.SelectDifficulty:FireServer("Norman")

    wait(1)

    -- Tự động bấm nút tạo
    Rep.RemoteEvents.Matchmaking.StartMatch:FireServer()
end)
