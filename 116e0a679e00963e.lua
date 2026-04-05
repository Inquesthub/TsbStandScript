

loadstring(game:HttpGet('https://pastebin.com/raw/FUPBRUuY'))()('Stand Script', 'By Inquestor420', 'Text Here', 'Text Here', '14286492315', true, false, false, 20, function() end, function() end)

local _Highlight = Instance.new('Highlight')
local _ForceField = Instance.new('ForceField')

_ForceField.Name = 'AbsoluteImmortal'
_ForceField.Parent = game.Players.LocalPlayer.Character
_ForceField.Visible = false
_Highlight.Name = 'IFrames but bootleg'
_Highlight.Parent = game.Players.LocalPlayer.Character
_Highlight.FillColor = Color3.fromRGB(255, 255, 130)
_Highlight.FillTransparency = 0.45
_Highlight.OutlineColor = Color3.fromRGB(255, 255, 130)
_Highlight.OutlineTransparency = 0.25

local u3 = game:GetService('TweenService'):Create(_Highlight, TweenInfo.new(2.68), {FillTransparency = 1})
local u4 = game:GetService('TweenService'):Create(_Highlight, TweenInfo.new(2.68), {OutlineTransparency = 1})

task.delay(2, function()
    u3:Play()
    u4:Play()
    task.wait(2.68)
    _Highlight:Destroy()
    _ForceField:Destroy()
end)

local _Players = game:GetService('Players')
local _Settings = getgenv().Settings

game:GetService('Chat')

local _RunService = game:GetService('RunService')
local _VirtualInputManager = game:GetService('VirtualInputManager')
local _UserInputService = game:GetService('UserInputService')
local _Debris = game:GetService('Debris')
local _TextChatService = game:GetService('TextChatService')
local _targetPlayerName = _Settings.player.targetPlayerName
local _standAnimId = _Settings.animation.standAnimId
local _isStandActive = _Settings.animation.isStandActive
local _attackFollowDuration = _Settings.combat.attackFollowDuration
local _followDistance = _Settings.combat.followDistance
local _zaWarudoMessages = _Settings.messages.zaWarudoMessages
local _Move1 = _Settings.moves.Move1
local _Move2 = _Settings.moves.Move2
local _Move3 = _Settings.moves.Move3
local _Move4 = _Settings.moves.Move4
local _PassiveKey = _Settings.moves.PassiveKey
local _LocalPlayer = _Players.LocalPlayer
local v24 = _LocalPlayer.Character or _LocalPlayer.CharacterAdded:Wait()
local _HumanoidRootPart = v24:WaitForChild('HumanoidRootPart')
local _Humanoid = v24:WaitForChild('Humanoid')
local u27 = _targetPlayerName
local u28 = nil
local u29 = nil

