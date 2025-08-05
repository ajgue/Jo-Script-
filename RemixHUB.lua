local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "DeltaWelcome"
gui.ResetOnSpawn = false

-- الإطار الرئيسي
local main = Instance.new("Frame")
main.Parent = gui
main.AnchorPoint = Vector2.new(0.5, 0.5)
main.Position = UDim2.new(0.5, 0, 0.4, 0)
main.Size = UDim2.new(0, 300, 0, 300)
main.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
main.BackgroundTransparency = 0.1
main.BorderSizePixel = 0
main.Visible = false

local corner = Instance.new("UICorner", main)
corner.CornerRadius = UDim.new(0, 30)

-- الحفاظ على الشكل مربع
local ratio = Instance.new("UIAspectRatioConstraint", main)
ratio.AspectRatio = 1

-- صورة في المنتصف
local icon = Instance.new("ImageLabel", main)
icon.Size = UDim2.new(0.6, 0, 0.6, 0)
icon.AnchorPoint = Vector2.new(0.5, 0.5)
icon.Position = UDim2.new(0.5, 0, 0.4, 0)
icon.BackgroundTransparency = 1
icon.Image = "rbxassetid://98360849741395" -- غيّر الـID حسب رغبتك

-- النص أسفل الصورة
local text = Instance.new("TextLabel", main)
text.Size = UDim2.new(1, -20, 0, 60)
text.Position = UDim2.new(0, 10, 0.75, 0)
text.BackgroundTransparency = 1
text.Text = "مطور السكربت: سجاد!"
text.TextColor3 = Color3.new(1, 1, 1)
text.Font = Enum.Font.GothamBold
text.TextScaled = true
text.TextWrapped = true
text.TextXAlignment = Enum.TextXAlignment.Center
text.TextYAlignment = Enum.TextYAlignment.Center

-- خلفية نيازك (نقاط بيضاء متحركة)
for i = 1, 20 do
	local star = Instance.new("Frame", main)
	star.Size = UDim2.new(0, math.random(2, 4), 0, math.random(2, 4))
	star.Position = UDim2.new(math.random(), 0, math.random(), 0)
	star.BackgroundColor3 = Color3.new(1, 1, 1)
	star.BorderSizePixel = 0
	star.BackgroundTransparency = 0.3
	
	coroutine.wrap(function()
		while gui and gui.Parent do
			star.Position = UDim2.new(math.random(), 0, math.random(), 0)
			wait(math.random(1, 3))
		end
	end)()
end

-- أنميشن الدخول
main.Visible = true
main.BackgroundTransparency = 1
text.TextTransparency = 1
icon.ImageTransparency = 1

for i = 1, 10 do
	main.BackgroundTransparency -= 0.08
	text.TextTransparency -= 0.1
	icon.ImageTransparency -= 0.1
	wait(0.03)
end

wait(5)

-- أنميشن الخروج
for i = 1, 10 do
	main.BackgroundTransparency += 0.08
	text.TextTransparency += 0.1
	icon.ImageTransparency += 0.1
	wait(0.03)
end

gui:Destroy()
local args = {
    [1] = "RolePlayName",
    [2] = "\217\133\217\139\216\183\217\144\217\136\217\140\216\177 \216\162\217\132\217\142\216\179\217\144\218\169\217\146\216\177\216\168\217\139\216\170\217\140 \216\179\217\144\216\172\217\145\216\162\216\175\217\141"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))

local args = {
    [1] = "RolePlayBio",
    [2] = "\196\142\195\131\197\152\208\140 \196\164\199\151\198\129"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))

loadstring(game:HttpGet(("https://raw.githubusercontent.com/Y0dp/R7/refs/heads/main/TT.Lua")))()
MakeWindow({
  Hub = {
    Title = " RemixHUB",
    Animation = "جار التحميل... "
  },
  Key = {
    KeySystem = false,
    Title = "Key System",
    Description = "",
    KeyLink = "",
    Keys = {"1234"},
    Notifi = {
      Notifications = true,
      CorrectKey = "Running the Script...",
      Incorrectkey = "The key is incorrect",
      CopyKeyLink = "Copied to Clipboard"
    }
  }
})
MinimizeButton({
  Image = "rbxassetid://98360849741395",
  Size = {40, 40},
  Color = Color3.fromRGB(255, 125, 0),
  Corner = true,
  Stroke = false,
  StrokeColor = Color3.fromRGB(255, 125, 0)
})

local Main = MakeTab({
    Name = "المطور",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})
local Image = AddImageLabel(Main, {
  Name = "قناة السكربت",
  Image = "rbxassetid://98360849741395"
})
AddButton(Main, {
  Name = "انضم",
  Callback = function()
    setclipboard('https://t.me/xkua_r')
  end
})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local Label = AddTextLabel(Main,
 "User: " .. LocalPlayer.Name .. "\n" ..
 "Map: " .. game.PlaceId .. "\n" ..
 "Time: " .. os.date("%H:%M:%S")
)

task.spawn(function()
 while true do
  task.wait(1)
  Label.Update(
   "User: " .. LocalPlayer.Name .. "\n" ..
   "Map: " .. game.PlaceId .. "\n" ..
   "Time: " .. os.date("%H:%M:%S")
  )
 end
end)
local Main = MakeTab({
    Name = "القتل",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local playerNames = {}
for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        table.insert(playerNames, plr.Name)
    end
end

local selectedPlayerName = nil

local Dropdown = AddDropdown(Main, {
    Name = "اختر لاعب",
    Options = playerNames,
    Default = playerNames[1],
    Callback = function(Value)
        selectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "قتل بالسفينه",
    Callback = function()
        if not selectedPlayerName then
            warn("لم يتم اختيار لاعب")
            return
        end

        MakeNotifi({
            Title = "تم التشغيل",
            Text = "لا تفعل الامر اكثر من مرا",
            Time = 5
        })

        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local originalPosition = humanoidRootPart.Position
            local originalAnchoredState = humanoidRootPart.Anchored

            humanoidRootPart.CFrame = CFrame.new(634.18, -4.00, 1839.65)
            wait(0.5)

            local args = {
                "PickingBoat",
                "MilitaryBoatFree"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            wait(1.5)

            local function sitInBoat()
                local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name .. "Car")
                if not vehicle then return end

                local vehicleSeat = vehicle.Body:FindFirstChild("VehicleSeat")
                if not vehicleSeat then return end

                humanoidRootPart.Anchored = false
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                wait(0.2)

                humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.5, 0)
                wait(0.2)

                humanoid.Sit = true
                firetouchinterest(humanoidRootPart, vehicleSeat, 0)
                firetouchinterest(humanoidRootPart, vehicleSeat, 1)
                wait(0.5)

                if humanoid.SeatPart ~= vehicleSeat then
                    humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.5, 0)
                    humanoid.Sit = true
                    wait(0.5)
                end
            end

            sitInBoat()
            wait(0.5)

            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
            local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name .. "Car")

            if vehicle then
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0)))
                humanoidRootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 5, 0))

                local crazyStart = tick()
                while tick() - crazyStart < 2 do
                    local offset = Vector3.new(
                        math.random(-25, 12),
                        math.random(-13, 10),
                        math.random(-10, 18)
                    )
                    vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0) + offset))
                    wait(0.05)
                end
            end

            local targetDestination = Vector3.new(-86.00, -224.27, 34.57)
            if vehicle then
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetDestination))
                humanoidRootPart.CFrame = CFrame.new(targetDestination + Vector3.new(0, 5, 0))
            end

            wait(1)
            humanoidRootPart.Anchored = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

            if vehicle then
                vehicle:Destroy()
            end

            wait(0.5)
            humanoidRootPart.CFrame = CFrame.new(originalPosition)
            humanoidRootPart.Anchored = originalAnchoredState
            humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)

            local finalArgs = {
                [1] = "PickingBoat",
                [2] = "MilitaryBoatFree"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(finalArgs))

            wait(0.5)
            local deleteArgs = {
                [1] = "DeleteAllVehicles"
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(deleteArgs))
        else
            warn("اللاعب غير موجود أو لا يملك الشخصية")
        end
    end
})

AddButton(Main, {
    Name = "قتل سفينة بدون ركوب",
    Callback = function()
        if not selectedPlayerName then return end

        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local originalPosition = humanoidRootPart.Position
            local originalAnchoredState = humanoidRootPart.Anchored

            humanoidRootPart.CFrame = CFrame.new(634.18, -4.00, 1839.65)
            wait(0.5)

            local args = {
                "PickingBoat",
                "MilitaryBoatFree"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            wait(1.5)

            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
            local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name .. "Car")

            if vehicle then
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0)))
                humanoidRootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 5, 0))

                local crazyStart = tick()
                while tick() - crazyStart < 2 do
                    local offset = Vector3.new(
                        math.random(-25, 12),
                        math.random(-13, 10),
                        math.random(-10, 18)
                    )
                    vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0) + offset))
                    wait(0.05)
                end
            end

            local targetDestination = Vector3.new(-86.00, -224.27, 34.57)
            if vehicle then
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetDestination))
                humanoidRootPart.CFrame = CFrame.new(targetDestination + Vector3.new(0, 5, 0))
            end

            wait(1)
            humanoidRootPart.Anchored = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

            if vehicle then
                vehicle:Destroy()
            end

            wait(0.5)
            humanoidRootPart.CFrame = CFrame.new(originalPosition)
            humanoidRootPart.Anchored = originalAnchoredState
            humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)

            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
            wait(0.5)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("DeleteAllVehicles")
        end
    end
})

local section = AddSection(Main, {"قتل باص"})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local SelectedPlayerName = nil

local playerNames = {}
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        table.insert(playerNames, player.Name)
    end
end

local Dropdown = AddDropdown(Main, {
    Name = "اختر لاعب",
    Options = playerNames,
    Default = playerNames[1] or "",
    Callback = function(Value)
        SelectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "قتل بالباص",
    Callback = function()
        if not SelectedPlayerName then
            warn("اختر لاعبًا أولًا")
            return
        end

        local player = LocalPlayer
        local targetPlayer = Players:FindFirstChild(SelectedPlayerName)
        if not (targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then
            warn("اللاعب غير موجود أو لم يُحمّل")
            return
        end

        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        local originalPosition = humanoidRootPart.Position
        local originalAnchoredState = humanoidRootPart.Anchored

        humanoidRootPart.CFrame = CFrame.new(1082.86, 76.00, -1125.20)
        wait(0.3)

        local spawnArgs = {
            [1] = "PickingCar",
            [2] = "SchoolBus"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(spawnArgs))
        wait(3.5)

        local function sitInBus()
            local vehicleName = player.Name .. "Car"
            local vehicle = workspace.Vehicles:FindFirstChild(vehicleName)
            if not vehicle then return false end

            local vehicleSeat = vehicle.Body:FindFirstChild("VehicleSeat")
            if not vehicleSeat then return false end

            humanoidRootPart.Anchored = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

            humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.3, 0)
            wait(0.15)

            humanoid.Sit = true
            firetouchinterest(humanoidRootPart, vehicleSeat, 0)
            firetouchinterest(humanoidRootPart, vehicleSeat, 1)
            wait(0.3)

            if humanoid.SeatPart ~= vehicleSeat then
                humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.3, 0)
                humanoid.Sit = true
                wait(0.3)
            end

            return humanoid.SeatPart == vehicleSeat
        end

        if not sitInBus() then return end

        local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
        local vehicleName = player.Name .. "Car"
        local vehicle = workspace.Vehicles:FindFirstChild(vehicleName)

        if vehicle then
            local crazyStart = tick()
            while tick() - crazyStart < 2.5 do
                local offset = Vector3.new(
                    math.random(-25, 12),
                        math.random(-13, 10),
                        math.random(-10, 18)
                )
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0) + offset))
                wait(0.04)
            end
        end

        local targetDestination = Vector3.new(-86.00, -224.27, 34.57)
        if vehicle then
            vehicle:SetPrimaryPartCFrame(CFrame.new(targetDestination))
            humanoidRootPart.CFrame = CFrame.new(targetDestination + Vector3.new(0, 3, 0))
        end

        wait(0.3)
        humanoidRootPart.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

        local deleteArgs = {
            [1] = "DeleteAllVehicles"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(deleteArgs))

        wait(0.2)
        humanoidRootPart.CFrame = CFrame.new(originalPosition)
        humanoidRootPart.Anchored = originalAnchoredState
        humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    end
})
AddButton(Main, {
    Name = "قتل باص بدون ركوب",
    Callback = function()
        if not selectedPlayerName then return end

        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local originalPosition = humanoidRootPart.Position
            local originalAnchoredState = humanoidRootPart.Anchored

            humanoidRootPart.CFrame = CFrame.new(634.18, -4.00, 1839.65)
            wait(0.5)

            local args = {
                "PickingBoat",
                "MilitaryBoatFree"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            wait(1.5)

            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
            local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name .. "Car")

            if vehicle then
              
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0)))
                humanoidRootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 5, 0))

               
                local targetHumanoid = targetPlayer.Character:FindFirstChildOfClass("Humanoid")
                if targetHumanoid then
                    targetHumanoid.Health = 0 
                end

                
                local crazyStart = tick()
                while tick() - crazyStart < 2 do
                    local offset = Vector3.new(
                        math.random(-25, 12),
                        math.random(-13, 10),
                        math.random(-10, 18)
                    )
                    vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0) + offset))
                    wait(0.05)
                end
            end

            local targetDestination = Vector3.new(-86.00, -224.27, 34.57)
            if vehicle then
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetDestination))
                humanoidRootPart.CFrame = CFrame.new(targetDestination + Vector3.new(0, 5, 0))
            end

            wait(1)
            humanoidRootPart.Anchored = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

            if vehicle then
                vehicle:Destroy()
            end

            wait(0.5)
            humanoidRootPart.CFrame = CFrame.new(originalPosition)
            humanoidRootPart.Anchored = originalAnchoredState
            humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)

            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer("PickingBoat", "MilitaryBoatFree")
            wait(0.5)
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer("DeleteAllVehicles")
        end
    end
})
local section = AddSection(Main, {"سحب باص"})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local SelectedPlayerName = nil

local playerNames = {}
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= LocalPlayer then
        table.insert(playerNames, player.Name)
    end
end

