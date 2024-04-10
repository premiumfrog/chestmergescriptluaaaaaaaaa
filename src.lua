-- do not touch
local screenGui = Instance.new("ScreenGui")
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

-- Create a Frame for the buttons
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 250)
frame.Position = UDim2.new(0, 10, 1, -300)
frame.BackgroundColor3 = Color3.new(0, 0, 0)
frame.BackgroundTransparency = 0.2
frame.Parent = screenGui

local UICorner = Instance.new("UICorner")
UICorner.CornerRadius = (.8)

-- Buy Chest Function
local button1 = Instance.new("TextButton")
button1.Size = UDim2.new(0, 180, 0, 30)
button1.Position = UDim2.new(0, 10, 0, 10)
button1.BackgroundColor3 = Color3.new(0, 0.5, 0)
button1.Text = "Buy Chest"
button1.TextColor3 = Color3.new(1, 1, 1)
button1.Parent = frame

-- Merge Chest Function
local button2 = Instance.new("TextButton")
button2.Size = UDim2.new(0, 180, 0, 30)
button2.Position = UDim2.new(0, 10, 0, 50)
button2.BackgroundColor3 = Color3.new(0, 0.5, 0)
button2.Text = "Merge Chests"
button2.TextColor3 = Color3.new(1, 1, 1)
button2.Parent = frame

-- Upgrade Cash Deposited Function
local button3 = Instance.new("TextButton")
button3.Size = UDim2.new(0, 180, 0, 30)
button3.Position = UDim2.new(0, 10, 0, 90)
button3.BackgroundColor3 = Color3.new(0, 0.5, 0)
button3.Text = "Upgrade Cash Deposited"
button3.TextColor3 = Color3.new(1, 1, 1)
button3.Parent = frame

-- New Button: Add 100k Points
local button4 = Instance.new("TextButton")
button4.Size = UDim2.new(0, 180, 0, 30)
button4.Position = UDim2.new(0, 10, 0, 130)
button4.BackgroundColor3 = Color3.new(0, 0.5, 0)
button4.Text = "Add 1M Points"
button4.TextColor3 = Color3.new(1, 1, 1)
button4.Parent = frame

-- New Button: Give everyone inf deposited
local button5 = Instance.new("TextButton")
button5.Size = UDim2.new(0, 180, 0, 30)
button5.Position = UDim2.new(0, 10, 0, 170)
button5.BackgroundColor3 = Color3.new(0, 0.5, 0)
button5.Text = "Give Everyone INF Deposited"
button5.TextColor3 = Color3.new(1, 1, 1)
button5.Parent = frame

-- Create a label at the bottom of the UI with a smaller font size
local label = Instance.new("TextLabel")
label.Size = UDim2.new(0, 180, 0, 30)
label.Position = UDim2.new(0, 10, 0, 210)
label.BackgroundColor3 = Color3.new(0, 0, 0)
label.BackgroundTransparency = 0.7
label.TextColor3 = Color3.new(1, 1, 1)
label.Text = "premiumfrog was here"
label.FontSize = Enum.FontSize.Size12 
label.Parent = frame

local function onButtonClick(button, scriptFunction, args)
    button.MouseButton1Click:Connect(function()
        scriptFunction(args)
    end)
end

local function script1(args)
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TycoonSystem"):WaitForChild("AddCell"):FireServer(unpack(args))
end

local function script2(args)
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TycoonSystem"):WaitForChild("Merge"):InvokeServer(unpack(args))
end

local function script3(args)
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TycoonSystem"):WaitForChild("UpgradeDeposit"):FireServer(unpack(args))
end

local function script4(args)
    game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TycoonSystem"):WaitForChild("UpdateXPValue"):FireServer(unpack(args))
end

-- give everyone inf deposited
local function script5()
    local tycoons = workspace:WaitForChild("Tycoons")
    for i = 1, 6 do
        local tycoon = tycoons:WaitForChild("Tycoon" .. i)
        local args = {
            [1] = tycoon,
            [2] = math.huge
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes"):WaitForChild("TycoonSystem"):WaitForChild("Deposit"):FireServer(unpack(args))
    end
end

-- Define arguments
local args1 = {
    [1] = workspace:WaitForChild("Tycoons"):WaitForChild("Tycoon1"),
    [2] = workspace:WaitForChild("Tycoons"):WaitForChild("Tycoon1"):WaitForChild("Upgrades"):WaitForChild("AddCell")
}

local args2 = {
    [1] = workspace:WaitForChild("Tycoons"):WaitForChild("Tycoon1")
}

local args3 = {
    [1] = workspace:WaitForChild("Tycoons"):WaitForChild("Tycoon1"),
    [2] = workspace:WaitForChild("Tycoons"):WaitForChild("Tycoon1"):WaitForChild("Upgrades"):WaitForChild("UpgradeDeposit")
}

local args4 = {
    [1] = 1000000
}

-- onnect buttons to their respective scripts with arguments
onButtonClick(button1, script1, args1)
onButtonClick(button2, script2, args2)
onButtonClick(button3, script3, args3)
onButtonClick(button4, script4, args4)
onButtonClick(button5, script5)

warn("------------------------------------------------------")
warn("Buy Chest and Upgrade Cash Deposited require money")
warn("Merge Chests require 5 of the same chests")
warn("------------------------------------------------------")
