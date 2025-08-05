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
    Image = "rbxassetid://139589712290648",
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
    Image = "rbxassetid://131153193945220",
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

AddButton(Main, {
    Name = "اقتل كل باص",
    Callback = function()
        local lp = game.Players.LocalPlayer
        local char = lp.Character or lp.CharacterAdded:Wait()
        local hrp = char:WaitForChild("HumanoidRootPart")
        local pos = hrp.CFrame

        local function kill(player)
            local A_1 = "SchoolBus"
            game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", A_1)
            wait(0.25)
            local Tool = lp.Backpack:FindFirstChild("SchoolBus")
            Tool.Parent = char
            wait(0.2)
            char:WaitForChild("VehicleSeat").Sit:FireServer(player.Character:FindFirstChildOfClass("Humanoid"))
            wait(0.1)
            char:FindFirstChild("HumanoidRootPart").CFrame = CFrame.new(0, -250, 0)
            wait(1)
        end

        for _, player in ipairs(game.Players:GetPlayers()) do
            if player ~= lp and player.Character then
                kill(player)
            end
        end

        wait(1)
        hrp.CFrame = pos
        wait(0.5)
        for _, v in ipairs(workspace.Vehicles:GetChildren()) do
            if v.Name == lp.Name then
                v:Destroy()
            end
        end
    end
})



AddButton(Main, {
    Name = "قتل الكل بل بيت وباص",
    Callback = function()
        local Players = game:GetService("Players")
        local lp = Players.LocalPlayer
        local rs = game:GetService("ReplicatedStorage")
        local Workspace = game:GetService("Workspace")
        local function BuyHouse()
            rs.RE:FindFirstChild("1Gettin1gHous1e"):InvokeServer()
        end

        local function GetTool(tool)
            rs.RE:FindFirstChild("1Too1l"):InvokeServer("PickingTools", tool)
        end

        local function EquipTool(tool)
            local Backpack = lp:WaitForChild("Backpack")
            if Backpack:FindFirstChild(tool) then
                Backpack[tool].Parent = lp.Character
            end
        end

        BuyHouse()
        wait(0.25)
        GetTool("SchoolBus")
        wait(0.2)
        EquipTool("SchoolBus")
        wait(0.2)

        local car = lp.Character:FindFirstChildWhichIsA("Model")
        local carseat = car and car:FindFirstChildWhichIsA("VehicleSeat")

        if not carseat then return end
        carseat:Sit(lp.Character:FindFirstChildWhichIsA("Humanoid"))

        for _, v in pairs(Players:GetPlayers()) do
            if v ~= lp and v.Character and v.Character:FindFirstChild("HumanoidRootPart") then
                local pos = v.Character.HumanoidRootPart.CFrame
                car:PivotTo(pos + Vector3.new(0, 1, 0))
                wait(0.4)
                if (lp.Character:FindFirstChild("HumanoidRootPart").Position - v.Character.HumanoidRootPart.Position).Magnitude < 13 then
                    rs.RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer("BanPlayerFromHouse", v)
                end
            end
        end
    end
})
