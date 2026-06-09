local Env = getfenv();
local Y = {};
local r1 = true;
local v1 = {...};
local r2 = string.gmatch;
local function r3(...)
    error("Tamper Detected!");
    return; 
end;
local r4 = false;
local v2 = pcall(function(...)
    r4 = true;
    return; 
end);
local v3 = v2;
if v2 then
    v3 = r4;
end;
local v4 = 1;
local r5 = math.random;
local v5 = table.concat;
local function v6(...)
    while true do
        l1 = l2;
        l2 = l1;
        r3(); 
    end;
    return; 
end;
local r6 = table and table.unpack or unpack;
local r7 = r5(3, 65);
local v7 = {
    pcall(function(...)
        return "a2vscAPdMDh9eQ" / (3764904 - "AZD" ^ 2041668); 
    end)
};
local v8 = v7[2];
local r8 = tonumber(r2(tostring(v8), ":(%d*):")());
for i = 1, r7 do
    r9 = i;
    r10 = math.random(1, 100);
    r11 = r5(0, 255);
    r12 = r5(1, r10);
    r13 = r5(1, 2) == 1;
    r14 = v8.gsub(v8, ":(%d*):", ":" .. tostring(r5(0, 10000)) .. ":");
    a = {
        pcall(function(...)
            if r5(1, 2) == 1 or r9 == r7 then
                r1 = r1 and r8 == tonumber(r2(tostring(({
                    pcall(function(...)
                        return "MCJr3jVYnHH" / (9031153 - "jgc" ^ 8421373); 
                    end)
                })[2]), ":(%d*):")());
            end;
            if r13 then
                error(r14, 0);
            end;
            v1 = {};
            for t = 1, r10 do
                v1[t] = r5(0, 255); 
            end;
            v1[r12] = r11;
            return r6(v1); 
        end)
    };
    if r13 then
        r1 = r1 and (pcall(function(...)
            if r5(1, 2) == 1 or r9 == r7 then
                r1 = r1 and r8 == tonumber(r2(tostring(({
                    pcall(function(...)
                        return "MCJr3jVYnHH" / (9031153 - "jgc" ^ 8421373); 
                    end)
                })[2]), ":(%d*):")());
            end;
            if r13 then
                error(r14, 0);
            end;
            v1 = {};
            for t = 1, r10 do
                v1[t] = r5(0, 255); 
            end;
            v1[r12] = r11;
            return r6(v1); 
        end) == false and a[2] == r14);
    end; 