local Dropdown = AddDropdown(Main, {
    Name = "اختر لاعب",
    Options = playerNames,
    Default = playerNames[1] or "",
    Callback = function(Value)
        SelectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "سحب بالباص",
    Callback = function()
        if not SelectedPlayerName then
            warn("اختر لاعبًا أولًا")
            return
        end

        local player = LocalPlayer
        local targetPlayer = Players:FindFirstChild(SelectedPlayerName)
        if not (targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart")) then
            warn("اللاعب غير موجود أو لم يُحمّل")
            return
        end

        local character = player.Character or player.CharacterAdded:Wait()
        local humanoid = character:WaitForChild("Humanoid")
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        local originalPosition = humanoidRootPart.Position
        local originalAnchoredState = humanoidRootPart.Anchored

        humanoidRootPart.CFrame = CFrame.new(1082.86, 76.00, -1125.20)
        wait(0.3)

        local spawnArgs = {
            [1] = "PickingCar",
            [2] = "SchoolBus"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(spawnArgs))
        wait(3.5)

        local function sitInBus()
            local vehicleName = player.Name .. "Car"
            local vehicle = workspace.Vehicles:FindFirstChild(vehicleName)
            if not vehicle then return false end

            local vehicleSeat = vehicle.Body:FindFirstChild("VehicleSeat")
            if not vehicleSeat then return false end

            humanoidRootPart.Anchored = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

            humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.3, 0)
            wait(0.15)

            humanoid.Sit = true
            firetouchinterest(humanoidRootPart, vehicleSeat, 0)
            firetouchinterest(humanoidRootPart, vehicleSeat, 1)
            wait(0.3)

            if humanoid.SeatPart ~= vehicleSeat then
                humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.3, 0)
                humanoid.Sit = true
                wait(0.3)
            end

            return humanoid.SeatPart == vehicleSeat
        end

        if not sitInBus() then return end

        local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
        local vehicleName = player.Name .. "Car"
        local vehicle = workspace.Vehicles:FindFirstChild(vehicleName)

        if vehicle then
            local crazyStart = tick()
            while tick() - crazyStart < 2.5 do
                local offset = Vector3.new(
                    math.random(-25, 12),
                        math.random(-13, 10),
                        math.random(-10, 18)
                )
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0) + offset))
                wait(0.04)
            end
        end

        if vehicle then
            vehicle:SetPrimaryPartCFrame(CFrame.new(originalPosition))
            humanoidRootPart.CFrame = CFrame.new(originalPosition + Vector3.new(0, 3, 0))
        end

        wait(0.3)
        humanoidRootPart.Anchored = false
        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

        local deleteArgs = {
            [1] = "DeleteAllVehicles"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(deleteArgs))

        wait(0.2)
        humanoidRootPart.CFrame = CFrame.new(originalPosition)
        humanoidRootPart.Anchored = originalAnchoredState
        humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)
    end
})
local section = AddSection(Main, {"=قتل سفينة جبيرة"})
local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer

local playerNames = {}
for _, plr in ipairs(Players:GetPlayers()) do
    if plr ~= LocalPlayer then
        table.insert(playerNames, plr.Name)
    end
end

local selectedPlayerName = nil

local Dropdown = AddDropdown(Main, {
    Name = "اختر لاعب",
    Options = playerNames,
    Default = playerNames[1],
    Callback = function(Value)
        selectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "قتل بالسفينه الكبيره",
    Callback = function()
        if not selectedPlayerName then
            warn("لم يتم اختيار لاعب")
            return
        end

        MakeNotifi({
            Title = "تم التشغيل",
            Text = "لا تفعله اكثر من مرا",
            Time = 5
        })

        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local originalPosition = humanoidRootPart.Position
            local originalAnchoredState = humanoidRootPart.Anchored

            humanoidRootPart.CFrame = CFrame.new(634.18, -4.00, 1839.65)
            wait(0.5)

            local args = {
                "PickingBoat",
                "PirateFree"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(args))
            wait(1.5)

            local function sitInBoat()
                local vehicleSeat = workspace.Vehicles:FindFirstChild("doctonbcCar")
                if not vehicleSeat then return end

                vehicleSeat = vehicleSeat.Body:FindFirstChild("VehicleSeat")
                if not vehicleSeat then return end

                humanoidRootPart.Anchored = false
                humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                wait(0.2)

                humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.5, 0)
                wait(0.2)

                humanoid.Sit = true
                firetouchinterest(humanoidRootPart, vehicleSeat, 0)
                firetouchinterest(humanoidRootPart, vehicleSeat, 1)
                wait(0.5)

                if humanoid.SeatPart ~= vehicleSeat then
                    humanoidRootPart.CFrame = vehicleSeat.CFrame * CFrame.new(0, 0.5, 0)
                    humanoid.Sit = true
                    wait(0.5)
                end
            end

            sitInBoat()
            wait(0.5)

            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
            local vehicle = workspace.Vehicles:FindFirstChild(LocalPlayer.Name .. "Car")

            if vehicle then
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0)))
                humanoidRootPart.CFrame = CFrame.new(targetPosition + Vector3.new(0, 5, 0))

                local crazyStart = tick()
                while tick() - crazyStart < 2 do
                    local offset = Vector3.new(
                        math.random(-25, 12),
                        math.random(-13, 10),
                        math.random(-10, 18)
                    )
                    vehicle:SetPrimaryPartCFrame(CFrame.new(targetPosition + Vector3.new(0, -2, 0) + offset))
                    wait(0.05)
                end
            end

            local targetDestination = Vector3.new(-86.00, -224.27, 34.57)
            if vehicle then
                vehicle:SetPrimaryPartCFrame(CFrame.new(targetDestination))
                humanoidRootPart.CFrame = CFrame.new(targetDestination + Vector3.new(0, 5, 0))
            end

            wait(0.5)
            humanoidRootPart.Anchored = false
            humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)

            if vehicle then
                vehicle:Destroy()
            end

            wait(0.5)
            humanoidRootPart.CFrame = CFrame.new(originalPosition)
            humanoidRootPart.Anchored = originalAnchoredState
            humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)

            local finalArgs = {
                [1] = "PickingBoat",
                [2] = "PirateFree"
            }
            game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Ca1r"):FireServer(unpack(finalArgs))

            wait(0.5)
            local deleteArgs = {
                [1] = "DeleteAllVehicles"
            }
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(deleteArgs))
        else
            warn("اللاعب غير موجود أو لا يملك الشخصية")
        end
    end
})
local section = AddSection(Main, {"كرسي قتل"})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local backpack = localPlayer:WaitForChild("Backpack")

local fixedPosition = Vector3.new(-86.00, -224.27, 34.57)
local returnPosition = humanoidRootPart.Position

local selectedPlayerName

local function removeTool()
    for _, item in pairs(character:GetChildren()) do
        if item:IsA("Tool") then
            item.Parent = backpack
        end
    end
end

local function teleportTo(position)
    humanoidRootPart.CFrame = CFrame.new(position)
end

local function resetScript()
    character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
    humanoidRootPart = character:WaitForChild("HumanoidRootPart")
    backpack = localPlayer:WaitForChild("Backpack")
    returnPosition = humanoidRootPart.Position
end

local function deleteToolAfterServer()
    local tool = character:FindFirstChild("Stretcher")
    if tool then
        local args = {
            [1] = "PlayerWantsToDeleteTool",
            [2] = "Stretcher"
        }
        ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))

        repeat
            task.wait(0.1)
        until not character:FindFirstChild("Stretcher")

        print("تم حذف الأداة تلقائيًا")
    end
end

local function followPlayer(targetPlayer)
    local targetChar = targetPlayer.Character
    if not targetChar then return end

    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHRP then return end

    local connection
    connection = RunService.Heartbeat:Connect(function()
        if not targetChar or not targetChar.Parent or not targetHRP then
            connection:Disconnect()
            teleportTo(fixedPosition)
            task.wait(0.5)
            deleteToolAfterServer()
            teleportTo(returnPosition)
            return
        end

        local targetHumanoid = targetChar:FindFirstChild("Humanoid")
        if targetHumanoid and targetHumanoid.Sit then
            connection:Disconnect()
            teleportTo(fixedPosition)
            task.wait(0.5)
            deleteToolAfterServer()
            teleportTo(returnPosition)
            return
        end

        humanoidRootPart.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)
    end)
end

local function pickToolAndFollow(targetPlayer)
    local args = {
        [1] = "PickingTools",
        [2] = "Stretcher"
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))

    local tool
    repeat
        task.wait(0.1)
        tool = backpack:FindFirstChild("Stretcher")
    until tool

    tool.Parent = character

    followPlayer(targetPlayer)
end

local function getPlayerNames()
    local playerNames = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local Dropdown = AddDropdown(Main, {
    Name = "اختر اللاعب",
    Options = getPlayerNames(),
    Default = "",
    Callback = function(Value)
        selectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "قتل بالكرسي",
    Callback = function()
        if selectedPlayerName then
            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
            if targetPlayer then
                resetScript()
                pickToolAndFollow(targetPlayer)
            else
                warn("اللاعب مو موجود!")
            end
        else
            warn("اختار لاعب اول!")
        end
    end
})

localPlayer.CharacterAdded:Connect(resetScript)
local section = AddSection(Main, {"سحب باص"})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local backpack = localPlayer:WaitForChild("Backpack")

local function deleteToolAfterServer()
    local tool = character:FindFirstChild("Stretcher")
    if tool then
        local args = {
            [1] = "PlayerWantsToDeleteTool",
            [2] = "Stretcher"
        }
        ReplicatedStorage.RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))

        repeat
            task.wait(0.1)
        until not character:FindFirstChild("Stretcher")
    end
end

local function pickTool()
    local args = {
        [1] = "PickingTools",
        [2] = "Stretcher"
    }
    ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))

    local tool
    repeat
        task.wait(0.1)
        tool = backpack:FindFirstChild("Stretcher")
    until tool

    tool.Parent = character
end

local function followPlayer(targetPlayer)
    local targetChar = targetPlayer.Character
    if not targetChar then return end

    local targetHRP = targetChar:FindFirstChild("HumanoidRootPart")
    if not targetHRP then return end

    local originalPosition = humanoidRootPart.Position
    local connection

    connection = RunService.Heartbeat:Connect(function()
        if not targetChar or not targetChar.Parent or not targetHRP then
            connection:Disconnect()
            humanoidRootPart.CFrame = CFrame.new(originalPosition)
            deleteToolAfterServer()
            return
        end

        local targetHumanoid = targetChar:FindFirstChild("Humanoid")
        if targetHumanoid and targetHumanoid.Sit then
            connection:Disconnect()
            humanoidRootPart.CFrame = CFrame.new(originalPosition)
            deleteToolAfterServer()
            return
        end

        humanoidRootPart.CFrame = targetHRP.CFrame * CFrame.new(0, 0, 3)
    end)
end

local function getPlayerNames()
    local playerNames = {}
    for _, player in pairs(Players:GetPlayers()) do
        if player ~= localPlayer then
            table.insert(playerNames, player.Name)
        end
    end
    return playerNames
end

local selectedPlayerName
local Dropdown = AddDropdown(Main, {
    Name = "اختر اللاعب",
    Options = getPlayerNames(),
    Default = "",
    Callback = function(Value)
        selectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "سحب بالكرسي",
    Callback = function()
        if selectedPlayerName then
            local targetPlayer = Players:FindFirstChild(selectedPlayerName)
            if targetPlayer then
                pickTool()
                followPlayer(targetPlayer)
            else
                warn("اللاعب مو موجود!")
            end
        else
            warn("اختار لاعب اول!")
        end
    end
})
AddSection(Main, {"فيلنق"})

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local function GetPlayer(Name)
    Name = Name:lower()
    for _, x in next, Players:GetPlayers() do
        if x ~= Player then
            if x.Name:lower():match("^" .. Name) or x.DisplayName:lower():match("^" .. Name) then
                return x
            end
        end
    end
    return nil
end

