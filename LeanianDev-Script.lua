-- Script untuk The Hunt: Mega Edition (PlaceId: 124180448122765)
local targetPlaceId = 124180448122765
if game.PlaceId ~= targetPlaceId then
    print("Script ini hanya untuk The Hunt: Mega Edition!")
    return
end

-- Nama Script dan Kredit
local scriptName = "LeanianDev"
local credit = "Telegram: @SirLeanian\nNeed this script with better and more complete features? Contact the Telegram account listed."

-- Fungsi untuk Auto Bobber
local function autoBobber()
    while task.wait() do
        -- Cari bobber di workspace
        local bobber = workspace:FindFirstChild("Bobber") -- Ganti "Bobber" dengan nama objek yang benar
        if bobber and bobber:FindFirstChild("MovementScript") then -- Asumsi ada script yang mengatur pergerakan bobber
            -- Jika bobber bergerak, tarik ikan
            firetouchinterest(bobber, game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
            firetouchinterest(bobber, game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
        end
    end
end

-- Fungsi untuk Auto Shake
local function autoShake()
    while task.wait() do
        -- Cari event atau fungsi yang mengatur shake
        local shakeEvent = game:GetService("ReplicatedStorage"):FindFirstChild("ShakeEvent") -- Ganti dengan nama event yang benar
        if shakeEvent then
            shakeEvent:FireServer()
        end
    end
end

-- Fungsi untuk Instant Reel
local function instantReel()
    -- Cari event atau fungsi yang mengatur reel
    local reelEvent = game:GetService("ReplicatedStorage"):FindFirstChild("ReelEvent") -- Ganti dengan nama event yang benar
    if reelEvent then
        reelEvent:FireServer()
    end
end

-- Fungsi untuk Teleport ke Semua Pulau
local function teleportToIslands()
    local islands = {
        Vector3.new(100, 0, 100), -- Ganti dengan koordinat pulau 1
        Vector3.new(200, 0, 200), -- Ganti dengan koordinat pulau 2
        Vector3.new(300, 0, 300), -- Ganti dengan koordinat pulau 3
        -- Tambahkan koordinat pulau lainnya di sini
    }

    for _, islandPos in pairs(islands) do
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(islandPos)
        task.wait(2) -- Tunggu 2 detik sebelum teleport ke pulau berikutnya
    end
end

-- Fungsi untuk Membuat UI
local function createGUI()
    local ScreenGui = Instance.new("ScreenGui")
    local MainFrame = Instance.new("Frame")
    local Title = Instance.new("TextLabel")
    local CreditLabel = Instance.new("TextLabel")
    local CheatListFrame = Instance.new("Frame")
    local AutoBobberButton = Instance.new("TextButton")
    local AutoShakeButton = Instance.new("TextButton")
    local InstantReelButton = Instance.new("TextButton")
    local TeleportButton = Instance.new("TextButton")

    -- ScreenGui
    ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
    ScreenGui.Name = scriptName

    -- MainFrame (Latar Belakang Utama)
    MainFrame.Parent = ScreenGui
    MainFrame.Size = UDim2.new(0, 300, 0, 250)
    MainFrame.Position = UDim2.new(0.5, -150, 0.5, -125)
    MainFrame.BackgroundColor3 = Color3.new(0.8, 0, 0) -- Warna merah
    MainFrame.BorderSizePixel = 0

    -- Title (Judul Script)
    Title.Parent = MainFrame
    Title.Size = UDim2.new(1, 0, 0.2, 0)
    Title.Position = UDim2.new(0, 0, 0, 0)
    Title.Text = scriptName
    Title.TextColor3 = Color3.new(1, 1, 1) -- Warna putih
    Title.Font = Enum.Font.SourceSansBold
    Title.TextSize = 20
    Title.BackgroundTransparency = 1

    -- CreditLabel (Kredit)
    CreditLabel.Parent = MainFrame
    CreditLabel.Size = UDim2.new(1, 0, 0.2, 0)
    CreditLabel.Position = UDim2.new(0, 0, 0.8, 0)
    CreditLabel.Text = credit
    CreditLabel.TextColor3 = Color3.new(1, 1, 1) -- Warna putih
    CreditLabel.Font = Enum.Font.SourceSans
    CreditLabel.TextSize = 14
    CreditLabel.BackgroundTransparency = 1
    CreditLabel.TextWrapped = true

    -- CheatListFrame (Area Daftar Cheat)
    CheatListFrame.Parent = MainFrame
    CheatListFrame.Size = UDim2.new(0.9, 0, 0.5, 0)
    CheatListFrame.Position = UDim2.new(0.05, 0, 0.25, 0)
    CheatListFrame.BackgroundColor3 = Color3.new(1, 1, 1) -- Warna putih
    CheatListFrame.BackgroundTransparency = 0.5 -- Transparansi 50%
    CheatListFrame.BorderSizePixel = 0

    -- Auto Bobber Button
    AutoBobberButton.Parent = CheatListFrame
    AutoBobberButton.Size = UDim2.new(0.8, 0, 0.2, 0)
    AutoBobberButton.Position = UDim2.new(0.1, 0, 0.1, 0)
    AutoBobberButton.Text = "Auto Bobber"
    AutoBobberButton.TextColor3 = Color3.new(0, 0, 0) -- Warna hitam
    AutoBobberButton.BackgroundColor3 = Color3.new(1, 1, 1) -- Warna putih
    AutoBobberButton.MouseButton1Click:Connect(autoBobber)

    -- Auto Shake Button
    AutoShakeButton.Parent = CheatListFrame
    AutoShakeButton.Size = UDim2.new(0.8, 0, 0.2, 0)
    AutoShakeButton.Position = UDim2.new(0.1, 0, 0.35, 0)
    AutoShakeButton.Text = "Auto Shake"
    AutoShakeButton.TextColor3 = Color3.new(0, 0, 0) -- Warna hitam
    AutoShakeButton.BackgroundColor3 = Color3.new(1, 1, 1) -- Warna putih
    AutoShakeButton.MouseButton1Click:Connect(autoShake)

    -- Instant Reel Button
    InstantReelButton.Parent = CheatListFrame
    InstantReelButton.Size = UDim2.new(0.8, 0, 0.2, 0)
    InstantReelButton.Position = UDim2.new(0.1, 0, 0.6, 0)
    InstantReelButton.Text = "Instant Reel"
    InstantReelButton.TextColor3 = Color3.new(0, 0, 0) -- Warna hitam
    InstantReelButton.BackgroundColor3 = Color3.new(1, 1, 1) -- Warna putih
    InstantReelButton.MouseButton1Click:Connect(instantReel)

    -- Teleport Button
    TeleportButton.Parent = CheatListFrame
    TeleportButton.Size = UDim2.new(0.8, 0, 0.2, 0)
    TeleportButton.Position = UDim2.new(0.1, 0, 0.85, 0)
    TeleportButton.Text = "Teleport to Islands"
    TeleportButton.TextColor3 = Color3.new(0, 0, 0) -- Warna hitam
    TeleportButton.BackgroundColor3 = Color3.new(1, 1, 1) -- Warna putih
    TeleportButton.MouseButton1Click:Connect(teleportToIslands)
end

-- Jalankan GUI
createGUI()
print("GUI berhasil dibuat! Cek layar Anda.")
