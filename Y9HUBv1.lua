loadstring(game:HttpGet(("https://raw.githubusercontent.com/ajgue/Jo-Script-/refs/heads/main/Y9.lua.txt")))()
MakeWindow({
  Hub = {
    Title = "Y9HUB",
    Animation = "هسة يفتح سكربت"
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
  Image = "rbxassetid://111320042197422",
  Size = {50, 50},
  Color = Color3.fromRGB(255, 125, 0),
  Corner = true,
  Stroke = false,
  StrokeColor = Color3.fromRGB(255, 125, 0)
})

local Main = MakeTab({Name = "معلومات"})
AddDiscord(Main, {
    DiscordLink = "hhttps://t.me/xkua_r",
    DiscordIcon = "rbxassetid://111320042197422",
    DiscordTitle = "Watch every update in the Telegram ",
    })
    local Main = MakeTab({Name = "التخريب"})
AddSection(Main, {"القتلات"})
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
    Name = "اختر الضحيه",
    Options = playerNames,
    Default = playerNames[1],
    Callback = function(Value)
        selectedPlayerName = Value
    end
})

AddButton(Main, {
    Name = "القتل بالسفينه",
    Callback = function()
        if not selectedPlayerName then
            warn("لم يتم اختيار لاعب")
            return
        end

        MakeNotifi({
            Title = "تم التشغيل",
            Text = "لا تفعل الامر اكثر من مره",
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
            Text = "لا تفعل الامر اكثر من مره",
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
AddSection(Main, {"الفلنجات"})
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
local Main = MakeTab({Name = "الرحمة"})
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

AddDropdown(Main, {
    Name = "اختر الضحية",
    Default = "...",
    Options = fetchPlayerNames(),
    Callback = function(Value)
        if Value ~= "" then
            getgenv().selectedPlayer = Value
        end
    end
})
    local Main = MakeTab({Name = "االاعب"})
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

-- Adiciona o Toggle para ativar/desativar o Fling V14  
AddButton(Main, {
  Name = "☠️يعلق السيرفر☠️",
  Callback = function()
tools = "FireX"
        shutdownserver = true
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
            task.wait()
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
        if game:GetService("Workspace"):FindFirstChild("Camera") then
            game:GetService("Workspace"):FindFirstChild("Camera"):Destroy()
        end
        wait(0.1)
        if game:GetService("Workspace"):FindFirstChild("Camera") then
            game:GetService("Workspace"):FindFirstChild("Camera"):Destroy()
        end
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.CFrame + Vector3.new(0, -15, 0)
        task.wait(0.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        ddos = true
        for i = 1, 1350 do
            task.wait()
            if ddos == false then
                local args = {
                    [1] = "ClearAllTools"
                }
 
                cleartoolremote:FireServer(unpack(args))
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999, -475, 9999)
                return
            end
            if game:GetService("Workspace"):FindFirstChild("Camera") then
                game:GetService("Workspace"):FindFirstChild("Camera"):Destroy()
            end
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools) then
                game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools):Destroy()
            end
            if ddos == false then return end
            fireclickdetector(game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.ClickDetector, 0)
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -475, 0)
  end
})
AddButton(Main, {
  Name = "☠️تدمير العالم ☠️",
  Callback = function()
    game.Workspace:ClearAllChildren()
  end
})

AddButton(Main, {
  Name = "طرد الكل | kick all",
  Callback = function()
            tools = "FireX"
        shutdownserver = true
        if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
            task.wait()
            game.Players.LocalPlayer.Character.Humanoid.Sit = false
        end
        if game:GetService("Workspace"):FindFirstChild("Camera") then
            game:GetService("Workspace"):FindFirstChild("Camera"):Destroy()
        end
        wait(0.1)
        if game:GetService("Workspace"):FindFirstChild("Camera") then
            game:GetService("Workspace"):FindFirstChild("Camera"):Destroy()
        end
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.CFrame + Vector3.new(0, -15, 0)
        task.wait(0.2)
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
        ddos = true
        for i = 1, 1350 do
            task.wait()
            if ddos == false then
                local args = {
                    [1] = "ClearAllTools"
                }
 
                cleartoolremote:FireServer(unpack(args))
                game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(9999, -475, 9999)
                return
            end
            if game:GetService("Workspace"):FindFirstChild("Camera") then
                game:GetService("Workspace"):FindFirstChild("Camera"):Destroy()
            end
            if game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools) then
                game:GetService("Players").LocalPlayer.Character:FindFirstChild(tools):Destroy()
            end
            if ddos == false then return end
            fireclickdetector(game:GetService("Workspace").WorkspaceCom["001_GiveTools"].FireX.ClickDetector, 0)
        end
        game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = false
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0, -475, 0)
  end
})
local Players = game:GetService("Players")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")

local LocalPlayer = Players.LocalPlayer
local Camera = workspace.CurrentCamera
local flying = false
local speed = 50
local BodyGyro, BodyVelocity

local function Fly()
    local Character = LocalPlayer.Character
    if not Character or not Character:FindFirstChild("HumanoidRootPart") then return end
    local RootPart = Character:FindFirstChild("HumanoidRootPart")

    BodyGyro = Instance.new("BodyGyro", RootPart)
    BodyGyro.P = 9e4
    BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
    BodyGyro.CFrame = RootPart.CFrame

    BodyVelocity = Instance.new("BodyVelocity", RootPart)
    BodyVelocity.Velocity = Vector3.new(0, 0.1, 0)
    BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)

    flying = true
    Character.Humanoid.PlatformStand = true

    RunService.RenderStepped:Connect(function()
        if flying then 
            local MoveDirection = Character.Humanoid.MoveDirection
            local CameraDirection = Camera.CFrame.LookVector

            if MoveDirection.Magnitude > 0 then
                BodyVelocity.Velocity = (CameraDirection * MoveDirection.Magnitude) * speed
            else
                BodyVelocity.Velocity = Vector3.new(0, 0.1, 0)
            end

            BodyGyro.CFrame = Camera.CFrame
        end
    end)
end

local function StopFly()
    flying = false
    if BodyGyro then BodyGyro:Destroy() end
    if BodyVelocity then BodyVelocity:Destroy() end
    if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") then
        LocalPlayer.Character.Humanoid.PlatformStand = false
    end
end

local Toggle = AddToggle(Main, {
    Name = "طيران",
    Default = false,
    Callback = function(Value)
        if Value then
            Fly()
        else
            StopFly()
        end
    end
})

    local Main = MakeTab({Name = "الاجسام"})
    
AddSection(Main, {"اجسام بنات"})
AddButton(Main, {
  Name = "جسم بنية",
  Callback = function()
print("Clicked")local args = {
    [1] = {
        [1] = 96491916349570;
        [2] = 76683091425509;
        [3] = 75159926897589;
        [4] = 1;
        [5] = 1;
        [6] = 1;
    };
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))

end
})


AddButton(Main, {
  Name = "جسم بنية 2",
  Callback = function()
print("Clicked")local args = {
    [1] = {
        [1] = 74302534603111;
        [2] = 76683091425509;
        [3] = 75159926897589;
        [4] = 1;
        [5] = 1;
        [6] = 1;
    };
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))

end
})

AddButton(Main, {
  Name = "جسم بنية 3",
  Callback = function()
print("Clicked")local args = {
    [1] = {
        [1] = 124754866635882;
        [2] = 76683091425509;
        [3] = 75159926897589;
        [4] = 1;
        [5] = 1;
        [6] = 1;
    };
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))

end
})

AddButton(Main, {
  Name = "جسم بنية 4",
  Callback = function()
print("Clicked")local args = {
    [1] = {
        [1] = 96491916349570;
        [2] = 14854350570;
        [3] = 14854350451;
        [4] = 1;
        [5] = 1;
        [6] = 1;
    };
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))

end
})

AddButton(Main, {
  Name = "جسم بنية 5",
  Callback = function()
print("Clicked")local args = {
    [1] = {
        [1] = 101577365085156;
        [2] = 121017849910260;
        [3] = 111571034664628;
        [4] = 1;
        [5] = 1;
        [6] = 1;
    };
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))

end
})

AddButton(Main, {
  Name = "جسم بنية 6",
  Callback = function()
print("Clicked")local args = {
    [1] = {
        [1] = 18839824113;
        [2] = 18839824209;
        [3] = 18839824132;
        [4] = 1;
        [5] = 1;
        [6] = 1;
    };
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))

end
})