end;
r1 = r1 and 0 == 0;
if r1 then
    r17 = math.floor;
    r18 = 0;
    v7 = {};
    r19 = 2;
    r20 = {};
    r = 0;
    for s = 1, 256 do
        v7[s] = s; 
    end;
    v8 = #v7 == 0;
    s = table.remove(v7, math.random(1, #v7));
    r20[s] = string.char(s - 1);
    if #v7 == 0 then
        r21 = {};
        r23 = {};
        r16 = setmetatable({}, {
            ["__index"] = r23,
            ["__metatable"] = nil
        });
        B = game;
        t = not B.IsLoaded(B);
        if t then
            t = game.Loaded;
            t.Wait(t);
        end;
        B = game;
        t = B.GetService(B, "Players").LocalPlayer;
        task.wait();
        B = game;
        t = B.GetService(B, "Players").LocalPlayer;
        if t then
            B = game;
            t = B.GetService(B, "Players").LocalPlayer;
            t.FindFirstChild(t, "PlayerGui");
            task.wait();
            B = game;
            t = B.GetService(B, "Players").LocalPlayer;
            if t.FindFirstChild(t, "PlayerGui") then
                t = game;
                t = game;
                t.GetService(t, "RunService");
                t = game;
                r24 = t.GetService(t, "VirtualInputManager");
                v2 = game;
                r25 = v2.GetService(v2, "ReplicatedStorage");
                v6 = game;
                r26 = v6.GetService(v6, "TeleportService");
                w = game;
                w.GetService(w, "HttpService");
                w = game;
                w.GetService(w, "GuiService");
                r27 = t.GetService(t, "Players").LocalPlayer;
                w = r27.Neutral == false and (r27.Team ~= nil and r27.Character);
                v5 = Y[K];
                v7 = v5;
                v8 = r27.Neutral == true;
                w = r27.Team == nil or r27.Team.Name == "Choose Team";
                while v8 do
                    v5 = v5;
                    if w then
                        pcall(function(...)
                            v5 = r25;
                            v3 = v5.WaitForChild(v5, "Remotes");
                            v5 = v3.WaitForChild(v3, "CommF_");
                            v5.InvokeServer(v5, "SetTeam", _G.Settings.Team);
                            return; 
                        end);
                    end;
                    task.wait(1);
                    a = 10434497467130;
                    v7 = v5;
                    v5 = v7;
                    if r27[r16[r15("`\xc2\xe4\xa7\xb0\xae\xb7", a)]] == false and (r27.Team ~= nil and r27.Character) then
                        r29 = false;
                        r30 = "";
                        r31 = false;
                        w = game;
                        r32 = w.GetService(w, "TweenService");
                        y = game;
                        r33 = y.GetService(y, "Players");
                        c = r33.LocalPlayer;
                        r34 = {};
                        r35 = {
                            ["BG_COLOR"] = Color3.fromRGB(15, 15, 15),
                            ["ACCENT_COLOR"] = Color3.fromRGB(0, 255, 150),
                            ["SECONDARY_COLOR"] = Color3.fromRGB(0, 150, 255),
                            ["TEXT_COLOR"] = Color3.fromRGB(255, 255, 255),
                            ["FONT_BOLD"] = Enum.Font.GothamBold,
                            ["FONT_REGULAR"] = Enum.Font.GothamMedium,
                            ["DISPLAY_TIME"] = 4
                        };
                        a = Instance.new("ScreenGui");
                        a.Name = "EchoHub_Notifications";
                        a.ResetOnSpawn = false;
                        a.DisplayOrder = 999;
                        j = c.WaitForChild(c, "PlayerGui");
                        a.Parent = j;
                        r36 = Instance.new("Frame");
                        r36.Name = "NotifyContainer";
                        r36.Size = UDim2.new(0, 300, .6, 0);
                        r36.Position = UDim2.new(1, -310, 0.5, 0);
                        r36.AnchorPoint = Vector2.new(0, 0.5);
                        r36.BackgroundTransparency = 1;
                        r36.Parent = a;
                        v = Instance.new("UIListLayout");
                        v.Parent = r36;
                        v.Padding = UDim.new(0, 10);
                        v.VerticalAlignment = Enum.VerticalAlignment.Center;
                        v.HorizontalAlignment = Enum.HorizontalAlignment.Right;
                        r34.Notify = function(arg1_2, arg2_2, ...)
                            r37 = Instance.new("CanvasGroup");
                            r37.Size = UDim2.new(0, 280, 0, 90);
                            r37.BackgroundColor3 = r35.BG_COLOR;
                            r37.BorderSizePixel = 0;
                            r37.GroupTransparency = 1;
                            r37.Parent = r36;
                            W = Instance.new("UICorner");
                            W.CornerRadius = UDim.new(0, 6);
                            W.Parent = r37;
                            B = Instance.new("UIGradient");
                            B.Color = ColorSequence.new({
                                ColorSequenceKeypoint.new(0, Color3.fromRGB(40, 40, 40)),
                                ColorSequenceKeypoint.new(1, Color3.fromRGB(20, 20, 20))
                            });
                            B.Rotation = 45;
                            B.Parent = r37;
                            v4 = Instance.new("UIStroke");
                            v4.Color = r35.ACCENT_COLOR;
                            v4.Thickness = 1.5;
                            v4.ApplyStrokeMode = Enum.ApplyStrokeMode.Border;
                            v4.Parent = r37;
                            v2 = Instance.new("TextLabel");
                            v2.Text = "ECHO HUB | MADE BY SUDAIS";
                            v2.Size = UDim2.new(1, -20, 0, 15);
                            v2.Position = UDim2.new(0, 10, 0, 8);
                            v2.BackgroundTransparency = 1;
                            v2.TextColor3 = r35.ACCENT_COLOR;
                            v2.Font = Enum.Font.GothamBlack;
                            v2.TextSize = 10;
                            v2.TextXAlignment = Enum.TextXAlignment.Left;
                            v2.Parent = r37;
                            v6 = Instance.new("TextLabel");
                            v3 = arg1_2;
                            v6.Text = v3;
                            v6.Size = UDim2.new(1, -20, 0, 20);
                            v6.Position = UDim2.new(0, 10, 0, 25);
                            v6.BackgroundTransparency = 1;
                            v6.TextColor3 = r35.TEXT_COLOR;
                            v6.Font = r35.FONT_BOLD;
                            v6.TextSize = 15;
                            v6.TextXAlignment = Enum.TextXAlignment.Left;
                            v6.Parent = r37;
                            w = Instance.new("TextLabel");
                            v3 = arg2_2;
                            w.Text = v3;
                            w.Size = UDim2.new(1, -20, 0, 35);
                            w.Position = UDim2.new(0, 10, 0, 45);
                            w.BackgroundTransparency = 1;
                            w.TextColor3 = Color3.fromRGB(200, 200, 200);
                            w.Font = r35.FONT_REGULAR;
                            w.TextSize = 13;
                            w.TextWrapped = true;
                            w.TextXAlignment = Enum.TextXAlignment.Left;
                            w.TextYAlignment = Enum.TextYAlignment.Top;
                            w.Parent = r37;
                            J = Instance.new("Frame");
                            J.Size = UDim2.new(1, 0, 0, 3);
                            J.Position = UDim2.new(0, 0, 1, -3);
                            J.BackgroundColor3 = Color3.new(0, 0, 0);
                            J.BackgroundTransparency = 0.5;
                            J.BorderSizePixel = 0;
                            J.Parent = r37;
                            r = Instance.new("Frame");
                            r.Size = UDim2.new(1, 0, 1, 0);
                            r.BackgroundColor3 = r35.ACCENT_COLOR;
                            r.BorderSizePixel = 0;
                            r.Parent = J;
                            r37.Position = UDim2.new(1, 50, 0, 0);
                            v5 = r32;
                            v3 = v5.Create(v5, r37, TweenInfo.new(.6, Enum.EasingStyle.Quart, Enum.EasingDirection.Out), {
                                ["Position"] = UDim2.new(0, 0, 0, 0),
                                ["GroupTransparency"] = 0
                            });
                            v3.Play(v3);
                            v5 = r32;
                            n = v5.Create(v5, r, TweenInfo.new(r35.DISPLAY_TIME, Enum.EasingStyle.Linear), {
                                ["Size"] = UDim2.new(0, 0, 1, 0)
                            });
                            n.Play(n);
                            task.delay(r35.DISPLAY_TIME, function(...)
                                v5 = r32;
                                v1 = v5.Create(v5, r37, TweenInfo.new(0.5, Enum.EasingStyle.Quart, Enum.EasingDirection.In), {
                                    ["Position"] = UDim2.new(1.2, 0, 0, 0),
                                    ["GroupTransparency"] = 1
                                });
                                v1.Play(v1);
                                v5 = v1.Completed;
                                v5.Connect(v5, function(...)
                                    v5 = Y[48];
                                    v5.Destroy(v5);
                                    return; 
                                end);
                                return; 
                            end);
                            return; 
                        end;
                        j = w.GetService(w, "GuiService").ErrorMessageChanged;
                        j.Connect(j, function(...)
                            task.wait(.1);
                            v5 = r26;
                            v5.Teleport(v5, game.PlaceId, r27);
                            return; 
                        end);
                        zv = 50;
                        S = r27.Character;
                        j = S;
                        if S then
                            v5 = v5;
                            r38 = j;
                            j = r27.CharacterAdded;
                            j.Connect(j, function(arg1_3, ...)
                                v1 = arg1_3;
                                r38 = v1;
                                r29 = false;
                                v1.FindFirstChild(v1, "HumanoidRootPart");
                                task.wait();
                                if v1.FindFirstChild(v1, "HumanoidRootPart") then
                                    return;
                                end; 
                            end);
                            _G.FastAttack = true;
                            r39 = {};
                            Qv = "FastAttack";
                            if _G[Qv] then
                                mv = "getgenv";
                                C = v5;
                                dv = v5;
                                Qv = Env[mv];
                                j = Qv and getgenv();
                                v5 = dv;
                                if Qv then
                                    v5 = v5;
                                    r40 = Qv and getgenv();
                                    local function r41(arg1_4, arg2_4, ...)
                                        r42 = arg1_4;
                                        r43 = arg2_4;
                                        B = {
                                            pcall(function(...)
                                                v5 = r42;
                                                return v5.WaitForChild(v5, r43); 
                                            end)
                                        };
                                        t = B[2];
                                        if not pcall(function(...)
                                            v5 = r42;
                                            return v5.WaitForChild(v5, r43); 
                                        end) or not t then
                                            warn("\xe2\x9a\xa0 Missing object (send this to Sudais): " .. tostring(r43));
                                        end;
                                        return t; 
                                    end;
                                    local function Qv(arg1_5, ...)
                                        v5 = {...};
                                        B = v5;
                                        W, v6 = B(v4, W);
                                        while W do
                                            J = {
                                                d(K)
                                            };
                                            r = t.FindFirstChild(t, 34);
                                            if r then
                                                t = r;
                                                v5 = v5;
                                                if not t then
                                                    break;
                                                else
                                                    
                                                end;
                                            else
                                                r41(t, 34);
                                            end; 
                                        end;
                                        return arg1_5; 
                                    end;
                                    dv = game;
                                    dv.GetService(dv, "VirtualInputManager");
                                    dv = game;
                                    dv.GetService(dv, "CollectionService");
                                    dv = game;
                                    Xv = dv.GetService(dv, "ReplicatedStorage");
                                    dv = game;
                                    dv.GetService(dv, "TeleportService");
                                    dv = game;
                                    pv = dv.GetService(dv, "RunService");
                                    dv = game;
                                    r44 = dv.GetService(dv, "Players").LocalPlayer;
                                    if not r44 then
                                        return warn("\xe2\x9d\x8c No LocalPlayer");
                                    end;
                                    ev = r41(Xv, "Remotes");
                                    if not ev then
                                        return;
                                    end;
                                    r41(ev, "Validator");
                                    r41(ev, "CommF_");
                                    r41(ev, "CommE");
                                    r41(workspace, "ChestModels");
                                    bv = r41(workspace, "_WorldOrigin");
                                    r45 = r41(workspace, "Characters");
                                    r46 = r41(workspace, "Enemies");
                                    r41(workspace, "Map");
                                    r41(bv, "EnemySpawns");
                                    r41(bv, "Locations");
                                    gv = pv.RenderStepped;
                                    Uv = pv.Heartbeat;
                                    Rv = pv.Stepped;
                                    Pv = v5;
                                    r47 = r41(r41(Xv, "Modules"), "Net");
                                    Zv = sethiddenproperty or function(...)
                                         
                                    end;
                                    Pv = setupvalue or debug;
                                    fv = getupvalue or debug;
                                    v5 = Pv;
                                    r48 = {
                                        ["AutoClick"] = true,
                                        ["ClickDelay"] = 0
                                    };
                                    ({}).FastAttack = (function(...)
                                        if r40.rz_FastAttack then
                                            return r40.rz_FastAttack;
                                        end;
                                        r49 = {
                                            ["Distance"] = 300,
                                            ["attackMobs"] = true,
                                            ["attackPlayers"] = true,
                                            ["Equipped"] = nil
                                        };
                                        r50 = r41(r47, "RE/RegisterAttack");
                                        r51 = r41(r47, "RE/RegisterHit");
                                        local function r52(arg1_6, ...)
                                            local m = {
                                                13,
                                                12
                                            };
                                            v1 = arg1_6;
                                            if v1 then
                                                v5 = Y[m[4]];
                                                v3 = v1.FindFirstChild(v1, "Humanoid") and v1.Humanoid.Health > 0;
                                            end;
                                            return v1; 
                                        end;
                                        local function r53(arg1_7, arg2_7, ...)
                                            K = arg2_7;
                                            v1 = arg1_7;
                                            v2 = K.GetChildren;
                                            v4 = {
                                                v2(K)
                                            };
                                            B = v2[3];
                                            v4 = v2[1];
                                            for B, v6 in v4, ipairs(d(v4)) do
                                                v2 = B;
                                                v8 = 15563360869455;
                                                w = v6.FindFirstChild(v6, r16[r15("\xdcm\x88\xfc", v8)]);
                                                if w then
                                                    v8 = r52(v6);
                                                    if v8 then
                                                        v8 = r44;
                                                        r = v8.DistanceFromCharacter(v8, v5.Position) < r49.Distance;
                                                    end;
                                                    v6.FindFirstChild(v6, r16[n]);
                                                    J = v8;
                                                end;
                                                if w then
                                                    if v6 ~= r44.Character then
                                                        table.insert(arg1_7, {
                                                            v6,
                                                            w
                                                        });
                                                        t = w;
                                                    end;
                                                end; 
                                            end;
                                            return nil; 
                                        end;
                                        r49.Attack = function(arg1_8, arg2_8, arg3_8, ...)
                                            v1 = arg1_8;
                                            t = arg3_8;
                                            K = arg2_8;
                                            if not K or #t == 0 then
                                                return;
                                            end;
                                            v5 = r50;
                                            B = v5;
                                            v5.FireServer(v5, r48.ClickDelay or 0);
                                            v3 = r51;
                                            v3.FireServer(v3, K, t);
                                            return; 
                                        end;
                                        r49.AttackNearest = function(arg1_9, ...)
                                            v1 = arg1_9;
                                            K = {};
                                            t = r53(K, r46);
                                            r53(K, r45);
                                            B = r44.Character;
                                            if not B then
                                                return;
                                            end;
                                            v5 = B.FindFirstChildOfClass(B, "Tool");
                                            r54 = v5;
                                            v2 = r54;
                                            if v2 then
                                                v2 = r54;
                                                v3 = v2.FindFirstChild(v2, "LeftClickRemote");
                                            end;
                                            if v2 then
                                                v2 = ("\xa95>\xe7")[2];
                                                w = ("\xa95>\xe7")[1];
                                                for v6, r in ipairs(K) do
                                                    n = r[1];
                                                    r55 = (n.HumanoidRootPart.Position - B.GetPivot(B).Position).Unit;
                                                    pcall(function(...)
                                                        v5 = r54.LeftClickRemote;
                                                        v5.FireServer(v5, r55, 1);
                                                        return; 
                                                    end); 
                                                end;
                                            else
                                                v6 = 0;
                                                v5 = #K > v6;
                                                if v5 then
                                                    v6 = v5;
                                                    if t then
                                                        v5 = v6;
                                                        v1.Attack(v1, t, {});
                                                        return;
                                                    else
                                                        r53(K, r45);
                                                    end;
                                                else
                                                    task.wait();
                                                end;
                                            end; 
                                        end;
                                        r49.BladeHits = function(arg1_10, ...)
                                            K = r52;
                                            v1 = arg1_10;
                                            K = K(r44.Character) and K.FindFirstChildOfClass(K, "Tool");
                                            if K then
                                                v3 = K.ToolTip ~= "Gun";
                                            end;
                                            if K then
                                                v1.AttackNearest(v1);
                                            else
                                                task.wait();
                                            end;
                                            return; 
                                        end;
                                        task.spawn(function(...)
                                            while task.wait(r48.ClickDelay) do
                                                v5 = r48.AutoClick;
                                                if v5 then
                                                    v5 = r49;
                                                    v5.BladeHits(v5);
                                                end; 
                                            end;
                                            return; 
                                        end);
                                        r40.rz_FastAttack = r49;
                                        return r49; 
                                    end)();
                                    local function r56(arg1_11, ...)
                                        v1 = arg1_11;
                                        K = v1 and v1.FindFirstChild(v1, "Humanoid");
                                        if K then
                                            v3 = K.Health > 0;
                                        end;
                                        return K; 
                                    end;
                                    local function r57(arg1_12, ...)
                                        v1 = arg1_12;
                                        if v1 then
                                            v3 = v1.FindFirstChild(v1, "HumanoidRootPart");
                                        end;
                                        return v1; 
                                    end;
                                    local function r58(...)
                                        r59 = false;
                                        pcall(function(...)
                                            local m = {
                                                m[1],
                                                m[2],
                                                m[3],
                                                49
                                            };
                                            v1 = Y[m[1]].PlayerGui.Main.BottomHUDList.InCombat;
                                            K = v1.Visible;
                                            if K then
                                                v3 = string.find(v1.Text, "Bounty at risk");
                                            end;
                                            if K then
                                                r59 = true;
                                            end;
                                            return; 
                                        end);
                                        return r59; 
                                    end;
                                    local function r60(arg1_13, ...)
                                        r61 = arg1_13;
                                        if not r61 or not r61.Character then
                                            return true;
                                        end;
                                        v5 = r61;
                                        if v5.GetAttribute(v5, "PvpDisabled") then
                                            return true;
                                        end;
                                        r62 = false;
                                        pcall(function(...)
                                            if r61.PlayerGui.Main.BottomHUDList.SafeZone.Visible then
                                                r62 = true;
                                            end;
                                            return; 
                                        end);
                                        if r62 then
                                            return true;
                                        end;
                                        if r57(r61.Character) then
                                            W = workspace;
                                            v2 = r16;
                                            v6 = r15;
                                            W = W.FindFirstChild(W, "_WorldOrigin") and W.FindFirstChild(W, "SafeZones");
                                            if W then
                                                v6 = W.GetChildren;
                                                v2 = {
                                                    v6(W)
                                                };
                                                B = v6[2];
                                                v2 = v6[1];
                                                for v4, w in pairs(d(v2)) do
                                                    v6 = v4;
                                                    if w.IsA(w, "BasePart") and (v3.Position - w.Position).Magnitude <= 200 then
                                                        return true;
                                                    else
                                                        
                                                    end; 
                                                end;
                                            end;
                                        end;
                                        return false; 
                                    end;
                                    local function r63(...)
                                        v1 = _G.Settings.TargetRegion or "Singapore";
                                        K = _G.Settings.MinPlayersForHop or 8;
                                        r64 = r33.LocalPlayer;
                                        task.spawn(function(...)
                                            while task.wait() do
                                                pcall(function(...)
                                                    v1 = r64.Character;
                                                    v3 = v1;
                                                    if v1 then
                                                        v1 = "HumanoidRootPart";
                                                        K = v1.WaitForChild(v1, "HumanoidRootPart", 5);
                                                        if K then
                                                            K.CFrame = CFrame.new(K.Position.X, 5000000, K.Position.v2);
                                                        end;
                                                        return;
                                                    else
                                                        v1 = r64.CharacterAdded;
                                                        v3 = v1.Wait(v1);
                                                    end; 
                                                end); 
                                            end;
                                            return; 
                                        end);
                                        if r58() then
                                            r34.Notify("Waiting", "In combat, waiting to hop...");
                                            v3 = not r58();
                                            task.wait(1);
                                            if not r58() then
                                                while true do
                                                    r34.Notify("Searching", "Looking for " .. (_G.Settings.TargetRegion or "Singapore") .. " servers...");
                                                    v3 = r64.PlayerGui;
                                                    W = v3.FindFirstChild(v3, "ServerBrowser");
                                                    v3 = not W;
                                                    if v3 then
                                                        pcall(function(...)
                                                            if _G.toggleMenu then
                                                                _G.toggleMenu("ServerBrowser");
                                                            end;
                                                            return; 
                                                        end);
                                                        task.wait(1.5);
                                                        v3 = r64.PlayerGui;
                                                        v3.FindFirstChild(v3, "ServerBrowser");
                                                    end;
                                                    if W then
                                                        v3 = W.FindFirstChild(W, "Frame");
                                                    end;
                                                    v5 = Pv;
                                                    if W then
                                                        v4 = v3.FindFirstChild(v3, B).Frame;
                                                        v2 = v4.FindFirstChild(v4, "ScrollingFrame");
                                                        v6 = v4.FindFirstChild(v4, "Refresh");
                                                        v3 = v4.Filters;
                                                        w = v3.FindFirstChild(v3, "SearchRegion");
                                                        v3 = v4.FakeScroll;
                                                        J = v3.FindFirstChild(v3, "Inside");
                                                        if v6 then
                                                            v3 = v6.Text == "Refresh";
                                                        end;
                                                        if v6 then
                                                            if getconnections then
                                                                v8 = getconnections;
                                                                s = {
                                                                    v8(v4.FindFirstChild(v4, "Refresh").MouseButton1Click)
                                                                };
                                                                n = v8[2];
                                                                r = v8[1];
                                                                for v7, s in pairs(d(s)) do
                                                                    v8 = v7;
                                                                    s.Fire(s); 
                                                                end;
                                                            else
                                                                v4.FindFirstChild(v4, "Refresh").Text = "Refreshing...";
                                                            end;
                                                        end;
                                                        task.wait(2);
                                                        if w then
                                                            v3 = w.FindFirstChild(w, "TextBox");
                                                        end;
                                                        v5 = task.wait;
                                                        if w then
                                                            n = _G.Settings.TargetRegion or "Singapore";
                                                            w.TextBox.Text = n;
                                                            task.wait(0.5);
                                                        end;
                                                        while 0 < v2.CanvasSize.Y.Offset do
                                                            v2.CanvasPosition = Vector2.new(0, 0);
                                                            task.wait(.1);
                                                            I = J.GetChildren;
                                                            s = I[3];
                                                            v8 = I[2];
                                                            for s, I in pairs(I(J)) do
                                                                i = s;
                                                                v5 = v4;
                                                                if I.IsA(I, "Frame") and I.Visible then
                                                                    h = I.FindFirstChild(I, "TextLabel");
                                                                    E = I.FindFirstChild(I, "Join");
                                                                    if h then
                                                                        v3 = string.find(h.Text, _G.Settings.TargetRegion or "Singapore");
                                                                    end;
                                                                    v5 = h;
                                                                    if h then
                                                                        y = v5;
                                                                        T = h.Text;
                                                                        y = tonumber(T.match(T, "Players: (%d+)/")) or 0;
                                                                        r65 = E.GetAttribute(E, "Job");
                                                                        v5 = v5;
                                                                        if r65 and (r65 ~= "" and y >= (_G.Settings.MinPlayersForHop or 8)) then
                                                                            r34.Notify("Match Found", "Joining " .. (_G.Settings.TargetRegion or "Singapore") .. " (" .. y .. " players)");
                                                                            pcall(function(...)
                                                                                v5 = r25;
                                                                                v3 = v5.WaitForChild(v5, "__ServerBrowser");
                                                                                v3.InvokeServer(v3, "teleport", r65);
                                                                                return; 
                                                                            end);
                                                                            task.wait(5);
                                                                        end;
                                                                    end;
                                                                end; 
                                                            end;
                                                            n = 0 + 800; 
                                                        end;
                                                        print("No valid " .. (_G.Settings.TargetRegion or "Singapore") .. " servers found. Retrying...");
                                                        task.wait(3);
                                                    end; 
                                                end;
                                                return;
                                            end;
                                        end; 
                                    end;
                                    task.spawn(function(...)
                                        K = "";
                                        while task.wait(.2) do
                                            if r29 or not r56(r38) then
                                                
                                            end;
                                            if tHum and tHum.Health <= 0 then
                                                r34.Notify("TARGET ELIMINATED", "Successfully defeated " .. r28.Name .. "!");
                                                table.insert(r39, r28.Name);
                                                K = "";
                                                task.wait(1);
                                            end;
                                            if r28 then
                                                v5 = task[W[v4]];
                                                if not r56(r28.Character) or (r60(r28) or table.find(r39, r28.Name)) then
                                                    K = "";
                                                end;
                                            end;
                                            t = math.huge;
                                            r = r33;
                                            J = r[3];
                                            for J, r in r[1], pairs(r.GetPlayers(r)) do
                                                v2 = J;
                                                v5 = task[W[v4]];
                                                if r ~= r27 and r56(r.Character) then
                                                    v7 = r57(r.Character);
                                                    v8 = r57(r38);
                                                    if v7 then
                                                        n = r57(r38);
                                                    end;
                                                    v5 = v7;
                                                    if v7 then
                                                        n = (v8.Position - v7.Position).Magnitude;
                                                        s = n < math[w];
                                                        if s then
                                                            s = (v8.Position - v7[r16[r15(c, T)]])[i];
                                                            t = n;
                                                            W = r;
                                                        end;
                                                    end;
                                                end; 
                                            end;
                                            if nil then
                                                v1 = 0;
                                                if nil ~= r28 then
                                                    v6 = nil.Name ~= r30;
                                                    r30 = nil.Name;
                                                    r34.Notify("TARGET LOCKED", "Engaging: " .. nil.Name);
                                                    v7 = not r58();
                                                    if v7 then
                                                        if v6 then
                                                            v7 = not r31;
                                                        end;
                                                        r = v6;
                                                        v5 = task[W[v4]];
                                                    end;
                                                    v5 = task[W[v4]];
                                                    if v7 then
                                                        r = r56;
                                                        if r(r38) then
                                                            r = r38;
                                                            r.BreakJoints(r);
                                                        end;
                                                        task.wait(0.5);
                                                    end;
                                                    r31 = false;
                                                end;
                                            else
                                                if 0 + 0.5 >= _G.Settings.ServerHopTimer then
                                                    r34.Notify("SERVER HOP", "No targets found. Finding new server...");
                                                    r63();
                                                    v1 = 0;
                                                end;
                                            end; 
                                        end;
                                        return; 
                                    end);
                                    mv = t.GetService(t, "RunService").Stepped;
                                    mv.Connect(mv, function(...)
                                        if r29 or (not r28 or not r56(r38)) then
                                            return;
                                        end;
                                        K = r57(r38);
                                        t = r57(r28.Character);
                                        if K then
                                            if t then
                                                r56(r28[r16[W]]);
                                            end;
                                            v5 = r57;
                                            v3 = t;
                                        end;
                                        if K then
                                            K.CFrame = t.CFrame * CFrame.new(0, 0, 5);
                                            K.Velocity = Vector3.new(0, 0, 0);
                                            v4 = r38;
                                            W = v4[2];
                                            v4 = v4[1];
                                            for B, v6 in pairs(v4.GetChildren(v4)) do
                                                v2 = B;
                                                if v6.IsA(v6, "BasePart") then
                                                    v6.CanCollide = false;
                                                end; 
                                            end;
                                            B = "Pain";
                                            if _G.Settings[B] then
                                                B = r38;
                                                W = B.FindFirstChild(B, "Pain-Pain") or B.FindFirstChild(B, "Pain-Pain");
                                                if W then
                                                    v5 = W.Parent ~= r38;
                                                    if v5 then
                                                        v5 = r38.Humanoid;
                                                        v5.EquipTool(v5, v4 or B.FindFirstChild(B, "Pain-Pain"));
                                                    end;
                                                    B = W.FindFirstChild(W, "LeftClickRemote");
                                                    if B then
                                                        return nil;
                                                    end;
                                                end;
                                            end;
                                        end;
                                        return; 
                                    end);
                                    if _G.Settings.FastAttack then
                                        mv = r25;
                                        Xv = mv.WaitForChild(mv, "Modules");
                                        r66 = Xv.WaitForChild(Xv, "Net");
                                        task.spawn(function(...)
                                            while task.wait() do
                                                if r28 and r56(r28.Character) then
                                                    pcall(function(...)
                                                        v5 = r66["RE/RegisterAttack"];
                                                        v5.FireServer(v5, 0);
                                                        v5 = r66["RE/RegisterHit"];
                                                        v5.FireServer(v5, r57(r28.Character), {
                                                            {
                                                                r28.Character,
                                                                r57(r28.Character)
                                                            }
                                                        });
                                                        return; 
                                                    end);
                                                end; 
                                            end;
                                            return; 
                                        end);
                                        break;
                                    end;
                                    task.spawn(function(...)
                                        K = r16;
                                        while task.wait(1) do
                                            if r38 and not K.FindFirstChild(K, "HasBuso") then
                                                v5 = r25.Remotes.CommF_;
                                                v5.InvokeServer(v5, "Buso");
                                            end;
                                            pcall(function(...)
                                                v5 = r25.Remotes.CommF_;
                                                v5.InvokeServer(v5, "EnablePvp");
                                                return; 
                                            end); 
                                        end;
                                        return; 
                                    end);
                                    task.spawn(function(...)
                                        v1 = 0.5;
                                        while task.wait(v1) do
                                            v1 = r38;
                                            v3 = v1;
                                            v1 = v3 and v1.FindFirstChild(v1, "Humanoid");
                                            if v1 then
                                                v5 = task[K[W]];
                                                v3 = v1.Health <= _G.Settings.SafeHealth and (not r29 and v1.Health > 0);
                                            end;
                                            if v1 then
                                                r29 = true;
                                                t = r57(r38);
                                                if t then
                                                    K = not v1 or (v1.Health >= _G.Settings.ResumeHealth or v1.Health <= 0);
                                                    t.CFrame = CFrame.new(t.Position.X, 50000, t.Position.v2);
                                                    t.Velocity = Vector3.new(0, 0, 0);
                                                    task.wait(.2);
                                                    v5 = true;
                                                    if not v1 or (v1.Health >= _G.Settings.ResumeHealth or v1.Health <= 0) then
                                                        r29 = false;
                                                    end;
                                                end;
                                            end; 
                                        end;
                                        return; 
                                    end);
                                    task.spawn(function(...)
                                        v1 = 0.5;
                                        while task.wait(v1) do
                                            v1 = _G.Settings.raceV4Enabled;
                                            if v1 then
                                                r56(r38);
                                            end;
                                            if v1 then
                                                v5 = r38;
                                                v5 = r38;
                                                v1 = v5.FindFirstChild(v5, "RaceEnergy");
                                                t = r16;
                                                v5.FindFirstChild(v5, "RaceTransformed");
                                                if v1 then
                                                    t = v1.Value >= 1;
                                                    v3 = t and v5;
                                                    v5 = v5;
                                                end;
                                                if v1 then
                                                    v5 = r24;
                                                    v5.SendKeyEvent(v5, true, "Y", false, game);
                                                    task.wait(.1);
                                                    v5 = r24;
                                                    v5.SendKeyEvent(v5, false, "Y", false, game);
                                                end;
                                            end; 
                                        end;
                                        return; 
                                    end);
                                    mv = game;
                                    r67 = mv.GetService(mv, "TweenService");
                                    Xv = game;
                                    pv = Instance.new("ScreenGui");
                                    pv.Name = "EchoHub_SkipUI";
                                    Yv = Xv.GetService(Xv, "CoreGui");
                                    pv.Parent = Yv;
                                    pv.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
                                    r68 = Instance.new("TextButton");
                                    r68.Name = "SkipButton";
                                    r68.Parent = pv;
                                    r68.Size = UDim2.new(0, 160, 0, 40);
                                    r68.Position = UDim2.new(0.5, -80, .03, 0);
                                    r68.BackgroundColor3 = Color3.fromRGB(15, 15, 15);
                                    r68.BorderSizePixel = 0;
                                    r68.AutoButtonColor = false;
                                    r68.Text = "SKIP TARGET";
                                    r68.TextColor3 = Color3.fromRGB(255, 255, 255);
                                    r68.Font = Enum.Font.GothamBlack;
                                    r68.TextSize = 13;
                                    r68.ClipsDescendants = true;
                                    Kv = Instance.new("UICorner");
                                    Kv.CornerRadius = UDim.new(0, 6);
                                    Kv.Parent = r68;
                                    r69 = Instance.new("UIStroke");
                                    r69.Color = Color3.fromRGB(0, 255, 150);
                                    r69.Thickness = 1.5;
                                    r69.Transparency = .4;
                                    r69.Parent = r68;
                                    r70 = Instance.new("Frame");
                                    r70.Name = "Shine";
                                    r70.Size = UDim2.new(0, 50, 1, 0);
                                    r70.Position = UDim2.new(-0.5, 0, 0, 0);
                                    r70.BackgroundColor3 = Color3.new(1, 1, 1);
                                    r70.BackgroundTransparency = .8;
                                    r70.Rotation = 25;
                                    r70.Parent = r68;
                                    tv = Instance.new("UIGradient");
                                    tv.Transparency = NumberSequence.new({
                                        NumberSequenceKeypoint.new(0, 1),
                                        NumberSequenceKeypoint.new(0.5, 0),
                                        NumberSequenceKeypoint.new(1, 1)
                                    });
                                    tv.Parent = r70;
                                    local function r71(arg1_14, arg2_14, arg3_14, ...)
                                        v5 = r67;
                                        return v5.Create(v5, arg1_14, TweenInfo.new(unpack(arg2_14)), arg3_14); 
                                    end;
                                    Wv = r68.MouseEnter;
                                    Wv.Connect(Wv, function(...)
                                        v3 = r71(r68, {
                                            .3,
                                            Enum.EasingStyle.Quart,
                                            Enum.EasingDirection.Out
                                        }, {
                                            ["Size"] = UDim2.new(0, 175, 0, 45),
                                            ["Position"] = UDim2.new(0.5, -87, .03, -2),
                                            ["BackgroundColor3"] = Color3.fromRGB(25, 25, 25)
                                        });
                                        v3.Play(v3);
                                        v3 = r71(r69, {
                                            .3,
                                            Enum.EasingStyle.Quart
                                        }, {
                                            ["Transparency"] = 0
                                        });
                                        v3.Play(v3);
                                        r70.Position = UDim2.new(-0.5, 0, 0, 0);
                                        v3 = r71(r70, {
                                            .6,
                                            Enum.EasingStyle.Quad,
                                            Enum.EasingDirection.Out
                                        }, {
                                            ["Position"] = UDim2.new(1.5, 0, 0, 0)
                                        });
                                        v3.Play(v3);
                                        return; 
                                    end);
                                    Wv = r68.MouseLeave;
                                    Wv.Connect(Wv, function(...)
                                        v3 = r71(r68, {
                                            .3,
                                            Enum.EasingStyle.Quart,
                                            Enum.EasingDirection.Out
                                        }, {
                                            ["Size"] = UDim2.new(0, 160, 0, 40),
                                            ["Position"] = UDim2.new(0.5, -80, .03, 0),
                                            ["BackgroundColor3"] = Color3.fromRGB(15, 15, 15)
                                        });
                                        v3.Play(v3);
                                        v3 = r71(r69, {
                                            .3,
                                            Enum.EasingStyle.Quart
                                        }, {
                                            ["Transparency"] = .4
                                        });
                                        v3.Play(v3);
                                        return; 
                                    end);
                                    Wv = r68.MouseButton1Down;
                                    Wv.Connect(Wv, function(...)
                                        v3 = r71(r68, {
                                            .1,
                                            Enum.EasingStyle.Back,
                                            Enum.EasingDirection.Out
                                        }, {
                                            ["Size"] = UDim2.new(0, 150, 0, 35),
                                            ["Position"] = UDim2.new(0.5, -75, .03, 2)
                                        });
                                        v3.Play(v3);
                                        return; 
                                    end);
                                    Wv = r68.MouseButton1Up;
                                    Wv.Connect(Wv, function(...)
                                        v3 = r71(r68, {
                                            .1,
                                            Enum.EasingStyle.Back,
                                            Enum.EasingDirection.Out
                                        }, {
                                            ["Size"] = UDim2.new(0, 175, 0, 45),
                                            ["Position"] = UDim2.new(0.5, -87, .03, -2)
                                        });
                                        v3.Play(v3);
                                        return; 
                                    end);
                                    Wv = r68.MouseButton1Click;
                                    Wv.Connect(Wv, function(...)
                                        if r28 then
                                            r69.Color = Color3.fromRGB(255, 255, 255);
                                            task.delay(.1, function(...)
                                                r69.Color = Color3.fromRGB(0, 255, 150);
                                                return; 
                                            end);
                                            r31 = true;
                                            table.insert(r39, r28.Name);
                                            r34.Notify("Target Skipped", "Moving to next player...");
                                        end;
                                        return; 
                                    end);
                                    r34.Notify("System Initialized", "Echo Hub has loaded successfully. Enjoy your session!");
                                    return r34;
                                else
                                    dv = dv;
                                    mv = dv;
                                    Xv = getrenv;
                                    if Xv then
                                        Lv = getrenv();
                                    end;
                                    v5 = dv;
                                    if Xv then
                                        v5 = dv;
                                        j = Lv;
                                    else
                                        Qv = getfenv();
                                    end;
                                end;
                            end;
                        else
                            S = r27.CharacterAdded;
                            j = S.Wait(S);
                        end;
                    end; 
                end;
                w = r27.Team == nil or r27.Team.Name == "Choose Team";
                v5 = v5;
            end;
        end;
    end;
end;
return (function(...)
    while true do
        l1 = l2;
        l2 = l1;
        r3(); 
    end;
    return; 
end)();