local function u36(p30)
    for _ = 1, 15 do
        local _Part = Instance.new('Part')

        _Part.Size = Vector3.new(0.3, 0.3, 0.3)
        _Part.Position = p30 + Vector3.new(math.random(-1, 1), math.random(0, 2), math.random(-1, 1))
        _Part.Anchored = true
        _Part.CanCollide = false
        _Part.Shape = Enum.PartType.Ball
        _Part.Material = Enum.Material.Neon

        local v32 = {
            Color3.fromRGB(255, 255, 0),
            Color3.fromRGB(255, 255, 255),
            Color3.fromRGB(255, 0, 0),
        }

        _Part.Color = v32[math.random(1, #v32)]
        _Part.Parent = workspace

        local u33 = _Part.Position + Vector3.new(0, 1, 0)
        local u34 = tick()

        _RunService.Heartbeat:Connect(function()
            local v35 = tick() - u34

            if v35 <= 0.8 then
                _Part.Transparency = v35
                _Part.Position = _Part.Position:Lerp(u33, v35 / 0.8)
            end
        end)
        _Debris:AddItem(_Part, 1.2)
    end
end
local function u39(p37)
    local _HumanoidRootPart2 = p37:WaitForChild('HumanoidRootPart')

    u28 = Instance.new('AlignPosition')
    u28.Attachment0 = Instance.new('Attachment', _HumanoidRootPart)
    u28.Attachment1 = Instance.new('Attachment', _HumanoidRootPart2)
    u28.RigidityEnabled = true
    u28.MaxForce = 100000
    u28.Responsiveness = 200
    u28.Parent = _HumanoidRootPart
    u29 = Instance.new('AlignOrientation')
    u29.Attachment0 = u28.Attachment0
    u29.Attachment1 = u28.Attachment1
    u29.RigidityEnabled = true
    u29.MaxTorque = 100000
    u29.Responsiveness = 200
    u29.Parent = _HumanoidRootPart
    u28.Attachment1.Position = Vector3.new(4.2, 4, 4)
end
local function u40()
    if u28 then
        u28:Destroy()
    end
    if u29 then
        u29:Destroy()
    end

    u29 = nil
    u28 = nil
end
local function u43()
    task.spawn(function()
        while true do
            if _Humanoid then
                local _Animation = Instance.new('Animation')

                _Animation.AnimationId = _standAnimId

                local v42 = _Humanoid:LoadAnimation(_Animation)

                v42.Looped = false

                v42:Play()
            end

            task.wait(1)
        end
    end)
end
local function u53(p44)
    local _huge = math.huge
    local v46 = _Players
    local v47, v48, v49 = pairs(v46:GetPlayers())
    local v50 = nil

    while true do
        local v51

        v49, v51 = v47(v48, v49)

        if v49 == nil then
            break
        end
        if v51 ~= _LocalPlayer and (v51 ~= p44 and v51.Character) and v51.Character:FindFirstChild('HumanoidRootPart') then
            local _Magnitude = (v51.Character.HumanoidRootPart.Position - p44.Character.HumanoidRootPart.Position).Magnitude

            if _Magnitude < _huge then
                v50 = v51
                _huge = _Magnitude
            end
        end
    end

    return v50
end
local function u61(p54)
    local v55 = p54:lower()
    local v56 = _Players
    local v57, v58, v59 = pairs(v56:GetPlayers())

    while true do
        local v60

        v59, v60 = v57(v58, v59)

        if v59 == nil then
            break
        end
        if v60.Name:lower():find(v55) then
            return v60
        end
    end

    return nil
end
local function u64(p62)
    local _TextChatService2 = game:GetService('TextChatService')

    game:GetService('Players')
    _TextChatService2:WaitForChild('TextChannels'):WaitForChild('RBXGeneral'):SendAsync('' .. p62)
end
local function u65()
    return _zaWarudoMessages[math.random(#_zaWarudoMessages)]
end
local function u75(p66, p67)
    local u68 = _Players:FindFirstChild(u27)

    if u68 and u68.Character then
        local v69 = p67 or u53(u68)

        if v69 and v69.Character then
            if p66 == Enum.KeyCode.One or (p66 == Enum.KeyCode.Two or p66 == Enum.KeyCode.Three) then
                u64(u65())
            end

            local _HumanoidRootPart3 = v69.Character:FindFirstChild('HumanoidRootPart')
            local u71 = _HumanoidRootPart

            if _HumanoidRootPart3 and u71 then
                local v72 = _HumanoidRootPart3.CFrame * CFrame.new(0, 0, 2)

                u36(u71.Position)
                u40()

                u71.CFrame = CFrame.new(v72.Position, _HumanoidRootPart3.Position)

                u36(u71.Position)
                _VirtualInputManager:SendKeyEvent(true, p66, false, game)
                _VirtualInputManager:SendKeyEvent(false, p66, false, game)

                local u73 = tick()

                task.spawn(function()
                    while tick() - u73 < _attackFollowDuration do
                        if _HumanoidRootPart3 and u71 then
                            local v74 = _HumanoidRootPart3.Position - _HumanoidRootPart3.CFrame.LookVector * _followDistance

                            u71.CFrame = CFrame.new(v74, _HumanoidRootPart3.Position)

                            u36(u71.Position)
                        end

                        task.wait(0.07)
                    end

                    if _isStandActive and u68.Character then
                        u39(u68.Character)
                    end
                end)
            end
        else
            return
        end
    else
        return
    end
end
local function u81(p76)
    function _TextChatService.OnIncomingMessage(p77)
        if p77.TextSource and _Players:GetPlayerByUserId(p77.TextSource.UserId) == p76 then
            local _wsw, v79 = p77.Text:lower():match('^(%w+)%s*(%w*)')

            if _wsw then
                local v80 = v79 ~= '' and u61(v79) or nil

                if _wsw ~= _Move1:lower() then
                    if _wsw ~= _Move2:lower() then
                        if _wsw ~= _Move3:lower() then
                            if _wsw == _Move4:lower() then
                                u75(Enum.KeyCode.Four, v80)
                            end
                        else
                            u75(Enum.KeyCode.Three, v80)
                        end
                    else
                        u75(Enum.KeyCode.Two, v80)
                    end
                else
                    u75(Enum.KeyCode.One, v80)
                end
            end
        end
    end
end

_UserInputService.InputBegan:Connect(function(p82, p83)
    if not p83 then
        if p82.KeyCode == _PassiveKey then
            _isStandActive = not _isStandActive

            if _isStandActive then
                local v84 = _Players:FindFirstChild(u27)

                if v84 and v84.Character then
                    u39(v84.Character)
                end
            else
                u40()
            end
        end
    end
end);
(function()
    local v85 = _Players:FindFirstChild(u27)

    if v85 and v85.Character then
        u39(v85.Character)
        u43()
        u81(v85)
    else
        warn('player not found.')
    end
end)()

local _UserInputService2 = game:GetService('UserInputService')
local _VirtualInputManager2 = game:GetService('VirtualInputManager')
local _LocalPlayer2 = game.Players.LocalPlayer

if _UserInputService2.TouchEnabled then
    local _ScreenGui = Instance.new('ScreenGui')

    _ScreenGui.Name = 'PassiveButtonGui'
    _ScreenGui.ResetOnSpawn = false
    _ScreenGui.IgnoreGuiInset = true
    _ScreenGui.Parent = _LocalPlayer2:WaitForChild('PlayerGui')

    local _Frame = Instance.new('Frame')

    _Frame.Size = UDim2.new(0, 130, 0, 60)
    _Frame.Position = UDim2.new(1, -150, 0.5, -30)
    _Frame.AnchorPoint = Vector2.new(1, 0.5)
    _Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
    _Frame.BackgroundTransparency = 0.2
    _Frame.BorderSizePixel = 0
    _Frame.Parent = _ScreenGui
    _Frame.Active = true

    local _UICorner = Instance.new('UICorner')

    _UICorner.CornerRadius = UDim.new(0, 12)
    _UICorner.Parent = _Frame

    local _TextButton = Instance.new('TextButton')

    _TextButton.Size = UDim2.new(1, -10, 1, -10)
    _TextButton.Position = UDim2.new(0, 5, 0, 5)
    _TextButton.Text = 'Passive'
    _TextButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    _TextButton.TextColor3 = Color3.new(1, 1, 1)
    _TextButton.Font = Enum.Font.GothamBold
    _TextButton.TextScaled = true
    _TextButton.AutoButtonColor = false
    _TextButton.Parent = _Frame

    local _UICorner2 = Instance.new('UICorner')

    _UICorner2.CornerRadius = UDim.new(0, 8)
    _UICorner2.Parent = _TextButton

    _TextButton.MouseEnter:Connect(function()
        _TextButton.BackgroundColor3 = Color3.fromRGB(80, 80, 80)
    end)
    _TextButton.MouseLeave:Connect(function()
        _TextButton.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
    end)
    _TextButton.Activated:Connect(function()
        _VirtualInputManager2:SendKeyEvent(true, _PassiveKey, false, game)
        task.wait(0.1)
        _VirtualInputManager2:SendKeyEvent(false, _PassiveKey, false, game)
    end)

    local u94 = false
    local u95 = nil
    local u96 = nil
    local u97 = nil

    local function u100(p98)
        local v99 = p98.Position - u96

        _Frame.Position = UDim2.new(u97.X.Scale, u97.X.Offset + v99.X, u97.Y.Scale, u97.Y.Offset + v99.Y)
    end

    _Frame.InputBegan:Connect(function(p101)
        if p101.UserInputType == Enum.UserInputType.Touch or p101.UserInputType == Enum.UserInputType.MouseButton1 then
            u94 = true
            u96 = p101.Position
            u97 = _Frame.Position

            p101.Changed:Connect(function()
                if p101.UserInputState == Enum.UserInputState.End then
                    u94 = false
                end
            end)
        end
    end)
    _Frame.InputChanged:Connect(function(p102)
        if p102.UserInputType == Enum.UserInputType.Touch or p102.UserInputType == Enum.UserInputType.MouseMovement then
            u95 = p102
        end
    end)
    _UserInputService2.InputChanged:Connect(function(p103)
        if p103 == u95 and u94 then
            u100(p103)
        end
    end)
end