local function Message(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local function SkidFling(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart

    local TCharacter = TargetPlayer.Character
    local THumanoid = TCharacter and TCharacter:FindFirstChildOfClass("Humanoid")
    local TRootPart = THumanoid and THumanoid.RootPart
    local THead = TCharacter and TCharacter:FindFirstChild("Head")
    local Accessory = TCharacter and TCharacter:FindFirstChildOfClass("Accessory")
    local Handle = Accessory and Accessory:FindFirstChild("Handle")

    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit then
            return Message("Error Occurred", "Target is sitting", 5)
        end
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        else
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
        
        local function FPos(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end
        
        local function SFBasePart(BasePart)
            local TimeToWait = 2
            local Time = tick()
            local Angle = 0

            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        
                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
        
        workspace.FallenPartsDestroyHeight = 0/0
        
        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
            return Message("Error Occurred", "Target is missing everything", 5)
        end
        
        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid
        
        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return Message("Error Occurred", "Random error", 5)
    end
end

local playerNames = {}
for _, player in ipairs(Players:GetPlayers()) do
    if player ~= Player then
        table.insert(playerNames, player.Name)
    end
end

local selectedPlayer = nil

local Dropdown = AddDropdown(Main, {
    Name = "Select Player",
    Options = playerNames,
    Default = playerNames[1] or "",
    Callback = function(Value)
        selectedPlayer = GetPlayer(Value)
    end
})

local Toggle = AddToggle(Main, {
    Name = "Fling Player",
    Default = false,
    Callback = function(Value)
        if Value then
            if selectedPlayer then
                SkidFling(selectedPlayer)
            else
                Message("Error", "No player selected", 5)
            end
        end
    end
})

AddButton(Main, {
    Name = "اداة قتل قنفة (Tool)",
    Callback = function()

        local jogadores = game:GetService("Players")
        local rep = game:GetService("ReplicatedStorage")
        local loop = game:GetService("RunService")
        local mundo = game:GetService("Workspace")
        local entrada = game:GetService("UserInputService")

        local eu = jogadores.LocalPlayer
        local cam = mundo.CurrentCamera

        local NOME_FERRAMENTA = "Click Kill Couch"
        local ferramentaEquipada = false
        local nomeAlvo = nil
        local loopTP = nil
        local sofaEquipado = false
        local base = nil
        local posInicial = nil
        local raiz = nil

        local mochila = eu:WaitForChild("Backpack")
        if not mochila:FindFirstChild(NOME_FERRAMENTA) then
            local ferramenta = Instance.new("Tool")
            ferramenta.Name = NOME_FERRAMENTA
            ferramenta.RequiresHandle = false
            ferramenta.CanBeDropped = false

            ferramenta.Equipped:Connect(function()
                ferramentaEquipada = true
            end)

            ferramenta.Unequipped:Connect(function()
                ferramentaEquipada = false
                nomeAlvo = nil
                limparSofa()
            end)

            ferramenta.Parent = mochila
        end

        function limparSofa()
            if loopTP then
                loopTP:Disconnect()
                loopTP = nil
            end

            if sofaEquipado then
                local boneco = eu.Character
                if boneco then
                    local sofa = boneco:FindFirstChild("Couch")
                    if sofa then
                        sofa.Parent = eu.Backpack
                        sofaEquipado = false
                    end
                end
            end

            if base then
                base:Destroy()
                base = nil
            end

            if getgenv().AntiSit then
                getgenv().AntiSit:Set(false)
            end

            local humano = eu.Character and eu.Character:FindFirstChildOfClass("Humanoid")
            if humano then
                humano:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
                humano:ChangeState(Enum.HumanoidStateType.GettingUp)
            end

            if posInicial and raiz then
                raiz.CFrame = posInicial
                posInicial = nil
            end
        end

        function pegarSofa()
            local boneco = eu.Character
            if not boneco then return end
            local mochila = eu.Backpack

            if not mochila:FindFirstChild("Couch") and not boneco:FindFirstChild("Couch") then
                local args = { "PickingTools", "Couch" }
                rep.RE["1Too1l"]:InvokeServer(unpack(args))
                task.wait(0.1)
            end

            local sofa = mochila:FindFirstChild("Couch") or boneco:FindFirstChild("Couch")
            if sofa then
                sofa.Parent = boneco
                sofaEquipado = true
            end
        end

        function posAleatoriaAbaixo(boneco)
            local rp = boneco:FindFirstChild("HumanoidRootPart")
            if not rp then return Vector3.new() end
            local offset = Vector3.new(math.random(-2, 2), -5.1, math.random(-2, 2))
            return rp.Position + offset
        end

        function tpAbaixo(alvo)
            if not alvo or not alvo.Character or not alvo.Character:FindFirstChild("HumanoidRootPart") then return end

            local meuBoneco = eu.Character
            local minhaRaiz = meuBoneco and meuBoneco:FindFirstChild("HumanoidRootPart")
            local humano = meuBoneco and meuBoneco:FindFirstChildOfClass("Humanoid")

            if not minhaRaiz or not humano then return end

            humano:SetStateEnabled(Enum.HumanoidStateType.Physics, false)

            if not base then
                base = Instance.new("Part")
                base.Size = Vector3.new(10, 1, 10)
                base.Anchored = true
                base.CanCollide = true
                base.Transparency = 0.5
                base.Parent = mundo
            end

            local destino = posAleatoriaAbaixo(alvo.Character)
            base.Position = destino
            minhaRaiz.CFrame = CFrame.new(destino)

            humano:SetStateEnabled(Enum.HumanoidStateType.Physics, true)
        end

        function arremessarComSofa(alvo)
            if not alvo then return end
            nomeAlvo = alvo.Name
            local boneco = eu.Character
            if not boneco then return end

            posInicial = boneco:FindFirstChild("HumanoidRootPart") and boneco.HumanoidRootPart.CFrame
            raiz = boneco:FindFirstChild("HumanoidRootPart")
            pegarSofa()

            loopTP = loop.Heartbeat:Connect(function()
                local alvoAtual = jogadores:FindFirstChild(nomeAlvo)
                if not alvoAtual or not alvoAtual.Character or not alvoAtual.Character:FindFirstChild("Humanoid") then
                    limparSofa()
                    return
                end
                if getgenv().AntiSit then
                    getgenv().AntiSit:Set(true)
                end
                tpAbaixo(alvoAtual)
            end)

            task.spawn(function()
                local alvoAtual = jogadores:FindFirstChild(nomeAlvo)
                while alvoAtual and alvoAtual.Character and alvoAtual.Character:FindFirstChild("Humanoid") do
                    task.wait(0.05)
                    if alvoAtual.Character.Humanoid.SeatPart then
                        local buraco = CFrame.new(265.46, -450.83, -59.93)
                        alvoAtual.Character.HumanoidRootPart.CFrame = buraco
                        eu.Character.HumanoidRootPart.CFrame = buraco
                        task.wait(0.4)
                        limparSofa()
                        task.wait(0.2)
                        if posInicial then
                            eu.Character.HumanoidRootPart.CFrame = posInicial
                        end
                        break
                    end
                end
            end)
        end

        entrada.TouchTap:Connect(function(toques, processado)
            if not ferramentaEquipada or processado then return end
            local pos = toques[1]
            local raio = cam:ScreenPointToRay(pos.X, pos.Y)
            local hit = mundo:Raycast(raio.Origin, raio.Direction * 1000)
            if hit and hit.Instance then
                local modelo = hit.Instance:FindFirstAncestorOfClass("Model")
                local jogador = jogadores:GetPlayerFromCharacter(modelo)
                if jogador and jogador ~= eu then
                    arremessarComSofa(jogador)
                end
            end
        end)
    end
})
AddButton(Main, {
    Name = "قتل ابواب",
    Description = "Approach doors, then click on the player you want to fling.",
    Callback = function()

local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")

local LocalPlayer = Players.LocalPlayer
local Character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local HRP = Character:WaitForChild("HumanoidRootPart")

local BlackHole = Instance.new("Part")
BlackHole.Size = Vector3.new(100000, 100000, 100000)
BlackHole.Transparency = 1
BlackHole.Anchored = true
BlackHole.CanCollide = false
BlackHole.Name = "BlackHoleTarget"
BlackHole.Parent = Workspace

local baseAttachment = Instance.new("Attachment")
baseAttachment.Name = "Luscaa_BlackHoleAttachment"
baseAttachment.Parent = BlackHole

RunService.Heartbeat:Connect(function()
    BlackHole.CFrame = HRP.CFrame
end)

local ControlledDoors = {}

local function SetupPart(part)
    if not part:IsA("BasePart") or part.Anchored or not string.find(part.Name, "Door") then return end
    if part:FindFirstChild("Luscaa_Attached") then return end

    part.CanCollide = false

    for _, obj in ipairs(part:GetChildren()) do
        if obj:IsA("AlignPosition") or obj:IsA("Torque") or obj:IsA("Attachment") then
            obj:Destroy()
        end
    end

    local marker = Instance.new("BoolValue", part)
    marker.Name = "Luscaa_Attached"

    local a1 = Instance.new("Attachment", part)

    local align = Instance.new("AlignPosition", part)
    align.Attachment0 = a1
    align.Attachment1 = baseAttachment
    align.MaxForce = 1e25
    align.MaxVelocity = 1e9
    align.Responsiveness = 1e9

    local torque = Instance.new("Torque", part)
    torque.Attachment0 = a1
    torque.RelativeTo = Enum.ActuatorRelativeTo.World
    torque.Torque = Vector3.new(
        math.random(-10e5, 10e5) * 10000,
        math.random(-10e5, 10e5) * 10000,
        math.random(-10e5, 10e5) * 10000
    )

    table.insert(ControlledDoors, {Part = part, Align = align})
end

for _, obj in ipairs(Workspace:GetDescendants()) do
    if obj:IsA("BasePart") and string.find(obj.Name, "Door") then
        SetupPart(obj)
    end
end

Workspace.DescendantAdded:Connect(function(obj)
    if obj:IsA("BasePart") and string.find(obj.Name, "Door") then
        SetupPart(obj)
    end
end)

local function FlingPlayer(player)
    local char = player.Character
    if not char then return end
    local targetHRP = char:FindFirstChild("HumanoidRootPart")
    if not targetHRP then return end

    local targetAttachment = targetHRP:FindFirstChild("SHNMAX_TargetAttachment")
    if not targetAttachment then
        targetAttachment = Instance.new("Attachment", targetHRP)
        targetAttachment.Name = "SHNMAX_TargetAttachment"
    end

    for _, data in ipairs(ControlledDoors) do
        if data.Align then
            data.Align.Attachment1 = targetAttachment
        end
    end

    local start = tick()
    local flingDetected = false

    while tick() - start < 5 do
        if targetHRP.Velocity.Magnitude >= 20 then
            flingDetected = true
            break
        end
        RunService.Heartbeat:Wait()
    end

    for _, data in ipairs(ControlledDoors) do
        if data.Align then
            data.Align.Attachment1 = baseAttachment
        end
    end
end

UserInputService.TouchTap:Connect(function(touchPositions, processed)
    if processed then return end
    local pos = touchPositions[1]
    local camera = Workspace.CurrentCamera
    local unitRay = camera:ScreenPointToRay(pos.X, pos.Y)
    local raycast = Workspace:Raycast(unitRay.Origin, unitRay.Direction * 1000)

    if raycast and raycast.Instance then
        local hit = raycast.Instance
        local player = Players:GetPlayerFromCharacter(hit:FindFirstAncestorOfClass("Model"))
        if player and player ~= LocalPlayer then
            FlingPlayer(player)
        end
    end
end)

    end
})
AddButton(Main, {
    Name = "قتل طوبة (Tool)",
    Callback = function()
        local Players = game:GetService("Players")
        local ReplicatedStorage = game:GetService("ReplicatedStorage")
        local Workspace = game:GetService("Workspace")
        local UserInputService = game:GetService("UserInputService")
        local Camera = Workspace.CurrentCamera
        local LocalPlayer = Players.LocalPlayer

        local TOOL_NAME = "Click Fling Ball"
        local toolEquipped = false

        local backpack = LocalPlayer:WaitForChild("Backpack")
        if not backpack:FindFirstChild(TOOL_NAME) then
            local tool = Instance.new("Tool")
            tool.Name = TOOL_NAME
            tool.RequiresHandle = false
            tool.CanBeDropped = false

            tool.Equipped:Connect(function()
                toolEquipped = true
            end)
            tool.Unequipped:Connect(function()
                toolEquipped = false
            end)

            tool.Parent = backpack
        end

        local function FlingBall(target)
            local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
            local humanoid = character:WaitForChild("Humanoid")
            local hrp = character:WaitForChild("HumanoidRootPart")
            local ServerBalls = Workspace.WorkspaceCom:WaitForChild("001_SoccerBalls")

            local function GetBall()
                if not backpack:FindFirstChild("SoccerBall") and not character:FindFirstChild("SoccerBall") then
                    ReplicatedStorage.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", "SoccerBall")
                end
                repeat task.wait() until backpack:FindFirstChild("SoccerBall") or character:FindFirstChild("SoccerBall")

                local tool = backpack:FindFirstChild("SoccerBall")
                if tool then
                    tool.Parent = character
                end

                repeat task.wait() until ServerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
                return ServerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name)
            end

            local Ball = ServerBalls:FindFirstChild("Soccer" .. LocalPlayer.Name) or GetBall()
            Ball.CanCollide = false
            Ball.Massless = true
            Ball.CustomPhysicalProperties = PhysicalProperties.new(0.0001, 0, 0)

            if target ~= LocalPlayer then
                local tchar = target.Character
                if tchar and tchar:FindFirstChild("HumanoidRootPart") and tchar:FindFirstChild("Humanoid") then
                    local troot = tchar.HumanoidRootPart
                    local thum = tchar.Humanoid

                    if Ball:FindFirstChildWhichIsA("BodyVelocity") then
                        Ball:FindFirstChildWhichIsA("BodyVelocity"):Destroy()
                    end

                    local bv = Instance.new("BodyVelocity")
                    bv.Name = "FlingPower"
                    bv.Velocity = Vector3.new(9e8, 9e8, 9e8)
                    bv.MaxForce = Vector3.new(math.huge, math.huge, math.huge)
                    bv.P = 9e900
                    bv.Parent = Ball

                    Camera.CameraSubject = thum

                    repeat
                        if troot.Velocity.Magnitude > 0 then
                            Ball.CFrame = CFrame.new(troot.Position + (troot.Velocity / 1.5))
                            Ball.Orientation += Vector3.new(45, 60, 30)
                        else
                            for _, v in ipairs(tchar:GetChildren()) do
                                if v:IsA("BasePart") and v.CanCollide and not v.Anchored then
                                    Ball.CFrame = v.CFrame
                                    task.wait(1 / 6000)
                                end
                            end
                        end
                        task.wait(1 / 6000)
                    until troot.Velocity.Magnitude > 1000 or thum.Health <= 0 or not tchar:IsDescendantOf(Workspace)

                    Camera.CameraSubject = humanoid
                end
            end
        end

        UserInputService.TouchTap:Connect(function(touches, processed)
            if not toolEquipped or processed then return end
            local pos = touches[1]
            local ray = Camera:ScreenPointToRay(pos.X, pos.Y)
            local hit = Workspace:Raycast(ray.Origin, ray.Direction * 1000)
            if hit and hit.Instance then
                local model = hit.Instance:FindFirstAncestorOfClass("Model")
                local player = Players:GetPlayerFromCharacter(model)
                if player and player ~= LocalPlayer then
                    FlingBall(player)
                end
            end
        end)
    end
})



local Main = MakeTab({
    Name = "اجسام",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})
AddButton(Main, {
  Name = "severed leg ",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
end
})

AddButton(Main, {
  Name = "رجل حديدة",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 17500249989,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "راس مخفي",
  Callback = function()
    local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 134082579
    },
    [3] = "Roblox20"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
wait(0.1)
  end
})

AddButton(Main, {
  Name = "راس روبوت",
  Callback = function()
    local args = {
    [1] = 3210773801
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "راس روكر",
  Callback = function()
    local args = {
    [1] = 134082579
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "راس كيوت",
  Callback = function()
    local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 746767604
    },
    [3] = "Roblox20"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
  end
})


AddButton(Main, {
  Name = "جسم بنت",
  Callback = function()
  local args = {
    [1] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.1)
end
})
  AddButton(Main, {
  Name = " القزم",
  Callback = function()
    print("Clicked")
    local args = {
    [1] = {
        [1] = 14579958702,
        [2] = 14579959062,
        [3] = 14579959191,
        [4] = 14579959249,
        [5] = 14579963667,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.1)
  end
})
AddButton(Main, {
  Name = "قزومي",
  Callback = function()
    print("Clicked")
    local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 18599265011,
        [2] = 18599265151,
        [3] = 18599265190,
        [4] = 18599265270,
        [5] = 18599264796,
        [6] = 1
    },
    [3] = "YinHub"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
wait(0.1)
  end
})

AddButton(Main, {
  Name = "عيون حادة",
  Callback = function()
  local args = {
    [1] = 16580493236
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

   end
})
AddButton(Main, {
  Name = "رجل العظام الرصاصي",
  Callback = function()
    print("Clicked")local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 17500249989,
        [5] = 1,
        [6] = 1
    },
    [3] = "Roblox20"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "رجل العظام السود",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 14547162578,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "رجل رول",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 3230472745,
        [5] = 3230470862,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "جسم بنت ضعيف خصر",
  Callback = function()
local args = {
    [1] = {
        [1] = 74302534603111,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})


AddButton(Main, {
  Name = "بنية جسم",
  Callback = function()
local args = {
    [1] = {
        [1] = 96491916349570,
        [2] = 14854350570,
        [3] = 14854350451,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})

AddButton(Main, {
  Name = "بنت جسم",
  Callback = function()
local args = {
    [1] = {
        [1] = 16214246112,
        [2] = 16214249513,
        [3] = 16214251181,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})

AddButton(Main, {
  Name = "جسم بنت",
  Callback = function()
local args = {
    [1] = {
        [1] = 15539008532,
        [2] = 15539008875,
        [3] = 15539008680,
        [4] = 15539008795,
        [5] = 15539011945,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})

AddButton(Main, {
  Name = "جسم بنت",
  Callback = function()
local args = {
    [1] = {
        [1] = 14861800638,
        [2] = 14861800626,
        [3] = 14861801452,
        [4] = 14861800627,
        [5] = 14861801454,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})

AddButton(Main, {
  Name = "جسم ولد",
  Callback = function()
local args = {
    [1] = {
        [1] = 17754346388,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})

AddButton(Main, {
  Name = "جسم ولد ضعيفم",
  Callback = function()
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 1,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})


AddButton(Main, {
  Name = "جسم ولد كوبي",
  Callback = function()
local args = {
    [1] = {
        [1] = 86499666,
        [2] = 27112039,
        [3] = 27112052,
        [4] = 27112068,
        [5] = 27112056,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "جسم ولد رول",
  Callback = function()
local args = {
    [1] = {
        [1] = 27112025,
        [2] = 27112039,
        [3] = 27112052,
        [4] = 3230472745,
        [5] = 3230470862,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "سيغما بوي",
  Callback = function()
local args = {
    [1] = {
        [1] = 18178775358,
        [2] = 18178775182,
        [3] = 18178775725,
        [4] = 18178777453,
        [5] = 18178775695,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end})

AddButton(Main, {
  Name = "جسم قزم ",
  Callback = function()
local args = {
    [1] = {
        [1] = 14579958702,
        [2] = 14579959062,
        [3] = 14579959191,
        [4] = 14579959249,
        [5] = 14579963667,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})

AddButton(Main, {
  Name = "جسم قزم2",
  Callback = function()
local args = {
    [1] = {
        [1] = 77813057823038,
        [2] = 135110043370135,
        [3] = 116607813654019,
        [4] = 138966229804486,
        [5] = 128961183894053,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})
AddButton(Main, {
  Name = "3جسم قزم",
  Callback = function()
local args = {
    [1] = {
        [1] = 120973199097564,
        [2] = 118345433416023,
        [3] = 112849465115864,
        [4] = 78321005147549,
        [5] = 106586789635639,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})
AddButton(Main, {
  Name = "جسم قزم",
  Callback = function()
local args = {
    [1] = {
        [1] = 126267841602936,
        [2] = 77530451194918,
        [3] = 123471958406889,
        [4] = 117042768644173,
        [5] = 131948590344338,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))


  end
})
AddButton(Main, {
  Name = "الهامستر",
  Callback = function()
  local args = {
    [1] = {
        [1] = 14898536974,
        [2] = 14898536957,
        [3] = 14898537277,
        [4] = 14898537300,
        [5] = 14898537292,
        [6] = 14898536975
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})
local Main = MakeTab({
    Name = "سكنات",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})

AddSection(Main, {"نسخ سكنات"})

local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Remotes = ReplicatedStorage:WaitForChild("Remotes")

local Target = nil

local function GetPlayerNames()
    local PlayerNames = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(PlayerNames, player.Name)
    end
    return PlayerNames
end

local Dropdown = AddDropdown(Main, {
    Name = "اختار اللاعب",
    Default = "",
    Options = GetPlayerNames(),
    Callback = function(value)
        Target = value
    end
})

local function UpdateDropdown()
    Dropdown:Refresh(GetPlayerNames(), true)
end

Players.PlayerAdded:Connect(UpdateDropdown)
Players.PlayerRemoving:Connect(UpdateDropdown)

AddButton(Main, {
    Name = "نسخ السكن",
    Callback = function()
        if not Target then return end

        local LP = Players.LocalPlayer
        local LChar = LP.Character
        local TPlayer = Players:FindFirstChild(Target)

        if TPlayer and TPlayer.Character then
            local LHumanoid = LChar and LChar:FindFirstChildOfClass("Humanoid")
            local THumanoid = TPlayer.Character:FindFirstChildOfClass("Humanoid")

            if LHumanoid and THumanoid then
                local LDesc = LHumanoid:GetAppliedDescription()

                for _, acc in ipairs(LDesc:GetAccessories(true)) do
                    if acc.AssetId and tonumber(acc.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(acc.AssetId))
                        task.wait(0.2)
                    end
                end

                if tonumber(LDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Shirt))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Pants))
                    task.wait(0.2)
                end

                if tonumber(LDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(LDesc.Face))
                    task.wait(0.2)
                end

                local PDesc = THumanoid:GetAppliedDescription()

                local argsBody = {
                    [1] = {
                        [1] = PDesc.Torso,
                        [2] = PDesc.RightArm,
                        [3] = PDesc.LeftArm,
                        [4] = PDesc.RightLeg,
                        [5] = PDesc.LeftLeg,
                        [6] = PDesc.Head
                    }
                }
                Remotes.ChangeCharacterBody:InvokeServer(unpack(argsBody))
                task.wait(0.5)

                if tonumber(PDesc.Shirt) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Shirt))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Pants) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Pants))
                    task.wait(0.3)
                end

                if tonumber(PDesc.Face) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.Face))
                    task.wait(0.3)
                end

                for _, v in ipairs(PDesc:GetAccessories(true)) do
                    if v.AssetId and tonumber(v.AssetId) then
                        Remotes.Wear:InvokeServer(tonumber(v.AssetId))
                        task.wait(0.3)
                    end
                end

                local SkinColor = TPlayer.Character:FindFirstChild("Body Colors")
                if SkinColor then
                    Remotes.ChangeBodyColor:FireServer(tostring(SkinColor.HeadColor))
                    task.wait(0.3)
                end

                if tonumber(PDesc.IdleAnimation) then
                    Remotes.Wear:InvokeServer(tonumber(PDesc.IdleAnimation))
                    task.wait(0.3)
                end

                local Bag = TPlayer:FindFirstChild("PlayersBag")
                if Bag then
                    if Bag:FindFirstChild("RPName") and Bag.RPName.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayName", Bag.RPName.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBio") and Bag.RPBio.Value ~= "" then
                        Remotes.RPNameText:FireServer("RolePlayBio", Bag.RPBio.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPNameColor") then
                        Remotes.RPNameColor:FireServer("PickingRPNameColor", Bag.RPNameColor.Value)
                        task.wait(0.3)
                    end
                    if Bag:FindFirstChild("RPBioColor") then
                        Remotes.RPNameColor:FireServer("PickingRPBioColor", Bag.RPBioColor.Value)
                        task.wait(0.3)
                    end
                end
            end
        end
    end
})

local colors = {
    Color3.new(1, 0, 0),
    Color3.new(0, 1, 0),
    Color3.new(0, 0, 1),
    Color3.new(1, 1, 0),
    Color3.new(0, 1, 1),
    Color3.new(1, 0, 1)
}

local isHouseRGBActive = false

local function changeColor()
    local remoteEvent = ReplicatedStorage:FindFirstChild("RE") and ReplicatedStorage.RE:FindFirstChild("1Player1sHous1e")
    if not remoteEvent then return end

    while isHouseRGBActive do
        for _, color in ipairs(colors) do
            if not isHouseRGBActive then return end
            local args = {
                [1] = "ColorPickHouse",
                [2] = color
            }
            pcall(function()
                remoteEvent:FireServer(unpack(args))
            end)
            task.wait(0.8)
        end
    end
end

local function toggleHouseRGB(state)
    isHouseRGBActive = state
    if isHouseRGBActive then
        task.spawn(changeColor)
    end
end

local isUnbanActive = false
AddSection(Main, {"سكنات عشوائيه"})
AddButton(Main, {
  Name = "سكن هاك",
  Callback = function()
    local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 0
    },
    [3] = "GAZE"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
local args = {
    [1] = "Really black"
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 6429144833
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 11753123667
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 311450131
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 132809431
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 305888394
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 13911241594
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 4786872560
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 33070696
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 226189871
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 150381051
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 14290954023
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
local args = {
    [1] = 14763453479
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سكن بزونه كيوت",
  Callback = function()
    local args = {16300856317}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن عصفور",
  Callback = function()
    local args = {125340284280306}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن توم",
  Callback = function()
    local args = {7815700752273}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن بطريق كيوت",
  Callback = function()
    local args = {127922357595147}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "سكن دجاجه",
  Callback = function()
    local args = {91756266312256}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن بينجوينو",
  Callback = function()
    local args = {94944293759578}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن تونج تونج ساهور",
  Callback = function()
    local args = {117098257036480}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن بومبارديلو تمساح",
  Callback = function()
    local args = {101715679276356}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سكن جاتو ميمي لوراندو",
  Callback = function()
    local args = {118086993144717}
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "مادري",
  Callback = function()
  local args = {
    [1] = 133953416816402
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "تنين Minecraft ",
  Callback = function()
  local args = {
    [1] = 130395412790431
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قطه",
  Callback = function()
  local args = {
    [1] = 16300856317
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "اندرويد",
  Callback = function()
  local args = {
    [1] = 92745288410210
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "نحله ",
  Callback = function()
  local args = {
    [1] = 120926297777811
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "كلش يضحك",
  Callback = function()
  local args = {
    [1] = 77967221454596
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "شامبنزيني بانانيني",
  Callback = function()
  local args = {
    [1] = 119803128501541
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "راس مال سونيك",
  Callback = function()
  local args = {
    [1] = 119506671691629
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "ايدين جبيرة",
  Callback = function()
  local args = {
    [1] = 2585557384
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "بطن جبير",
  Callback = function()
  local args = {
    [1] = 4465005264
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "دب ابيض",
  Callback = function()
  local args = {
    [1] = 420160506
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
local Main = MakeTab({
    Name = "سكنات جاهزة",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})
Paragraph = AddParagraph(Main, {"قائمة سكنات البنات"})
AddButton(Main,{
  Name = "سكن بنت / 0",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 104558184738792
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 110138817602297
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 78625340992085
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 133739083878132
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15936091685
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 14960720067
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 11137846401
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 91764783976162
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 13900309877
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
wait(0.4)
local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.3)
local args = {
    [1] = 9068015167
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
wait(0.2)
local args = {
    [1] = 8428878750
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
wait(0.4)
local args = {
    [1] = "Institutional white"
}

game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سكن بنت / 1",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 14592692650
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 82117306117807
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 137774587072189
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 77745292670615
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 101521377229190
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 139844681686463
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 17744851762
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 17577949104
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 91764783976162
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 13153798277
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15461112727
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 120996397463893
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 113749281926930
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.3)
local args = {
    [1] = 2735240888
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.2)
local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 0,
        [5] = 0,
        [6] = 14960720067
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سكن بنت / 2",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 12727899468
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 6445187498
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 13900309877
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 17744851762
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 10714603421
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 13154819267
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 132270791472589
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 138578095847420
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 70449108798560
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12145754469
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 82125900044946
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 100584662788677
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 0,
        [5] = 0,
        [6] = 14960720067
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سكن بنت / 3",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 17744851762
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 10714603421
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 91764783976162
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 13153798277
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 75456487243472
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 133328016919894
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15258757346
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15701269099
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 10868131140
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 14398986629
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 12320559736
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12491799299
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 139607718,
        [5] = 0,
        [6] = 14960720067
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
  })
  AddButton(Main, {
  Name = "سكن بنت / 4",
  Callback = function()
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15701713751
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 18509805623
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 18744734552
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15222846056
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 101459562936324
} 

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 17529187838
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 130491506065838
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 17444483167
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 16709737106
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15395115525
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 14762227337
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(5.0)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(3.7)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 3210773801
    },
    [3] = "Roblox20"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 7581474755
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 6174066797
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "skintone",
    [2] = "Institutional white"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
  end
})
AddButton(Main, {
  Name = "سكن بنت / 5",
  Callback = function()
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13307477554
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15795056785
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 12563952028
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 11156841853
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 17744851762
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 16139700318
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13133257230
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 116091391891300
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13620518518
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(5.0)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(3.7)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 3210773801
    },
    [3] = "Roblox20"
}


game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 18510929286
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 7675094321
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "skintone",
    [2] = "Institutional white"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
  end
})
 
 AddButton(Main, {
  Name = "سكن بنت / 6",
  Callback = function()
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 73569970599873
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 71333952559271
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 129864383052397
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 17744851762
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 122223238457929
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 88966032649180
}


game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 127228549233812
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 9151422607
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 18923672769
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 137160650691565
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 6238758375
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 14402624573
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13900309877
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(5.0)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 96491916349570,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(3.7)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 3210773801
    },
    [3] = "Roblox20"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 5981620229
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13329302128
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "skintone",
    [2] = "Institutional white"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
  end
})
AddButton(Main, {
    Name = "سكن 7",
    Callback = function()
        local args = {
            [1] = {
                [1]=96491916349570, [2]=76683091425509, [3]=75159926897589, [4]=1, [5]=1, [6]=3210773801
            }
        }
        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
        wait(2)
        local items = {
            17462585534, 8491999465, 16030963309, 115942071538305, 11539811223, 13412319846,
            6657507028, 140098985957900, 10714603421, 17744851762, 13797056492, 13059925879,
            17529187838
        }
        for _, v in pairs(items) do
            game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v)
            wait(1)
        end
        game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
        wait(1)
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

AddButton(Main, {
    Name = "سكن 7",
    Callback = function()
        local args = {
            [1] = {
                [1]=96491916349570, [2]=76683091425509, [3]=75159926897589, [4]=1, [5]=1, [6]=3210773801
            }
        }
        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
        wait(2)
        local items = {
            16163146382, 2550890393, 15590550272, 90156423533584, 13900309877,
            16160920138, 6201860992, 93406436694938, 14619788675, 98341593609358,
            17279703215, 17442266260, 17561748169, 17279701810, 114704060956590
        }
        for _, v in pairs(items) do
            game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v)
            wait(1)
        end
        game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
        wait(1)
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

AddButton(Main, {
    Name = "سكن 8",
    Callback = function()
        local args = {
            [1] = {
                [1]=96491916349570, [2]=76683091425509, [3]=75159926897589, [4]=1, [5]=1, [6]=3210773801
            }
        }
        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
        wait(2)
        local items = {
            173569970599873, 71333952559271, 129864383052397, 17744851762,
            122223238457929, 88966032649180, 127228549233812, 9151422607,
            18923672769, 137160650691565, 6238758375, 14402624573,
            13900309877, 5981620229, 13329302128
        }
        for _, v in pairs(items) do
            game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v)
            wait(1)
        end
        game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
        wait(1)
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

AddButton(Main, {
    Name = "سكن 9",
    Callback = function()
        local args = {
            [1] = {
                [1]=96491916349570, [2]=76683091425509, [3]=75159926897589, [4]=1, [5]=1, [6]=3210773801
            }
        }
        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
        wait(2)
        local items = {
            118075313675296, 13575374227, 17744851762, 81209049520605,
            7667832719, 17491092069, 17450914193, 15827255744, 13900309877,
            15264863474, 18236339514, 13933994153, 8095555899, 6433477241
        }
        for _, v in pairs(items) do
            game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v)
            wait(1)
        end
        game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
        wait(1)
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

AddButton(Main, {
    Name = "سكن 10",
    Callback = function()
        local args = {
            [1] = {
                [1]=96491916349570, [2]=76683091425509, [3]=75159926897589, [4]=1, [5]=1, [6]=3210773801
            }
        }
        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
        wait(2)
        local items = {
            13307477554, 12563952028, 15795056785, 11156841853, 17744851762,
            16139700318, 116091391891300, 13133257230, 13620518518,
            18510929286, 7675094321
        }
        for _, v in pairs(items) do
            game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v)
            wait(1)
        end
        game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
        wait(1)
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})

AddButton(Main, {
    Name = "سكن 11",
    Callback = function()
        local args = {
            [1] = {
                [1]=96491916349570, [2]=76683091425509, [3]=75159926897589, [4]=1, [5]=1, [6]=3210773801
            }
        }
        game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
        wait(2)
        local items = {
            15701713751, 18509805623, 18744734552, 15222846056, 101459562936324,
            17529187838, 130491506065838, 17444483167, 16709737106, 15395115525,
            14762227337, 6174066797, 7581474755
        }
        for _, v in pairs(items) do
            game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v)
            wait(1)
        end
        game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
        wait(1)
        game.Players.LocalPlayer.Character.Humanoid.Health = 0
    end
})


Paragraph = AddParagraph(Main, {"سكنات ولد"})
-- سكن 1
AddButton(Main, {
  Name = "سكن 1",
  Callback = function()
    local args = {
        {92757812011061, 99519402284266, 115905570886697, 139607718, 1, 3210773801}
    }
    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    wait(2)
    local items = {5315424251, 5591898874, 15848163279, 15535076528, 10810651229, 15294026484, 6869986319, 10484245226}
    for _, v in ipairs(items) do game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v) wait(1) end
    game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://8183296024"; Sound:Play()
  end
})

-- سكن 2
AddButton(Main, {
  Name = "سكن 2",
  Callback = function()
    local args = {
        {4637265517, 99519402284266, 115905570886697, 139607718, 1, 3210773801}
    }
    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    wait(2)
    local items = {14808924884, 15848163279, 16127830905, 15535076528, 13575374227, 11984960300, 6433477241, 14659003969, 7667832719}
    for _, v in ipairs(items) do game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v) wait(1) end
    game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://8183296024"; Sound:Play()
  end
})

-- سكن 3
AddButton(Main, {
  Name = "سكن 3",
  Callback = function()
    local args = {
        {17754346388, 1, 1, 139607718, 1, 134082579}
    }
    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    wait(2)
    local items = {140150480026352, 82992820037885, 13498671093, 17386216598, 14774768752, 81526836860931, 14832120928, 14832124031, 5727822995, 18594685747, 18693879614, 83289659312825, 12249790024}
    for _, v in ipairs(items) do game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v) wait(1) end
    game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://8183296024"; Sound:Play()
  end
})

-- سكن 4
AddButton(Main, {
  Name = "سكن 4",
  Callback = function()
    local args = {
        {4637265517, 99519402284266, 115905570886697, 139607718, 1, 134082579}
    }
    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    wait(2)
    local items = {12277691994, 15535089544, 15360964433, 15547029728, 11491426272, 18231956957, 14967839572, 11388723847, 16396460593, 11666244695, 75882113968133, 15827271920, 11817884773, 8626716317}
    for _, v in ipairs(items) do game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v) wait(1) end
    game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://8183296024"; Sound:Play()
  end
})

-- سكن 5
AddButton(Main, {
  Name = "سكن 5",
  Callback = function()
    local args = {
        {1, 1, 4637265517, 1, 1, 1}
    }
    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    wait(2)
    local items = {3210773801, 11386778657, 15696510459, 15294007958, 16127867077, 12553878346, 15360967485, 12410997561, 14388001192, 14388019333, 13463285148, 15209194774, 73122104376331, 12418813921, 16079104171}
    for _, v in ipairs(items) do game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v) wait(1) end
    game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
    wait(1)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://8183296024"; Sound:Play()
  end
})

-- سكن 6
AddButton(Main, {
  Name = "سكن 6",
  Callback = function()
    local args = {
        {1, 1, 4637265517, 1, 1, 1}
    }
    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    wait(2)
    local items = {3210773801, 15066901505, 6438419573, 11300257519, 12395782823, 15530780426, 14388004031, 12411004315, 12553870762, 15848173823, 16127870253, 14808889186, 130269607301022, 14887721871, 18154424333, 17039389777, 15145469178, 13463285148, 14388009243}
    for _, v in ipairs(items) do game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v) wait(1) end
    game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
    wait(1)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://8183296024"; Sound:Play()
  end
})
AddButton(Main, {
  Name = "سكن 7",
  Callback = function()
    local args = {
        {4637265517, 1, 1, 1, 1, 1}
    }
    game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))
    wait(2)
    local items = {3210773801, 106701020164834, 14388001192, 14388009243, 15653788852, 11944534333, 15113163167, 13463290106, 89963641541698, 15214479618, 16168983297, 12553856439, 12411026610, 15848163279, 15294026484, 11386780095, 15303551954}
    for _, v in ipairs(items) do game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(v) wait(1) end
    game:GetService("ReplicatedStorage").Remotes.ChangeBodyColor:FireServer("Institutional white")
    wait(1)
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://8183296024"; Sound:Play()
  end
})
AddButton(Main, {
Name = "سكن ولد /8",
Callback = function()
local args = {
[1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 18907115656
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 11666244695
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 5375274460
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 6140709264
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12320559736
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 12399304406
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12324916270
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.2)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})
  AddButton(Main, {
  Name = "سكن ولد / 9",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 18907051894
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 11666241096
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 17578973282
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 16727932178
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12320557577
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 12491790283
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 14884031293
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 71561979890902
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.3)
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.4)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سكن ولد / 10",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 5375274460
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 131767886983906
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12563952028
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 18349876491
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12320559736
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 12399296368
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12886633010
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 12258163872
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.6)
local args = {
    [1] = 14388001192
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سكن ولد / 11",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 12406845750
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 12300914679
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12886618098
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 83065690630260
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12406845750
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 16632862946
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15654736913
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 5375274460
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.4)
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.4)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سكن ولد / 12",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 12324916270
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 12399304406
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 8902806997
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 12719043468
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 73342575980321
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 121191734883063
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 116918306368653
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 16729315650
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 16127830905
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15519708781
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.8)
local args = {
    [1] = 12320559736
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.3)
local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.4)
local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.3)
local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.8)
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سكن ولد / 13",
  Callback = function()
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 139607718,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 4637265517,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 14808924884
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15848163279
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 16127830905
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 15535076528
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 13575374227
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 11984960300
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 6433477241
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 14659003969
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 7667832719
} 

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(5.0)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 4637265517,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 1,
        [5] = 1,
        [6] = 1
    },
    [3] = "YinHub"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(3.7)
 
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 1,
        [6] = 3210773801
    },
    [3] = "Roblox20"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "wear",
    [2] = 1
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
wait(0.1)
 
local args = {
    [1] = "skintone",
    [2] = "Institutional white"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Updat1eAvata1r"):FireServer(unpack(args))
 
  end
})
Paragraph = AddParagraph(Main, {"قائمة سكنات التطقيمات للكابلز"})
AddButton(Main, {
  Name = "تطقيم سكن بنت ابيض",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 71523705002059
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 133739083878132
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12491805479
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 17812777774
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12642699915
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 9207509028
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 6323672306
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 17885542271
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 17744851762
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 89320309255381
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 10714603421
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 13153798277
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 17486162984
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.4)
local args = {
    [1] = 17321153635
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.6)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.6)
local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end
}) 
AddButton(Main, {
  Name = "تطقيم سكن ولد ابيض ",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  
  wait(0.2)
  local args = {
    [1] = 12871866840
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 12324916270
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 17812757369
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 17330476501
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 18164942938
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 82015366838137
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 18203491026
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "حط تطقيم بنت احمر",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 13153798277
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 8275222163
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 17577949104
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 17744851762
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15343119229
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 84206973218163
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 131767886983906
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12563952028
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 6995267080
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 13849640889
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 13463280917
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12483105503
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 14388001192
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.6)
local args = {
    [1] = 14398993174
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = 14398986629
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.6)
local args = {
    [1] = {
        [1] = 115745153758680,
        [2] = 76683091425509,
        [3] = 75159926897589,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.7)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

end
}) 
AddButton(Main, {
  Name = "تطقيم سكن ولد احمر",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12553856439
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 15618243532
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15848163279
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 15530783724
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15294026484
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 12563952028
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 131767886983906
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 5859953144
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 6995267080
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 13463280917
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 12483105503
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.6)
local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "تطقيم سكن بنت جلدي اسود",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = 73808851901807
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 114487356855004
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 3062282619
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 8760264049
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 18522484489
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 17744851762
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 13900309877
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 10714603421
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 13154819267
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 85199815817187
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 17627081584
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 12483105503
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 13463280917
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

wait(0.5)
local args = {
    [1] = {
        [1] = 15282063616,
        [2] = 14976777566,
        [3] = 14976777585,
        [4] = 14538400463,
        [5] = 14538400387,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

wait(0.7)
local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "تطقيم سكن ولد جلدي اسود",
  Callback = function()
  local args = {
    [1] = "OCA";
}

game:GetService("ReplicatedStorage"):WaitForChild("RE", 9e9):WaitForChild("1Avata1rOrigina1l", 9e9):FireServer(unpack(args))
  wait(0.2)
  local args = {
    [1] = {
        [1] = 92757812011061,
        [2] = 99519402284266,
        [3] = 115905570886697,
        [4] = 0,
        [5] = 0,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = {
        [1] = 0,
        [2] = 0,
        [3] = 0,
        [4] = 0,
        [5] = 0,
        [6] = 3210773801
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 73808851901807
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 114487356855004
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.6)
  local args = {
    [1] = 15197532379
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.7)
  local args = {
    [1] = 12754522665
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15474892096
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15547027816
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.3)
  local args = {
    [1] = 15848166908
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.4)
  local args = {
    [1] = 15294007958
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  wait(0.5)
  local args = {
    [1] = 11666244695
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})

local Main = MakeTab({
    Name = "كشف اماكن",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})
AddSection(Main, {"كشف v1"})
local ESP = loadstring(game:HttpGet("https://kiriot22.com/releases/ESP.lua"))()
ESP:Toggle(true)
ESP.Players = false
ESP.Names = false

local Toggle = AddToggle(Main, {
  Name = "فعلة",
  Default = false,
  Callback = function(Value)
    ESP.Players = Value
  end
})

local Toggle = AddToggle(Main, {
  Name = "الاسامي الاعبين",
  Default = false,
  Callback = function(Value)
    ESP.Names = Value
  end
})
AddColorPicker(Main, {
  Name = "لون ESP ",
  Default = Color3.fromRGB(255, 255, 0),
  Callback = function(Value)
    ESP.Color = Value
  end
})
AddSection(Main, {"كشف v2"})
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local heartbeatConnection
local playerAddedConnection
local playerRemovingConnection

local function getCharacter(player)
    return workspace:FindFirstChild(player.Name)
end

local function applyHighlight(player)
    local character = getCharacter(player)
    if character and character:FindFirstChild("HumanoidRootPart") then
        if not character.HumanoidRootPart:FindFirstChild("Highlight") then
            local highlight = Instance.new("Highlight")
            highlight.Adornee = character
            highlight.Parent = character.HumanoidRootPart
            highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
            highlight.Name = "Highlight"
        end
    end
end

local function removeHighlight(player)
    local character = getCharacter(player)
    if character and character:FindFirstChild("HumanoidRootPart") then
        local highlight = character.HumanoidRootPart:FindFirstChild("Highlight")
        if highlight then
            highlight:Destroy()
        end
    end
end

local Toggle = AddToggle(Main, {
    Name = "كشف v2",
    Default = false,
    Callback = function(Value)
        if Value then
            -- تفعيل ESP
            for _, player in pairs(Players:GetPlayers()) do
                applyHighlight(player)
            end

            playerAddedConnection = Players.PlayerAdded:Connect(function(player)
                repeat wait() until getCharacter(player)
                applyHighlight(player)
            end)

            playerRemovingConnection = Players.PlayerRemoving:Connect(function(player)
                removeHighlight(player)
            end)

            heartbeatConnection = RunService.Heartbeat:Connect(function()
                for _, player in pairs(Players:GetPlayers()) do
                    applyHighlight(player)
                end
            end)
        else
            -- إلغاء ESP
            for _, player in pairs(Players:GetPlayers()) do
                removeHighlight(player)
            end

            if playerAddedConnection then
                playerAddedConnection:Disconnect()
                playerAddedConnection = nil
            end
            if playerRemovingConnection then
                playerRemovingConnection:Disconnect()
                playerRemovingConnection = nil
            end
            if heartbeatConnection then
                heartbeatConnection:Disconnect()
                heartbeatConnection = nil
            end
        end
    end
})
AddSection(Main, {"كشف v3"})
AddToggle(Main, {
    Name = "كشف اماكن",
    Default = false,
    Callback = function(Value)
        if Value then
            ESPConnection = game:GetService("RunService").RenderStepped:Connect(function()
                for _, player in pairs(game.Players:GetPlayers()) do
                    if player ~= game.Players.LocalPlayer and player.Character and player.Character:FindFirstChild("Head") and player.Character:FindFirstChild("Humanoid") then
                        local head = player.Character.Head
                        local humanoid = player.Character.Humanoid
                        local distance = math.floor((head.Position - game.Players.LocalPlayer.Character.Head.Position).Magnitude)
                        local health = math.floor(humanoid.Health)

                        local esp = player.Character:FindFirstChild("ESP")
                        if not esp then
                            esp = Instance.new("BillboardGui", player.Character)
                            esp.Name = "ESP"
                            esp.Size = UDim2.new(0, 150, 0, 50)
                            esp.AlwaysOnTop = true
                            esp.Adornee = head

                            local text = Instance.new("TextLabel", esp)
                            text.Name = "ESPText"
                            text.Size = UDim2.new(1, 0, 1, 0)
                            text.BackgroundTransparency = 1
                            text.TextColor3 = Color3.new(1, 0, 0)
                            text.TextStrokeTransparency = 0
                            text.Font = Enum.Font.SourceSansBold
                            text.TextScaled = true
                        end

                        local label = esp:FindFirstChild("ESPText")
                        if label then
                            label.Text = string.format("%s\nالمسافة: %d\nالدم: %d", player.Name, distance, health)
                        end
                    end
                end
            end)
        else
            if ESPConnection then
                ESPConnection:Disconnect()
                ESPConnection = nil
            end
            for _, player in pairs(game.Players:GetPlayers()) do
                if player.Character and player.Character:FindFirstChild("ESP") then
                    player.Character.ESP:Destroy()
                end
            end
        end
    end
})

AddColorPicker(Main, {
    Name = "لون ESP ",
    Default = Color3.fromRGB(255, 255, 0),
    Callback = function(Value)
        for _, player in pairs(game.Players:GetPlayers()) do
            local char = workspace:FindFirstChild(player.Name)
            if char and char:FindFirstChild("HumanoidRootPart") then
                local esp = char:FindFirstChild("ESP")
                if esp then
                    local label = esp:FindFirstChild("ESPText")
                    if label then
                        label.TextColor3 = Value  -- تغيير لون النص بناءً على اختيار اللون
                    end
                end
            end
        end
    end
})
local Main = MakeTab({
    Name = "تنقل",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})

local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")

local function fadeCharacter(character, toTransparent, duration)
    local steps = 15
    for i = 0, steps do
        local t = i / steps
        for _, part in ipairs(character:GetDescendants()) do
            if part:IsA("BasePart") and part.Name ~= "HumanoidRootPart" then
                part.Transparency = toTransparent and t or (1 - t)
                part.CanCollide = not toTransparent
            end
        end
        RunService.Heartbeat:Wait()
    end
end

local function teleportWithGokuFly(destinationCFrame)
    local player = Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local hrp = character:WaitForChild("HumanoidRootPart")

    fadeCharacter(character, true, 0.5)

    hrp.Anchored = true
    local upCFrame = hrp.CFrame + Vector3.new(0, 30, 0)
    TweenService:Create(hrp, TweenInfo.new(0.4), {CFrame = upCFrame}):Play()
    wait(0.4)

    local flyTo = CFrame.new(destinationCFrame.Position + Vector3.new(0, 30, 0))
    TweenService:Create(hrp, TweenInfo.new(1.1, Enum.EasingStyle.Sine), {CFrame = flyTo}):Play()
    wait(1.1)

    TweenService:Create(hrp, TweenInfo.new(0.4), {CFrame = destinationCFrame}):Play()
    wait(0.4)

    hrp.Anchored = false
    fadeCharacter(character, false, 0.5)
end


AddButton(Main, {
    Name = "🌀 أداة تنقل غوكو",
    Callback = function()
        local player = Players.LocalPlayer
        local mouse = player:GetMouse()

        local function createTool()
            local tool = Instance.new("Tool")
            tool.RequiresHandle = false
            tool.Name = "تنقل غوكو"

            tool.Activated:Connect(function()
                local pos = mouse.Hit.Position + Vector3.new(0, 2.5, 0)
                teleportWithGokuFly(CFrame.new(pos))
            end)

            tool.Parent = player.Backpack
        end

        createTool()

        player.CharacterAdded:Connect(function()
            wait(0.2)
            createTool()
        end)
    end
})


local locations = {
    {"📍 لوحة 1", Vector3.new(-242.68, 89.68, -549.64)},
    {"📍 لوحة 2", Vector3.new(-630.48, 26.58, 365.14)},
    {"🏠 ورا البيوت", Vector3.new(192, 4, 272)},
    {"🏠 قدام البيوت", Vector3.new(136, 4, 117)},
    {"🔫 مكان أسلحة", Vector3.new(-119, -28, 235)},
    {"🏚️ بيت قفير", Vector3.new(986, 4, 63)},
    {"🌀 مكان سري", Vector3.new(672, 4, -296)},
    {"🕳️ جو الأرض", Vector3.new(505, -75, 143)},
    {"🏫 مدرسة", Vector3.new(-312, 4, 211)},
    {"☕ قهوة", Vector3.new(161, 8, 52)},
    {"🏁 البداية", Vector3.new(-26, 4, -23)},
    {"🏥 مستشفى", Vector3.new(-309, 4, 71)},
    {"🌉 فوق الجسر", Vector3.new(-589, 141, -59)},
    {"⚡ مكان الكهرباء", Vector3.new(179, 4, -464)},
    {"🕳️ جو الأرض 2", Vector3.new(-343, 4, -613)},
    {"🏝️ جزيرة 1", Vector3.new(-1925, 23, 127)},
    {"✈️ مطار", Vector3.new(310, 5, 31)},
    {"🏘️ البيوت", Vector3.new(182, 4, 150)},
    {"🚗 نص الشارع", Vector3.new(63, 35, 410)},
    {"🗻 فوق الجبل", Vector3.new(-670, 251, 765)},
    {"🏫 فوق المدرسة", Vector3.new(-370, 50, 173)},
    {"🛠️ سرية الورشة", Vector3.new(0, 4, -495)},
}

for _, data in ipairs(locations) do
    local name, pos = data[1], data[2]
    AddButton(Main, {
        Name = name,
        Callback = function()
            teleportWithGokuFly(CFrame.new(pos))
        end
    })
end
local Main = MakeTab({
    Name = "أغاني",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})
AddTextBox(Main, {
  Name = "اغاني",
  Default = "",
  PlaceholderText = "ادخل الكود",
  ClearText = true,
  Callback = function(Value)
local args1 = {
            [1] = "SkateBoard"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args1))
 
        -- Replacing the static value with the input from the textbox
        local args2 = {
            [1] = "PickingScooterMusicText",
            [2] = Value -- Here, we use the textbox value to replace 35935204
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args2))
        
end 
}) 
AddTextBox(Main, {
    Name = "اغاني بلاش",
    Default = "",
    PlaceholderText = "خلي الكود",
    ClearText = true,
    Callback = function(Value)
        -- إرسال أول حدث للسيرفر
        local args1 = {
            [1] = "SkateBoard"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args1))


        local args2 = {
            [1] = "PickingScooterMusicText",
            [2] = Value
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args2))
    end
})
AddButton(Main, {
  Name = "اغنية حلوة",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "109188610023287"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سب 1",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "6536444735"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "سب 2",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "8701632845"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "سب 3",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "6713993281"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "سب 4",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "5849978429"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "سب 4",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7183326833"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اكس اكس ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "1836685799"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "Bigger Than Everything",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "15689446558"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنية عراقية",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "135009652401688"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنية عراقية 2",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "11463392143"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})



local Main = MakeTab({
    Name = "سيارات",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})
local Speed = 50
local Turbo = 50

local function ChangeCarSpeedAndTurbo(speedValue, turboValue)
    local player = game.Players.LocalPlayer
    local car = workspace.Vehicles:FindFirstChild(player.Name .. "Car")

    if car then
        local body = car:FindFirstChild("Body").VehicleSeat
        if body then
            body.TopSpeed.Value = speedValue
            body.Turbo.Value = turboValue
            wait(0.1)
            redzlib:MakeNotification({
                Name = "Mafia Hub",
                Content = "Done, You can Move Now!",
                Time = 5
            })
        else
            redzlib:MakeNotification({
                Name = "Error",
                Content = "Sit in car first!",
                Time = 5
            })
        end
    else
        redzlib:MakeNotification({
            Name = "Error",
            Content = "Put a Car First!",
            Time = 5
        })
    end
end

AddTextBox(Main, {
    Name = "سرعة",
    PlaceholderText = "50",
    Callback = function(value)
        local newSpeed = tonumber(value)
        if newSpeed then
            Speed = newSpeed
        end
    end
})

AddTextBox(Main, {
    Name = "تيربو",
    PlaceholderText = "50",
    Callback = function(value)
        local newTurbo = tonumber(value)
        if newTurbo then
            Turbo = newTurbo
        end
    end
})

AddTextBox(Main, {
    Name = "تفحيط",
    PlaceholderText = "50",
    Callback = function(value)
        local args = {
            [1] = "DriftingNumber",
            [2] = value
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Player1sCa1r"):FireServer(unpack(args))
    end
})

AddButton(Main, {
  Name = "تطبيق سرعة وا تفحيط",
  Callback = function()
        ChangeCarSpeedAndTurbo(Speed, Turbo)
    end
})

AddTextBox(Main, {
  Name = "أغاني لسيارة",
  Default = "",
PlaceholderText = "ادخل الكود",
  ClearText = true,
  Callback = function(Value)
local args1 = {
            [1] = "SkateBoard"
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args1))
 
        -- Replacing the static value with the input from the textbox
        local args2 = {
            [1] = "PickingScooterMusicText",
            [2] = Value -- Here, we use the textbox value to replace 35935204
        }
        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1NoMoto1rVehicle1s"):FireServer(unpack(args2))
        


AddButton(Main, {
    Name = "سبام  كاديلاك",
    Callback = function()
        while true do
            local args = {
                [1] = "PickingCar",
                [2] = "Cadillac"
            }

            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
            wait(0.5) 
        end
    end
})
AddButton(Main, {
    Name = "سبام لامبرجيني",
    Callback = function()
        while true do
            local args = {
    [1] = "PickingCar",
    [2] = "Lambo"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))

            wait(0.5) 
        end
    end
})
AddButton(Main, {
    Name = "سبام سيارات",
    Callback = function()
        while true do
            local args = {
    [1] = "PickingCar",
    [2] = "SchoolBus"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))


            wait(0.5) 
local args = {
    [1] = "PickingCar",
    [2] = "350Z"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
wait(0.5) 
        end
    end
})
AddButton(Main, {
    Name = "سبام سيارات",
    Callback = function()
        while true do
            local args = {
    [1] = "PickingCar",
    [2] = "SchoolBus"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))


            wait(0.5) 
local args = {
    [1] = "PickingCar",
    [2] = "350Z"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
wait(0.5) 
local args = {
    [1] = "PickingCar",
    [2] = "P50"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
wait(0.5) 
local args = {
    [1] = "PickingCar",
    [2] = "Tank"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))

        end
    end
})
AddButton(Main, {
    Name = "سبام حصان",
    Callback = function()
        while true do
            local args = {
    [1] = "PickingCar",
    [2] = "Horse"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))
wait(0.5) 
local args = {
    [1] = "PickingCar",
    [2] = "Horse"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Ca1r"):FireServer(unpack(args))

        end
    end
})

end 
})
local Main = MakeTab({
    Name = "اغاني مجانية",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")

local selectedAudioID
local audioLoop = false
getgenv().Audio_All_loop_fast = false


local audios = {
    {Name = "فورتنيات الببجي", ID = 8671258578},
    {Name = "برازيلي", ID = 104541292443133},
    {Name = "هنديه", ID = 98757377820359},
    {Name = "شعر شيعي", ID = 98224127892587},
    {Name = "قران 9", ID = 86911769585232},
    {Name = "في عالم", ID = 125151253990122},
    {Name = "قران 6", ID = 133272041755020},
    {Name = "قران 5", ID = 88269497623993},
    {Name = "حزين 2", ID = 135308045},
    {Name = "قرأن ٤", ID = 90593176828958},
    {Name = "الحمدلله", ID = 7609175072},
    {Name = "اذان", ID = 1836685881},
    {Name = "قرأن2", ID = 1836685929},
    {Name = "قرأن", ID = 4711690175},
    {Name = "جاء الليل", ID = 132182002773837},
    {Name = "صلو علنبي", ID = 9108676586},
    {Name = "السلام عليكم", ID = 7038667176},
    {Name = "كريسماس", ID = 1841342574},
    {Name = "صدام", ID = 8273849195},
    {Name = "ويه ويه", ID = 1164198099},
    {Name = "حبيبي شنو في", ID = 7657178494},
    {Name = "اغنيه مصريه حب", ID = 93620598835551},
    {Name = "عراقي حزين", ID = 80039364766636},
    {Name = "موسيقى حماس", ID = 128018172854846},
    {Name = "دبجه", ID = 76698985299412},
    {Name = "ازعاج", ID = 4776398821},
    {Name = "ضراط", ID = 4809574295},
    {Name = "عود قوي", ID = 114157294180725},
    {Name = "عود حزين", ID = 104085669063530},
    {Name = "يمني وين الوفاء", ID = 116150415085902},
    {Name = "اغنيه حزينه", ID = 132378395114388},
    {Name = "سب4", ID = 8701632845},
    {Name = "سب3", ID = 6713993281},
    {Name = "سعودي حزين", ID = 99123490695024},
    {Name = "اغنيه سوريه", ID = 98640789490482},
    {Name = "اهات 😂", ID = 8107899910},
    {Name = "اغنيه خليجيه", ID = 127593500790634},
    {Name = "سب2", ID = 6536444735},
    {Name = "رعب", ID = 1848748988},
    {Name = "سبونج بوب", ID = 2396797933},
    {Name = "اغنيه عرببه", ID = 1836685799},
    {Name = "اوووو", ID = 93123670572331},
    {Name = "ناني", ID = 8842446965},
    {Name = "صوت مطي", ID = 6900670817},
    {Name = "حقود", ID = 4533138868},
    {Name = "مايكل جاكسن", ID = 7061299253},
    {Name = "هديها شوي", ID = 7644757406},
    {Name = "ريمكس", ID = 16190783774},
    {Name = "سب5", ID = 5849978429},
    {Name = "رمي", ID = 2838571776},
    {Name = "سب", ID = 7942547789},
    {Name = "تفحيط 2", ID = 7173073353},
    {Name = "حزين", ID = 1845920238},
}

local audioNames = {}
for _, v in ipairs(audios) do
    table.insert(audioNames, v.Name)
end

local selectedAudioID = nil

AddTextBox(Main, {
    Name = "ايدي صوت",
    Description = "",
    PlaceholderText = "",
    Callback = function(value)
        selectedAudioID = tonumber(value)
    end
})
local audioNames = {}
for _, audio in ipairs(audios) do
    table.insert(audioNames, audio.Name)
end

AddDropdown(Main, {
    Name = "Select Audio",
    Options = audioNames,
    Default = audioNames[1],
    Callback = function(selected)
        for _, v in ipairs(audios) do
            if v.Name == selected then
                selectedAudioID = v.ID
                break
            end
        end
    end
})



local function playAudio()
    if selectedAudioID then
        local args = {Workspace, selectedAudioID, 1}
        ReplicatedStorage.RE:FindFirstChild("1Gu1nSound1s"):FireServer(unpack(args))

        local sound = Instance.new("Sound")
        sound.SoundId = "rbxassetid://" .. selectedAudioID
        sound.Parent = Players.LocalPlayer.Character:WaitForChild("HumanoidRootPart")
        sound:Play()
    else
        warn("لم يتم اختيار صوت.")
    end
end


local function playLoopedAudio()
    while audioLoop do
        playAudio()
        task.wait(0.5)
    end
end


AddButton(Main, {
    Name = "تشغيل الصوت",
    Callback = function()
        playAudio()
    end
})

AddToggle(Main, {
    Name = "تكرار الصوت",
    Default = false,
    Callback = function(value)
        audioLoop = value
        if audioLoop then
            task.spawn(playLoopedAudio)
        end
    end
})

local function Audio_All_ClientSide(ID)
    local folder = workspace:FindFirstChild("Audio all client")
    if not folder then
        folder = Instance.new("Folder")
        folder.Name = "Audio all client"
        folder.Parent = workspace
    end

    local sound = Instance.new("Sound")
    sound.SoundId = "rbxassetid://" .. ID
    sound.Volume = 1
    sound.Looped = false
    sound.Parent = folder
    sound:Play()

    task.delay(1, function()
        sound:Destroy()
    end)
end

local function Audio_All_ServerSide(ID)
    if type(ID) ~= "number" then return end
    local event = ReplicatedStorage:FindFirstChild("1Gu1nSound1s", true)
    if event then
        event:FireServer(Workspace, ID, 1)
    end
end


AddToggle(Main, {
    Name = "تكرار مزعج",
    Default = false,
    Callback = function(Value)
        getgenv().Audio_All_loop_fast = Value

        while getgenv().Audio_All_loop_fast do
            if selectedAudioID then
                Audio_All_ServerSide(selectedAudioID)
                task.spawn(function()
                    Audio_All_ClientSide(selectedAudioID)
                end)
            else
                warn("لم يتم اختيار صوت.")
            end
            task.wait(0.03)
        end
    end
})

AddToggle(Main, {
    Name = "مزعج صو",
    Default = false,
    Callback = function(state)
        getgenv().AudioLoop = state

        while getgenv().AudioLoop and selectedAudioID do
            if Audio_All_ServerSide then
                Audio_All_ServerSide(selectedAudioID)
            end
            task.spawn(function()
                if Audio_All_ClientSide then
                    Audio_All_ClientSide(selectedAudioID)
                end
            end)
            task.wait(0.03)
        end
    end
})
local Main = MakeTab({
    Name = "سبام",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})


local TextSave = ""
local tcs = game:GetService("TextChatService")
local chat = tcs.ChatInputBarConfiguration.TargetTextChannel

function sendchat(msg)
    if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
        game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg, "All")
    else
        chat:SendAsync(msg)
    end
end

AddTextBox(Main, {
    Name = "اكتب هنا",
    Description = "بوبجي",
    Flag = "SpamMessage",
    Default = "",
    Callback = function(text)
        TextSave = text
    end
})

local SpamDelay = 0.5 
AddSlider(Main, {
    Name = "سرعة السبام",
    MinValue = 0,
    MaxValue = 2,
    Default = 0.5,
    Increase = 0.1,
    Callback = function(Value)
        SpamDelay = Value
    end
})

AddToggle(Main, {
    Name = "بدء السبام",
    Description = "",
    Flag = "StartSpam",
    Default = false,
    Callback = function(Value)
        getgenv().RaelHubSpamOn = Value
        while getgenv().RaelHubSpamOn do
            if TextSave and TextSave ~= "" then
                sendchat(TextSave)
            end
            task.wait(SpamDelay)
        end
    end
})

AddButton(Main, {
  Name = "هكر شات",
  Callback = function()
            if game:GetService("TextChatService").ChatVersion == Enum.ChatVersion.TextChatService then 
            game:GetService("TextChatService").TextChannels.RBXGeneral:SendAsync("hi\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\r\ TOP RemixHUB ")
        else 
            print("Nadaa")
    end
  end
})
local Main = MakeTab({
    Name = "بانق",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local function fetchPlayerNames()
    local namesList = {}
    for _, plr in ipairs(Players:GetPlayers()) do
        if plr ~= Players.LocalPlayer then 
            table.insert(namesList, plr.Name)
        end
    end
    return namesList
end

local dropdown = AddDropdown(Main, {
    Name = "Select a player",
    Default = "...",
    Options = fetchPlayerNames(),
    Callback = function(Value)
        if Value ~= "" then
            getgenv().selectedPlayer = Value
        end
    end
})

local function createBangToggle(name, yOffset, faceBang)
    local bangActive = false
    local connection
    local togglePosition = false

    AddToggle(Main, {
        Name = name,
        Default = false,
        Callback = function(Value)
            bangActive = Value

            local player = Players.LocalPlayer
            local char = player.Character
            if not char then return end

            local humanoid = char:FindFirstChildOfClass("Humanoid")
            if not humanoid then return end

            if Value then
                humanoid.PlatformStand = true

                if connection then connection:Disconnect() end

                connection = RunService.Heartbeat:Connect(function()
                    if bangActive and getgenv().selectedPlayer then
                        local targetPlayer = Players:FindFirstChild(getgenv().selectedPlayer)
                        if targetPlayer and targetPlayer.Character and targetPlayer.Character.PrimaryPart then
                            local targetHead = targetPlayer.Character:FindFirstChild("Head")
                            if targetHead and char.PrimaryPart then
                                local offset = togglePosition and 1 or 4
                                if faceBang then
                                    char:SetPrimaryPartCFrame(targetHead.CFrame * CFrame.new(0, 1, -offset) * CFrame.Angles(0, math.rad(180), 0))
                                else
                                    char:SetPrimaryPartCFrame(targetHead.CFrame * CFrame.new(0, yOffset, offset) * CFrame.Angles(0, 0, 0))
                                end
                                togglePosition = not togglePosition
                                wait(1)
                            end
                        end
                    end
                end)
            else
                humanoid.PlatformStand = false
                if connection then
                    connection:Disconnect()
                    connection = nil
                end
            end
        end    
    })
end

createBangToggle("Bang", -1, false)
createBangToggle("Bang 2", -1.5, false)
createBangToggle("الوجه Bang", 1, true)
createBangToggle("الوجه Bang 2", 1, true)

AddButton(Main, {
  Name = "مانع للبانج",
  Callback = function()
    local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local rootPart = character:WaitForChild("HumanoidRootPart")
local originalPosition = rootPart.Position
local farPosition = Vector3.new(9999999, 9999999, 9999999)
rootPart.CFrame = CFrame.new(farPosition)
task.delay(2, function()
    if rootPart then
        rootPart.CFrame = CFrame.new(originalPosition)
    end
end)
  end
})
local Main = MakeTab({
    Name = "الاعب",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})

AddButton(Main, {
  Name = "Rejoin | اعادة دخول الى سيرفر",
  Callback = function()
    local ts = game:GetService("TeleportService")
				local p = game:GetService("Players").LocalPlayer
				ts:Teleport(game.PlaceId, p)
    print('Hello!')
  end
})
AddButton(Main, {
  Name = "احذف جميع الأشياء الي في ايدك",
  Callback = function()
    local args = {
    [1] = "ClearAllTools"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clea1rTool1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اقتل نفسك",
  Callback = function()
    game.Players.LocalPlayer.Character.Humanoid.Health = 0
  end
})
AddButton(Main, {
  Name = "ازالة لاق • Destroy Lag",
  Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CasperFlyModz/discord.gg-rips/main/FPSBooster.lua"))()
  end
})

AddTextBox(Main, {
  Name = "سرعة | Speed",
  Default = "",
  PlaceholderText = "ادخل رقم",
  ClearText = true,
  Callback = function(value)
game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value     
 end
})
AddTextBox(Main, {
  Name = "قفز | Jump",
  Default = "",
  PlaceholderText = "ادخل رقم",
  ClearText = true,
  Callback = function(value)
game.Players.LocalPlayer.Character.Humanoid.JumpPower = value    
  end
})
AddTextBox(Main, {
  Name = "Fov | شاشه",
  Default = "",
  PlaceholderText = "ادخل رقم",
  ClearText = true,
  Callback = function(value)
local FovNumber = value
local Camera = workspace.CurrentCamera
Camera.FieldOfView = FovNumber  
  end
})
AddTextBox(Main, {
  Name = "Spin | دوران",
  Default = "",
  PlaceholderText = "ادخل رقم",
  ClearText = true,
  Callback = function(Value)
    getgenv().Spinspeed = Value

local Spin = Instance.new'BodyAngularVelocity'
Spin.Parent = game:GetService'Players'.LocalPlayer.Character:FindFirstChild'HumanoidRootPart'
Spin.MaxTorque = Vector3.new(0, math.huge, 100)
wait(0.1)
Spin.AngularVelocity = Vector3.new(100,Spinspeed,0)
  end
})
AddButton(Main, {
  Name = "كنبه | Couch",
  Callback = function()
    local args={[1]="PickingTools",[2]="Couch"};game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
  end
})
local infiniteJumpEnabled = false

-- Conectar o evento de pulo somente uma vez
local infiniteJumpConnection

-- Função de callback para o botão de alternância de pulo infinito
local function onInfiniteJumpToggle(value)
    infiniteJumpEnabled = value
    print("Infinite Jump Enabled:", infiniteJumpEnabled)
    
    -- Conectar o evento de pulo somente uma vez
    if not infiniteJumpConnection then
        infiniteJumpConnection = game:GetService("UserInputService").JumpRequest:Connect(function()
            if infiniteJumpEnabled then
                local player = game.Players.LocalPlayer
                local character = player.Character
                if character and character:FindFirstChildOfClass("Humanoid") then
                    character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
                end
            end
        end)
    end
end

-- Adiciona o botão de alternância "Infinitejum    
    local Toggle = AddToggle(Main, {
    Name = "قفز لا نهائي | Inf Jump",
    Default = false,
    Callback = onInfiniteJumpToggle
})
function MakeNotifi(notification)
    game.StarterGui:SetCore("SendNotification", {
        Title = notification.Title;
        Text = notification.Text;
        Duration = notification.Time;
    })
end
function MakeNotifi(notification)
    game.StarterGui:SetCore("SendNotification", {
        Title = notification.Title;
        Text = notification.Text;
        Duration = notification.Time;
    })
end

-- Variáveis e funções para a visualização dos jogadores
local viewEnabled = false
local selectedViewPlayer = nil
local characterAddedConnection = nil

local function toggleView(enabled)
    if enabled then
        if selectedViewPlayer then
            local player = selectedViewPlayer
            if player then
                game.Workspace.CurrentCamera.CameraSubject = player.Character
                if characterAddedConnection then
                    characterAddedConnection:Disconnect()
                end
                characterAddedConnection = player.CharacterAdded:Connect(function(character)
                    game.Workspace.CurrentCamera.CameraSubject = character
                end)
                MakeNotifi({
                    Title = "Visualizando " .. player.Name,
                    Text = "Você está visualizando o jogador: " .. player.Name,
                    Time = 6
                })
            else
                print("Jogador não encontrado.")
                viewEnabled = false
            end
        else
            print("Nenhum jogador selecionado para a visualização.")
            viewEnabled = false
        end
    else
        if characterAddedConnection then
            characterAddedConnection:Disconnect()
            characterAddedConnection = nil
        end
        game.Workspace.CurrentCamera.CameraSubject = game.Players.LocalPlayer.Character
    end
end

local value = "" -- Variável para armazenar o nome digitado

local function findPlayerByPartialNameOrNickname(partialName)
    value = partialName -- Atualiza a variável com o nome digitado completo
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name:lower():find(partialName:lower(), 1, true) or (player.DisplayName and player.DisplayName:lower():find(partialName:lower(), 1, true)) then
            return player
        end
    end
    return nil
end

-- Adicionando a caixa de texto para entrada do nome ou apelido do jogador
AddTextBox(Main, {
    Name = " دخل اول ثلاث أحرف من اسم اللاعب",
    Default = "",
    PlaceholderText = "دخل اسم اللاعب",
    ClearText = true,
    Callback = function(value)
        if value == "" then
            MakeNotifi({
                Title = "Erro",
                Text = "Nome do jogador não foi digitado.",
                Time = 5
            })
            if viewEnabled then
                toggleView(false)
            end
            return
        end

        selectedViewPlayer = findPlayerByPartialNameOrNickname(value)
        if selectedViewPlayer then
            print("Jogador encontrado: " .. selectedViewPlayer.Name)
            if viewEnabled then
                toggleView(false)
                toggleView(true)
            end
        else
            MakeNotifi({
                Title = "Erro",
                Text = "Nenhum jogador encontrado com esse nome ou apelido.",
                Time = 7
            })
            if viewEnabled then
                toggleView(false)
            end
        end
    end
})

-- Adicionando o toggle para ativar/desativar a visualização
AddToggle(Main, {
    Name = "شاهد | View",
    Default = false,
    Callback = function(enabled)
        viewEnabled = enabled
        toggleView(enabled)
    end
})

-- Conectando eventos de jogador removido
game.Players.PlayerRemoving:Connect(function(player)
    if selectedViewPlayer == player then
        selectedViewPlayer = nil
        if viewEnabled then
            toggleView(false)
            MakeNotifi({
                Title = "Jogador Saiu",
                Text = player.Name .. " saiu do jogo. Visualização desativada.",
                Time = 5
            })
        end
    end
end)

-- Função para manter a câmera no jogador selecionado
local function maintainView()
    while wait() do
        if viewEnabled and selectedViewPlayer then
            local player = selectedViewPlayer
            if player and game.Workspace.CurrentCamera.CameraSubject ~= player.Character then
                game.Workspace.CurrentCamera.CameraSubject = player.Character
            end
        end
    end
end
AddButton(Main, {
  Name = "اختفاء اللاعب",
  Callback = function()
    local args = {
    [1] = "CharacterSizeUp",
    [2] = 6
}
game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "إلغاء اختفاء",
  Callback = function()
    local args = {
    [1] = "CharacterSizeUp",
    [2] = 1
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
  end
})
-- Variável para controlar o estado do Noclip
local noclipEnabled = false
local runService = game:GetService("RunService")

-- Função para definir CanCollide para todas as partes do personagem
local function setCharacterCanCollide(character, canCollide)
    for _, part in ipairs(character:GetDescendants()) do
        if part:IsA("BasePart") then
            part.CanCollide = canCollide
        end
    end
end

-- Função de callback para o botão de alternância de Noclip
local function onNoclipToggle(value)
    noclipEnabled = value
    print("Noclip Enabled:", noclipEnabled)
    
    local player = game.Players.LocalPlayer
    local character = player.Character

    if noclipEnabled then
        -- Inicia um loop para continuamente definir CanCollide
        noclipLoop = runService.Stepped:Connect(function()
            if character then
                setCharacterCanCollide(character, false)
            end
        end)
    else
        -- Desativa o loop e restaura CanCollide
        if noclipLoop then
            noclipLoop:Disconnect()
        end
        if character then
            setCharacterCanCollide(character, true)
        end
    end
end

-- Adiciona o botão de alternância "Noclip"
local Toggle = AddToggle(Main, {
    Name = " اختراق الجدار",
    Default = false,
    Callback = onNoclipToggle
})
AddButton(Main, {
  Name = "مسجل مجاني",
  Callback = function(s)
_G.boomboxb = game:GetObjects('rbxassetid://740618400')[1]
_G.boomboxb.Parent = game:GetService'Players'.LocalPlayer.Backpack
loadstring(_G.boomboxb.Client.Source)() 
loadstring(_G.boomboxb.Server.Source)()
 end
})
local section = AddSection(Main, {"قتل بس قبله اخذ قنفة"})
AddButton(Main, {
  Name = "كنبة",
  Callback = function()
    local args={[1]="PickingTools",[2]="Couch"};game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
  end
})

-- Serviços necessários
local playerService = game:GetService('Players')
local runService = game:GetService('RunService')
local player = playerService.LocalPlayer

-- Variáveis globais
local selectedPlayer = nil
local selectedKillAdvancedPlayer = nil
local couchEquipped = false
local playerDropdownV13

-- Função para obter a lista de jogadores
local function getPlayerList()
    local playerList = {}
    for _, player in ipairs(playerService:GetPlayers()) do
        if player ~= playerService.LocalPlayer then
            table.insert(playerList, player.Name)
        end
    end
    return playerList
end

-- Função para atualizar o dropdown
local function updateDropdown(dropdown)
    UpdateDropdown(dropdown, getPlayerList())
end

-- Função para encontrar jogador por nome
local function gplr(String)
    local strl = String:lower()
    local Found = {}
    for _, v in pairs(playerService:GetPlayers()) do
        if v.Name:lower():sub(1, #strl) == strl then
            table.insert(Found, v)
        end
    end
    return Found
end

-- Função para flingar jogador (V13)
local function flingPlayer(targetName)
    local Target = gplr(targetName)
    if Target[1] then
        Target = Target[1]
        
        local Thrust = Instance.new('BodyThrust', player.Character.HumanoidRootPart)
        Thrust.Force = Vector3.new(999, 999, 999)
        Thrust.Name = "FlingForce"
        repeat
            player.Character.HumanoidRootPart.CFrame = Target.Character.HumanoidRootPart.CFrame
            Thrust.Location = Target.Character.HumanoidRootPart.Position
            runService.Heartbeat:Wait()
        until not Target.Character:FindFirstChild("Head")
    end
end

-- Interface para Fling V13
playerDropdownV13 = AddDropdown(Main, {
    Name = "اختار الاعب الي تريده",
    Default = "",
    Options = getPlayerList(),
    Callback = function(value)
        selectedPlayer = value
    end
})

AddButton(Main, {
    Name = "قتل الاعب",
    Callback = function()
        if selectedPlayer then
            flingPlayer(selectedPlayer)
        end
    end
})

-- Atualiza a lista de jogadores quando os jogadores entram ou saem do jogo
playerService.PlayerAdded:Connect(function()
    updateDropdown(playerDropdownV13)
end)

playerService.PlayerRemoving:Connect(function()
    updateDropdown(playerDropdownV13)
end)

-- Atualiza a lista de jogadores ao iniciar o script
updateDropdown(playerDropdownV13)

-- Serviços necessários
local playerService = game:GetService('Players')
local runService = game:GetService('RunService')
local localPlayer = playerService.LocalPlayer

-- Variáveis globais
local flingV14Toggle = false
local currentPlayerIndex = 1
local flingV14Connection
local players

-- Função para teleportar para a coordenada específica
local function teleportToCoordinate()
    local teleportPosition = Vector3.new(-58, 54, -183) -- Coordenada para onde você deseja teleportar
    if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        localPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(teleportPosition)
    end
end

-- Função para flingar jogadores em sequência
local function flingPlayersInSequence()
    if flingV14Toggle then
        -- Obtém a lista de jogadores uma vez
        players = playerService:GetPlayers()
        
        -- Reseta o índice do jogador atual
        currentPlayerIndex = 1
        
        -- Looping de teleportes em cada jogador
        flingV14Connection = runService.Heartbeat:Connect(function()
            -- Ignora o jogador local
            while players[currentPlayerIndex] == localPlayer do
                currentPlayerIndex = currentPlayerIndex + 1
                if currentPlayerIndex > #players then
                    currentPlayerIndex = 1
                end
            end
            
            local targetPlayer = players[currentPlayerIndex]
            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                if localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
                    localPlayer.Character.HumanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame

                    -- Verifica se o jogador alvo está sentado
                    if targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.SeatPart then
                        teleportToCoordinate()
                        
                        -- Espera 3 segundos antes de ir para o próximo jogador
                        wait(5)
                        currentPlayerIndex = currentPlayerIndex + 1
                        
                        if currentPlayerIndex > #players then
                            currentPlayerIndex = 1
                        end
                    end
                end
            end
        end)
    end
end

-- Função de callback para o toggle
local function onFlingV14Toggle(value)
    flingV14Toggle = value
    if flingV14Toggle then
        flingPlayersInSequence()
    else
        -- Desconecta as conexões quando o toggle é desativado
        if flingV14Connection then
            flingV14Connection:Disconnect()
            flingV14Connection = nil
        end
    end
end

local Main = MakeTab({
    Name = "سكربتات صنع مطور",
    Image = "rbxassetid://98360849741395",
    TabTitle = false
})
AddButton(Main, {
  Name = "طيران v1",
  Callback = function()
local url = "https://t.me/xkua_r"
setclipboard(url)
print("Discord url has been copied to your clipboard!")




-- RylorHub Fly Gui Hub --

 
local main = Instance.new("ScreenGui")

local Frame = Instance.new("Frame")

local up = Instance.new("TextButton")

local down = Instance.new("TextButton")

local onof = Instance.new("TextButton")

local TextLabel = Instance.new("TextLabel")

local plus = Instance.new("TextButton")

local speed = Instance.new("TextLabel")

local mine = Instance.new("TextButton")

local closebutton = Instance.new("TextButton")

local mini = Instance.new("TextButton")

local mini2 = Instance.new("TextButton")

 

main.Name = "main"

main.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")

main.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

main.ResetOnSpawn = false

 

Frame.Parent = main

Frame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)

Frame.Position = UDim2.new(0.100320168, 0, 0.379746825, 0)

Frame.Size = UDim2.new(0, 190, 0, 57)

 

up.Name = "صعود"

up.Parent = Frame

up.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

up.Size = UDim2.new(0, 44, 0, 28)

up.Font = Enum.Font.SourceSans

up.Text = "↑"

up.TextColor3 = Color3.fromRGB(0, 0, 0)

up.TextSize = 14.000

 

down.Name = "نزول"

down.Parent = Frame

down.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

down.Position = UDim2.new(0, 0, 0.491228074, 0)

down.Size = UDim2.new(0, 44, 0, 28)

down.Font = Enum.Font.SourceSans

down.Text = "↓"

down.TextColor3 = Color3.fromRGB(0, 0, 0)

down.TextSize = 14.000

 

onof.Name = "onof"

onof.Parent = Frame

onof.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

onof.Position = UDim2.new(0.702823281, 0, 0.491228074, 0)

onof.Size = UDim2.new(0, 56, 0, 28)

onof.Font = Enum.Font.Michroma

onof.Text = "Fly"

onof.TextColor3 = Color3.fromRGB(0, 0, 0)

onof.TextSize = 14.000

 

TextLabel.Parent = Frame

TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

TextLabel.Position = UDim2.new(0.469327301, 0, 0, 0)

TextLabel.Size = UDim2.new(0, 100, 0, 28)

TextLabel.Font = Enum.Font.Michroma

TextLabel.Text = "Script Made By DARK"

TextLabel.TextColor3 = Color3.fromRGB(0, 0, 0)

TextLabel.TextScaled = true

TextLabel.TextSize = 14.000

TextLabel.TextWrapped = true

 

plus.Name = "plus"

plus.Parent = Frame

plus.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

plus.Position = UDim2.new(0.231578946, 0, 0, 0)

plus.Size = UDim2.new(0, 45, 0, 28)

plus.Font = Enum.Font.SourceSans

plus.Text = "+"

plus.TextColor3 = Color3.fromRGB(0, 0, 0)

plus.TextScaled = true

plus.TextSize = 14.000

plus.TextWrapped = true

 

speed.Name = "speed"

speed.Parent = Frame

speed.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

speed.Position = UDim2.new(0.468421042, 0, 0.491228074, 0)

speed.Size = UDim2.new(0, 44, 0, 28)

speed.Font = Enum.Font.SourceSans

speed.Text = "1"

speed.TextColor3 = Color3.fromRGB(0, 0, 0)

speed.TextScaled = true

speed.TextSize = 14.000

speed.TextWrapped = true

 

mine.Name = "mine"

mine.Parent = Frame

mine.BackgroundColor3 = Color3.fromRGB(255, 255, 255)

mine.Position = UDim2.new(0.231578946, 0, 0.491228074, 0)

mine.Size = UDim2.new(0, 45, 0, 29)

mine.Font = Enum.Font.SourceSans

mine.Text = "-"

mine.TextColor3 = Color3.fromRGB(0, 0, 0)

mine.TextScaled = true

mine.TextSize = 14.000

mine.TextWrapped = true

 

closebutton.Name = "Close"

closebutton.Parent = main.Frame

closebutton.BackgroundColor3 = Color3.fromRGB(255, 5, 5)

closebutton.Font = "Michroma"

closebutton.Size = UDim2.new(0, 45, 0, 28)

closebutton.Text = "x"

closebutton.TextSize = 30

closebutton.Position = UDim2.new(0, 0, -1, 27)

 

mini.Name = "minimize"

mini.Parent = main.Frame

mini.BackgroundColor3 = Color3.fromRGB(117, 117, 117)

mini.Font = "Michroma"

mini.Size = UDim2.new(0, 45, 0, 28)

mini.Text = "-"

mini.TextSize = 40

mini.Position = UDim2.new(0, 44, -1, 27)

 

mini2.Name = "minimize2"

mini2.Parent = main.Frame

mini2.BackgroundColor3 = Color3.fromRGB(117, 117, 117)

mini2.Font = "SourceSans"

mini2.Size = UDim2.new(0, 45, 0, 28)

mini2.Text = "+"

mini2.TextSize = 40

mini2.Position = UDim2.new(0, 44, -1, 57)

mini2.Visible = false

 

speeds = 1

 

local speaker = game:GetService("Players").LocalPlayer

 

local chr = game.Players.LocalPlayer.Character

local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

 

nowe = false

 



wait(1.2)
game.StarterGui:SetCore("SendNotification", {
Title = "Welcome"; -- the title (ofc)
Text = "Script Made By DARK"; -- what the text says (ofc)
Icon = ""; -- the image if u want. 
Duration = 5; -- how long the notification should in secounds
})

 

Frame.Active = true -- main = gui

Frame.Draggable = true

 

onof.MouseButton1Down:connect(function()

 

 if nowe == true then

  nowe = false

 

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,true)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,true)

  speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.RunningNoPhysics)

 else 

  nowe = true

 

 

 

  for i = 1, speeds do

   spawn(function()

 

    local hb = game:GetService("RunService").Heartbeat 

 

 

    tpwalking = true

    local chr = game.Players.LocalPlayer.Character

    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

    while tpwalking and hb:Wait() and chr and hum and hum.Parent do

     if hum.MoveDirection.Magnitude > 0 then

      chr:TranslateBy(hum.MoveDirection)

     end

    end

 

   end)

  end

  game.Players.LocalPlayer.Character.Animate.Disabled = true

  local Char = game.Players.LocalPlayer.Character

  local Hum = Char:FindFirstChildOfClass("Humanoid") or Char:FindFirstChildOfClass("AnimationController")

 

  for i,v in next, Hum:GetPlayingAnimationTracks() do

   v:AdjustSpeed(0)

  end

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Flying,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.GettingUp,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Jumping,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Landed,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Physics,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.PlatformStanding,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Ragdoll,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.RunningNoPhysics,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.StrafingNoPhysics,false)

  speaker.Character.Humanoid:SetStateEnabled(Enum.HumanoidStateType.Swimming,false)

  speaker.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)

 end

 

 

 

 

 if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").RigType == Enum.HumanoidRigType.R6 then

 

 

 

  local plr = game.Players.LocalPlayer

  local torso = plr.Character.Torso

  local flying = true

  local deb = true

  local ctrl = {f = 0, b = 0, l = 0, r = 0}

  local lastctrl = {f = 0, b = 0, l = 0, r = 0}

  local maxspeed = 50

  local speed = 0

 

 

  local bg = Instance.new("BodyGyro", torso)

  bg.P = 9e4

  bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)

  bg.cframe = torso.CFrame

  local bv = Instance.new("BodyVelocity", torso)

  bv.velocity = Vector3.new(0,0.1,0)

  bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

  if nowe == true then

   plr.Character.Humanoid.PlatformStand = true

  end

  while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do

   game:GetService("RunService").RenderStepped:Wait()

 

   if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then

    speed = speed+.5+(speed/maxspeed)

    if speed > maxspeed then

     speed = maxspeed

    end

   elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then

    speed = speed-1

    if speed < 0 then

     speed = 0

    end

   end

   if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then

    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed

    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}

   elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then

    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed

   else

    bv.velocity = Vector3.new(0,0,0)

   end

   -- game.Players.LocalPlayer.Character.Animate.Disabled = true

   bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)

  end

  ctrl = {f = 0, b = 0, l = 0, r = 0}

  lastctrl = {f = 0, b = 0, l = 0, r = 0}

  speed = 0

  bg:Destroy()

  bv:Destroy()

  plr.Character.Humanoid.PlatformStand = false

  game.Players.LocalPlayer.Character.Animate.Disabled = false

  tpwalking = false

 

 

 

 

 else

  local plr = game.Players.LocalPlayer

  local UpperTorso = plr.Character.UpperTorso

  local flying = true

  local deb = true

  local ctrl = {f = 0, b = 0, l = 0, r = 0}

  local lastctrl = {f = 0, b = 0, l = 0, r = 0}

  local maxspeed = 50

  local speed = 0

 

 

  local bg = Instance.new("BodyGyro", UpperTorso)

  bg.P = 9e4

  bg.maxTorque = Vector3.new(9e9, 9e9, 9e9)

  bg.cframe = UpperTorso.CFrame

  local bv = Instance.new("BodyVelocity", UpperTorso)

  bv.velocity = Vector3.new(0,0.1,0)

  bv.maxForce = Vector3.new(9e9, 9e9, 9e9)

  if nowe == true then

   plr.Character.Humanoid.PlatformStand = true

  end

  while nowe == true or game:GetService("Players").LocalPlayer.Character.Humanoid.Health == 0 do

   wait()

 

   if ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0 then

    speed = speed+.5+(speed/maxspeed)

    if speed > maxspeed then

     speed = maxspeed

    end

   elseif not (ctrl.l + ctrl.r ~= 0 or ctrl.f + ctrl.b ~= 0) and speed ~= 0 then

    speed = speed-1

    if speed < 0 then

     speed = 0

    end

   end

   if (ctrl.l + ctrl.r) ~= 0 or (ctrl.f + ctrl.b) ~= 0 then

    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (ctrl.f+ctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(ctrl.l+ctrl.r,(ctrl.f+ctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed

    lastctrl = {f = ctrl.f, b = ctrl.b, l = ctrl.l, r = ctrl.r}

   elseif (ctrl.l + ctrl.r) == 0 and (ctrl.f + ctrl.b) == 0 and speed ~= 0 then

    bv.velocity = ((game.Workspace.CurrentCamera.CoordinateFrame.lookVector * (lastctrl.f+lastctrl.b)) + ((game.Workspace.CurrentCamera.CoordinateFrame * CFrame.new(lastctrl.l+lastctrl.r,(lastctrl.f+lastctrl.b)*.2,0).p) - game.Workspace.CurrentCamera.CoordinateFrame.p))*speed

   else

    bv.velocity = Vector3.new(0,0,0)

   end

 

   bg.cframe = game.Workspace.CurrentCamera.CoordinateFrame * CFrame.Angles(-math.rad((ctrl.f+ctrl.b)*50*speed/maxspeed),0,0)

  end

  ctrl = {f = 0, b = 0, l = 0, r = 0}

  lastctrl = {f = 0, b = 0, l = 0, r = 0}

  speed = 0

  bg:Destroy()

  bv:Destroy()

  plr.Character.Humanoid.PlatformStand = false

  game.Players.LocalPlayer.Character.Animate.Disabled = false

  tpwalking = false

 

 

 

 end

 

 

 

 

 

end)

 

local tis

 

up.MouseButton1Down:connect(function()

 tis = up.MouseEnter:connect(function()

  while tis do

   wait()

   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,1,0)

  end

 end)

end)

 

up.MouseLeave:connect(function()

 if tis then

  tis:Disconnect()

  tis = nil

 end

end)

 

local dis

 

down.MouseButton1Down:connect(function()

 dis = down.MouseEnter:connect(function()

  while dis do

   wait()

   game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(0,-1,0)

  end

 end)

end)

 

down.MouseLeave:connect(function()

 if dis then

  dis:Disconnect()

  dis = nil

 end

end)

 

 

game:GetService("Players").LocalPlayer.CharacterAdded:Connect(function(char)

 wait(0.7)

 game.Players.LocalPlayer.Character.Humanoid.PlatformStand = false

 game.Players.LocalPlayer.Character.Animate.Disabled = false

 

end)

 

 

plus.MouseButton1Down:connect(function()

 speeds = speeds + 1

 speed.Text = speeds

 if nowe == true then

 

 

  tpwalking = false

  for i = 1, speeds do

   spawn(function()

 

    local hb = game:GetService("RunService").Heartbeat 

 

 

    tpwalking = true

    local chr = game.Players.LocalPlayer.Character

    local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

    while tpwalking and hb:Wait() and chr and hum and hum.Parent do

     if hum.MoveDirection.Magnitude > 0 then

      chr:TranslateBy(hum.MoveDirection)

     end

    end

 

   end)

  end

 end

end)

mine.MouseButton1Down:connect(function()

 if speeds == 1 then

  speed.Text = '-1 speed fly bruh'

  wait(1)

  speed.Text = speeds

 else

  speeds = speeds - 1

  speed.Text = speeds

  if nowe == true then

   tpwalking = false

   for i = 1, speeds do

    spawn(function()

 

     local hb = game:GetService("RunService").Heartbeat 

 

 

     tpwalking = true

     local chr = game.Players.LocalPlayer.Character

     local hum = chr and chr:FindFirstChildWhichIsA("Humanoid")

     while tpwalking and hb:Wait() and chr and hum and hum.Parent do

      if hum.MoveDirection.Magnitude > 0 then

       chr:TranslateBy(hum.MoveDirection)

      end

     end

 

    end)

   end

  end

 end

end)

 

closebutton.MouseButton1Click:Connect(function()

 main:Destroy()

end)

 

mini.MouseButton1Click:Connect(function()

 up.Visible = false

 down.Visible = false

 onof.Visible = false

 plus.Visible = false

 speed.Visible = false

 mine.Visible = false

 mini.Visible = false

 mini2.Visible = true

 main.Frame.BackgroundTransparency = 1

 closebutton.Position = UDim2.new(0, 0, -1, 57)

end)

 

mini2.MouseButton1Click:Connect(function()

 up.Visible = true

 down.Visible = true

 onof.Visible = true

 plus.Visible = true

 speed.Visible = true

 mine.Visible = true

 mini.Visible = true

 mini2.Visible = false

 main.Frame.BackgroundTransparency = 0 

 closebutton.Position = UDim2.new(0, 0, -1, 27)

end)
  end
})
