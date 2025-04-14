--[[
    Auto Bonds Script for Dead Rail (KRNL Compatible)
    Created by: long dzz
    Description:
        - Tự động kiểm tra trạng thái "Bonds"
        - Nếu chưa được kích hoạt, sẽ tự động gửi remote yêu cầu kích hoạt
        - Chạy mỗi 1 giây liên tục
]]--

local success, err = pcall(function()
    local ReplicatedStorage = game:GetService("ReplicatedStorage")
    local Players = game:GetService("Players")
    local LocalPlayer = Players.LocalPlayer

    -- Tìm folder Remotes
    local Remotes = ReplicatedStorage:FindFirstChild("Remotes")
    if not Remotes then
        warn("❌ Không tìm thấy folder 'Remotes'. Script dừng.")
        return
    end

    -- Tìm remote để gửi yêu cầu kích hoạt Bonds
    local CommF_ = Remotes:FindFirstChild("CommF_")
    if not CommF_ then
        warn("❌ Không tìm thấy Remote 'CommF_'. Script dừng.")
        return
    end

    -- Hàm kiểm tra và kích hoạt Bonds
    local function activateBonds()
        local dataFolder = LocalPlayer:FindFirstChild("Data")
        local bonds = dataFolder and dataFolder:FindFirstChild("Bonds")

        if bonds and bonds.Value ~= "Activated" then
            CommF_:InvokeServer("ActivateBonds")
            print("✅ Bonds đã được kích hoạt!")
        end
    end

    -- Lặp kiểm tra và kích hoạt nếu cần
    while task.wait(1) do
        activateBonds()
    end
end)

-- Báo lỗi nếu có vấn đề
if not success then
    warn("❌ Script lỗi:", err)
else
    print("🔥 Auto Bonds script đã khởi động thành công!")
end