AddButton(Main, {
  Name = "جسم بنية 7",
  Callback = function()
print("Clicked")local args = {
    [1] = {
        [1] = 16214246112;
        [2] = 76683091425509;
        [3] = 16214251181;
        [4] = 1;
        [5] = 1;
        [6] = 1;
    };
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))

end
})

AddButton(Main, {
  Name = "جسم بنية 8",
  Callback = function()
print("Clicked")local args = {
    [1] = {
        [1] = 15539008532;
        [2] = 15539008875;
        [3] = 15539008680;
        [4] = 15539008795;
        [5] = 15539011945;
        [6] = 1;
    };
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))

end
})

AddButton(Main, {
  Name = "جسم بنية 9",
  Callback = function()
print("Clicked")local args = {
    [1] = {
        [1] = 14861800638;
        [2] = 14861800626;
        [3] = 14861801452;
        [4] = 14861800627;
        [5] = 14861801454;
        [6] = 1;
    };
}

game:GetService("ReplicatedStorage"):WaitForChild("Remotes", 9e9):WaitForChild("ChangeCharacterBody", 9e9):InvokeServer(unpack(args))

end
})


AddSection(Main, {"ا"})

AddButton(Main, {
  Name = "جسم ولد نحيف 1",
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
  Name = "جسم ولد نحيف 2",
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
local section = AddSection(Main, {"أجسام اولاد مشهوره وجميله "})
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
local section = AddSection(Main, {"أجسام اقزام"})
AddButton(Main, {
  Name = "جسم قزم عادي",
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
  Name = "جسم قزم متوسط",
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
  Name = "جسم قزم صغيره [ كيوت ] ",
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
local Main = MakeTab({Name = "الـرؤوس و الارجـل"})

local Paragraph = AddParagraph(Main, {"الراس"})
AddButton(Main, {
  Name = "رأس روبوت",
  Callback = function()
    local args = {
    [1] = 3210773801
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "رأس مخفي ",
  Callback = function()
    local args = {
    [1] = 134082579
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "رأس كوبي | رول ",
  Callback = function()
    local args = {
    [1] = 746767604
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})

AddButton(Main, {
  Name = "عيون زرق ",
  Callback = function()
    local args = {
    [1] = 16580493236
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})

local Paragraph = AddParagraph(Main, {"متنوع"})
AddButton(Main, {
  Name = "٭جسم ولد كوبي",
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
  Name = "جـسم ولد رول",
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
  Name = "قادح",
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
  Name = "جـسم قزم ",
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
  Name = "جـسم قزم",
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
  Name = "الهامسـتر",
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
AddButton(Main, {
  Name = "الرجل اليسري",
  Callback = function()
local args = {
    [1] = "CharacterChange",
    [2] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 1,
        [5] = 139607673,
        [6] = 1
    },
    [3] = "by:REDz"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "الرجل اليمنى",
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
    [3] = "by:REDz"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Avata1rOrigina1l"):FireServer(unpack(args))

  end
})
local Paragraph = AddParagraph(Main, {"个الراجل متنوعه个"})
AddButton(Main, {
  Name = "رجل عضام ابيض",
  Callback = function()
    local args = {
    [1] = {
        [1] = 1,
        [2] = 1,
        [3] = 1,
        [4] = 14580308646,
        [5] = 1,
        [6] = 1
    }
}

game:GetService("ReplicatedStorage").Remotes.ChangeCharacterBody:InvokeServer(unpack(args))

  end
})

--[[
  Name = "Botão teste" <string> nome do seu botão
  Callback = function()
    -- funcão do seu botão
  end
]]
AddButton(Main, {
  Name = "رجل عضام اسود",
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
  Name = "ارجل رول ",
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
  Name = "个رجل حديديه个",
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


local Main = MakeTab({Name = "سكنات مضحكة"})
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
local Main = MakeTab({Name = "الاكسسوارات"})
AddButton(Main, {
  Name = "قفازات ايد سوداء",
  Callback = function()
  local args = {
    [1] = 9239689111
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سترة سوداء",
  Callback = function()
  local args = {
    [1] = 89892588488089
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "سترة وردي كيوت",
  Callback = function()
  local args = {
    [1] = 10789914680
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قفازات ايد سودة 1",
  Callback = function()
  local args = {
    [1] = 10789914680
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قفازات ايد سودة 2",
  Callback = function()
  local args = {
    [1] = 11363898043
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قفازات ايد سودة 3",
  Callback = function()
  local args = {
    [1] = 10791180072
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قفازات ايد بيضة",
  Callback = function()
  local args = {
    [1] = 10871965173
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قفازات يد زهري",
  Callback = function()
  local args = {
    [1] = 10789939838
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "قفازات يد حمراء",
  Callback = function()
  local args = {
    [1] = 12379676852
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "اضافر سوداء",
  Callback = function()
  local args = {
    [1] = 12825022709
}

game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "تنحط بل رجل حمراء",
  Callback = function()
    local args = {
        [1] = 14388001192
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "تنحط بل رجل بيضاء",
  Callback = function()
    local args = {
        [1] = 14388009243
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "بزازت مال رجلين",
  Callback = function()
    local args = {
        [1] = 13463290106
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "مخده سوده تنحط بل رجلين",
  Callback = function()
    local args = {
        [1] = 101836206044298
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "بيضه تحط بل رجلين",
  Callback = function()
    local args = {
        [1] = 11111279400
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "مخده تنحط بل رجل بيضه و سوده",
  Callback = function()
    local args = {
        [1] = 14387999337
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "مخده بيضه تنحط بل رجلين",
  Callback = function()
    local args = {
        [1] = 90926188446523
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "تنحط بل رجل مخده تشك شگ",
  Callback = function()
    local args = {
        [1] = 14388006902
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "مخده سوده تنحط بل رجل",
  Callback = function()
    local args = {
        [1] = 14388004031
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
local section = AddSection(Main, {"اليد"})
AddButton(Main, {
  Name = "بزازت مال ادين",
  Callback = function()
    local args = {
        [1] = 13463292395
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "جفوف صغار",
  Callback = function()
    local args = {
        [1] = 14134136352
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "جفوف كبار ما ادين",
  Callback = function()
    local args = {
        [1] = 115529577360949
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "جفوف كبار بلون الابيض",
  Callback = function()
    local args = {
        [1] = 128527713198404
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "جفوف مشككات مال ادين",
  Callback = function()
    local args = {
        [1] = 9239689111
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "بيضه تنحط بل ادين",
  Callback = function()
    local args = {
        [1] = 11111279400
    }
    game:GetService("ReplicatedStorage").Remotes.Wear:InvokeServer(unpack(args))
  end
})

AddSection(Main, {" أحذية الشيطان "})
AddButton(Main, {
    Name = " حذاء الشيطان الأبيض ",
    Callback = function()
        local args = {
            [1] = 14388009243;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " حذاء الشيطان الأسود والأحمر ",
    Callback = function()
        local args = {
            [1] = 14388001192;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " حذاء الشيطان الأسود ",
    Callback = function()
        local args = {
            [1] = 14388004031;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

AddSection(Main, {" شوك "})
AddButton(Main, {
    Name = " شوك أسود بالذراع والساق ",
    Callback = function()
        local args = {
            [1] = 17406577951;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " شوك أبيض بالذراع والساق ",
    Callback = function()
        local args = {
            [1] = 17406634097;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " شوك أسود حول كامل الجسم ",
    Callback = function()
        local args = {
            [1] = 13463285148;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

AddSection(Main, {" باقات ورد "})
AddButton(Main, {
    Name = " باقة ورد سوداء ",
    Callback = function()
        local args = {
            [1] = 12465465333;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " باقة ورد حمراء ",
    Callback = function()
        local args = {
            [1] = 86738633187728;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " باقة ورد وردية ",
    Callback = function()
        local args = {
            [1] = 12465478536;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " باقة ورد بيضاء ",
    Callback = function()
        local args = {
            [1] = 72175664063418;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

AddSection(Main, {" ضمادات الذراع "})
AddButton(Main, {
    Name = " ضمادات الذراع لون أسود ",
    Callback = function()
        local args = {
            [1] = 11456892689;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " ضمادات الذراع لون أبيض ",
    Callback = function()
        local args = {
            [1] = 11458078735;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

AddSection(Main, {" قفازات "})
AddButton(Main, {
    Name = " قفازات اليد طويلة لون أسود ",
    Callback = function()
        local args = {
            [1] = 14663501859;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات قصيرة لون أسود ",
    Callback = function()
        local args = {
            [1] = 14915193711;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات اليد طويلة لون أحمر ",
    Callback = function()
        local args = {
            [1] = 15209194774;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات اليد طويلة لون أبيض ",
    Callback = function()
        local args = {
            [1] = 10789933479;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات قصيرة لون أبيض ",
    Callback = function()
        local args = {
            [1] = 15066901505;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات اليد طويلة لون أزرق ",
    Callback = function()
        local args = {
            [1] = 10789945803;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات قصيرة لون أزرق ",
    Callback = function()
        local args = {
            [1] = 10714157708;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات اليد طويلة لون وردي ",
    Callback = function()
        local args = {
            [1] = 10789939838;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات قصيرة لون وردي ",
    Callback = function()
        local args = {
            [1] = 17775444165;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات اليد طويلة لون أخضر ",
    Callback = function()
        local args = {
            [1] = 13233318125;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات قصيرة لون أخضر ",
    Callback = function()
        local args = {
            [1] = 10713817180;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفاز غريب ",
    Callback = function()
        local args = {
            [1] = 12175951307;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات حمراء مخططة لون أبيض ",
    Callback = function()
        local args = {
            [1] = 14687547890;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات تتناسب على البنت أو الولد ",
    Callback = function()
        local args = {
            [1] = 106701020164834;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات وردية للبنات ",
    Callback = function()
        local args = {
            [1] = 16030963309;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات سوداء جميلة ",
    Callback = function()
        local args = {
            [1] = 12368927792;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات بيضاء جميلة ",
    Callback = function()
        local args = {
            [1] = 12368919975;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات خضراء جميلة ",
    Callback = function()
        local args = {
            [1] = 12368854118;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات مخططة أسود وأحمر ",
    Callback = function()
        local args = {
            [1] = 14758885890;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " قفازات مخططة أبيض وأسود ",
    Callback = function()
        local args = {
            [1] = 14758885890;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

AddSection(Main, {" جاكيتات "})
AddButton(Main, {
    Name = " جاكيت أسود مفتوح ",
    Callback = function()
        local args = {
            [1] = 9048321833;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " جاكيت أسود فيه هيكل عظمي مفتوح ",
    Callback = function()
        local args = {
            [1] = 15154273975;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " جاكيت أسود وأبيض مفتوح ",
    Callback = function()
        local args = {
            [1] = 9122099141;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " جاكيت أبيض مفتوح ",
    Callback = function()
        local args = {
            [1] = 11247067714;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " جاكيت أسود مفتوح حلو ",
    Callback = function()
        local args = {
            [1] = 9132711224;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

AddSection(Main, {" جاكيتات بنات "})
AddButton(Main, {
    Name = " جاكيت بنت أسود مفتوح ",
    Callback = function()
        local args = {
            [1] = 14900095685;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " جاكيت بنت أسود مفتوح حلو ",
    Callback = function()
        local args = {
            [1] = 14849843673;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " جاكيت بنت أحمر مفتوح ",
    Callback = function()
        local args = {
            [1] = 18623320140;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " جاكيت بنت أحمر وأسود ",
    Callback = function()
        local args = {
            [1] = 17833109917;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " جاكيت بنت قصير أحمر مفتوح ",
    Callback = function()
        local args = {
            [1] = 109964869516145;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

AddSection(Main, {" تيشيرتات أولاد "})
AddButton(Main, {
    Name = " تيشيرت للاولاد أبيض موشم ",
    Callback = function()
        local args = {
            [1] = 16756099522;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " تيشيرت للاولاد أسود موشم ",
    Callback = function()
        local args = {
            [1] = 16690692104;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " تيشيرت للاولاد باد بوي وبني ",
    Callback = function()
        local args = {
            [1] = 17490664393;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " تيشيرت للاولاد باد بوي أسود ورصاصي ",
    Callback = function()
        local args = {
            [1] = 12938645598;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " تيشيرت للاولاد باد بوي أسود وأحمر ",
    Callback = function()
        local args = {
            [1] = 12938637969;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

AddSection(Main, {" تيشيرتات بنات "})
AddButton(Main, {
    Name = " تيشيرت بنت أسود موشم ",
    Callback = function()
        local args = {
            [1] = 16701261333;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " تيشيرت أسود للبنات فيه ورود ",
    Callback = function()
        local args = {
            [1] = 16466139521;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " تيشيرت للبنات أسود وأبيض نجوم ",
    Callback = function()
        local args = {
            [1] = 16249512832;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " تيشيرت للبنات أسود ويحضن كلب ",
    Callback = function()
        local args = {
            [1] = 17120804100;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " تيشيرت للبنات أبيض ويحضن كلب ",
    Callback = function()
        local args = {
            [1] = 17585438642;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " تيشيرت للبنات أسود ويحضن قطة ",
    Callback = function()
        local args = {
            [1] = 17044246130;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

AddSection(Main, {" سويترات "})
AddButton(Main, {
    Name = " سويتر للولد أسود ديناصور ",
    Callback = function()
        local args = {
            [1] = 12503598247;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " سويتر أسود للاولاد ",
    Callback = function()
        local args = {
            [1] = 11567575400;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

AddSection(Main, {" تنانير "})
AddButton(Main, {
    Name = " تنورة وردية للبنات ",
    Callback = function()
        local args = {
            [1] = 15116615569;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

AddSection(Main, {" بنطلونات "})
AddButton(Main, {
    Name = " بنطال Y2K أسود ",
    Callback = function()
        local args = {
            [1] = 126490351689789;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " بنطال Y2K أبيض وجميل ",
    Callback = function()
        local args = {
            [1] = 80443852619543;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " بنطال أسود وأحمر يشبه نينجا ",
    Callback = function()
        local args = {
            [1] = 14733928358;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " بنطال جينز سماوي ",
    Callback = function()
        local args = {
            [1] = 18507527463;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " بنطال جينز أسود ",
    Callback = function()
        local args = {
            [1] = 18507625481;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " بنطال أسود حلو ",
    Callback = function()
        local args = {
            [1] = 18667464289;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " بنطال Y2K أسود وأبيض موشم ",
    Callback = function()
        local args = {
            [1] = 17829216066;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " بنطال أسود إيمو موشم ",
    Callback = function()
        local args = {
            [1] = 18964450118;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " بنطال أسود زائد بوي ",
    Callback = function()
        local args = {
            [1] = 17106135964;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " بنطال أسود جينز ",
    Callback = function()
        local args = {
            [1] = 17278036207;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " بنطال للبنات حلو ",
    Callback = function()
        local args = {
            [1] = 77787269452920;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})

AddSection(Main, {" سكنات "})
AddButton(Main, {
    Name = " سكن ديك دجاجة ",
    Callback = function()
        local args = {
            [1] = 13266788937;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " سكن بطة بيضاء ",
    Callback = function()
        local args = {
            [1] = 12406241223;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " سكن بطة صفراء ",
    Callback = function()
        local args = {
            [1] = 12406243807;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " سكن بطة سوداء شيطانية ",
    Callback = function()
        local args = {
            [1] = 12406246648;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
AddButton(Main, {
    Name = " سكن دجاجة مشوية ",
    Callback = function()
        local args = {
            [1] = 18706155992;
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Remotes",9e9):WaitForChild("Wear",9e9):InvokeServer(unpack(args))
    end
})
local Main = MakeTab({Name = "كشفESP"})
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
                        label.TextColor3 = Value  
                    end
                end
            end
        end
    end
})
local Main = MakeTab({Name = "سبام شـات"})


AddSection(Main, {"انتبه من باند ! "})


AddSection(Main, {"سبام سرعة 0.2"})

local TextSave
local tcs = game:GetService("TextChatService")
local chat = tcs.ChatInputBarConfiguration.TargetTextChannel
function sendchat(msg)
  if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
    game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg,"All")
  else
    chat:SendAsync(msg)
  end
end
AddTextBox(Main, {
  Name = "اكتب رسالتك",
  Description = "اكتب الرسالة",
  Flag = "هنا",
  Default = false,
  Callback = function(text)
    TextSave = text
  end
})



AddToggle(Main, {
  Name = "بدء السبام",
  Description = "سبام كتابتك",
  Flag = ".",
  Default = false,
  Callback = function(Value)
    getgenv().RaelHubSpawnText = Value
    while getgenv().RaelHubSpawnText do
      sendchat(TextSave)
      task.wait(0.2)
    end
  end
})

AddSection(Main, {"سبام سرعة 0.6"})
local TextSave
local tcs = game:GetService("TextChatService")
local chat = tcs.ChatInputBarConfiguration.TargetTextChannel
function sendchat(msg)
  if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
    game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg,"All")
  else
    chat:SendAsync(msg)
  end
end
AddTextBox(Main, {
  Name = "اكتب رسالتك",
  Description = "اكتب الرسالة",
  Flag = "هنا",
  Default = false,
  Callback = function(text)
    TextSave = text
  end
})



AddToggle(Main, {
  Name = "بدء السبام",
  Description = "سبام كتابتك",
  Flag = ".",
  Default = false,
  Callback = function(Value)
    getgenv().RaelHubSpawnText = Value
    while getgenv().RaelHubSpawnText do
      sendchat(TextSave)
      task.wait(0.6)
    end
  end
})
AddSection(Main, {"سبام سرعة 0.8"})

local TextSave
local tcs = game:GetService("TextChatService")
local chat = tcs.ChatInputBarConfiguration.TargetTextChannel
function sendchat(msg)
  if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
    game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg,"All")
  else
    chat:SendAsync(msg)
  end
end
AddTextBox(Main, {
  Name = "اكتب رسالتك",
  Description = "اكتب الرسالة",
  Flag = "هنا",
  Default = false,
  Callback = function(text)
    TextSave = text
  end
})



AddToggle(Main, {
  Name = "بدء السبام",
  Description = "سبام كتابتك",
  Flag = ".",
  Default = false,
  Callback = function(Value)
    getgenv().RaelHubSpawnText = Value
    while getgenv().RaelHubSpawnText do
      sendchat(TextSave)
      task.wait(0.8)
    end
  end
})
local TextSave
local tcs = game:GetService("TextChatService")
local chat = tcs.ChatInputBarConfiguration.TargetTextChannel
function sendchat(msg)
  if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
    game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg,"All")
  else
    chat:SendAsync(msg)
  end
end

AddSection(Main, {"سبام سرعة 1.0"})

local TextSave
local tcs = game:GetService("TextChatService")
local chat = tcs.ChatInputBarConfiguration.TargetTextChannel
function sendchat(msg)
  if tcs.ChatVersion == Enum.ChatVersion.LegacyChatService then
    game:GetService("ReplicatedStorage"):FindFirstChild("DefaultChatSystemChatEvents").SayMessageRequest:FireServer(msg,"All")
  else
    chat:SendAsync(msg)
  end
end
AddTextBox(Main, {
  Name = "اكتب رسالتك",
  Description = "اكتب الرسالة",
  Flag = "هنا",
  Default = false,
  Callback = function(text)
    TextSave = text
  end
})
AddToggle(Main, {
  Name = "بدء السبام",
  Description = "سبام كتابتك",
  Flag = ".",
  Default = false,
  Callback = function(Value)
    getgenv().RaelHubSpawnText = Value
    while getgenv().RaelHubSpawnText do
      sendchat(TextSave)
      task.wait(1.0)
    end
  end
})
local Main = MakeTab({Name = "تخريب v1"})  
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
AddSection(Main, {"شغلات ثانية"})
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")

local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local backpack = localPlayer:WaitForChild("Backpack")

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
            return
        end

        local targetHumanoid = targetChar:FindFirstChild("Humanoid")
        if targetHumanoid and targetHumanoid.Sit then
            connection:Disconnect()
            humanoidRootPart.CFrame = CFrame.new(originalPosition)
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
    Name = "سحب",
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
local section = AddSection(Main, {"اختار لاعب تريد تروح اله"})
 
local plrs = game.Players
 
-- Fetch all player names
local playerNames = {}
local players = plrs:GetPlayers()
 
for _, player in ipairs(players) do
    table.insert(playerNames, player.Name)
end
 
local Dropdown = AddDropdown(Main, {
  Name = playerNames[1] or "No Players",
  Options = playerNames,
  Default = "2",
  Callback = function(selectedplrName)
    plrs:FindFirstChild(selectedplrName)
        local targetPlayer = plrs:FindFirstChild(selectedplrName)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            -- Teleporting your character to the selected player's position
            local targetPosition = targetPlayer.Character.HumanoidRootPart.Position
            local localPlayerRoot = plrs.LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
 
            if localPlayerRoot then
                localPlayerRoot.CFrame = CFrame.new(targetPosition)
            end
        end
        print(selectedplrName)
 
  end
})
AddToggle(Main, {
    Name = "تطير الكل",
    Default = false,
    Callback = onFlingV14Toggle
})

-- Variável para armazenar a posição original do jogador
local originalPosition

-- Função para salvar a posição original do jogador
local function saveOriginalPosition()
    local character = game.Players.LocalPlayer.Character
    if character then
        originalPosition = character.HumanoidRootPart.CFrame
        print("Posição original salva:", originalPosition)
    else
        print("Erro ao salvar a posição original: personagem não encontrado.")
    end
end

-- Função para teleportar de volta para a posição original
local function teleportToOriginalPosition()
    local character = game.Players.LocalPlayer.Character
    if character and originalPosition then
        character.HumanoidRootPart.CFrame = originalPosition
        print("Teleportado de volta para a posição original!")
    else
        print("Erro ao teleportar de volta para a posição original.")
    end
end

-- Função para executar a ação de alerta com a arma
local function alarmGun()
    -- Salvar a posição original antes de teleportar
    saveOriginalPosition()

    -- Puxa o item Sniper
    local args = {
        [1] = "PickingTools",
        [2] = "Sniper"
    }
    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))

    -- Equipa o item Sniper
    local backpack = game.Players.LocalPlayer.Backpack
    local character = game.Players.LocalPlayer.Character

    local sniper = backpack:FindFirstChild("Sniper") or character:FindFirstChild("Sniper")

    if sniper then
        -- Se o item for encontrado, equipá-lo
        game.Players.LocalPlayer.Character.Humanoid:EquipTool(sniper)

        -- Salvar a posição atual do jogador
        local currentPosition = character.HumanoidRootPart.CFrame

        -- Teleportar o jogador para as coordenadas especificadas
        character.HumanoidRootPart.CFrame = CFrame.new(315, 5, 42)

        print("AlarmGun equipado e jogador teleportado!")

        -- Esperar um pouco antes de teleportar de volta para garantir que a animação seja concluída
        wait(2)

        -- Teleportar de volta para a posição original após usar a Sniper
        teleportToOriginalPosition()
    else
        -- Se o item não for encontrado, exibir uma mensagem de erro
        print("Sniper não encontrado no inventário ou personagem.")
    end
end
AddButton(Main, {
  Name = "تطير الناس",
  Callback = function()
    local args={[1]="PickingTools",[2]="Couch"};game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
    loadstring(game:HttpGet("https://raw.githubusercontent.com/0Ben1/fe./main/Fling%20GUI"))()
  end
})
-- Kill Players
local targetPlayer = nil

local function findPlayerByName(partialName)
    local partial = partialName:sub(1, 2):lower()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player.Name:lower():sub(1, 2) == partial or (player.DisplayName and player.DisplayName:lower():sub(1, 2) == partial) then
            return player
        end
    end
    return nil
end

local function teleportAndKillPlayer(targetPlayer)
    if targetPlayer and targetPlayer.Character then
        local myHRP = game.Players.LocalPlayer.Character.HumanoidRootPart
        local targetHRP = targetPlayer.Character:WaitForChild("HumanoidRootPart")
        local connection
        connection = game:GetService("RunService").Stepped:Connect(function()
            myHRP.CFrame = targetHRP.CFrame
            if targetPlayer.Character and targetPlayer.Character:FindFirstChild("Humanoid") and targetPlayer.Character.Humanoid.Sit then
                myHRP.CFrame = CFrame.new(500000, 0, 0)
                connection:Disconnect()
            end
        end)
    end
end
local section = AddSection(Main, {"قنفة قتل v1"})
local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local RunService = game:GetService("RunService")

local player = Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
local backpack = player:WaitForChild("Backpack")

local selectedPlayerName = nil

local function getPlayersNames()
    local names = {}
    for _, p in ipairs(Players:GetPlayers()) do
        if p ~= player then
            table.insert(names, p.Name)
        end
    end
    return names
end

local Dropdown = AddDropdown(Main, {
    Name = "اختار الاعب",
    Options = getPlayersNames(),
    Default = "",
    Callback = function(Value)
        selectedPlayerName = Value
    end
})

local StartButton = AddButton(Main, {
    Name = "قتل الاعب بالكنب",
    Callback = function()
        if not selectedPlayerName then
            warn("لم يتم اختيار لاعب!")
            return
        end
        
        local targetPlayer = Players:FindFirstChild(selectedPlayerName)
        if not targetPlayer or not targetPlayer.Character or not targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            warn("اللاعب غير موجود أو شخصيته غير جاهزة")
            return
        end

        local args = {
            [1] = "PickingTools",
            [2] = "Couch"
        }
        ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Too1l"):InvokeServer(unpack(args))
        task.wait(0.5)

        local tool = backpack:FindFirstChildOfClass("Tool")
        if tool then
            tool.Parent = character
        end

        local originalCFrame = humanoidRootPart.CFrame

        humanoidRootPart.CFrame = targetPlayer.Character.HumanoidRootPart.CFrame * CFrame.new(2, 0, 2)

        task.wait(0.2)

        local connection
        connection = RunService.Heartbeat:Connect(function()
            if targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
                local targetPos = targetPlayer.Character.HumanoidRootPart.Position
                local offset = Vector3.new(
                    math.random(-5,5),
                    math.random(-2,2),
                    math.random(-5,5)
                )
                humanoidRootPart.CFrame = CFrame.new(humanoidRootPart.Position, targetPos + offset)
                humanoidRootPart.Velocity = (targetPos - humanoidRootPart.Position).Unit * 100
            end
        end)

        task.delay(2, function()
            connection:Disconnect()

            humanoidRootPart.CFrame = CFrame.new(Vector3.new(-86, -224.27, 34.57))

            task.wait(1)

            humanoidRootPart.CFrame = originalCFrame

            task.wait(0.1)

            local deleteArgs = {
                [1] = "PlayerWantsToDeleteTool",
                [2] = "Couch"
            }
            ReplicatedStorage:WaitForChild("RE"):WaitForChild("1Clea1rTool1s"):FireServer(unpack(deleteArgs))
        end)
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
local section = AddSection(Main, {"=========="})
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
AddSection(Main, {" قتل كنبه"})

local Players = game:GetService('Players')
local lplayer = Players.LocalPlayer

function GetPlayer(String)
    local Found = {}
    local strl = String:lower()
    if strl == "all" then
        for _, v in pairs(Players:GetPlayers()) do
            table.insert(Found, v)
        end
    elseif strl == "others" then
        for _, v in pairs(Players:GetPlayers()) do
            if v.Name ~= lplayer.Name then
                table.insert(Found, v)
            end
        end
    elseif strl == "me" then
        table.insert(Found, lplayer)
    else
        for _, v in pairs(Players:GetPlayers()) do
            if v.Name:lower():sub(1, #String) == String:lower() then
                table.insert(Found, v)
            end
        end
    end
    return Found
end

local function isItemInInventory(itemName)
    for _, item in pairs(lplayer.Backpack:GetChildren()) do
        if item.Name == itemName then
            return true
        end
    end
    return false
end

local function equipItem(itemName)
    local item = lplayer.Backpack:FindFirstChild(itemName)
    if item then
        lplayer.Character.Humanoid:EquipTool(item)
    end
end

local function unequipItem(itemName)
    local item = lplayer.Character:FindFirstChild(itemName)
    if item then
        item.Parent = lplayer.Backpack
    end
end

local function ActiveAutoFling(targetPlayer)
    if not isItemInInventory("Couch") then
        local args = { [1] = "PickingTools", [2] = "Couch" }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
    end

    equipItem("Couch")
    getgenv().flingloop = true

    while getgenv().flingloop do
        local function flingloopfix()
            local Players = game:GetService("Players")
            local Player = Players.LocalPlayer
            local AllBool = false

            local SkidFling = function(TargetPlayer)
                local Character = Player.Character
                local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
                local RootPart = Humanoid and Humanoid.RootPart
                local TCharacter = TargetPlayer.Character
                local THumanoid, TRootPart, THead, Accessory, Handle

                if TCharacter:FindFirstChildOfClass("Humanoid") then
                    THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
                end
                if THumanoid and THumanoid.RootPart then
                    TRootPart = THumanoid.RootPart
                end
                if TCharacter:FindFirstChild("Head") then
                    THead = TCharacter.Head
                end
                if TCharacter:FindFirstChildOfClass("Accessory") then
                    Accessory = TCharacter:FindFirstChildOfClass("Accessory")
                end
                if Accessory and Accessory:FindFirstChild("Handle") then
                    Handle = Accessory.Handle
                end

                if Character and Humanoid and RootPart then
                    if RootPart.Velocity.Magnitude < 50 then
                        getgenv().OldPos = RootPart.CFrame
                    end
                    if THumanoid and THumanoid.Sit and not AllBool then
                        unequipItem("Couch")
                        getgenv().flingloop = false
                        return
                    end
                    if THead then
                        workspace.CurrentCamera.CameraSubject = THead
                    elseif not THead and Handle then
                        workspace.CurrentCamera.CameraSubject = Handle
                    elseif THumanoid and TRootPart then
                        workspace.CurrentCamera.CameraSubject = THumanoid
                    end

                    if not TCharacter:FindFirstChildWhichIsA("BasePart") then
                        return
                    end

                    local FPos = function(BasePart, Pos, Ang)
                        RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
                        Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
                        RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
                        RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
                    end

                    local SFBasePart = function(BasePart)
                        local TimeToWait = 2
                        local Time = tick()
                        local Angle = 0
                        repeat
                            if RootPart and THumanoid then
                                if BasePart.Velocity.Magnitude < 50 then
                                    Angle = Angle + 100
                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
                                    task.wait()
                                    FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection, CFrame.Angles(math.rad(Angle), 0, 0))
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
                        until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait or getgenv().flingloop == false
                    end

                    workspace.FallenPartsDestroyHeight = 0/0
                    local BV = Instance.new("BodyVelocity")
                    BV.Name = "SpeedDoPai"
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
                end
            end

            if not Welcome then
                -- Mensagem de boas-vindas
            end
            getgenv().Welcome = true

            if AllBool then
                for _, x in next, Players:GetPlayers() do
                    SkidFling(x)
                end
            end

            if targetPlayer then
                SkidFling(targetPlayer)
            end

            task.wait()
        end

        wait()
        pcall(flingloopfix)
    end
end

local FlingAdvancedPlayerList = {}
local playerDropdown

local function UMupdatePlayerList()
    FlingAdvancedPlayerList = {}
    for _, player in ipairs(Players:GetPlayers()) do
        table.insert(FlingAdvancedPlayerList, player.Name)
    end
    if playerDropdown then
        playerDropdown:Refresh(FlingAdvancedPlayerList, true)
    end
end

local function teleportToPlayer(playerName)
    local player = Players:FindFirstChild(playerName)
    local localPlayer = Players.LocalPlayer

    if player and player.Character and localPlayer.Character and localPlayer.Character:FindFirstChild("HumanoidRootPart") then
        local targetPosition = player.Character.HumanoidRootPart.Position
        localPlayer.Character:MoveTo(targetPosition)
        print("Teletransportado para o jogador alvo.")
    else
        print("NÃ£o foi possÃ­vel encontrar o jogador alvo ou o HumanoidRootPart.")
    end
end

UMupdatePlayerList()

AddDropdown(Main, {
    Name = "اختار اسم الاعب",
    Default = "",
    Options = FlingAdvancedPlayerList,
    Callback = function(value)
        SelectedPlayer = value
    end    
})

AddButton(Main, {
    Name = "تحديث القائمة ",
    Callback = function()
        UMupdatePlayerList()
    end    
})

local flingToggle

AddToggle(Main, {
    Name = " تخريب كنبة",
    Default = false,
    Callback = function(state)
        if state then
            if SelectedPlayer then
                local targetPlayer = GetPlayer(SelectedPlayer)[1]
                if targetPlayer then
                    ActiveAutoFling(targetPlayer)
                end
            end
        else
            getgenv().flingloop = false
        end
    end    
})

game:GetService("Players").LocalPlayer.Character.Humanoid:GetPropertyChangedSignal("Sit"):Connect(function()
    if lplayer.Character.Humanoid.Sit then
        if flingToggle then
            flingToggle:Set(false)
        end
    end
end)
local Main = MakeTab({Name = "الماب"})
AddSection(Main, {"تدمير الماب"})
AddButton(Main, {
  Name = "تفعيل التدمير",
  Callback = function()
    game.Workspace:ClearAllChildren()
  end
})
AddButton(Main, {
  Name = "تدمير البيوت",
  Callback = function()
local housesFolder = game.Workspace:FindFirstChild("Houses")
if housesFolder then
    for _, house in pairs(housesFolder:GetChildren()) do
        house:Destroy()
    end
end
  end
})
AddButton(Main, {
  Name = "تدمير كل شي ء مع استثنائات",
  Callback = function()
for _, obj in pairs(game.Workspace:GetChildren()) do
    if obj.Name ~= "Baseplate" and obj.Name ~= "Camera" then
        obj:Destroy()
    end
end
  end
})

local Main = MakeTab({Name = "الموارد"})
local Paragraph = AddParagraph(Main, {"تحديث جاي اخلي بعد ادوات"})
AddButton(Main, {
Name = "كـرسـتـال / 1",
Callback = function()
local args = {
    [1] = "PickingTools",
    [2] = "Crystal"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
end
})
AddButton(Main, {
Name = "كـرسـتـال / 2",
Callback = function()
local args = {
    [1] = "PickingTools",
    [2] = "Crystals"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
end
})
AddSection(Main, {"اشـيـاء تـبـيـن بـس لـك"})
AddButton(Main, {
Name = "يـضـرب راچـدي",
Callback = function()
 loadstring(game:HttpGet(('http://pastefy.app/GvnHVjT5/raw'),true))()
end
})
AddButton(Main, {
Name = "الـتـحـريـك الـذهـنـي",
Callback = function()
 loadstring(game:HttpGet(('https://raw.githubusercontent.com/SAZXHUB/Control-update/main/README.md'),true))()
end
})
AddButton(Main, {
Name = "f3x",
Callback = function()
 loadstring(game:GetObjects("rbxassetid://6695644299")[1].Source)()
end
})
AddButton(Main, {
Name = "مـعـدات الـبـنـاء",
Callback = function()
 loadstring(game:HttpGet("https://raw.githubusercontent.com/err0r129/PqpHadesBlair/main/Bao.lua"))()
end
})
AddButton(Main, {
Name = "الـتـنـقـل",
Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/err0r129/KptHadesBlair/main/Bao.lua"))()
end
})
AddButton(Main, {
	Name = "مادري شنو",
	Callback = function()
      	local args = {
    [1] = "PickingTools",
    [2] = "Taser"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
  	end    
})

AddButton(Main, {
Name = "اخـذ صـنـدوق",
Callback = function()
 local args = {
    [1] = "PickingTools",
    [2] = "Box"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
end
})
AddButton(Main, {
Name = "اخذ جيس ورقي",
Callback = function()
 local args = {
    [1] = "PickingTools",
    [2] = "Paperbag"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
end
})
AddSection(Main, {"مـوارد الـبـنـك"})
AddButton(Main, {
Name = "حـقـيـبـة بـتـكـويـن",
	Callback = function()
		local args = {
    [1] = "PickingTools",
    [2] = "DuffleBagBitcoin"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
	end
})
AddButton(Main, {
Name = "حـقـيـبـة الـالـمـاس",
	Callback = function()
		local args = {
    [1] = "PickingTools",
    [2] = "DuffleBagDiamonds"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
	end
})
AddButton(Main, {
Name = "حـقـيـبـة الـذهـب",
	Callback = function()
		local args = {
    [1] = "PickingTools",
    [2] = "DuffleBagGold"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
	end
})
AddButton(Main, {
Name = "بـطـاقـة جـاتـا كـي كـارد",
	Callback = function()
		local args = {
    [1] = "PickingTools",
    [2] = "BankGateKey"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
	end
})
AddButton(Main, {
  Name = "بـطـاقـة جـاتـا كـي كارد بـيـضـاء",
	Callback = function()
		local args = {
    [1] = "PickingTools",
    [2] = "KeyCardWhite"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Too1l"):InvokeServer(unpack(args))
	end
})
local Main = MakeTab({Name = "قسم سيارات"})

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
        
end 
})

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
local Main = MakeTab({Name = "تنقل"})  

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
local Main = MakeTab({Name = "سكنات جاهزة"})
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
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://111320042197422"; Sound:Play()
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
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://111320042197422"; Sound:Play()
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
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://111320042197422"; Sound:Play()
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
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://111320042197422"; Sound:Play()
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
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://111320042197422"; Sound:Play()
  end
})

-- سكن 7
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
    local Sound = Instance.new("Sound", game:GetService("SoundService")); Sound.SoundId = "rbxassetid://111320042197422"; Sound:Play()
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
local Main = MakeTab({Name = "اغاني"})
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
AddSection(Main, {"الازعاج"})
AddButton(Main, {
  Name = "ازعاج 1",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "9108676586"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "ازعاج 2",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "4776398821"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "ازعاج 3",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "16190784875"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "صليل الصوارم",
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
  Name = "الله اكبر (تفجير) ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "112885470931928"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه ايرانيه (حربكه) ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "73352238398867"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه هنديه",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "1843530001"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه باك رومز",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "120817494107898"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه عربيه ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "113546449124802"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "دبجه",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "90807238125839"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "اه يا حلو",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "93620598835551"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "امبيه",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "7657178494"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه عراقيه كرنج",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "111256095783364"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "هم عراقيه وهم كرنج",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "73632319736202"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "هم اغنيه عراقيه كرنجج ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "72918998227337"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "شلغه وراح تعرف اكرنج لو لا",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "93387586724251"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه مصريه",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "126863477912372"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "اغنيه مصريه 2",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "106169760792625"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "يا بكاية ",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "98640789490482"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "محمد عبد",
  Callback = function()
     local args = {
    [1] = "SkateBoard"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
local args = {
    [1] = "PickingScooterMusicText",
    [2] = "131507511127909"
}
 
game:GetService("ReplicatedStorage").RE:FindFirstChild("1NoMoto1rVehicle1s"):FireServer(unpack(args))
  end
})

local Main = MakeTab({Name = "☠️الاسماء☠️"})
local colors = {
    Color3.fromRGB(255, 0, 0),    
    Color3.fromRGB(255, 127, 0),  
    Color3.fromRGB(255, 255, 0),  
    Color3.fromRGB(0, 255, 0),    
    Color3.fromRGB(0, 0, 255),  
    Color3.fromRGB(75, 0, 130),   
    Color3.fromRGB(148, 0, 211),  
}

local rainbowRunning = false

AddButton(Main, {
    Name = "اسم ملون",
    Callback = function()
        if rainbowRunning then return end
        rainbowRunning = true

        task.spawn(function()
            while rainbowRunning do
                for _, color in ipairs(colors) do
                    local args = {
                        [1] = "PickingRPNameColor",
                        [2] = color,
                    }

                    game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eColo1r"):FireServer(unpack(args))
                    task.wait(0.5) 
                end
            end
        end)
    end
})
AddTextBox(Main, {
    Name = "اسم",
    Default = "",
    PlaceholderText = "اكتب اسمك اهنا",
    ClearTextOnFocus = true,
    Callback = function(text)
        local args = {
            [1] = "RolePlayName",
            [2] = text  -- النص اللي المستخدم كتبه
        }

        game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1RPNam1eTex1t"):FireServer(unpack(args))
    end
})
local section = AddSection(Main, {"☠️اسماء بنات☠️ "})

AddButton(Main, {
  Name = "شمس",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "شْمَسَ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "نٌـوَرَ",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "نـِِـِـوُر"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "اسراء",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "أَسَرٌأَء"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "مريم",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "مـْـْْـْريمـْـْْـْ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "زهراء",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "زَهُرٌأَء"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "فََاَطْـمَِـهْ",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "فََاَطْـمَِـهْ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "ليلى",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "لُـِـِِـِِِـِِـِـيلُـِـِِـِِِـِِـِـﮯ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "تالين",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "تـٌـٌٌـآلُـِـِِـِِِـِِـِـينـِِـِـ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "زينب",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "ڒٍينـِِـِـبـٌـٌٌـٌٌٌـٌٌـٌ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "ريم",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "رٌيُمَ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "رقية",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "رٌقُيُة"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "نرجس",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "نرٍجٍسًٌُُ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "حور",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "حـًـًًـًًًـًًـًـوُر"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "شهد",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "شْهُدُ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
local section = AddSection(Main, {"☠️اسماء اولاد☠️ "})
AddButton(Main, {
  Name = "ايتاشي",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "آيتـٌـٌٌـآشُـُـُُـُي!"
}

AddButton(Main, {
  Name = "إآيَرٍيَن",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "إآيَرٍيَن"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "مارتن",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "مـآرٍتــن"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "مهدي",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "مَهُدُيُ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "حسين",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "حَسَيُنِ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "عـلـي",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "عٌـِـِِـِـلُـِـِِـِِِـِِـِـي"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "محمد",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "مـْـْْـْحـًـًًـًًًـًًـًـمـْـْْـْڊ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "يوهان",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "يُوٌهُأَنِ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "أَبَهُرٌ",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "أَبَهُرٌ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "سايكو",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "سَأَيُﮖوٌ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "عباس",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "عُبَأَسَ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "عمار",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "عٌـِـِِـِـمـْـْْـْآر"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "شهم",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "شًـھﻤ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "A҉F҉K҉",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "A҉F҉K҉"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "مرتضى",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "مَرٌتَضِى"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "يوسف✨",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "يَۈسًٌُُفَ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "سجاد",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "سَجِأَدُ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})

AddButton(Main, {
  Name = "توم",
  Callback = function()
    local args = {
    [1] = "RolePlayName",
    [2] = "تَوٌمَ"
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPNam1eTex1t"):FireServer(unpack(args))
  end
})
local Main = MakeTab({Name = "مضادات"})  

local Toggle = AddToggle(Main, {
  Name = "عدم طيران لو ناس تطيرك",
  Default = false,
  Callback = function(Value)
  local player = game.Players.LocalPlayer

        -- Função para desabilitar a habilidade de sentar
        local function preventSitting(humanoid)
            if humanoid then
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
                -- Conecta a função ao evento StateChanged do Humanoid
                sitConnection = humanoid.StateChanged:Connect(function(_, newState)
                    if newState == Enum.HumanoidStateType.Seated then
                        humanoid:ChangeState(Enum.HumanoidStateType.GettingUp)
                    end
                end)
            end
        end

        -- Função para monitorar mudanças no personagem e impedir a habilidade de sentar
        local function monitorCharacter()
            -- Função para lidar com o personagem atual e novos personagens
            local function onCharacterAdded(character)
                local humanoid = character:WaitForChild("Humanoid")
                preventSitting(humanoid)
            end

            -- Conecta a função ao evento CharacterAdded para lidar com respawns
            player.CharacterAdded:Connect(onCharacterAdded)

            -- Verifica se o personagem já existe quando o script é executado
            if player.Character then
                onCharacterAdded(player.Character)
            end
        end

        if Value then
            -- Quando o toggle está ativado (Value é true), iniciar a monitorCharacter
            monitorCharacter()
        else
            -- Quando o toggle está desativado (Value é false), permitir sentar novamente
            local humanoid = player.Character and player.Character:FindFirstChildOfClass("Humanoid")
            if humanoid then
                humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                -- Desconectar qualquer conexão existente para evitar conflitos futuros
                if sitConnection then
                    sitConnection:Disconnect()
                    sitConnection = nil
                end
            else
                print("Erro: Personagem não encontrado.")
            end
        end
    end    
})

local Toggle = AddToggle(Main, {
  Name = "عدم فويد",
  Default = false,
  Callback = function(Value)
if value then
RunService.Stepped:Connect(function()
if LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
if LocalPlayer.Character.HumanoidRootPart.Position.Y < -50 then
LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-118.54170227050781, 3.8526408672332764, -1.622152805328369)
end
end
end)
end
end
})
local Toggle = AddToggle(Main, {
  Name = "عدم طرد",
  Default = false,
  Callback = function(Value)
if value then
game:GetService("CoreGui").RobloxPromptGui.promptOverlay.ChildAdded:Connect(function(child)
if child.Name == "ErrorPrompt" then
TeleportService:Teleport(game.PlaceId, LocalPlayer)
end
end)
end
end
})

local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")

local function disableLaggyFeatures()
for _, v in pairs(workspace:GetDescendants()) do
if v:IsA("ParticleEmitter") or v:IsA("Trail") or v:IsA("Smoke") or v:IsA("Fire") then
v.Enabled = false
end
end
end

local Toggle = AddToggle(Main, {
  Name = "ازاله الاق",
  Default = false,
  Callback = function(Value)

if value then
disableLaggyFeatures()
workspace.DescendantAdded:Connect(function(descendant)
if descendant:IsA("ParticleEmitter") or descendant:IsA("Trail") or descendant:IsA("Smoke") or descendant:IsA("Fire") then
descendant.Enabled = false
end
end)
end
end
})
AddToggle(Main, {
    Name = "حماية من جلوس",
    Default = false,
    Callback = function(state)
local seats = {}
for _, seat in next, workspace:GetDescendants() do
	if seat:IsA("Seat") then
		seats[seat] = true
	end
end

workspace.DescendantAdded:connect(function(seat)
	if seat:IsA("Seat") then
		seats[seat] = true
		seat.Disabled = not enabled
	end
end)

workspace.DescendantRemoving:connect(function(seat)
	if seat:IsA("Seat") then
		seats[seat] = nil
	end
end)

setEnabled = function(newEnabled)
	if newEnabled == enabled then
		return
	end
	enabled = newEnabled
	for seat, _ in next, seats do
		seat.Disabled = not enabled
	end
end

---

setEnabled(false)
	end,
})
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
local Main = MakeTab({Name = "البيت | House"})

AddButton(Main, {
  Name = "  	كراج تفتحة وتسده",
  Callback = function()
					local args = {
						[1] = "GarageDoor"
					}
					game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(args))
end
})




AddButton(Main, {
  Name = "  	شباك تفتحة  وتسده",
  Callback = function()
					local args = {
						[1] = "Curtains"
					}
					game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(args))
end
})




AddButton(Main, {
  Name = "تحذف بيتك",
  Callback = function()
  local args = {
    [1] = "PlayerSellHouse"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1eChoic1e"):FireServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "فتح",
  Callback = function() 
  local args = {
    [1] = "LockDoors"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(args))


  end
})
AddButton(Main, {
  Name = "قفل",
  Callback = function()
  local args = {
    [1] = "LockDoors"
}

game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e"):FireServer(unpack(args))

  end
})
AddButton(Main, {
  Name = "لون بيتك ",
  Callback = function()
    local colors = {
      Color3.fromRGB(255, 0, 0),   
      Color3.fromRGB(255, 127, 0),   
      Color3.fromRGB(255, 255, 0),   
      Color3.fromRGB(0, 255, 0),    
      Color3.fromRGB(0, 0, 255),     
      Color3.fromRGB(75, 0, 130),    
      Color3.fromRGB(148, 0, 211)   
    }

    local remote = game:GetService("ReplicatedStorage"):WaitForChild("RE"):WaitForChild("1Player1sHous1e")

    
    while true do
      for _, color in ipairs(colors) do
        local args = {
          [1] = "ColorPickHouse",
          [2] = color
        }
        remote:FireServer(unpack(args))
        wait(0.5)
      end
    end
  end
})
AddTextBox(Main, {
    Name = "اسم",
    Default = "",
    PlaceholderText = "اكتب اسمك اهنا",
    Callback = function(value)
        local args = {
            [1] = "BusinessName",
            [2] = value
        }
        game:GetService("ReplicatedStorage").RE:FindFirstChild("1RPHous1eEven1t"):FireServer(unpack(args))
    end
})
AddToggle(Main, {
    Name = "الغاء حظر عن بيت",
    Default = false,
    Callback = function(state)
        isUnbanActive = state
        if isUnbanActive then
            print("احبج ايات")
            startAutoUnban()
        else
            print("تم فك الحظر")
        end
    end
})
function startAutoUnban()
    while isUnbanActive do
        for i, v in pairs(game:GetService("Workspace"):WaitForChild("001_Lots"):GetDescendants()) do
            -- houses
            if v.Name == "BannedBlock1" or v.Name == "BannedBlock2" or v.Name == "BannedBlock3" or v.Name == "BannedBlock4" or v.Name == "BannedBlock5" or v.Name == "BannedBlock6" or v.Name == "BannedBlock7" or v.Name == "BannedBlock11" or v.Name == "BannedBlock12" or v.Name == "BannedBlock13" or v.Name == "BannedBlock14" or v.Name == "BannedBlock15" or v.Name == "BannedBlock16" or v.Name == "BannedBlock17" or v.Name == "BannedBlock18" or v.Name == "BannedBlock19" or v.Name == "BannedBlock20" or v.Name == "BannedBlock21" or v.Name == "BannedBlock21" or v.Name == "BannedBlock22" or v.Name == "BannedBlock23" or v.Name == "BannedBlock24" or v.Name == "BannedBlock30" or v.Name == "BannedBlock31" or v.Name == "BannedBlock32" or v.Name == "BannedBlock33" or v.Name == "BannedBlock34" or v.Name == "BannedBlock35" then                -- destroy
                v:Destroy()
            end
        end
wait(1)
    end
end

AddButton(Main, {
  Name = "1 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 1
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "2 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 2
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "3 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 3
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "4 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 4
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "5 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 5
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "6 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 6
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "7 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 7
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "11 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 11
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "12 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 12
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "13 تاخذ تحكم البيت ",
  Callback = function()
    	local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 13
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "14 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 14
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "15 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 15
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "16 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 16
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "17 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 17
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "18 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 18
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "19 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 19
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "20 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 20
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "21 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 21
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "22 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 22
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "23 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 23
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "24 تاخذ تحكم البيت ",
  Callback = function()
    local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 24
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))	
  end
})
AddButton(Main, {
  Name = "تحكم بيت 25",
  Callback = function()
  local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 25
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "تحكم بيت 26",
  Callback = function()
  local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 26
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "تحكم بيت 27",
  Callback = function()
  local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 27
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "تحكم بيت 28",
  Callback = function()
  local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 28
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "تحكم بيت 29",
  Callback = function()
  local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 29
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "تحكم بيت 30",
  Callback = function()
  local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 30
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "تحكم بيت 31",
  Callback = function()
  local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 31
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "تحكم بيت 33",
  Callback = function()
  local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 33
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "تحكم بيت 34",
  Callback = function()
  local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 34
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "تحكم بيت 35",
  Callback = function()
  local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 35
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "تحكم بيت 36",
  Callback = function()
  local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 36
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
AddButton(Main, {
  Name = "تحكم بيت 37",
  Callback = function()
  local args = {
    [1] = "GivePermissionLoopToServer",
    [2] = game:GetService("Players").LocalPlayer,
    [3] = 37
}

game:GetService("ReplicatedStorage").RE:FindFirstChild("1Playe1rTrigge1rEven1t"):FireServer(unpack(args))
  end
})
local Main = MakeTab({Name = "اغاني مجانية"})
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

local audios = {
    {Name = "ياميت كوداساي", ID = 108494476595033},
    {Name = "غريتينيهو", ID = 5710016194},
    {Name = "جامبسكير هوروروسو", ID = 85435253347146},
    {Name = "صوت عالي", ID = 6855150757},
    {Name = "رايحة", ID = 120034877160791},
    {Name = "جامبسكير 2", ID = 110637995610528},
    {Name = "ضحكة الساحرة ماين كرافت", ID = 116214940486087},
    {Name = "ذا بويلد وان", ID = 137177653817621},
    {Name = "دقيت أبا ماريا ديويدو", ID = 128669424001766},
    {Name = "ماندريك ديتيكتيد", ID = 9068077052},
    {Name = "آآآآآااا", ID = 80156405968805},
    {Name = "آآآآه", ID = 9084006093},
    {Name = "أمونغاس", ID = 6651571134},
    {Name = "سوس", ID = 6701126635},
    {Name = "غريتاو آآآآآاااا", ID = 5853668794},
    {Name = "أووه كووف كووف", ID = 7056720271},
    {Name = "سوس", ID = 7153419575},
    {Name = "سونيك إكس إي", ID = 2496367477},
    {Name = "توبيرز93 1", ID = 270145703},
    {Name = "توبيرز93 2", ID = 18131809532},
    {Name = "ضحكة جون", ID = 130759239},
    {Name = "ما أعرف كككك", ID = 6549021381},
    {Name = "غريتو", ID = 80156405968805},
    {Name = "سوس أوديو", ID = 7705506391},
    {Name = "آآآه", ID = 7772283448},
    {Name = "غاي، غاي", ID = 18786647417},
    {Name = "ضربة بات", ID = 7129073354},
    {Name = "سيرين نووي", ID = 675587093},
    {Name = "ما عندي فكرة عن الاسم كك", ID = 7520729342},
    {Name = "غريتو 2", ID = 91412024101709},
    {Name = "إستورا تيمبانو", ID = 268116333},
    {Name = "جميداو", ID = 106835463235574},
    {Name = "توما جاك", ID = 132603645477541},
    {Name = "بديت آيفود بديت", ID = 133843750864059},
    {Name = "آي غوست ذا داون", ID = 84663543883498},
    {Name = "كومبري أونلاين نا شوب", ID = 8747441609},
    {Name = "أووه كي نوجو", ID = 103440368630269},
    {Name = "ساي داي لافا براتو", ID = 101232400175829},
    {Name = "سيلوكو نو كومبنساسيون", ID = 78442476709262},
}



local audioNames = {}
for _, audio in ipairs(audios) do
    table.insert(audioNames, audio.Name)
end

AddDropdown(Main, {
    Name = "اختر صوت من القائمة",
    Options = audioNames,
    Default = audioNames[1],
    Callback = function(value)
        for _, audio in ipairs(audios) do
            if audio.Name == value then
                selectedAudioID = audio.ID
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
local Main = MakeTab({Name = "اوامر أدمن"})
AddSection(Main, {"اوامر التجسس"})
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
    Name = "اختراق جدران",
    Default = false,
    Callback = onNoclipToggle
})

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

local function getPlayerNames()
    local playerNames = {}
    for _, player in ipairs(game.Players:GetPlayers()) do
        table.insert(playerNames, player.Name)
    end
    return playerNames
end

-- Store selected player for later use
local selectedPlayer = nil
local followHead = false
local connection = nil

-- Function to spectate the selected player
local function spectatePlayer(enable)
    local player = game.Players.LocalPlayer
    local camera = workspace.CurrentCamera

    if selectedPlayer then
        local targetPlayer = game.Players:FindFirstChild(selectedPlayer)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            if enable then
                -- Set camera to follow the selected player
                camera.CameraSubject = targetPlayer.Character.Humanoid
            else
                -- Reset camera to default (back to the local player)
                camera.CameraSubject = player.Character.Humanoid
            end
        else
            print("Selected player not available or out of game.")
        end
    else
        print("No player selected!")
    end
end

-- Function to float just above the selected player's head without falling
local function floatAbovePlayerHead()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()

    if character and character:FindFirstChild("HumanoidRootPart") then
        local humanoidRootPart = character.HumanoidRootPart

        if selectedPlayer then
            local targetPlayer = game.Players:FindFirstChild(selectedPlayer)

            if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
                local targetHead = targetPlayer.Character.Head

                -- Position above the selected player's head
                humanoidRootPart.CFrame = targetHead.CFrame * CFrame.new(0, 3, 0)

                -- Keep updating the position every frame
                connection = game:GetService("RunService").Heartbeat:Connect(function()
                    if followHead and targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("Head") then
                        -- Update to stay above the player's head
                        humanoidRootPart.CFrame = targetPlayer.Character.Head.CFrame * CFrame.new(0, 3, 0)
                    else
                        connection:Disconnect() -- Disconnect if the toggle is off
                    end
                end)
            else
                print("Target player not found or not in the game.")
            end
        else
            print("No player selected!")
        end
    end
end

-- Function to trigger the secondary script
local function triggerCharacterSizeDown()
    local args = {
        [1] = "CharacterSizeDown",
        [2] = 2.4
    }
    game:GetService("ReplicatedStorage").RE:FindFirstChild("1Clothe1s"):FireServer(unpack(args))
end

-- Function to teleport behind the selected player and return after 1.5 seconds
local function moveBehindAndReturn()
    local player = game.Players.LocalPlayer
    local character = player.Character or player.CharacterAdded:Wait()
    local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")

    if humanoidRootPart and selectedPlayer then
        local targetPlayer = game.Players:FindFirstChild(selectedPlayer)
        if targetPlayer and targetPlayer.Character and targetPlayer.Character:FindFirstChild("HumanoidRootPart") then
            local targetHumanoidRootPart = targetPlayer.Character.HumanoidRootPart

            -- Store the original position
            local originalPosition = humanoidRootPart.CFrame

            -- Move behind the selected player
            humanoidRootPart.CFrame = targetHumanoidRootPart.CFrame * CFrame.new(0, 0, 3)

            -- Wait for 1.5 seconds before returning
            wait(1.5)

            -- Return to original position
            humanoidRootPart.CFrame = originalPosition
        else
            print("Selected player not found or not in the game.")
        end
    else
        print("No player or HumanoidRootPart found!")
    end
end

-- Create the dropdown with player names
AddDropdown(Main, {
    Name = "اختار الاعب",
    Default = "",
    Options = getPlayerNames(),
    Callback = function(value)
        selectedPlayer = value
        print("Player selected: " .. value)
    end    
})

AddButton(Main, {
    Name = "تحديث القائمة",
    Callback = function()
        UMupdatePlayerList()
    end    
})

local flingToggle

-- Add a toggle that allows the player to spectate the selected player
AddToggle(Main, {
    Name = "شوف الاعب",
    Default = false,
    Callback = function(value)
        spectatePlayer(value)
    end    
})

-- Add a button to teleport to the selected player
AddButton(Main, {
    Name = "اذهب الى الاعب",
    Callback = function()
        floatAbovePlayerHead()
    end    
})
