local Env = getfenv();
local U = {};
local v1 = {...};
local r1 = true;
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
        return "Yx0VGsf2YPd9" / (12857230 - "gh5ezK7" ^ 15252830); 
    end)
};
local v8 = v7[2];
local r8 = tonumber(r2(tostring(v8), ":(%d*):")());
for T = 1, r7 do
    r9 = T;
    r10 = math.random(1, 100);
    r11 = r5(0, 255);
    r12 = r5(1, r10);
    r13 = r5(1, 2) == 1;
    r14 = v8.gsub(v8, ":(%d*):", ":" .. tostring(r5(0, 10000)) .. ":");
    R = {
        pcall(function(...)
            if r5(1, 2) == 1 or r9 == r7 then
                r1 = r1 and r8 == tonumber(r2(tostring(({
                    pcall(function(...)
                        return "qI1" / (448511 - "KV" ^ 2232763); 
                    end)
                })[2]), ":(%d*):")());
            end;
            if r13 then
                error(r14, 0);
            end;
            v1 = {};
            for Z = 1, r10 do
                v1[Z] = r5(0, 255); 
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
                        return "qI1" / (448511 - "KV" ^ 2232763); 
                    end)
                })[2]), ":(%d*):")());
            end;
            if r13 then
                error(r14, 0);
            end;
            v1 = {};
            for Z = 1, r10 do
                v1[Z] = r5(0, 255); 
            end;
            v1[r12] = r11;
            return r6(v1); 
        end) == false and R[2] == r14);
    end; 
end;
r1 = r1 and 0 == 0;
if r1 then
    v7 = {};
    r17 = math.floor;
    r18 = 0;
    r19 = 2;
    r20 = {};
    V = 0;
    for J = 1, 256 do
        v7[J] = J; 
    end;
    v8 = #v7 == 0;
    J = table.remove(v7, math.random(1, #v7));
    r20[J] = string.char(J - 1);
    if #v7 == 0 then
        r21 = {};
        r23 = {};
        r15 = setmetatable({}, {
            ["__index"] = r23,
            ["__metatable"] = nil
        });
        v4 = game;
        r24 = loadstring(v4.HttpGet(v4, "https://sirius.menu/rayfield"))();
        Z = r24;
        c7[8] = 18216681152802;
        c7[2] = 30036657682082;
        c7[25] = 30646215112638;
        c7[16] = 31045534873720;
        c7[4] = 26275170021323;
        v4 = Z.CreateWindow(Z, {
            ["Name"] = "[ORVA] \xf0\x9f\x8d\xab +1 Speed Keyboard Escape | Candy & Chocolate",
            ["Icon"] = 0,
            ["LoadingTitle"] = "[ORVA] \xf0\x9f\x8d\xab +1 Speed Keyboard Escape",
            ["LoadingSubtitle"] = "BY ORVA",
            ["ShowText"] = "Rayfield",
            ["Theme"] = {
                ["TextColor"] = Color3.fromRGB(235, 235, 245),
                ["Background"] = Color3.fromRGB(15, 15, 35),
                ["Topbar"] = Color3.fromRGB(22, 22, 50),
                ["Shadow"] = Color3.fromRGB(10, 10, 25),
                ["NotificationBackground"] = Color3.fromRGB(18, 18, 40),
                ["NotificationActionsBackground"] = Color3.fromRGB(180, 140, 255),
                ["TabBackground"] = Color3.fromRGB(40, 40, 90),
                ["TabStroke"] = Color3.fromRGB(70, 60, 120),
                ["TabBackgroundSelected"] = Color3.fromRGB(170, 130, 255),
                ["TabTextColor"] = Color3.fromRGB(235, 235, 245),
                ["SelectedTabTextColor"] = Color3.fromRGB(20, 20, 30),
                ["ElementBackground"] = Color3.fromRGB(25, 25, 55),
                ["ElementBackgroundHover"] = Color3.fromRGB(35, 35, 75),
                ["SecondaryElementBackground"] = Color3.fromRGB(18, 18, 40),
                ["ElementStroke"] = Color3.fromRGB(80, 70, 140),
                ["SecondaryElementStroke"] = Color3.fromRGB(60, 55, 110),
                ["SliderBackground"] = Color3.fromRGB(120, 90, 255),
                ["SliderProgress"] = Color3.fromRGB(140, 110, 255),
                ["SliderStroke"] = Color3.fromRGB(180, 150, 255),
                ["ToggleBackground"] = Color3.fromRGB(20, 20, 45),
                ["ToggleEnabled"] = Color3.fromRGB(130, 90, 255),
                ["ToggleDisabled"] = Color3.fromRGB(80, 80, 100),
                ["ToggleEnabledStroke"] = Color3.fromRGB(170, 130, 255),
                ["ToggleDisabledStroke"] = Color3.fromRGB(100, 100, 130),
                ["ToggleEnabledOuterStroke"] = Color3.fromRGB(70, 60, 120),
                ["ToggleDisabledOuterStroke"] = Color3.fromRGB(50, 50, 80),
                ["DropdownSelected"] = Color3.fromRGB(30, 30, 65),
                ["DropdownUnselected"] = Color3.fromRGB(20, 20, 45),
                ["InputBackground"] = Color3.fromRGB(20, 20, 45),
                ["InputStroke"] = Color3.fromRGB(90, 80, 150),
                ["PlaceholderColor"] = Color3.fromRGB(160, 160, 190)
            },
            ["ToggleUIKeybind"] = "K",
            ["DisableRayfieldPrompts"] = false,
            ["DisableBuildWarnings"] = false,
            ["ConfigurationSaving"] = {
                ["Enabled"] = true,
                ["FolderName"] = nil,
                ["FileName"] = "OrvaHub"
            },
            ["Discord"] = {
                ["Enabled"] = true,
                ["Invite"] = "HsqbWfNb9B",
                ["RememberJoins"] = false
            },
            ["KeySystem"] = false,
            ["KeySettings"] = {
                ["Title"] = "ORVA",
                ["Subtitle"] = "Key System",
                ["Note"] = "Join our Discord to get the key: https://discord.gg/HsqbWfNb9B",
                ["FileName"] = "ORVAKeySystem",
                ["SaveKey"] = false,
                ["GrabKeyFromSite"] = false,
                ["Key"] = {
                    "ORVA1"
                }
            }
        });
        Z = v4.CreateTab(v4, "\xe2\x9a\x99\xef\xb8\x8f Main", nil);
        Z.CreateSection(Z, "World Selection");
        v6 = game;
        r25 = v6.GetService(v6, "TweenService");
        C = game;
        local function O(arg1_2, arg2_2, ...)
            return {
                ["Type"] = "Touch",
                ["GetTarget"] = arg1_2,
                ["Delay"] = arg2_2
            }; 
        end;
        local function u(arg1_3, arg2_3, ...)
            return {
                ["Type"] = "WaitForTimer",
                ["GetTimer"] = arg1_3,
                ["Target"] = arg2_3
            }; 
        end;
        r26 = C.GetService(C, "Players").LocalPlayer;
        r27 = "World 1";
        r28 = "1 Win";
        r29 = "1 Win";
        r30 = 120;
        r31 = 1.5;
        r32 = false;
        r33 = false;
        local function C(arg1_4, arg2_4, ...)
            return {
                ["Type"] = "Move",
                ["Position"] = arg1_4,
                ["Speed"] = arg2_4
            }; 
        end;
        r34 = {
            ["World 1"] = {
                "1 Win",
                "3 Wins",
                "10 Wins",
                "20 Wins",
                "50 Wins",
                "100 Wins",
                "150 Wins",
                "300 Wins",
                "500 Wins",
                "1000 Wins",
                "2500 Wins",
                "10000 Wins",
                "25000 Wins"
            },
            ["World 2"] = {
                "250k Wins",
                "400k Wins",
                "600k Wins",
                "1M Wins",
                "1.5M Wins",
                "2.5M Wins",
                "4M Wins",
                "6M Wins",
                "10M Wins",
                "15M Wins",
                "16M Wins"
            }
        };
        c7[9] = 5268271237525;
        c7[1] = 16938561674959;
        c7[7] = 61840015388;
        c7[28] = "\xb4h|\x0e\xce`\xc8";
        c7[10] = 10072893870674;
        c7[5] = 22453003839703;
        c7[12] = 12748603086640;
        c7[19] = 24283306191915;
        c7[20] = 28225589244759;
        c7[17] = 18818918474299;
        c7[3] = 30591753254821;
        c7[15] = 20685168158112;
        c7[1] = ")\x08\x87";
        c7[2] = "\xb0\xb3;";
        c7[1] = r16(c7[2], c7[3]);
        c7[2] = 3425448347195;
        c7[1] = 5680802581077;
        c7[13] = 21978938009594;
        c7[18] = 7356374617441;
        c7[1] = "_<}";
        c7[3] = 536998756602;
        c7[2] = "\xe5\xfe\x14";
        c7[1] = r16(c7[2], c7[3]);
        c7[3] = ")u\t";
        c7[6] = 18784980132395;
        c7[1] = r16;
        c7[2] = c7[1](c7[3], c7[4]);
        c7[1] = 1477.3;
        c7[4] = "\xc3\xcc\xcf";
        c7[1] = r15;
        c7[2] = r16;
        c7[3] = c7[2](c7[4], c7[5]);
        c7[5] = "G\xd4\xd0";
        c7[1] = 476.83;
        c7[2] = 1480.4;
        c7[1] = "Vector3";
        c7[2] = r15;
        c7[3] = r16;
        c7[4] = c7[3](c7[5], c7[6]);
        c7[1] = c7[2][c7[4]];
        c7[1] = -5902.1;
        c7[3] = 1565.53;
        c7[6] = "\x9cT\xe8";
        c7[2] = 486.11;
        c7[2] = "Vector3";
        c7[1] = Env[c7[2]];
        c7[3] = r15;
        c7[4] = r16;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[4] = 1388.15;
        c7[2] = c7[3][c7[5]];
        c7[7] = "e\x0e\xc7";
        c7[3] = 488.56;
        c7[2] = -6479.85;
        c7[1] = {
            c7[1][c7[2]](c7[2], c7[3], c7[4])
        };
        c7[3] = "Vector3";
        c7[2] = Env[c7[3]];
        c7[4] = r15;
        c7[5] = r16;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[8] = "\xbe\n\x8b";
        c7[3] = c7[4][c7[6]];
        c7[5] = 1487.06;
        c7[1] = c7[2][c7[3]];
        c7[4] = 520.43;
        c7[3] = -6808.44;
        c7[2] = {
            c7[1](c7[3], c7[4], c7[5])
        };
        c7[4] = "Vector3";
        c7[3] = Env[c7[4]];
        c7[5] = r15;
        c7[6] = r16;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[6] = 1470.37;
        c7[2] = c7[3][c7[4]];
        c7[5] = 523.6;
        c7[4] = -6808.57;
        c7[3] = {
            c7[2](c7[4], c7[5], c7[6])
        };
        c7[1] = C(o(c7[3]));
        c7[4] = .1;
        c7[3] = function(...)
            return workspace.Structure.Stage14.WinBlock13; 
        end;
        c7[2] = {
            O(c7[3], c7[4])
        };
        c7[5] = 1057399407084;
        c7[4] = 3867779548937;
        c7[29] = 5114525469005;
        c7[1] = 23897586084728;
        c7[6] = 3353833965081;
        c7[14] = 1926274483072;
        c7[2] = 29772668089895;
        c7[3] = 1502551540411;
        c7[1] = "\xd4m\x10";
        c7[2] = "\x8b\x80_";
        c7[1] = r16(c7[2], c7[3]);
        c7[3] = "\xfe}$";
        c7[1] = r16;
        c7[2] = c7[1](c7[3], c7[4]);
        c7[1] = 3879.8;
        c7[9] = "\xfc%\xc4\x1e";
        c7[7] = 3104229524901;
        c7[3] = 9605734306169;
        c7[1] = 3952261416752;
        c7[2] = 29695964149252;
        c7[4] = 7339845864793;
        c7[8] = 14661008890539;
        c7[1] = "\xf6\xae\x07";
        c7[2] = "\xbe\x97y";
        c7[1] = r16(c7[2], c7[3]);
        c7[1] = r16;
        c7[3] = "#\x85K";
        c7[2] = c7[1](c7[3], c7[4]);
        c7[1] = 3863.21;
        c7[1] = r15;
        c7[4] = "\x87\xb6\x84";
        c7[2] = r16;
        c7[3] = c7[2](c7[4], c7[5]);
        c7[2] = 3863.84;
        c7[1] = 622.38;
        c7[1] = "Vector3";
        c7[5] = "]\x1e\xb8";
        c7[2] = r15;
        c7[3] = r16;
        c7[4] = c7[3](c7[5], c7[6]);
        c7[1] = c7[2][c7[4]];
        c7[6] = "\xf3\xf8\xe6";
        c7[1] = 596.06;
        c7[2] = 622.41;
        c7[3] = 3817.04;
        c7[2] = "Vector3";
        c7[1] = Env[c7[2]];
        c7[3] = r15;
        c7[4] = r16;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[2] = c7[3][c7[5]];
        c7[3] = 626.04;
        c7[4] = 3801.68;
        c7[2] = 593.71;
        c7[1] = {
            c7[1][c7[2]](c7[2], c7[3], c7[4])
        };
        c7[2] = .1;
        c7[1] = function(...)
            return workspace["WORLD 2"].Winblocks.WinBlock26; 
        end;
        r35 = {
            ["World 1"] = {
                ["1 Win"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(-13.25, 11.31, 285.25), 100),
                    O(function(...)
                        return workspace.Structure.Stage2.WinBlock1; 
                    end, .2)
                },
                ["3 Wins"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(50.45, 7.68, 399.32)),
                    C(Vector3.new(.22, 7.68, 504.8)),
                    C(Vector3.new(-16.12, 10.65, 507.26), 100),
                    O(function(...)
                        return workspace.Structure.Stage3.WinBlock2; 
                    end, .2)
                },
                ["10 Wins"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(50.45, 7.68, 399.32)),
                    C(Vector3.new(.22, 7.68, 504.8)),
                    C(Vector3.new(-12.28, 7.68, 526.86)),
                    C(Vector3.new(-15.79, 7.68, 559.83)),
                    C(Vector3.new(-16.23, 49.29, 677.16)),
                    C(Vector3.new(-15.94, 75.96, 757.34)),
                    C(Vector3.new(-15.92, 77.92, 774.04), 100),
                    O(function(...)
                        return workspace.Structure.Stage4.WinBlock3; 
                    end, .2)
                },
                ["20 Wins"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(50.45, 7.68, 399.32)),
                    C(Vector3.new(.22, 7.68, 504.8)),
                    C(Vector3.new(-12.28, 7.68, 526.86)),
                    C(Vector3.new(-15.79, 7.68, 559.83)),
                    C(Vector3.new(-16.23, 49.29, 677.16)),
                    C(Vector3.new(-15.94, 75.96, 757.34)),
                    C(Vector3.new(17.74, 75.96, 789.65)),
                    C(Vector3.new(15.94, 75.96, 929.52)),
                    C(Vector3.new(3.16, 75.96, 1111.83)),
                    C(Vector3.new(-14.89, 78.94, 1108.95), 100),
                    O(function(...)
                        return workspace.Structure.Stage5.WinBlock4; 
                    end, .2)
                },
                ["50 Wins"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(50.45, 7.68, 399.32)),
                    C(Vector3.new(.22, 7.68, 504.8)),
                    C(Vector3.new(-12.28, 7.68, 526.86)),
                    C(Vector3.new(-15.79, 7.68, 559.83)),
                    C(Vector3.new(-16.23, 49.29, 677.16)),
                    C(Vector3.new(-15.94, 75.96, 757.34)),
                    C(Vector3.new(17.74, 75.96, 789.65)),
                    C(Vector3.new(15.94, 75.96, 929.52)),
                    C(Vector3.new(3.16, 75.96, 1111.83)),
                    C(Vector3.new(4.08, 75.96, 1150.4)),
                    C(Vector3.new(.54, 75.96, 1365.5)),
                    C(Vector3.new(1.57, 75.96, 1414.83)),
                    C(Vector3.new(-20.89, 78.4, 1412.88), 100),
                    O(function(...)
                        return workspace.Structure.Stage6.WinBlock5; 
                    end, .2)
                },
                ["100 Wins"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(50.45, 7.68, 399.32)),
                    C(Vector3.new(.22, 7.68, 504.8)),
                    C(Vector3.new(-12.28, 7.68, 526.86)),
                    C(Vector3.new(-15.79, 7.68, 559.83)),
                    C(Vector3.new(-16.23, 49.29, 677.16)),
                    C(Vector3.new(-15.94, 75.96, 757.34)),
                    C(Vector3.new(17.74, 75.96, 789.65)),
                    C(Vector3.new(15.94, 75.96, 929.52)),
                    C(Vector3.new(3.16, 75.96, 1111.83)),
                    C(Vector3.new(4.08, 75.96, 1150.4)),
                    C(Vector3.new(.54, 75.96, 1365.5)),
                    C(Vector3.new(1.57, 75.96, 1414.83)),
                    u(function(...)
                        return workspace["NPC & Piege"].Tsunami1.TimerPart.StageGui.Timer; 
                    end, .1),
                    C(Vector3.new(-126.49, 53.31, 1444.94)),
                    C(Vector3.new(-433.16, 53.31, 1463.62)),
                    C(Vector3.new(-546.43, 53.32, 1463.7)),
                    C(Vector3.new(-539.85, 55.15, 1448.3), 100),
                    O(function(...)
                        return workspace.Structure.Stage7.WinBlock6; 
                    end, .2)
                },
                ["150 Wins"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(50.45, 7.68, 399.32)),
                    C(Vector3.new(.22, 7.68, 504.8)),
                    C(Vector3.new(-12.28, 7.68, 526.86)),
                    C(Vector3.new(-15.79, 7.68, 559.83)),
                    C(Vector3.new(-16.23, 49.29, 677.16)),
                    C(Vector3.new(-15.94, 75.96, 757.34)),
                    C(Vector3.new(17.74, 75.96, 789.65)),
                    C(Vector3.new(15.94, 75.96, 929.52)),
                    C(Vector3.new(3.16, 75.96, 1111.83)),
                    C(Vector3.new(4.08, 75.96, 1150.4)),
                    C(Vector3.new(.54, 75.96, 1365.5)),
                    C(Vector3.new(1.57, 75.96, 1414.83)),
                    u(function(...)
                        return workspace["NPC & Piege"].Tsunami1.TimerPart.StageGui.Timer; 
                    end, .1),
                    C(Vector3.new(-126.49, 53.31, 1444.94)),
                    C(Vector3.new(-433.16, 53.31, 1463.62)),
                    C(Vector3.new(-546.43, 53.32, 1463.7)),
                    C(Vector3.new(-712.52, 53.32, 1465.25)),
                    C(Vector3.new(-1007.36, 53.32, 1466.5)),
                    C(Vector3.new(-1008.4, 55.29, 1451.05), 100),
                    O(function(...)
                        return workspace.Structure.Stage8.WinBlock7; 
                    end, .2)
                },
                ["300 Wins"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(50.45, 7.68, 399.32)),
                    C(Vector3.new(.22, 7.68, 504.8)),
                    C(Vector3.new(-12.28, 7.68, 526.86)),
                    C(Vector3.new(-15.79, 7.68, 559.83)),
                    C(Vector3.new(-16.23, 49.29, 677.16)),
                    C(Vector3.new(-15.94, 75.96, 757.34)),
                    C(Vector3.new(17.74, 75.96, 789.65)),
                    C(Vector3.new(15.94, 75.96, 929.52)),
                    C(Vector3.new(3.16, 75.96, 1111.83)),
                    C(Vector3.new(4.08, 75.96, 1150.4)),
                    C(Vector3.new(.54, 75.96, 1365.5)),
                    C(Vector3.new(1.57, 75.96, 1414.83)),
                    u(function(...)
                        return workspace["NPC & Piege"].Tsunami1.TimerPart.StageGui.Timer; 
                    end, .1),
                    C(Vector3.new(-126.49, 53.31, 1444.94)),
                    C(Vector3.new(-433.16, 53.31, 1463.62)),
                    C(Vector3.new(-546.43, 53.32, 1463.7)),
                    C(Vector3.new(-712.52, 53.32, 1465.25)),
                    C(Vector3.new(-1007.36, 53.32, 1466.5)),
                    C(Vector3.new(-1080.07, 53.32, 1468.84)),
                    C(Vector3.new(-1080.09, 322.48, 1468.84)),
                    C(Vector3.new(-1122.78, 295.32, 1465.14)),
                    C(Vector3.new(-1123.63, 298.61, 1452.2), 100),
                    O(function(...)
                        return workspace.Structure.Stage9.WinBlock8; 
                    end, .2)
                },
                ["500 Wins"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(50.45, 7.68, 399.32)),
                    C(Vector3.new(.22, 7.68, 504.8)),
                    C(Vector3.new(-12.28, 7.68, 526.86)),
                    C(Vector3.new(-15.79, 7.68, 559.83)),
                    C(Vector3.new(-16.23, 49.29, 677.16)),
                    C(Vector3.new(-15.94, 75.96, 757.34)),
                    C(Vector3.new(17.74, 75.96, 789.65)),
                    C(Vector3.new(15.94, 75.96, 929.52)),
                    C(Vector3.new(3.16, 75.96, 1111.83)),
                    C(Vector3.new(4.08, 75.96, 1150.4)),
                    C(Vector3.new(.54, 75.96, 1365.5)),
                    C(Vector3.new(1.57, 75.96, 1414.83)),
                    u(function(...)
                        return workspace["NPC & Piege"].Tsunami1.TimerPart.StageGui.Timer; 
                    end, .1),
                    C(Vector3.new(-126.49, 53.31, 1444.94)),
                    C(Vector3.new(-433.16, 53.31, 1463.62)),
                    C(Vector3.new(-546.43, 53.32, 1463.7)),
                    C(Vector3.new(-712.52, 53.32, 1465.25)),
                    C(Vector3.new(-1007.36, 53.32, 1466.5)),
                    C(Vector3.new(-1080.07, 53.32, 1468.84)),
                    C(Vector3.new(-1080.09, 322.48, 1468.84)),
                    C(Vector3.new(-1122.78, 295.32, 1465.14)),
                    C(Vector3.new(-1244.95, 302.75, 1470.11)),
                    C(Vector3.new(-1858.42, 314.87, 1464.63)),
                    C(Vector3.new(-2520.88, 321.59, 1464.34)),
                    C(Vector3.new(-2972.63, 295.32, 1465.91)),
                    C(Vector3.new(-2973.39, 299.56, 1449.55), 100),
                    O(function(...)
                        return workspace.Structure.Stage10.WinBlock9; 
                    end, .2)
                },
                ["1000 Wins"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(50.45, 7.68, 399.32)),
                    C(Vector3.new(.22, 7.68, 504.8)),
                    C(Vector3.new(-12.28, 7.68, 526.86)),
                    C(Vector3.new(-15.79, 7.68, 559.83)),
                    C(Vector3.new(-16.23, 49.29, 677.16)),
                    C(Vector3.new(-15.94, 75.96, 757.34)),
                    C(Vector3.new(17.74, 75.96, 789.65)),
                    C(Vector3.new(15.94, 75.96, 929.52)),
                    C(Vector3.new(3.16, 75.96, 1111.83)),
                    C(Vector3.new(4.08, 75.96, 1150.4)),
                    C(Vector3.new(.54, 75.96, 1365.5)),
                    C(Vector3.new(1.57, 75.96, 1414.83)),
                    u(function(...)
                        return workspace["NPC & Piege"].Tsunami1.TimerPart.StageGui.Timer; 
                    end, .1),
                    C(Vector3.new(-126.49, 53.31, 1444.94)),
                    C(Vector3.new(-433.16, 53.31, 1463.62)),
                    C(Vector3.new(-546.43, 53.32, 1463.7)),
                    C(Vector3.new(-712.52, 53.32, 1465.25)),
                    C(Vector3.new(-1007.36, 53.32, 1466.5)),
                    C(Vector3.new(-1080.07, 53.32, 1468.84)),
                    C(Vector3.new(-1080.09, 322.48, 1468.84)),
                    C(Vector3.new(-1122.78, 295.32, 1465.14)),
                    C(Vector3.new(-1244.95, 302.75, 1470.11)),
                    C(Vector3.new(-1858.42, 314.87, 1464.63)),
                    C(Vector3.new(-2520.88, 321.59, 1464.34)),
                    C(Vector3.new(-2972.63, 295.32, 1465.91)),
                    C(Vector3.new(-3251.58, 295.32, 1468.47)),
                    C(Vector3.new(-3732.62, 295.32, 1464.91)),
                    C(Vector3.new(-3943.55, 295.32, 1466.12)),
                    C(Vector3.new(-3939.01, 299.56, 1447.85), 100),
                    O(function(...)
                        return workspace.Structure.Stage11.WinBlock10; 
                    end, .2)
                },
                ["2500 Wins"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(50.45, 7.68, 399.32)),
                    C(Vector3.new(.22, 7.68, 504.8)),
                    C(Vector3.new(-12.28, 7.68, 526.86)),
                    C(Vector3.new(-15.79, 7.68, 559.83)),
                    C(Vector3.new(-16.23, 49.29, 677.16)),
                    C(Vector3.new(-15.94, 75.96, 757.34)),
                    C(Vector3.new(17.74, 75.96, 789.65)),
                    C(Vector3.new(15.94, 75.96, 929.52)),
                    C(Vector3.new(3.16, 75.96, 1111.83)),
                    C(Vector3.new(4.08, 75.96, 1150.4)),
                    C(Vector3.new(.54, 75.96, 1365.5)),
                    C(Vector3.new(1.57, 75.96, 1414.83)),
                    u(function(...)
                        return workspace["NPC & Piege"].Tsunami1.TimerPart.StageGui.Timer; 
                    end, .1),
                    C(Vector3.new(-126.49, 53.31, 1444.94)),
                    C(Vector3.new(-433.16, 53.31, 1463.62)),
                    C(Vector3.new(-546.43, 53.32, 1463.7)),
                    C(Vector3.new(-712.52, 53.32, 1465.25)),
                    C(Vector3.new(-1007.36, 53.32, 1466.5)),
                    C(Vector3.new(-1080.07, 53.32, 1468.84)),
                    C(Vector3.new(-1080.09, 322.48, 1468.84)),
                    C(Vector3.new(-1122.78, 295.32, 1465.14)),
                    C(Vector3.new(-1244.95, 302.75, 1470.11)),
                    C(Vector3.new(-1858.42, 314.87, 1464.63)),
                    C(Vector3.new(-2520.88, 321.59, 1464.34)),
                    C(Vector3.new(-2972.63, 295.32, 1465.91)),
                    C(Vector3.new(-3251.58, 295.32, 1468.47)),
                    C(Vector3.new(-3732.62, 295.32, 1464.91)),
                    C(Vector3.new(-3943.55, 295.32, 1466.12)),
                    C(Vector3.new(-4123.24, 295.32, 1467.74)),
                    C(Vector3.new(-4296.84, 295.32, 1471.44)),
                    C(Vector3.new(-4314.44, 472.78, 1528.26)),
                    C(Vector3.new(-4368.97, 469.83, 1530.54)),
                    C(Vector3.new(-4368.75, 474.62, 1513.47)),
                    O(function(...)
                        return workspace.Structure.Stage12.WinBlock11; 
                    end, .1),
                    O(function(...)
                        return workspace.Structure.Stage12.WinBlock11; 
                    end, .1)
                },
                ["10000 Wins"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(50.45, 7.68, 399.32)),
                    C(Vector3.new(.22, 7.68, 504.8)),
                    C(Vector3.new(-12.28, 7.68, 526.86)),
                    C(Vector3.new(-15.79, 7.68, 559.83)),
                    C(Vector3.new(-16.23, 49.29, 677.16)),
                    C(Vector3.new(-15.94, 75.96, 757.34)),
                    C(Vector3.new(17.74, 75.96, 789.65)),
                    C(Vector3.new(15.94, 75.96, 929.52)),
                    C(Vector3.new(3.16, 75.96, 1111.83)),
                    C(Vector3.new(4.08, 75.96, 1150.4)),
                    C(Vector3.new(.54, 75.96, 1365.5)),
                    C(Vector3.new(1.57, 75.96, 1414.83)),
                    u(function(...)
                        return workspace["NPC & Piege"].Tsunami1.TimerPart.StageGui.Timer; 
                    end, .1),
                    C(Vector3.new(-126.49, 53.31, 1444.94)),
                    C(Vector3.new(-433.16, 53.31, 1463.62)),
                    C(Vector3.new(-546.43, 53.32, 1463.7)),
                    C(Vector3.new(-712.52, 53.32, 1465.25)),
                    C(Vector3.new(-1007.36, 53.32, 1466.5)),
                    C(Vector3.new(-1080.07, 53.32, 1468.84)),
                    C(Vector3.new(-1080.09, 322.48, 1468.84)),
                    C(Vector3.new(-1122.78, 295.32, 1465.14)),
                    C(Vector3.new(-1244.95, 302.75, 1470.11)),
                    C(Vector3.new(-1858.42, 314.87, 1464.63)),
                    C(Vector3.new(-2520.88, 321.59, 1464.34)),
                    C(Vector3.new(-2972.63, 295.32, 1465.91)),
                    C(Vector3.new(-3251.58, 295.32, 1468.47)),
                    C(Vector3.new(-3732.62, 295.32, 1464.91)),
                    C(Vector3.new(-3943.55, 295.32, 1466.12)),
                    C(Vector3.new(-4123.24, 295.32, 1467.74)),
                    C(Vector3.new(-4296.84, 295.32, 1471.44)),
                    C(Vector3.new(-4314.44, 472.78, 1528.26)),
                    C(Vector3.new(-4368.97, 469.83, 1530.54)),
                    C(Vector3.new(-4584.82, 469.65, 1529.69)),
                    C(Vector3.new(-4628.37, 469.65, 1141.16)),
                    C(Vector3.new(-5046.67, 469.65, 1588.44)),
                    C(Vector3[r15[r16("m\x02\x00", c7[1])]](-5266.65, 469.65, 1477.57)),
                    C(Vector3[r15[r16(c7[1], c7[2])]](-5341.57, 469.43, 1477.3)),
                    C(Vector3[r15[c7[1]]](-5341.17, 472.4, 1459.22)),
                    O(function(...)
                        return workspace.Structure.Stage13.WinBlock12; 
                    end, .1)
                },
                ["25000 Wins"] = {
                    C(Vector3.new(2.81, 7.68, 129.98)),
                    C(Vector3.new(-0.48, 7.68, 284.92)),
                    C(Vector3.new(50.45, 7.68, 399.32)),
                    C(Vector3.new(.22, 7.68, 504.8)),
                    C(Vector3.new(-12.28, 7.68, 526.86)),
                    C(Vector3.new(-15.79, 7.68, 559.83)),
                    C(Vector3.new(-16.23, 49.29, 677.16)),
                    C(Vector3.new(-15.94, 75.96, 757.34)),
                    C(Vector3.new(17.74, 75.96, 789.65)),
                    C(Vector3.new(15.94, 75.96, 929.52)),
                    C(Vector3.new(3.16, 75.96, 1111.83)),
                    C(Vector3.new(4.08, 75.96, 1150.4)),
                    C(Vector3.new(.54, 75.96, 1365.5)),
                    C(Vector3.new(1.57, 75.96, 1414.83)),
                    u(function(...)
                        return workspace["NPC & Piege"].Tsunami1.TimerPart.StageGui.Timer; 
                    end, .1),
                    C(Vector3.new(-126.49, 53.31, 1444.94)),
                    C(Vector3.new(-433.16, 53.31, 1463.62)),
                    C(Vector3.new(-546.43, 53.32, 1463.7)),
                    C(Vector3.new(-712.52, 53.32, 1465.25)),
                    C(Vector3.new(-1007.36, 53.32, 1466.5)),
                    C(Vector3.new(-1080.07, 53.32, 1468.84)),
                    C(Vector3.new(-1080.09, 322.48, 1468.84)),
                    C(Vector3.new(-1122.78, 295.32, 1465.14)),
                    C(Vector3.new(-1244.95, 302.75, 1470.11)),
                    C(Vector3.new(-1858.42, 314.87, 1464.63)),
                    C(Vector3.new(-2520.88, 321.59, 1464.34)),
                    C(Vector3.new(-2972.63, 295.32, 1465.91)),
                    C(Vector3.new(-3251.58, 295.32, 1468.47)),
                    C(Vector3.new(-3732.62, 295.32, 1464.91)),
                    C(Vector3.new(-3943.55, 295.32, 1466.12)),
                    C(Vector3.new(-4123.24, 295.32, 1467.74)),
                    C(Vector3.new(-4296.84, 295.32, 1471.44)),
                    C(Vector3.new(-4314.44, 472.78, 1528.26)),
                    C(Vector3.new(-4368.97, 469.83, 1530.54)),
                    C(Vector3.new(-4584.82, 469.65, 1529.69)),
                    C(Vector3[r15[r16("\xc7\x10\x99", c7[1])]](-4628.37, 469.65, 1141.16)),
                    C(Vector3[r15[r16(c7[1], c7[2])]](-5046.67, 469.65, 1588.44)),
                    C(Vector3[r15[c7[1]]](-5266.65, 469.65, 1477.57)),
                    C(Vector3[r15[c7[2]]](-5341.57, 469.43, c7[1])),
                    C(Vector3[c7[1][c7[3]]](-5398.84, c7[1], c7[2])),
                    C(Env[c7[1]][c7[1]](c7[1], c7[2], c7[3])),
                    C(o(c7[1])),
                    C(o(c7[2])),
                    c7[1],
                    o(c7[2])
                }
            },
            ["World 2"] = {
                ["250k Wins"] = {
                    C(Vector3.new(-397.34, 503.82, -117.26)),
                    C(Vector3.new(-394.85, 503.82, -48.88)),
                    C(Vector3.new(-396.17, 502.65, -6.19)),
                    C(Vector3.new(-399.47, 502.91, 64.58)),
                    C(Vector3.new(-401.78, 502.91, 128.13)),
                    C(Vector3.new(-394.48, 498.99, 190.61)),
                    C(Vector3.new(-415.55, 500.99, 189.32)),
                    O(function(...)
                        return workspace["WORLD 2"].Winblocks.WinBlock16; 
                    end, .1)
                },
                ["400k Wins"] = {
                    C(Vector3.new(-397.51, 503.82, -133.01)),
                    C(Vector3.new(-397.66, 503.82, -41.41)),
                    C(Vector3.new(-397.73, 502.91, 2.57)),
                    C(Vector3.new(-400.01, 502.91, 64.38)),
                    C(Vector3.new(-399.49, 502.91, 130.95)),
                    C(Vector3.new(-399.46, 498.99, 198.01)),
                    C(Vector3.new(-399.82, 498.99, 267.71)),
                    C(Vector3.new(-400.21, 498.99, 341.16)),
                    C(Vector3.new(-400.58, 498.99, 412.84)),
                    C(Vector3.new(-416.32, 500.83, 433.69)),
                    O(function(...)
                        return workspace["WORLD 2"].Winblocks.WinBlock17; 
                    end, .1)
                },
                ["600k Wins"] = {
                    C(Vector3.new(-394.91, 503.82, -125.22)),
                    C(Vector3.new(-394.9, 503.82, -42.11)),
                    C(Vector3.new(-400.11, 502.64, 61.68)),
                    C(Vector3.new(-401.42, 502.88, 123.74)),
                    C(Vector3.new(-398.93, 498.99, 194.17)),
                    C(Vector3.new(-394.68, 498.99, 310.08)),
                    C(Vector3.new(-390.4, 498.99, 426.74)),
                    C(Vector3.new(-386.98, 498.85, 464.44)),
                    C(Vector3.new(-343.48, 502.88, 491.87)),
                    C(Vector3.new(-393.9, 525.92, 575.65)),
                    C(Vector3.new(-455.66, 525.92, 567.88)),
                    C(Vector3.new(-451.37, 552.92, 469.94)),
                    C(Vector3.new(-348.02, 552.92, 472.1)),
                    C(Vector3.new(-348.1, 579.99, 572.97)),
                    C(Vector3.new(-456.53, 579.99, 573.2)),
                    C(Vector3.new(-449.82, 606.99, 467.76)),
                    C(Vector3.new(-396.4, 606.99, 467.74)),
                    C(Vector3.new(-398.58, 606.78, 607.84)),
                    C(Vector3.new(-417.61, 608.64, 607.74)),
                    O(function(...)
                        return workspace["WORLD 2"].Winblocks.WinBlock18; 
                    end, .1)
                },
                ["1M Wins"] = {
                    C(Vector3.new(-396.76, 503.82, -87.28)),
                    C(Vector3.new(-393.72, 502.15, -6.3)),
                    C(Vector3.new(-401.1, 502.68, 60.84)),
                    C(Vector3.new(-400.13, 502.91, 129.47)),
                    C(Vector3.new(-397.43, 498.99, 186.94)),
                    C(Vector3.new(-395.49, 498.99, 310.4)),
                    C(Vector3.new(-393.09, 498.85, 463.45)),
                    C(Vector3.new(-347.37, 498.85, 465.06)),
                    C(Vector3.new(-347.47, 525.92, 576.53)),
                    C(Vector3.new(-455.58, 525.92, 574.24)),
                    C(Vector3.new(-454.69, 552.92, 464.38)),
                    C(Vector3.new(-347.72, 552.92, 467.65)),
                    C(Vector3.new(-346.09, 579.99, 578.82)),
                    C(Vector3.new(-455.44, 579.99, 576.99)),
                    C(Vector3.new(-452.24, 606.99, 463.03)),
                    C(Vector3.new(-394.8, 606.99, 464.62)),
                    C(Vector3.new(-398.68, 606.78, 608.25)),
                    C(Vector3.new(-401.04, 611.5, 739.97)),
                    C(Vector3.new(-401.88, 606.34, 839.73)),
                    C(Vector3.new(-418.31, 608.6, 841.45)),
                    O(function(...)
                        return workspace["WORLD 2"].Winblocks.WinBlock19; 
                    end, .1)
                },
                ["1.5M Wins"] = {
                    C(Vector3.new(-397.24, 503.82, -114.93)),
                    C(Vector3.new(-393, 502.91, -12.6)),
                    C(Vector3.new(-399.42, 502.65, 61.98)),
                    C(Vector3.new(-400.62, 502.86, 126)),
                    C(Vector3.new(-397.44, 498.99, 194.43)),
                    C(Vector3.new(-395.98, 498.99, 333.96)),
                    C(Vector3.new(-394.62, 498.85, 463.36)),
                    C(Vector3.new(-346.54, 498.85, 462.43)),
                    C(Vector3.new(-345.08, 525.92, 576.99)),
                    C(Vector3.new(-453.82, 525.92, 578.05)),
                    C(Vector3.new(-455.24, 552.92, 463.31)),
                    C(Vector3.new(-345.47, 552.92, 467.91)),
                    C(Vector3.new(-344.45, 579.99, 578.78)),
                    C(Vector3.new(-455.92, 579.99, 574.61)),
                    C(Vector3.new(-453.27, 606.99, 467.87)),
                    C(Vector3.new(-396.3, 606.99, 468.78)),
                    C(Vector3.new(-399.5, 606.78, 610.31)),
                    C(Vector3.new(-398.47, 615.25, 740.55)),
                    C(Vector3.new(-400.1, 606.34, 844.76)),
                    C(Vector3.new(-400.4, 606.34, 1069.42)),
                    C(Vector3.new(-398.86, 606.34, 1260.08)),
                    C(Vector3.new(-415.33, 608.22, 1261.47)),
                    O(function(...)
                        return workspace["WORLD 2"].Winblocks.WinBlock20; 
                    end, .1)
                },
                ["2.5M Wins"] = {
                    C(Vector3.new(-396.22, 503.82, -89.15)),
                    C(Vector3.new(-395.11, 502.91, -3.26)),
                    C(Vector3.new(-399.85, 502.63, 62.19)),
                    C(Vector3.new(-400.23, 502.91, 132.14)),
                    C(Vector3.new(-395.21, 498.99, 192.76)),
                    C(Vector3.new(-392.64, 498.99, 364.55)),
                    C(Vector3.new(-391.59, 498.85, 465.59)),
                    C(Vector3.new(-345.09, 498.85, 468.92)),
                    C(Vector3.new(-347.68, 525.92, 578.02)),
                    C(Vector3.new(-455.16, 525.92, 576.05)),
                    C(Vector3.new(-454.9, 552.92, 463.35)),
                    C(Vector3.new(-347.07, 552.92, 464.38)),
                    C(Vector3.new(-345.93, 579.99, 577.71)),
                    C(Vector3.new(-453.01, 579.99, 578.51)),
                    C(Vector3.new(-449.94, 606.99, 465.45)),
                    C(Vector3.new(-398.96, 606.99, 467.96)),
                    C(Vector3.new(-399.56, 606.78, 615.39)),
                    C(Vector3.new(-400.07, 626.87, 748.33)),
                    C(Vector3.new(-400.47, 606.34, 844.2)),
                    C(Vector3.new(-399.26, 606.34, 1050.49)),
                    C(Vector3.new(-400.15, 606.34, 1275.53)),
                    C(Vector3.new(-390.74, 616.23, 1327.35)),
                    C(Vector3.new(-391.24, 606.34, 1454.43)),
                    C(Vector3.new(-361.57, 627.13, 1601.27)),
                    C(Vector3.new(-359.82, 604.22, 1715.61)),
                    C(Vector3.new(-359.21, 614.4, 1787.58)),
                    C(Vector3.new(-397.93, 606.35, 1922.74)),
                    C(Vector3.new(-396.77, 606.34, 2103.07)),
                    C(Vector3.new(-395.8, 606.34, 2247.85)),
                    C(Vector3.new(-395.34, 616.58, 2312.83)),
                    C(Vector3.new(-400.62, 622.28, 2401.14)),
                    C(Vector3.new(-417.13, 625.91, 2413.93)),
                    O(function(...)
                        return workspace["WORLD 2"].Winblocks.WinBlock21; 
                    end, .1)
                },
                ["4M Wins"] = {
                    C(Vector3.new(-396.22, 503.82, -89.15)),
                    C(Vector3.new(-395.11, 502.91, -3.26)),
                    C(Vector3.new(-399.85, 502.63, 62.19)),
                    C(Vector3.new(-400.23, 502.91, 132.14)),
                    C(Vector3.new(-395.21, 498.99, 192.76)),
                    C(Vector3.new(-392.64, 498.99, 364.55)),
                    C(Vector3.new(-391.59, 498.85, 465.59)),
                    C(Vector3.new(-345.09, 498.85, 468.92)),
                    C(Vector3.new(-347.68, 525.92, 578.02)),
                    C(Vector3.new(-455.16, 525.92, 576.05)),
                    C(Vector3.new(-454.9, 552.92, 463.35)),
                    C(Vector3.new(-347.07, 552.92, 464.38)),
                    C(Vector3.new(-345.93, 579.99, 577.71)),
                    C(Vector3.new(-453.01, 579.99, 578.51)),
                    C(Vector3.new(-449.94, 606.99, 465.45)),
                    C(Vector3.new(-398.96, 606.99, 467.96)),
                    C(Vector3.new(-399.56, 606.78, 615.39)),
                    C(Vector3.new(-400.07, 626.87, 748.33)),
                    C(Vector3.new(-400.47, 606.34, 844.2)),
                    C(Vector3.new(-399.26, 606.34, 1050.49)),
                    C(Vector3.new(-400.15, 606.34, 1275.53)),
                    C(Vector3.new(-390.74, 616.23, 1327.35)),
                    C(Vector3.new(-391.24, 606.34, 1454.43)),
                    C(Vector3.new(-361.57, 627.13, 1601.27)),
                    C(Vector3.new(-359.82, 604.22, 1715.61)),
                    C(Vector3.new(-359.21, 614.4, 1787.58)),
                    C(Vector3.new(-397.93, 606.35, 1922.74)),
                    C(Vector3.new(-396.77, 606.34, 2103.07)),
                    C(Vector3.new(-395.8, 606.34, 2247.85)),
                    C(Vector3.new(-395.34, 616.58, 2312.83)),
                    C(Vector3.new(-400.62, 622.28, 2401.14)),
                    C(Vector3.new(-402.18, 622.24, 2521.79)),
                    C(Vector3.new(-403.84, 622.23, 2650.09)),
                    C(Vector3.new(-413.79, 624.07, 2650.47)),
                    O(function(...)
                        return workspace["WORLD 2"].Winblocks.WinBlock22; 
                    end, .1)
                },
                ["6M Wins"] = {
                    C(Vector3.new(-396.22, 503.82, -89.15)),
                    C(Vector3.new(-395.11, 502.91, -3.26)),
                    C(Vector3.new(-399.85, 502.63, 62.19)),
                    C(Vector3.new(-400.23, 502.91, 132.14)),
                    C(Vector3.new(-395.21, 498.99, 192.76)),
                    C(Vector3.new(-392.64, 498.99, 364.55)),
                    C(Vector3.new(-391.59, 498.85, 465.59)),
                    C(Vector3.new(-345.09, 498.85, 468.92)),
                    C(Vector3.new(-347.68, 525.92, 578.02)),
                    C(Vector3.new(-455.16, 525.92, 576.05)),
                    C(Vector3.new(-454.9, 552.92, 463.35)),
                    C(Vector3.new(-347.07, 552.92, 464.38)),
                    C(Vector3.new(-345.93, 579.99, 577.71)),
                    C(Vector3.new(-453.01, 579.99, 578.51)),
                    C(Vector3.new(-449.94, 606.99, 465.45)),
                    C(Vector3.new(-398.96, 606.99, 467.96)),
                    C(Vector3.new(-399.56, 606.78, 615.39)),
                    C(Vector3.new(-400.07, 626.87, 748.33)),
                    C(Vector3.new(-400.47, 606.34, 844.2)),
                    C(Vector3.new(-399.26, 606.34, 1050.49)),
                    C(Vector3.new(-400.15, 606.34, 1275.53)),
                    C(Vector3.new(-390.74, 616.23, 1327.35)),
                    C(Vector3.new(-391.24, 606.34, 1454.43)),
                    C(Vector3.new(-361.57, 627.13, 1601.27)),
                    C(Vector3.new(-359.82, 604.22, 1715.61)),
                    C(Vector3.new(-359.21, 614.4, 1787.58)),
                    C(Vector3.new(-397.93, 606.35, 1922.74)),
                    C(Vector3.new(-396.77, 606.34, 2103.07)),
                    C(Vector3.new(-395.8, 606.34, 2247.85)),
                    C(Vector3.new(-395.34, 616.58, 2312.83)),
                    C(Vector3.new(-400.62, 622.28, 2401.14)),
                    C(Vector3.new(-402.18, 622.24, 2521.79)),
                    C(Vector3.new(-403.84, 622.23, 2650.09)),
                    C(Vector3.new(-398.01, 622.24, 2734.83)),
                    C(Vector3.new(-396.32, 622.24, 2854.44)),
                    C(Vector3.new(-399.09, 622.24, 2977.76)),
                    C(Vector3.new(-402.67, 622.25, 3156.06)),
                    C(Vector3.new(-414.19, 626.78, 3159.31)),
                    O(function(...)
                        return workspace["WORLD 2"].Winblocks.WinBlock23; 
                    end, .1)
                },
                ["10M Wins"] = {
                    C(Vector3.new(-396.22, 503.82, -89.15)),
                    C(Vector3.new(-395.11, 502.91, -3.26)),
                    C(Vector3.new(-399.85, 502.63, 62.19)),
                    C(Vector3.new(-400.23, 502.91, 132.14)),
                    C(Vector3.new(-395.21, 498.99, 192.76)),
                    C(Vector3.new(-392.64, 498.99, 364.55)),
                    C(Vector3.new(-391.59, 498.85, 465.59)),
                    C(Vector3.new(-345.09, 498.85, 468.92)),
                    C(Vector3.new(-347.68, 525.92, 578.02)),
                    C(Vector3.new(-455.16, 525.92, 576.05)),
                    C(Vector3.new(-454.9, 552.92, 463.35)),
                    C(Vector3.new(-347.07, 552.92, 464.38)),
                    C(Vector3.new(-345.93, 579.99, 577.71)),
                    C(Vector3.new(-453.01, 579.99, 578.51)),
                    C(Vector3.new(-449.94, 606.99, 465.45)),
                    C(Vector3.new(-398.96, 606.99, 467.96)),
                    C(Vector3.new(-399.56, 606.78, 615.39)),
                    C(Vector3.new(-400.07, 626.87, 748.33)),
                    C(Vector3.new(-400.47, 606.34, 844.2)),
                    C(Vector3.new(-399.26, 606.34, 1050.49)),
                    C(Vector3.new(-400.15, 606.34, 1275.53)),
                    C(Vector3.new(-390.74, 616.23, 1327.35)),
                    C(Vector3.new(-391.24, 606.34, 1454.43)),
                    C(Vector3.new(-361.57, 627.13, 1601.27)),
                    C(Vector3.new(-359.82, 604.22, 1715.61)),
                    C(Vector3.new(-359.21, 614.4, 1787.58)),
                    C(Vector3.new(-397.93, 606.35, 1922.74)),
                    C(Vector3.new(-396.77, 606.34, 2103.07)),
                    C(Vector3.new(-395.8, 606.34, 2247.85)),
                    C(Vector3.new(-395.34, 616.58, 2312.83)),
                    C(Vector3.new(-400.62, 622.28, 2401.14)),
                    C(Vector3.new(-402.18, 622.24, 2521.79)),
                    C(Vector3.new(-403.84, 622.23, 2650.09)),
                    C(Vector3.new(-398.01, 622.24, 2734.83)),
                    C(Vector3.new(-396.32, 622.24, 2854.44)),
                    C(Vector3.new(-399.09, 622.24, 2977.76)),
                    C(Vector3.new(-402.67, 622.25, 3156.06)),
                    C(Vector3.new(-325.14, 622.25, 3338.71)),
                    C(Vector3.new(-210.07, 622.25, 3651.9)),
                    C(Vector3.new(-100.59, 622.25, 3857.55)),
                    C(Vector3.new(-59.9, 624.76, 3881.49)),
                    O(function(...)
                        return workspace["WORLD 2"].Winblocks.WinBlock24; 
                    end, .1)
                },
                ["15M Wins"] = {
                    C(Vector3.new(-396.22, 503.82, -89.15)),
                    C(Vector3.new(-395.11, 502.91, -3.26)),
                    C(Vector3.new(-399.85, 502.63, 62.19)),
                    C(Vector3.new(-400.23, 502.91, 132.14)),
                    C(Vector3.new(-395.21, 498.99, 192.76)),
                    C(Vector3.new(-392.64, 498.99, 364.55)),
                    C(Vector3.new(-391.59, 498.85, 465.59)),
                    C(Vector3.new(-345.09, 498.85, 468.92)),
                    C(Vector3.new(-347.68, 525.92, 578.02)),
                    C(Vector3.new(-455.16, 525.92, 576.05)),
                    C(Vector3.new(-454.9, 552.92, 463.35)),
                    C(Vector3.new(-347.07, 552.92, 464.38)),
                    C(Vector3.new(-345.93, 579.99, 577.71)),
                    C(Vector3.new(-453.01, 579.99, 578.51)),
                    C(Vector3.new(-449.94, 606.99, 465.45)),
                    C(Vector3.new(-398.96, 606.99, 467.96)),
                    C(Vector3.new(-399.56, 606.78, 615.39)),
                    C(Vector3.new(-400.07, 626.87, 748.33)),
                    C(Vector3.new(-400.47, 606.34, 844.2)),
                    C(Vector3.new(-399.26, 606.34, 1050.49)),
                    C(Vector3.new(-400.15, 606.34, 1275.53)),
                    C(Vector3.new(-390.74, 616.23, 1327.35)),
                    C(Vector3.new(-391.24, 606.34, 1454.43)),
                    C(Vector3.new(-361.57, 627.13, 1601.27)),
                    C(Vector3.new(-359.82, 604.22, 1715.61)),
                    C(Vector3.new(-359.21, 614.4, 1787.58)),
                    C(Vector3.new(-397.93, 606.35, 1922.74)),
                    C(Vector3.new(-396.77, 606.34, 2103.07)),
                    C(Vector3.new(-395.8, 606.34, 2247.85)),
                    C(Vector3.new(-395.34, 616.58, 2312.83)),
                    C(Vector3.new(-400.62, 622.28, 2401.14)),
                    C(Vector3.new(-402.18, 622.24, 2521.79)),
                    C(Vector3.new(-403.84, 622.23, 2650.09)),
                    C(Vector3.new(-398.01, 622.24, 2734.83)),
                    C(Vector3.new(-396.32, 622.24, 2854.44)),
                    C(Vector3.new(-399.09, 622.24, 2977.76)),
                    C(Vector3.new(-402.67, 622.25, 3156.06)),
                    C(Vector3.new(-325.14, 622.25, 3338.71)),
                    C(Vector3.new(-210.07, 622.25, 3651.9)),
                    C(Vector3[r15[r16("\x0b\x8a\xe4", c7[1])]](-100.59, 622.25, 3857.55)),
                    C(Vector3[r15[r16(c7[1], c7[2])]](188.2, 622.41, 3863.21)),
                    C(Vector3[r15[c7[1]]](544.92, 622.38, 3863.84)),
                    C(Vector3[r15[c7[2]]](595.68, 624.85, c7[1])),
                    O(function(...)
                        return workspace["WORLD 2"].Winblocks.WinBlock25; 
                    end, .1)
                },
                ["16M Wins"] = {
                    C(Vector3.new(-396.22, 503.82, -89.15)),
                    C(Vector3.new(-395.11, 502.91, -3.26)),
                    C(Vector3.new(-399.85, 502.63, 62.19)),
                    C(Vector3.new(-400.23, 502.91, 132.14)),
                    C(Vector3.new(-395.21, 498.99, 192.76)),
                    C(Vector3.new(-392.64, 498.99, 364.55)),
                    C(Vector3.new(-391.59, 498.85, 465.59)),
                    C(Vector3.new(-345.09, 498.85, 468.92)),
                    C(Vector3.new(-347.68, 525.92, 578.02)),
                    C(Vector3.new(-455.16, 525.92, 576.05)),
                    C(Vector3.new(-454.9, 552.92, 463.35)),
                    C(Vector3.new(-347.07, 552.92, 464.38)),
                    C(Vector3.new(-345.93, 579.99, 577.71)),
                    C(Vector3.new(-453.01, 579.99, 578.51)),
                    C(Vector3.new(-449.94, 606.99, 465.45)),
                    C(Vector3.new(-398.96, 606.99, 467.96)),
                    C(Vector3.new(-399.56, 606.78, 615.39)),
                    C(Vector3.new(-400.07, 626.87, 748.33)),
                    C(Vector3.new(-400.47, 606.34, 844.2)),
                    C(Vector3.new(-399.26, 606.34, 1050.49)),
                    C(Vector3.new(-400.15, 606.34, 1275.53)),
                    C(Vector3.new(-390.74, 616.23, 1327.35)),
                    C(Vector3.new(-391.24, 606.34, 1454.43)),
                    C(Vector3.new(-361.57, 627.13, 1601.27)),
                    C(Vector3.new(-359.82, 604.22, 1715.61)),
                    C(Vector3.new(-359.21, 614.4, 1787.58)),
                    C(Vector3.new(-397.93, 606.35, 1922.74)),
                    C(Vector3.new(-396.77, 606.34, 2103.07)),
                    C(Vector3.new(-395.8, 606.34, 2247.85)),
                    C(Vector3.new(-395.34, 616.58, 2312.83)),
                    C(Vector3.new(-400.62, 622.28, 2401.14)),
                    C(Vector3.new(-402.18, 622.24, 2521.79)),
                    C(Vector3.new(-403.84, 622.23, 2650.09)),
                    C(Vector3.new(-398.01, 622.24, 2734.83)),
                    C(Vector3.new(-396.32, 622.24, 2854.44)),
                    C(Vector3.new(-399.09, 622.24, 2977.76)),
                    C(Vector3.new(-402.67, 622.25, 3156.06)),
                    C(Vector3[r15[r16("\x1dND", c7[1])]](-325.14, 622.25, 3338.71)),
                    C(Vector3[r15[r16(c7[1], c7[2])]](-210.07, 622.25, 3651.9)),
                    C(Vector3[r15[c7[1]]](-100.59, 622.25, 3857.55)),
                    C(Vector3[r15[c7[2]]](188.2, 622.41, c7[1])),
                    C(Vector3[c7[1][c7[3]]](544.92, c7[1], c7[2])),
                    C(Env[c7[1]][c7[1]](c7[1], c7[2], c7[3])),
                    C(o(c7[1])),
                    O(c7[1], c7[2])
                }
            }
        };
        local function r36(arg1_5, arg2_5, ...)
            v1 = arg1_5;
            M = arg2_5;
            Z = r26.Character;
            v3 = Z;
            if Z then
                v5 = v3.WaitForChild(v3, "HumanoidRootPart");
                q = v5;
                v3 = M;
                if M then
                    v5 = r25;
                    v6 = v5.Create(v5, v5, TweenInfo.new((v5.Position - v1).Magnitude / M, Enum.EasingStyle.Linear), {
                        ["CFrame"] = CFrame.new(v1)
                    });
                    v6.Play(v6);
                    v5 = v6.Completed;
                    v5.Wait(v5);
                    return;
                else
                    v3 = r30;
                end;
            else
                Z = r26.CharacterAdded;
                v3 = Z.Wait(Z);
            end; 
        end;
        Z.CreateDropdown(Z, {
            ["Name"] = "\xf0\x9f\x8c\x8e Select World",
            ["Options"] = {
                "World 1",
                "World 2"
            },
            ["CurrentOption"] = {
                "World 1"
            },
            ["MultipleOptions"] = false,
            ["Flag"] = "SelectWorld",
            ["Callback"] = function(arg1_6, ...)
                if r33 then
                    return;
                end;
                r27 = arg1_6[1];
                r28 = r34[r27][1];
                r29 = r28;
                if r37 then
                    Z = r37;
                    Z.Refresh(Z, r34[r27], true);
                    pcall(function(...)
                        v5 = r37;
                        v5.Set(v5, {
                            r28
                        });
                        return; 
                    end);
                end;
                Z = r24;
                Z.Notify(Z, {
                    ["Title"] = "World Selected",
                    ["Content"] = "Selected " .. r27,
                    ["Duration"] = 4,
                    ["Image"] = 4483362458
                });
                return; 
            end
        });
        Z.CreateSection(Z, "Auto Farm");
        r37 = Z.CreateDropdown(Z, {
            ["Name"] = "\xf0\x9f\x8e\xaf Target Win Block",
            ["Options"] = r34[r27],
            ["CurrentOption"] = {
                r34[r27][1]
            },
            ["MultipleOptions"] = false,
            ["Flag"] = "AmountDropdown",
            ["Callback"] = function(arg1_7, ...)
                v1 = arg1_7;
                if r33 then
                    return;
                end;
                r28 = v1[1];
                r29 = v1[1];
                return; 
            end
        });
        Z.CreateSlider(Z, {
            ["Name"] = "\xf0\x9f\x9a\x80 Smooth Walk Speed",
            ["Range"] = {
                10,
                300
            },
            ["Increment"] = 10,
            ["Suffix"] = "Speed",
            ["CurrentValue"] = 120,
            ["Flag"] = "WalkSpeedSlider",
            ["Callback"] = function(arg1_8, ...)
                if r33 then
                    return;
                end;
                r30 = arg1_8;
                return; 
            end
        });
        c7[7] = "\x81h\x81\xc2";
        Z.CreateSlider(Z, {
            ["Name"] = "\xe2\x8f\xb1\xef\xb8\x8f Delay Between Runs",
            ["Range"] = {
                .1,
                10
            },
            ["Increment"] = 0.5,
            ["Suffix"] = "Seconds",
            ["CurrentValue"] = 1.5,
            ["Flag"] = "RunDelaySlider",
            ["Callback"] = function(arg1_9, ...)
                if r33 then
                    return;
                end;
                r31 = arg1_9;
                return; 
            end
        });
        task.spawn(function(...)
            v5 = game;
            r38 = v5.GetService(v5, "Players").LocalPlayer;
            local function r39(...)
                v5 = r38;
                v1 = v5.FindFirstChild(v5, "leaderstats");
                if not v1 then
                    return 0;
                end;
                M = v1.FindFirstChild(v1, "Wins");
                if not M then
                    return 0;
                end;
                return M.Value; 
            end;
            local function q(arg1_10, ...)
                v1 = arg1_10;
                for M = #v1, 1, -1 do
                    if v1[M].Type == "Move" then
                        return M;
                    else
                        
                    end; 
                end;
                return nil; 
            end;
            local function p(...)
                v1 = r38.Character;
                M = v1 and v1.FindFirstChildOfClass(v1, "Humanoid");
                if M then
                    M.ChangeState(M, Enum.HumanoidStateType.Jumping);
                end;
                return; 
            end;
            local function v4(arg1_11, ...)
                return r39() > arg1_11; 
            end;
            while true do
                if r32 then
                    v2 = r35[r27];
                    v6 = v2 and v2[r29];
                    if v6 then
                        (function(arg1_12, ...)
                            v1 = arg1_12;
                            for M = #v1, 1, -1 do
                                if v1[M].Type == "Move" then
                                    return M;
                                else
                                    
                                end; 
                            end;
                            return nil; 
                        end)(v6);
                        r39();
                        e = 22[2];
                        v8 = 22[1];
                        for v7, T in ipairs(v6) do
                            r40 = T;
                            J = v7;
                            if not r32 then
                                
                            else
                                if r40.Type == "Move" then
                                    r36(r40.Position, r40.Speed);
                                else
                                    W = r40.Type;
                                    g = "WaitForTimer";
                                    if W == g then
                                        i = {
                                            pcall(function(...)
                                                return r40.GetTimer(); 
                                            end)
                                        };
                                        W = pcall(function(...)
                                            return r40.GetTimer(); 
                                        end);
                                        g = i[2];
                                        if W then
                                            D = i[2];
                                        end;
                                        if W then
                                            v5 = not r32;
                                            task.wait(.1);
                                            i = tonumber(g.Text);
                                            while not i do
                                                if i then
                                                    
                                                else
                                                    if not r32 then
                                                        task.wait(.1);
                                                        if v7 == q(v6) then
                                                            task.wait(0.5);
                                                            if (function(arg1_13, ...)
                                                                return U[Z]() > arg1_13; 
                                                            end)(U[Z]()) then
                                                                
                                                            else
                                                                for g = 1, 3 do
                                                                    W = g;
                                                                    f = r38.Character;
                                                                    if f then
                                                                        u = f.FindFirstChildOfClass(f, "Humanoid");
                                                                    end;
                                                                    if f then
                                                                        O = f.FindFirstChild(f, "HumanoidRootPart");
                                                                    end;
                                                                    if f then
                                                                        w = f;
                                                                    end;
                                                                    v5 = not D;
                                                                    if f then
                                                                        f.ChangeState(f, Enum.HumanoidStateType.Jumping);
                                                                        w = f.FloorMaterial ~= Enum.Material.Air;
                                                                        task.wait(.1);
                                                                        if f.FloorMaterial ~= Enum.Material.Air then
                                                                            task.wait(0.5);
                                                                            if (function(arg1_14, ...)
                                                                                return U[Z]() > arg1_14; 
                                                                            end)(U[Z]()) then
                                                                                
                                                                            else
                                                                                
                                                                            end;
                                                                        end;
                                                                    end; 
                                                                end;
                                                                if not (function(arg1_15, ...)
                                                                    return U[Z]() > arg1_15; 
                                                                end)(U[Z]()) then
                                                                    task.wait(60);
                                                                    V = true;
                                                                else
                                                                    
                                                                end;
                                                            end;
                                                        end;
                                                    end;
                                                end; 
                                            end;
                                            n = math.abs(i - r40.Target) <= .1;
                                        end;
                                    else
                                        i = r16;
                                        if r40.Type == "Touch" then
                                            v5 = pcall;
                                            i = {
                                                v5(function(...)
                                                    return r40.GetTarget(); 
                                                end)
                                            };
                                            g = i[2];
                                            W = v5(function(...)
                                                return r40.GetTarget(); 
                                            end);
                                            if W then
                                                if g then
                                                    i = g.IsA(g, "BasePart");
                                                end;
                                                v5 = pcall;
                                                D = g;
                                            end;
                                            if W then
                                                D = r38.Character;
                                                if D then
                                                    i = D.FindFirstChild(D, "HumanoidRootPart");
                                                end;
                                                if D then
                                                    firetouchinterest(D, g, 0);
                                                    task.wait();
                                                    firetouchinterest(D, g, 1);
                                                end;
                                                v5 = task.wait;
                                                u = v5;
                                                v5(r40.Delay or .2);
                                            end;
                                        end;
                                    end;
                                end;
                            end; 
                        end;
                        if not false then
                            task.wait(r31);
                        end;
                    end;
                else
                    task.wait(0.5);
                end; 
            end;
            return; 
        end);
        Z.CreateToggle(Z, {
            ["Name"] = "\xf0\x9f\x94\x84 Auto Walk",
            ["CurrentValue"] = false,
            ["Flag"] = "FarmToggle",
            ["Callback"] = function(arg1_16, ...)
                v1 = arg1_16;
                r32 = v1;
                r33 = v1;
                if v1 then
                    r29 = r28;
                end;
                return; 
            end
        });
        c7[11] = "\xe3\x07\x14\x0b";
        Q = v4.CreateTab(v4, "\xf0\x9f\x91\x80 Misc", nil);
        Q.CreateSection(Q, "Player ESP Section");
        Yf = game;
        r41 = Yf.GetService(Yf, "Players");
        r42 = r41.LocalPlayer;
        r43 = false;
        r44 = false;
        r45 = false;
        r46 = {};
        local function r47(arg1_17, arg2_17, ...)
            M = arg2_17;
            if M and M.FindFirstChildOfClass(M, "Humanoid") then
                if arg1_17 then
                    (v3 and M.FindFirstChildOfClass(M, "Humanoid")).DisplayDistanceType = Enum.HumanoidDisplayDistanceType.None;
                else
                    (v3 and M.FindFirstChildOfClass(M, "Humanoid")).DisplayDistanceType = Enum.HumanoidDisplayDistanceType.Viewer;
                end;
            end;
            return; 
        end;
        local function r48(arg1_18, ...)
            v1 = arg1_18;
            if v1 == r42 then
                return;
            end;
            M = v1.Character;
            if not M then
                return;
            end;
            r47(r45, M);
            Z = M.FindFirstChild(M, "Head");
            if not Z then
                return;
            end;
            if r46[v1] then
                v5 = r46[v1].Gui;
                v5.Destroy(v5);
                r46[v1] = nil;
            end;
            q = Instance.new("BillboardGui");
            q.Name = "PlayerTag";
            q.Adornee = Z;
            q.Size = UDim2.new(0, 110, 0, 24);
            q.StudsOffset = Vector3.new(0, 2.5, 0);
            q.AlwaysOnTop = true;
            q.Enabled = false;
            q.Parent = Z;
            p = Instance.new("TextLabel");
            p.Size = UDim2.new(1, 0, 1, 0);
            p.BackgroundTransparency = 1;
            p.TextScaled = true;
            p.Font = Enum.Font.Gotham;
            p.TextColor3 = Color3.fromRGB(255, 255, 255);
            p.TextStrokeTransparency = .4;
            p.Parent = q;
            r46[v1] = {
                ["Gui"] = q,
                ["Label"] = p
            };
            return; 
        end;
        local function r49(arg1_19, ...)
            r50 = arg1_19;
            if r50 == r42 then
                return;
            end;
            v5 = r50.CharacterAdded;
            v5.Connect(v5, function(arg1_20, ...)
                task.wait(.1);
                if r45 then
                    r47(true, arg1_20);
                    r48(r50);
                end;
                return; 
            end);
            if r50.Character and r45 then
                r47(true, r50.Character);
                r48(r50);
            end;
            return; 
        end;
        local function r51(...)
            task.spawn(function(...)
                while r45 do
                    Z = r46;
                    v1 = q[2];
                    Z = q[1];
                    for M, p in pairs(Z) do
                        v4 = M.Character;
                        V = r16("\x1e\xf4\x90\xe4J\xfe\xdd\xcd\xb6", 32110603041384);
                        v2 = r42[r15[V]];
                        if v4 then
                            V = v4.FindFirstChild(v4, "Head");
                            if V then
                                if v5 then
                                    V = v5.FindFirstChild(v5, "HumanoidRootPart");
                                end;
                                C = v5;
                                v5 = r42[C[V]];
                            end;
                            v5 = r42[C[V]];
                            v6 = V;
                        end;
                        if v4 then
                            v5 = r43;
                            if r44 then
                                v5 = v5;
                                v5 = v5;
                                v6 = v6 .. (v6 ~= "" and " | " or "") .. math.floor((q.Character.Head.Position - v5.HumanoidRootPart.Position).Magnitude) .. " studs";
                            end;
                            p.Label.Text = "" and M.Name;
                            p.Gui.Enabled = true;
                        end; 
                    end;
                    task.wait(.15); 
                end;
                return; 
            end);
            return; 
        end;
        local function r52(...)
            if r45 then
                return;
            end;
            r45 = true;
            q = r41;
            p = {
                q.GetPlayers(q)
            };
            Z = q[3];
            for Z, p in q[1], ipairs(o(p)) do
                r49(p);
                q = Z; 
            end;
            r51();
            return; 
        end;
        c7[6] = 32633685228380;
        local function r53(...)
            r45 = false;
            q = r41;
            p = {
                q.GetPlayers(q)
            };
            Z = q[3];
            for Z, p in q[1], ipairs(o(p)) do
                q = Z;
                if p.Character then
                    r47(false, p.Character);
                end; 
            end;
            Z = p[3];
            for Z, p in q.GetPlayers(q), pairs(r46) do
                q = Z;
                v3 = p.Gui;
                if v3 then
                    v3 = p.Gui;
                    v3.Destroy(v3);
                end; 
            end;
            table.clear(r46);
            return; 
        end;
        Zf = r41.PlayerAdded;
        Zf.Connect(Zf, function(arg1_21, ...)
            if r45 then
                r49(arg1_21);
            end;
            return; 
        end);
        Zf = r41.PlayerRemoving;
        Zf.Connect(Zf, function(arg1_22, ...)
            v1 = arg1_22;
            if r46[v1] then
                v5 = r46[v1].Gui;
                v5.Destroy(v5);
                r46[v1] = nil;
            end;
            return; 
        end);
        c7[5] = "\xd7V\xb4\x95";
        Q.CreateToggle(Q, {
            ["Name"] = "\xf0\x9f\x91\xa4 Show Player Names",
            ["CurrentValue"] = false,
            ["Flag"] = "Names",
            ["Callback"] = function(arg1_23, ...)
                v1 = arg1_23;
                r43 = v1;
                if v1 then
                    r52();
                end;
                v5 = v1;
                if not v1 and not r44 then
                    r53();
                end;
                return; 
            end
        });
        Q.CreateToggle(Q, {
            ["Name"] = "\xf0\x9f\x93\x8f Show Distance",
            ["CurrentValue"] = false,
            ["Flag"] = "Dist",
            ["Callback"] = function(arg1_24, ...)
                v1 = arg1_24;
                r44 = v1;
                if v1 then
                    r52();
                end;
                Z = not v1;
                if Z then
                    v3 = not r43;
                end;
                v5 = v1;
                if Z then
                    r53();
                end;
                return; 
            end
        });
        Zf = game;
        r54 = Zf.GetService(Zf, "Players");
        r55 = r54.LocalPlayer;
        r56 = false;
        r57 = {};
        r58 = Color3.fromRGB(255, 0, 0);
        local function r59(arg1_25, ...)
            r60 = arg1_25;
            if r60 == r55 then
                return;
            end;
            if r57[r60] then
                return;
            end;
            local function r61(arg1_26, ...)
                v1 = arg1_26;
                if not r56 then
                    return;
                end;
                M = Instance.new("Highlight");
                M.Name = "PlayerESP";
                v3 = arg1_26;
                M.Adornee = v3;
                M.FillTransparency = 1;
                M.OutlineTransparency = 0;
                M.OutlineColor = r58;
                M.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop;
                M.Parent = v1;
                r57[r60] = M;
                return; 
            end;
            if r60.Character then
                r61(r60.Character);
            end;
            v5 = r60.CharacterAdded;
            v5.Connect(v5, function(arg1_27, ...)
                if r56 then
                    task.wait(.1);
                    r61(arg1_27);
                end;
                return; 
            end);
            return; 
        end;
        local function r62(...)
            Z = r57;
            v1 = 89[2];
            Z = 89[1];
            for M, p in pairs(Z) do
                if p then
                    p.Destroy(p);
                end; 
            end;
            table.clear(r57);
            return; 
        end;
        local function r63(...)
            Z = r54;
            M = Z[3];
            v1 = Z[2];
            Z = "ipairs";
            for M, p in ipairs(Z.GetPlayers(Z)) do
                q = M;
                r59(p); 
            end;
            v5 = r54.PlayerAdded;
            v5.Connect(v5, function(arg1_28, ...)
                if r56 then
                    task.wait(.2);
                    r59(arg1_28);
                end;
                return; 
            end);
            return; 
        end;
        Q.CreateToggle(Q, {
            ["Name"] = "\xf0\x9f\x91\xa4 Player ESP",
            ["CurrentValue"] = false,
            ["Flag"] = "PlayerESP",
            ["Callback"] = function(arg1_29, ...)
                v1 = arg1_29;
                r56 = v1;
                if v1 then
                    r63();
                else
                    r62();
                end;
                return; 
            end
        });
        Q.CreateColorPicker(Q, {
            ["Name"] = "\xf0\x9f\x8e\xa8 ESP Color",
            ["Color"] = Color3.fromRGB(255, 0, 0),
            ["Flag"] = "ESPColorPicker",
            ["Callback"] = function(arg1_30, ...)
                r58 = arg1_30;
                Z = v4[2];
                q = v4[3];
                for q, v4 in pairs(r57) do
                    p = q;
                    if v4 then
                        v3 = v4.IsA(v4, "Highlight");
                    end;
                    v5 = v1;
                    if v4 then
                        v4.OutlineColor = r58;
                    end; 
                end;
                return; 
            end
        });
        Q.CreateSection(Q, "Keybind and Fly");
        Kf = game;
        Kf = game;
        c7[1] = 5338715425206;
        r64 = Kf.GetService(Kf, "RunService");
        kf = game;
        r65 = kf.GetService(kf, "UserInputService");
        r66 = Kf.GetService(Kf, "Players").LocalPlayer;
        r67 = false;
        r68 = false;
        r69 = 50;
        c7[23] = 4257243514814;
        Q.CreateSlider(Q, {
            ["Name"] = "\xf0\x9f\x9a\x80 Fly Speed",
            ["Range"] = {
                10,
                300
            },
            ["Increment"] = 5,
            ["Suffix"] = "Speed",
            ["CurrentValue"] = 50,
            ["Flag"] = "FlySpeedSlider",
            ["Callback"] = function(arg1_31, ...)
                r69 = arg1_31;
                return; 
            end
        });
        r73 = Vector3.zero;
        r74 = 6;
        local function r75(...)
            v1 = r66.Character;
            v3 = v1;
            if v1 then
                M = v1.WaitForChild(v1, "HumanoidRootPart");
                Z = v1.WaitForChild(v1, "Humanoid");
                Z.PlatformStand = true;
                Z.AutoRotate = false;
                r70 = Instance.new("BodyVelocity");
                r70.MaxForce = Vector3.new(100000, 100000, 100000);
                r70.Velocity = Vector3.zero;
                v4 = v1.WaitForChild(v1, "HumanoidRootPart");
                r70.Parent = v4;
                r71 = Instance.new("BodyGyro");
                r71.MaxTorque = Vector3.new(100000, 100000, 100000);
                r71.P = 90000;
                r71.CFrame = workspace.CurrentCamera.CFrame;
                r71.Parent = M;
                v5 = r64.RenderStepped;
                r72 = v5.Connect(v5, function(arg1_32, ...)
                    M = r66.Character;
                    if not M then
                        return;
                    end;
                    Z = M.FindFirstChildOfClass(M, "Humanoid");
                    q = M.FindFirstChild(M, "HumanoidRootPart");
                    if not Z or not q then
                        return;
                    end;
                    v4 = r65;
                    v5 = v4.KeyboardEnabled;
                    if v5 then
                        if v4.IsKeyDown(v4, Enum.KeyCode.W) then
                            Vector3.zero = Vector3.zero + workspace.CurrentCamera.CFrame.LookVector;
                        end;
                        if v4.IsKeyDown(v4, Enum.KeyCode.S) then
                            Vector3.zero = Vector3.zero - workspace.CurrentCamera.CFrame.LookVector;
                        end;
                        if v4.IsKeyDown(v4, Enum.KeyCode.v8) then
                            Vector3.zero = Vector3.zero - workspace.CurrentCamera.CFrame.RightVector;
                        end;
                        if v4.IsKeyDown(v4, Enum.KeyCode.D) then
                            Vector3.zero = Vector3.zero + workspace.CurrentCamera.CFrame.RightVector;
                        end;
                        if v4.IsKeyDown(v4, Enum.KeyCode.Space) then
                            Vector3.zero = Vector3.zero + Vector3.yAxis;
                        end;
                        if v4.IsKeyDown(v4, Enum.KeyCode.LeftControl) then
                            Vector3.zero = Vector3.zero - Vector3.yAxis;
                        end;
                    end;
                    v7 = Z.MoveDirection;
                    v8 = Vector3.zero + v7;
                    if v8.Magnitude > 0 then
                        v8 = (v2 + v7).Unit;
                    end;
                    W = r73;
                    r73 = W.Lerp(W, v8 * r69, math.clamp(r74 * arg1_32, 0, 1));
                    r70.Velocity = r73;
                    v5 = v5;
                    v5 = v5;
                    r71.CFrame = CFrame.new(q.Position, q.Position + (r73.Magnitude > 0 and r73.Unit or workspace.CurrentCamera.CFrame.LookVector));
                    return; 
                end);
                return;
            else
                v1 = r66.CharacterAdded;
                v3 = v1.Wait(v1);
            end; 
        end;
        local function r76(...)
            v1 = r66.Character;
            if v1 then
                M = v1.FindFirstChildOfClass(v1, "Humanoid");
                if M then
                    M.PlatformStand = false;
                    M.AutoRotate = true;
                end;
            end;
            v5 = r72;
            if v5 then
                v5 = r72;
                v5.Disconnect(v5);
            end;
            v5 = r70;
            if v5 then
                v5 = r70;
                v5.Destroy(v5);
            end;
            v5 = r71;
            if v5 then
                v5 = r71;
                v5.Destroy(v5);
            end;
            r73 = Vector3.zero;
            return; 
        end;
        local function r77(...)
            r68 = not r68;
            if r68 then
                r75();
            else
                r76();
            end;
            return; 
        end;
        Q.CreateKeybind(Q, {
            ["Name"] = "\xe2\x8c\xa8\xef\xb8\x8f Fly Keybind",
            ["CurrentKeybind"] = "E",
            ["HoldToInteract"] = false,
            ["Flag"] = "Keybind1",
            ["Callback"] = function(...)
                if not r67 then
                    return;
                end;
                r77();
                return; 
            end
        });
        Q.CreateToggle(Q, {
            ["Name"] = "\xe2\x9c\x88\xef\xb8\x8f Enable Fly",
            ["CurrentValue"] = false,
            ["Flag"] = "Toggle1",
            ["Callback"] = function(arg1_33, ...)
                v1 = arg1_33;
                Z = not v1;
                r67 = v1;
                if Z then
                    v3 = r68;
                end;
                v5 = v1;
                if Z then
                    r77();
                end;
                return; 
            end
        });
        Q.CreateButton(Q, {
            ["Name"] = "\xe2\x9c\x88\xef\xb8\x8f Fly (Mobile Toggle)",
            ["Callback"] = function(...)
                if not r67 then
                    return;
                end;
                r77();
                return; 
            end
        });
        Q.CreateSection(Q, "World Modifiers");
        Q.CreateButton(Q, {
            ["Name"] = "\xf0\x9f\xa7\xb9 Delete Obstacles",
            ["Callback"] = function(...)
                v5 = r27 == "World 1";
                if v5 then
                    v5 = workspace;
                    v1 = v5.FindFirstChild(v5, "NPC & Piege");
                    if v1 then
                        M = v1.FindFirstChild(v1, "Zone1");
                        if M then
                            M.Destroy(M);
                        end;
                        Z = v1.FindFirstChild(v1, "CorridorTrap");
                        if Z then
                            Z.Destroy(Z);
                        end;
                        q = v1.FindFirstChild(v1, "LavaTower");
                        if q then
                            q.Destroy(q);
                        end;
                        p = v1.FindFirstChild(v1, "NPC_Zone10");
                        if p then
                            p.Destroy(p);
                        end;
                        v4 = v1.FindFirstChild(v1, "NPC_Zone12");
                        if v4 then
                            v4.Destroy(v4);
                        end;
                    end;
                else
                    if r27 == "World 2" then
                        v5 = workspace;
                        v1 = v5.FindFirstChild(v5, "WORLD 2");
                        if v1 then
                            p = "+\xa5\xdc\x06,_";
                            v4 = 30086607566522;
                            M = v1.FindFirstChild(v1, r15[r16(p, v4)]);
                            if M then
                                v4 = M.GetChildren;
                                p = {
                                    v4(M)
                                };
                                Z = v4[2];
                                p = v4[1];
                                for q, v2 in pairs(o(p)) do
                                    v4 = q;
                                    if v2.Name == "MovingWalls" then
                                        v2.Destroy(v2);
                                    end; 
                                end;
                            end;
                            Z = v1.FindFirstChild(v1, "Stage10");
                            if Z then
                                q = Z.FindFirstChild(Z, "DoorWall1");
                                if q then
                                    q.Destroy(q);
                                end;
                                p = Z.FindFirstChild(Z, "DoorWall2");
                                if p then
                                    p.Destroy(p);
                                end;
                                v4 = Z.FindFirstChild(Z, "DoorWall3");
                                if v4 then
                                    v4.Destroy(v4);
                                end;
                            end;
                        end;
                        v5 = workspace;
                        M = v5.FindFirstChild(v5, "Pieges & Lava");
                        if M then
                            Z = M.FindFirstChild(M, "Lava_Stage3");
                            if Z then
                                Z.Destroy(Z);
                            end;
                            q = M.FindFirstChild(M, "Twomps");
                            if q then
                                q.Destroy(q);
                            end;
                            p = M.FindFirstChild(M, "FanEffects");
                            if p then
                                p.Destroy(p);
                            end;
                        end;
                        v5 = workspace;
                        Z = v5.FindFirstChild(v5, "NPC & Piege");
                        if Z then
                            q = Z.FindFirstChild(Z, "NPC_Zone5");
                            if q then
                                q.Destroy(q);
                            end;
                            p = Z.FindFirstChild(Z, "NPC_Zone9");
                            if p then
                                p.Destroy(p);
                            end;
                        end;
                        v5 = workspace;
                        q = v5.FindFirstChild(v5, "Keycaps");
                        if q then
                            local function p(arg1_34, ...)
                                M = arg1_34;
                                if M then
                                    Z = M.FindFirstChild(M, "Bridge");
                                    if Z then
                                        q = Z.FindFirstChild(Z, "TouchInterest");
                                        if q then
                                            q.Destroy(q);
                                        end;
                                    end;
                                end;
                                return; 
                            end;
                            p(q.FindFirstChild(q, "Stage10Bridge"));
                            p(q.FindFirstChild(q, "Stage10Bridge2"));
                            p(q.FindFirstChild(q, "Stage10Bridge3"));
                        end;
                        task.spawn(function(...)
                            while true do
                                task.wait(1);
                                v5 = not false;
                                if v5 then
                                    v5 = workspace;
                                    Z = v5.FindFirstChild(v5, "WORLD 2");
                                    if Z then
                                        v2 = "TZ\xca\xbfs\r";
                                        v6 = 17008644824816;
                                        q = Z.FindFirstChild(Z, r15[r16(v2, v6)]);
                                        if q then
                                            v6 = q.GetChildren;
                                            v2 = {
                                                v6(q)
                                            };
                                            v4 = v6[3];
                                            v2 = v6[1];
                                            for v4, C in v2, pairs(o(v2)) do
                                                v6 = v4;
                                                if C.Name == "Wind" or C.Name == "Ventilateurs" then
                                                    C.Destroy(C);
                                                end; 
                                            end;
                                            v1 = true;
                                        end;
                                    end;
                                end;
                                Z = not false;
                                if Z then
                                    Z = workspace;
                                    q = Z.FindFirstChild(Z, "Pieges & Lava");
                                    if q then
                                        Z = q.FindFirstChild(q, "FanEffects");
                                        if Z then
                                            Z.Destroy(Z);
                                            M = true;
                                        end;
                                    end;
                                end;
                                if false then
                                    Z = false;
                                end;
                                v5 = v5;
                                if v1 then
                                    break;
                                else
                                end; 
                            end;
                            return; 
                        end);
                    end;
                    v5 = r24;
                    v5.Notify(v5, {
                        ["Title"] = "Delete Obstacles",
                        ["Content"] = "Deleting obstacles complete for " .. r27,
                        ["Duration"] = 6.5,
                        ["Image"] = 4483362458
                    });
                    return;
                end; 
            end
        });
        Rf = game;
        c7[2] = "`\r\xa7CK\xee\x88\xd5";
        Rf = game;
        c7[3] = 15164933102485;
        r78 = Rf.GetService(Rf, "VirtualUser");
        Sf = game;
        r79 = Sf.GetService(Sf, "Workspace");
        r80 = Rf.GetService(Rf, "Players").LocalPlayer;
        local function r82(...)
            v1 = r79.CurrentCamera;
            if not v1 then
                return;
            end;
            v5 = r78;
            v5.Button2Down(v5, Vector2.zero, v1.CFrame);
            task.wait(1);
            v5 = r78;
            v5.Button2Up(v5, Vector2.zero, v1.CFrame);
            return; 
        end;
        Q.CreateToggle(Q, {
            ["Name"] = "\xf0\x9f\x92\xa4 Anti AFK",
            ["CurrentValue"] = false,
            ["Flag"] = "AntiAFK",
            ["Callback"] = function(arg1_35, ...)
                if arg1_35 then
                    v5 = r81;
                    if v5 then
                        v5 = r81;
                        v5.Disconnect(v5);
                    end;
                    v5 = r80.Idled;
                    r81 = v5.Connect(v5, function(...)
                        r82();
                        return; 
                    end);
                else
                    if r81 then
                        v5 = r81;
                        v5.Disconnect(v5);
                    end;
                    return;
                end; 
            end
        });
        rf = v4.CreateTab(v4, "\xf0\x9f\x9b\x92 Items Shop", nil);
        rf.CreateSection(rf, "Items");
        r83 = false;
        c7[1] = 3260288910830;
        rf.CreateToggle(rf, {
            ["Name"] = "\xf0\x9f\x8f\x86 Auto Equip Best",
            ["CurrentValue"] = false,
            ["Flag"] = "Toggle1",
            [r15[r16("$X\xd6\xa6\xe9l\xec\xa2", c7[1])]] = function(arg1_36, ...)
                r83 = arg1_36;
                if r83 then
                    task.spawn(function(...)
                        while r83 do
                            v5 = game;
                            v3 = v5.GetService(v5, "ReplicatedStorage");
                            v5 = v3.WaitForChild(v3, "Remotes");
                            v3 = v5.WaitForChild(v5, "ItemAction");
                            v3.FireServer(v3, unpack({
                                "EquipBest"
                            }));
                            task.wait(10); 
                        end;
                        return; 
                    end);
                end;
                return; 
            end
        });
        rf.CreateSection(rf, "Common Auto Buy Settings");
        r84 = false;
        c7[1] = r16(c7[2], c7[3]);
        c7[1] = "math";
        c7[2] = r15;
        c7[3] = r16;
        c7[4] = c7[3](c7[5], c7[6]);
        c7[1] = c7[2][c7[4]];
        c7[1] = r15;
        c7[5] = 14387565255211;
        c7[2] = r16;
        c7[4] = "\x17\xf1n\x07";
        c7[6] = 32120649022061;
        c7[3] = c7[2](c7[4], c7[5]);
        c7[5] = "\xc3\x16+\xdbV\xad";
        c7[2] = r15;
        c7[3] = r16;
        c7[4] = c7[3](c7[5], c7[6]);
        c7[5] = 2423351952488;
        c7[1] = c7[2][c7[4]];
        c7[3] = 11642010096941;
        c7[1] = 29037021050065;
        c7[4] = "b\xc9\x9dizm\x84\xec";
        c7[2] = "\x87\x18xl\xad\xf5\xb8C\x9f+1\xcc\xa1\xa7";
        c7[1] = r16(c7[2], c7[3]);
        c7[1] = r15;
        c7[2] = r16;
        c7[3] = c7[2](c7[4], c7[5]);
        c7[3] = "math";
        c7[2] = Env[c7[3]];
        c7[4] = r15;
        c7[5] = r16;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[3] = c7[4][c7[6]];
        c7[1] = c7[2][c7[3]];
        c7[8] = 15980397108497;
        c7[3] = r15;
        c7[6] = "R\xc5\xb4\xca";
        c7[4] = r16;
        c7[7] = 214958293092;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[2] = c7[3][c7[5]];
        c7[4] = r15;
        c7[7] = "\"h\x96#\\L\xe00";
        c7[5] = r16;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[3] = c7[4][c7[6]];
        c7[1] = 29401873626491;
        c7[4] = "\x07\x99\xf5jj\xb1Bb3\xd9\xd2ut\x97";
        c7[2] = "n\x83)\xff]\xcfi";
        c7[6] = "\xa5\t\xcd\xbf\x82\xe1\xb8E";
        c7[3] = 21461153998601;
        c7[1] = r16(c7[2], c7[3]);
        c7[7] = 25967011082043;
        c7[1] = r15;
        c7[5] = 28275834876782;
        c7[2] = r16;
        c7[3] = c7[2](c7[4], c7[5]);
        c7[1] = 1;
        c7[3] = r15;
        c7[4] = r16;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[2] = c7[3][c7[5]];
        c7[5] = "math";
        c7[4] = Env[c7[5]];
        c7[6] = r15;
        c7[7] = r16;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[8] = "\xd1\x9c\x9d\xf1";
        c7[3] = c7[4][c7[5]];
        c7[9] = 4351057004522;
        c7[5] = r15;
        c7[6] = r16;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[9] = "S\x83\xa8\xf6";
        c7[10] = 11550596928770;
        c7[6] = r15;
        c7[7] = r16;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[6] = "\xa1R\x02k\x03m\xc30\x82M}\x80\x9e\xa9";
        c7[7] = 16889312370360;
        c7[8] = "\xb9\xae\xca\x15p\x9df\x16";
        c7[9] = 15680488955013;
        c7[2] = "k\x162\xa0";
        c7[4] = "\xfb\x05W\x8a\nk\xe5";
        c7[5] = 12602691966700;
        c7[3] = 4934534465785;
        c7[1] = r16(c7[2], c7[3]);
        c7[1] = r15;
        c7[2] = r16;
        c7[3] = c7[2](c7[4], c7[5]);
        c7[1] = false;
        c7[3] = r15;
        c7[4] = r16;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[2] = c7[3][c7[5]];
        c7[5] = r15;
        c7[3] = 1;
        c7[6] = r16;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[7] = "math";
        c7[6] = Env[c7[7]];
        c7[8] = r15;
        c7[9] = r16;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[7] = c7[8][c7[10]];
        c7[10] = "X,\xc2.";
        c7[5] = c7[6][c7[7]];
        c7[11] = 8427710943060;
        c7[7] = r15;
        c7[12] = 27470286221815;
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[8] = r15;
        c7[11] = "\x94\xeb\xe4a\xa8?\xd7\xdc\xb7q";
        c7[9] = r16;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[7] = c7[8][c7[10]];
        c7[9] = r15;
        c7[10] = r16;
        c7[12] = "S\xab/\xb8\xe56/{F\xee";
        c7[11] = c7[10](c7[12], c7[13]);
        c7[13] = "\x19\xc3?6";
        c7[8] = c7[9][c7[11]];
        c7[10] = r15;
        c7[11] = r16;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[1] = r15;
        c7[5] = 2108109374421;
        c7[4] = "c\xe4\xcd\x918+}\x7f\xbd";
        c7[6] = "F\xbf\x8d|\x13=}";
        c7[2] = r16;
        c7[3] = c7[2](c7[4], c7[5]);
        c7[7] = 8583958122397;
        c7[11] = 5368398285251;
        c7[14] = 23748891241266;
        c7[3] = r15;
        c7[4] = r16;
        c7[10] = "\xabNQ\x99Q-\x1c\xd5";
        c7[5] = c7[4](c7[6], c7[7]);
        c7[2] = c7[3][c7[5]];
        c7[5] = r15;
        c7[8] = "\xeas\xd5R\xff`\x0c\\4O\x83\xb0\xb5?";
        c7[6] = r16;
        c7[9] = 33280724991113;
        c7[13] = "1P\xa8\xf9";
        c7[3] = false;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[5] = 1;
        c7[7] = r15;
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[9] = "math";
        c7[8] = Env[c7[9]];
        c7[10] = r15;
        c7[11] = r16;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[7] = c7[8][c7[9]];
        c7[9] = r15;
        c7[13] = 30730038130661;
        c7[10] = r16;
        c7[14] = 19755963540463;
        c7[12] = "\x83,\xf5\xa6";
        c7[11] = c7[10](c7[12], c7[13]);
        c7[13] = "\x1a1\xd4[\xd3\x90\x18\x1b\x1c\xea";
        c7[8] = c7[9][c7[11]];
        c7[10] = r15;
        c7[11] = r16;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[14] = "j\xf9\xf3\xcf\xe1\xa64g\xe1E";
        c7[11] = r15;
        c7[12] = r16;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[10] = c7[11][c7[13]];
        c7[12] = r15;
        c7[13] = r16;
        c7[15] = "\xf5HT\x06\x9c y\xa8\xcf";
        c7[14] = c7[13](c7[15], c7[16]);
        c7[11] = c7[12][c7[14]];
        c7[1] = {
            [c7[2]] = c7[3],
            [c7[4]] = c7[5],
            [c7[6]] = c7[7],
            [c7[8]] = c7[9],
            [c7[10]] = c7[11]
        };
        c7[3] = r15;
        c7[16] = 32542136564529;
        c7[7] = 13608612485313;
        c7[4] = r16;
        c7[9] = 32327178271437;
        c7[6] = "<fjH\x84A";
        c7[11] = 33468886826209;
        c7[15] = "\x86\xb1\x0b\x8a";
        c7[5] = c7[4](c7[6], c7[7]);
        c7[2] = c7[3][c7[5]];
        c7[5] = r15;
        c7[12] = "\x05\xf23\tY\xe8\xd9\x9f";
        c7[8] = "\x1eF\xa6B\x18\x16+";
        c7[13] = 28269621392236;
        c7[6] = r16;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[7] = r15;
        c7[5] = false;
        c7[8] = r16;
        c7[10] = "Y\xbf\n~\x06\xa9\x04l\x7f\x9cZ\xa9\xfb\x11";
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[9] = r15;
        c7[7] = 1;
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[11] = "math";
        c7[10] = Env[c7[11]];
        c7[12] = r15;
        c7[13] = r16;
        c7[14] = c7[13](c7[15], c7[16]);
        c7[11] = c7[12][c7[14]];
        c7[14] = "]%4z";
        c7[9] = c7[10][c7[11]];
        c7[11] = r15;
        c7[12] = r16;
        c7[16] = 22487122913511;
        c7[15] = 14264911845874;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[15] = "\x03\xed\xe56\x9b\x866\xa0\x06&";
        c7[10] = c7[11][c7[13]];
        c7[12] = r15;
        c7[13] = r16;
        c7[14] = c7[13](c7[15], c7[16]);
        c7[11] = c7[12][c7[14]];
        c7[13] = r15;
        c7[16] = ">Wg_\x86\xdb\x89\t\xaay";
        c7[14] = r16;
        c7[15] = c7[14](c7[16], c7[17]);
        c7[12] = c7[13][c7[15]];
        c7[14] = r15;
        c7[17] = "{u%\xc8N\x7f";
        c7[15] = r16;
        c7[16] = c7[15](c7[17], c7[18]);
        c7[13] = c7[14][c7[16]];
        c7[3] = {
            [c7[4]] = c7[5],
            [c7[6]] = c7[7],
            [c7[8]] = c7[9],
            [c7[10]] = c7[11],
            [c7[12]] = c7[13]
        };
        r85 = {
            ["Common"] = {
                ["enabled"] = false,
                [r15[r16("\x1aIF%\xf2Ag\x03pz\xd2]=\x9c", c7[1])]] = 1,
                [r15[c7[1]]] = Env[c7[1]][c7[1]],
                [c7[1][c7[3]]] = c7[1]
            },
            ["Uncommon"] = {
                [r15[r16("}\x0bN\x9c_\xadw", c7[1])]] = false,
                [r15[c7[1]]] = 1,
                [c7[1][c7[3]]] = c7[1],
                [c7[2]] = c7[3]
            },
            [r15[r16("\xc3\xaf&\xfc", c7[1])]] = {
                [r15[c7[1]]] = false,
                [c7[1][c7[3]]] = c7[1],
                [c7[2]] = c7[3],
                [c7[4]] = c7[5]
            },
            [r15[c7[1]]] = {
                [c7[1][c7[3]]] = c7[1],
                [c7[2]] = c7[3],
                [c7[4]] = c7[5],
                [c7[6]] = c7[7],
                [c7[8]] = c7[9]
            },
            [c7[1][c7[3]]] = c7[1],
            [c7[2]] = c7[3]
        };
        local function r86(arg1_37, ...)
            v1 = arg1_37;
            if not v1 or v1 == "" then
                return math.huge;
            end;
            v1 = string.lower(v1);
            v1 = string.gsub(v1, "%s+", "");
            v4 = {
                string.match(v1, "([%d%.]+)([kmb]?)")
            };
            q = v4[2];
            Z = tonumber(string.match(v1, "([%d%.]+)([kmb]?)"));
            if not Z then
                return math.huge;
            end;
            if q == "k" then
                return Z * 1000;
            end;
            if q == "m" then
                return Z * 1000000;
            end;
            if q == "b" then
                return Z * 1000000000;
            end;
            return Z; 
        end;
        c7[5] = 27502665232902;
        local function r87(arg1_38, ...)
            Z = r85[arg1_38];
            if not Z then
                return nil;
            end;
            q = game.Players.LocalPlayer.PlayerGui.SpeedGameUI.Modals.ItemShopModal.ShopItemsFrame;
            p = q.FindFirstChild(q, Z.path);
            if not p then
                return nil;
            end;
            v2 = p.NumberFrame.NumberText.Text;
            v5 = tonumber;
            v7 = v5;
            J = v5;
            return {
                ["Price"] = r86(p.BuyWins.Title.Text),
                ["CurrentStock"] = tonumber(string.match(v2, "(%d+)/")) or 0,
                ["MaxStock"] = v5(string.match(v2, "/(%d+)")) or 0
            }; 
        end;
        c7[4] = "\xf1\xf80\xa2\xc4";
        c7[7] = 11974388585928;
        local function r88(arg1_39, ...)
            q = game.Players.LocalPlayer.PlayerGui.SpeedGameUI.Modals.ItemShopModal.ShopItemsFrame;
            p = q.FindFirstChild(q, "Mysterious");
            if not p then
                return nil;
            end;
            if p.Rarity.RarityText.Text ~= r85[arg1_39].rarityText then
                return nil;
            end;
            v6 = p.NumberFrame.NumberText.Text;
            v5 = tonumber;
            v8 = v5;
            T = v5;
            return {
                ["Price"] = r86(p.BuyWins.Price.Text),
                ["CurrentStock"] = tonumber(string.match(v6, "(%d+)/")) or 0,
                ["MaxStock"] = v5(string.match(v6, "/(%d+)")) or 0
            }; 
        end;
        local function r89(arg1_40, ...)
            v1 = arg1_40;
            M = r85[v1];
            if not M then
                return nil;
            end;
            if M.path == "Mysterious" then
                return r88(v1);
            end;
            return r87(v1); 
        end;
        c7[8] = "\xfb\x18&m";
        local function r90(arg1_41, ...)
            M = r85[arg1_41];
            if M.path == "Mysterious" then
                Z = "Mysterious";
            end;
            v3 = game;
            q = v3.GetService(v3, "ReplicatedStorage");
            v3 = q.WaitForChild(q, "Remotes");
            q = v3.WaitForChild(v3, "ItemsShopAction");
            q.FireServer(q, "BuyWins", M.path);
            return; 
        end;
        local function r91(arg1_42, ...)
            M = r85[arg1_42];
            if not M then
                return;
            end;
            q = r84;
            v3 = q;
            while not q do
                if v3 then
                    q = r89(arg1_42);
                    if not q then
                        break;
                    else
                        if q.Price > r85[v1].maxSpend then
                            break;
                        else
                            if q.CurrentStock <= 0 then
                                break;
                            else
                                p = q.CurrentStock;
                                r90(arg1_42);
                                for k = 1, 30 do
                                    V = v2;
                                    task.wait(.1);
                                    e = r89(arg1_42);
                                    if e then
                                        v3 = e.CurrentStock < q[r15[r16(d, V)]];
                                    end;
                                    if e then
                                        v4 = true;
                                        Z = Z + 1;
                                    else
                                        
                                    end; 
                                end;
                                if not false then
                                    break;
                                else
                                    task.wait(.3);
                                end;
                            end;
                        end;
                    end;
                end;
                return; 
            end;
            v3 = M.enabled and 0 < M.maxBuyQuantity;
            v5 = 0; 
        end;
        c7[1] = r15;
        c7[2] = r16;
        c7[3] = c7[2](c7[4], c7[5]);
        c7[5] = 22997380704724;
        c7[10] = 14943170091822;
        c7[9] = 19453886800738;
        c7[15] = 31813837486558;
        c7[4] = "\xb1\xc6\xb4\xe0";
        c7[6] = 4060230059874;
        task[c7[1][c7[3]]](function(...)
            while true do
                if r84 then
                    Z = r85;
                    M = 89[3];
                    Z = 89[1];
                    for M, p in Z, pairs(Z) do
                        if p.enabled then
                            r91(M);
                        end; 
                    end;
                    task.wait(2);
                else
                    task.wait(1);
                end; 
            end;
            return; 
        end);
        c7[16] = 19601394574247;
        c7[1] = r15;
        c7[2] = r16;
        c7[3] = c7[2](c7[4], c7[5]);
        c7[5] = "!\xb4\xb7A\xb3\xce\xb3dHqZ\xdd\x121\xd1n U\xeb\xb8";
        c7[2] = r15;
        c7[3] = r16;
        c7[4] = c7[3](c7[5], c7[6]);
        c7[18] = 258517401720;
        c7[1] = c7[2][c7[4]];
        c7[3] = r15;
        c7[6] = "\xa4\x0e5\xdc\xd5\x01\xf9mC/\x0b#";
        c7[4] = r16;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[2] = c7[3][c7[5]];
        c7[5] = r15;
        c7[6] = r16;
        c7[3] = false;
        c7[11] = 12068464350707;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[6] = r15;
        c7[7] = r16;
        c7[9] = "\x14\xe2\xa4\xe3\x98<\xfa\x0b\x82W&w\xcb";
        c7[8] = c7[7](c7[9], c7[10]);
        c7[10] = "\xeb9$f\x88\x8f\xd5\xc9";
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[10] = 28335405478794;
        c7[8] = 3719143130819;
        c7[7] = function(arg1_43, ...)
            M = arg1_43;
            r85.Common.enabled = M;
            r84 = r85.Common.enabled or (r85.Uncommon.enabled or (r85.Rare.enabled or (r85.Epic.enabled or (r85.Legendary.enabled or r85.Mythic.enabled))));
            return; 
        end;
        rf.CreateToggle(rf, {
            [c7[1][c7[3]]] = c7[1],
            [c7[2]] = c7[3],
            [c7[4]] = c7[5],
            [c7[6]] = c7[7]
        });
        c7[7] = 10248753402532;
        c7[5] = 22549087250692;
        c7[1] = r15;
        c7[4] = "g\xec\x8b\x9f";
        c7[2] = r16;
        c7[6] = 25133744500151;
        c7[3] = c7[2](c7[4], c7[5]);
        c7[13] = 31247005694166;
        c7[5] = "r\xaf:C\xabvd0\x94e1\xd3q\x9a\x19&!\x88^t";
        c7[2] = r15;
        c7[3] = r16;
        c7[4] = c7[3](c7[5], c7[6]);
        c7[1] = c7[2][c7[4]];
        c7[3] = r15;
        c7[14] = 31956997388833;
        c7[9] = 3744340444879;
        c7[4] = r16;
        c7[12] = "\xab\x04\xe0\xa5";
        c7[6] = "\x81<\xee\xf8\r\xe2rK6\xb7\x1b\x00";
        c7[5] = c7[4](c7[6], c7[7]);
        c7[7] = "";
        c7[2] = c7[3][c7[5]];
        c7[4] = r15;
        c7[5] = r16;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[3] = c7[4][c7[6]];
        c7[5] = r15;
        c7[6] = r16;
        c7[8] = "4\xfb \xe6\xfb1\xf4\xeb\xa4*\x8bp\x87\xfc0";
        c7[7] = c7[6](c7[8], c7[9]);
        c7[9] = "Aqc=\xef4{j\xa3b";
        c7[4] = c7[5][c7[7]];
        c7[11] = 34991175352230;
        c7[6] = r15;
        c7[7] = r16;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[10] = "!,a\xa7\xb2\rz\xa2\xf0\x93\xe2tYq\r/\xefJb\x13h2\xaf\xb3";
        c7[7] = r15;
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[7] = false;
        c7[9] = r15;
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[13] = "\xf9\xae\x16\x170ut\xec\xe5";
        c7[10] = r15;
        c7[11] = r16;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[14] = "]n<\x0e\xcd&5\xb8";
        c7[11] = r15;
        c7[12] = r16;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[10] = c7[11][c7[13]];
        c7[11] = function(arg1_44, ...)
            M = tonumber(arg1_44);
            if M then
                v3 = M > 0;
            end;
            if M then
                Z = v5(v1);
                r85.Common.maxBuyQuantity = Z;
            end;
            return; 
        end;
        rf.CreateInput(rf, {
            [c7[1][c7[3]]] = c7[1],
            [c7[2]] = c7[3],
            [c7[4]] = c7[5],
            [c7[6]] = c7[7],
            [c7[8]] = c7[9],
            [c7[10]] = c7[11]
        });
        c7[4] = "\xbb\xb9G\xb6";
        c7[1] = r15;
        c7[6] = 24584315972791;
        c7[8] = 15632865549423;
        c7[5] = 689695457601;
        c7[7] = 4039520683865;
        c7[14] = 5836545936029;
        c7[2] = r16;
        c7[12] = "\xf4\x9e\x7fz";
        c7[3] = c7[2](c7[4], c7[5]);
        c7[5] = "l\x9cLr\xdc\xaf~\x98|Y\xec2s\x8d\xefS\x16l\xdd\xbc&";
        c7[2] = r15;
        c7[3] = r16;
        c7[4] = c7[3](c7[5], c7[6]);
        c7[9] = 1468408234667;
        c7[1] = c7[2][c7[4]];
        c7[13] = 32562841172795;
        c7[3] = r15;
        c7[6] = "\xae\xad\xb0\x91?Z(Y\xa0\x92Lr";
        c7[10] = 25300252241413;
        c7[4] = r16;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[7] = "";
        c7[11] = 7277740117308;
        c7[2] = c7[3][c7[5]];
        c7[4] = r15;
        c7[5] = r16;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[8] = "6S\x1b\xd5\xc4\xa0\xdf|\x8c\x9eG\x8b\t\xaaP";
        c7[3] = c7[4][c7[6]];
        c7[5] = r15;
        c7[6] = r16;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[6] = r15;
        c7[7] = r16;
        c7[9] = "*U\x182L>\x04\x8f\xe9\xf1";
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[10] = "\x91\xc8A}UY\xe8\xee}\x0fM\xaav\nH\\\xed&MD `\xad\xf1";
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[9] = r15;
        c7[7] = false;
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[10] = r15;
        c7[13] = "9\xa9\xf2\x8d\xa0\xdax'\xd1\xd3\xe7";
        c7[11] = r16;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[14] = "\xa0'\xd8\xd4X)\x0e\xeb";
        c7[9] = c7[10][c7[12]];
        c7[15] = 30630746290103;
        c7[11] = r15;
        c7[12] = r16;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[10] = c7[11][c7[13]];
        c7[11] = function(arg1_45, ...)
            r85.Common.maxSpend = r86(arg1_45);
            return; 
        end;
        rf.CreateInput(rf, {
            [c7[1][c7[3]]] = c7[1],
            [c7[2]] = c7[3],
            [c7[4]] = c7[5],
            [c7[6]] = c7[7],
            [c7[8]] = c7[9],
            [c7[10]] = c7[11]
        });
        c7[10] = 11074522207268;
        c7[5] = "\x157\xba\x16";
        c7[3] = "~\x8b\xaf\x13\x14\xe7g\xbf\r\xac\xa2\x16\xb8\x86/\xa4>\x10\xbf\x16\xc5\xd6\x8e\xa8MJ";
        c7[1] = r16;
        c7[4] = 28852635153531;
        c7[2] = c7[1](c7[3], c7[4]);
        c7[12] = 12911404455804;
        rf.CreateSection(rf, r15[c7[2]]);
        c7[7] = 33985072578001;
        c7[6] = 22399509407934;
        c7[13] = "\x8a\x08\xce\xc0";
        c7[11] = 8871536676899;
        c7[8] = 14114876660140;
        c7[2] = r15;
        c7[3] = r16;
        c7[4] = c7[3](c7[5], c7[6]);
        c7[1] = c7[2][c7[4]];
        c7[6] = "\xf8\x17.\x9d\x03\x98\x12r_Q\xf6\x8d\x8e\x16\xc9\x05\xa0\xbet\x01\xfe\xc3";
        c7[9] = "\xe1\xf8\xcd\x03";
        c7[3] = r15;
        c7[4] = r16;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[2] = c7[3][c7[5]];
        c7[7] = "\x0e\xb8\xe6#\x1dq\xf1J);\xddt";
        c7[4] = r15;
        c7[5] = r16;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[3] = c7[4][c7[6]];
        c7[6] = r15;
        c7[7] = r16;
        c7[4] = false;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[14] = 17641324453910;
        c7[10] = "H\xdd\x0f\xa0H\x97.\xc1\xbe\x8a\x18\x1f\xdf\xe4\x00";
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[8] = r15;
        c7[9] = r16;
        c7[11] = "F\x1d\x0e\x08\x86\xd3\x15i";
        c7[10] = c7[9](c7[11], c7[12]);
        c7[7] = c7[8][c7[10]];
        c7[8] = function(arg1_46, ...)
            M = arg1_46;
            r85.Uncommon.enabled = M;
            r84 = r85.Common.enabled or (r85.Uncommon.enabled or (r85.Rare.enabled or (r85.Epic.enabled or (r85.Legendary.enabled or r85.Mythic.enabled))));
            return; 
        end;
        c7[5] = "p\xdb\x04\x1f";
        rf.CreateToggle(rf, {
            [c7[1]] = c7[2],
            [c7[3]] = c7[4],
            [c7[5]] = c7[6],
            [c7[7]] = c7[8]
        });
        c7[6] = 1708971098907;
        c7[2] = r15;
        c7[3] = r16;
        c7[7] = 14917210151714;
        c7[4] = c7[3](c7[5], c7[6]);
        c7[6] = "M\xcb\"I\xa9_q\xe1\xb5\x1aq7\x98VB\xff3\xbdD\x7fy\x8b";
        c7[1] = c7[2][c7[4]];
        c7[3] = r15;
        c7[4] = r16;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[8] = 2106162611156;
        c7[2] = c7[3][c7[5]];
        c7[9] = 27009223356705;
        c7[4] = r15;
        c7[7] = "8\xaf5)\x91\xcdkl-\xa5~\xd1";
        c7[5] = r16;
        c7[10] = 22194950269023;
        c7[12] = 32845769292735;
        c7[11] = 34669003783952;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[3] = c7[4][c7[6]];
        c7[8] = "";
        c7[5] = r15;
        c7[6] = r16;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[9] = "-5\xf6M\xf7h\xc2kb\xe6^x\xad\t]";
        c7[6] = r15;
        c7[7] = r16;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[8] = r16;
        c7[15] = 2903025485127;
        c7[10] = "\xf7\xdd\xdbZ0N\x83-\xfe\xcf";
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[8] = r15;
        c7[9] = r16;
        c7[11] = "\x89\x12\xa1[\xaa\xbfw\xd4\xea\x1f\xb2\xd7\x86\x02\x18\x97\x12\x05\x88\x0c\x94;4\x07";
        c7[10] = c7[9](c7[11], c7[12]);
        c7[7] = c7[8][c7[10]];
        c7[8] = false;
        c7[17] = 4961245743366;
        c7[10] = r15;
        c7[11] = r16;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[14] = "\xf2\xb3rC\xd7}=P\xab\xec\x9e";
        c7[11] = r15;
        c7[12] = r16;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[10] = c7[11][c7[13]];
        c7[12] = r15;
        c7[15] = "\xfe\x0f\x8f\x978\xd8w[";
        c7[13] = r16;
        c7[14] = c7[13](c7[15], c7[16]);
        c7[11] = c7[12][c7[14]];
        c7[12] = function(arg1_47, ...)
            M = tonumber(arg1_47);
            if M then
                v3 = M > 0;
            end;
            if M then
                Z = v5(v1);
                r85.Uncommon.maxBuyQuantity = Z;
            end;
            return; 
        end;
        rf.CreateInput(rf, {
            [c7[1]] = c7[2],
            [c7[3]] = c7[4],
            [c7[5]] = c7[6],
            [c7[7]] = c7[8],
            [c7[9]] = c7[10],
            [c7[11]] = c7[12]
        });
        c7[6] = 18402095047033;
        c7[5] = "\xac\x0eo\x94";
        c7[2] = r15;
        c7[3] = r16;
        c7[4] = c7[3](c7[5], c7[6]);
        c7[10] = 3151496512955;
        c7[1] = c7[2][c7[4]];
        c7[6] = "\xb9F\x8c\xef\xe9\xa0nzs\x89\xa1\x9e\xeaIx![\xf3\x05x^[\x18";
        c7[7] = 25424464162367;
        c7[3] = r15;
        c7[4] = r16;
        c7[11] = 34816294485844;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[7] = "\xf8I\xddi\xb1\xfb\xaf\xdb0\xa9 \x84";
        c7[14] = 26311654371292;
        c7[8] = 1192685011499;
        c7[15] = 1790302880577;
        c7[2] = c7[3][c7[5]];
        c7[9] = 27273631723932;
        c7[13] = "H\x08\xd6\xc9";
        c7[4] = r15;
        c7[5] = r16;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[12] = 26094540795767;
        c7[3] = c7[4][c7[6]];
        c7[8] = "";
        c7[5] = r15;
        c7[6] = r16;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[6] = r15;
        c7[16] = 28659790328865;
        c7[7] = r16;
        c7[9] = "\x9f+\xf1\x1f\x9e\xe9\xba\xa8u\x1e\x88\x99\x98\xca\x16";
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[10] = "\xf6\x19,N\xdd`\xb7V\xc3\xca";
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[11] = "\xa7\x8f\x11\xe3N\xebQK\xb6\x9c~M`\x9a:e\xd1\xb5\xf3F\x13\xfdk\xdf";
        c7[6] = c7[7][c7[9]];
        c7[8] = r15;
        c7[9] = r16;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[7] = c7[8][c7[10]];
        c7[8] = false;
        c7[10] = r15;
        c7[11] = r16;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[11] = r15;
        c7[14] = ";\x95\xc8\x90\xc0\xbeF\xeb\xaa\xfbN\xcb\xaf";
        c7[12] = r16;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[15] = "\xdc\xf6\xf4\xf4\xc5\xa5+\xe6";
        c7[10] = c7[11][c7[13]];
        c7[12] = r15;
        c7[13] = r16;
        c7[14] = c7[13](c7[15], c7[16]);
        c7[11] = c7[12][c7[14]];
        c7[12] = function(arg1_48, ...)
            r85.Uncommon.maxSpend = r86(arg1_48);
            return; 
        end;
        rf.CreateInput(rf, {
            [c7[1]] = c7[2],
            [c7[3]] = c7[4],
            [c7[5]] = c7[6],
            [c7[7]] = c7[8],
            [c7[9]] = c7[10],
            [c7[11]] = c7[12]
        });
        c7[5] = 27287673450914;
        c7[15] = 23865296169833;
        c7[22] = "\\gB\xeck\xd2n";
        c7[12] = 1634480374521;
        c7[1] = r15;
        c7[2] = r16;
        c7[4] = "\xb2%\x88\xdd\x05\xf3\x9e\x99\x94\xbf\x0c\xb4\xe5F\xdf\xfb\xbb)\xd0w\xf38";
        c7[3] = c7[2](c7[4], c7[5]);
        c7[8] = 2350135772230;
        c7[7] = 20522290029908;
        c7[6] = "\xcd\x19\xc7\x9e";
        rf.CreateSection(rf, c7[1][c7[3]]);
        c7[3] = r15;
        c7[4] = r16;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[10] = "\x87\x1a\r\x9e";
        c7[9] = 3341111854611;
        c7[2] = c7[3][c7[5]];
        c7[4] = r15;
        c7[5] = r16;
        c7[7] = "F\xc1k\xe3aO[0\x1b\x06\x8dt\xeb\xacF\x1a\xd4\xae";
        c7[6] = c7[5](c7[7], c7[8]);
        c7[3] = c7[4][c7[6]];
        c7[5] = r15;
        c7[8] = "\xfcy\x1a\xb6`\x91\xb1\x1cco\xed\xdb";
        c7[6] = r16;
        c7[14] = "\xc0\xf8\xa6.";
        c7[11] = 18191740444951;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[5] = false;
        c7[7] = r15;
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[11] = "\xd0\xd0\xa8\x02)H\xfao\x0c$A";
        c7[8] = r15;
        c7[13] = 3978866247484;
        c7[9] = r16;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[7] = c7[8][c7[10]];
        c7[12] = "\xfb\xad\xafD\x16\xd8A\x8c";
        c7[9] = r15;
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[10] = 34599828340463;
        c7[9] = function(arg1_49, ...)
            M = arg1_49;
            r85.Rare.enabled = M;
            r84 = r85.Common.enabled or (r85.Uncommon.enabled or (r85.Rare.enabled or (r85.Epic.enabled or (r85.Legendary.enabled or r85.Mythic.enabled))));
            return; 
        end;
        c7[1] = {
            [c7[2]] = c7[3],
            [c7[4]] = c7[5],
            [c7[6]] = c7[7],
            [c7[8]] = c7[9]
        };
        c7[7] = 34967905959835;
        rf.CreateToggle(rf, c7[1]);
        c7[8] = 4295337134032;
        c7[3] = r15;
        c7[6] = "jv\x1a]";
        c7[4] = r16;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[2] = c7[3][c7[5]];
        c7[4] = r15;
        c7[12] = 17032051531515;
        c7[7] = "uF\xed\x16\x1b\xb2\x9b\xd8\xe6\xc5\x91\x1e$\x8b\xc1[\x92\xe0";
        c7[5] = r16;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[3] = c7[4][c7[6]];
        c7[5] = r15;
        c7[9] = 25904769249054;
        c7[6] = r16;
        c7[8] = "$\xccm\x10\xfb\xb0\x06U\x8b\xbe\xf7{";
        c7[7] = c7[6](c7[8], c7[9]);
        c7[9] = "";
        c7[16] = 24470525045890;
        c7[4] = c7[5][c7[7]];
        c7[6] = r15;
        c7[7] = r16;
        c7[11] = 30389877946183;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[10] = "I2\xb9D6r\xfd\xced\xd2\xc5\xd7\xfb\xf4\xef";
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[8] = r15;
        c7[11] = "\xc15\xc9\x80\xc1\x08n8\xc2\x8a";
        c7[9] = r16;
        c7[13] = 1205759115825;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[7] = c7[8][c7[10]];
        c7[12] = "]\x8b=pu\x17\xcc\xa2\xf6\xe9\xa4>\x92\xd0Y`\xac\x8f\x97\xce\xfd\x97i\xd2";
        c7[9] = r15;
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[11] = r15;
        c7[12] = r16;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[10] = c7[11][c7[13]];
        c7[9] = false;
        c7[15] = "\xf6\xd2\x86\x9c\x8ct\xcb";
        c7[12] = r15;
        c7[13] = r16;
        c7[14] = c7[13](c7[15], c7[16]);
        c7[11] = c7[12][c7[14]];
        c7[13] = r15;
        c7[16] = "\xe8\x05W\x90$\xb7\xeb\n";
        c7[14] = r16;
        c7[15] = c7[14](c7[16], c7[17]);
        c7[12] = c7[13][c7[15]];
        c7[13] = function(arg1_50, ...)
            M = tonumber(arg1_50);
            if M then
                v3 = M > 0;
            end;
            if M then
                Z = v5(v1);
                r85.Rare.maxBuyQuantity = Z;
            end;
            return; 
        end;
        c7[1] = {
            [c7[2]] = c7[3],
            [c7[4]] = c7[5],
            [c7[6]] = c7[7],
            [c7[8]] = c7[9],
            [c7[10]] = c7[11],
            [c7[12]] = c7[13]
        };
        c7[10] = 8945861906501;
        rf.CreateInput(rf, c7[1]);
        c7[3] = r15;
        c7[4] = r16;
        c7[7] = 7311381531980;
        c7[6] = "\xa5\xbb\x8b\x88";
        c7[5] = c7[4](c7[6], c7[7]);
        c7[2] = c7[3][c7[5]];
        c7[4] = r15;
        c7[11] = 23288575634012;
        c7[5] = r16;
        c7[13] = 25497552449121;
        c7[7] = "3Hf\x9e\xb98\xccSJH\x06\"\xa6\xf6\x1f\x96\x97Ws";
        c7[8] = 19309709386527;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[3] = c7[4][c7[6]];
        c7[9] = 28000183431918;
        c7[15] = 29373604509038;
        c7[5] = r15;
        c7[8] = "\xe0\xe3\xc5\xe1j(|\xda\xb5\xbb\x89\xac";
        c7[6] = r16;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[9] = "";
        c7[4] = c7[5][c7[7]];
        c7[6] = r15;
        c7[7] = r16;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[8] = r16;
        c7[12] = 12716522886945;
        c7[10] = "&\x17\x83\xbd\xcb\xc1\xe1,\xa8\"\xf54\x92\xa5\x97";
        c7[14] = "\\Z\x9a\x0b";
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[8] = r15;
        c7[11] = "F\x1b\x01\x04\x08\xe7\x1b'\x1a\x1d";
        c7[17] = 29059821139164;
        c7[9] = r16;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[7] = c7[8][c7[10]];
        c7[9] = r15;
        c7[12] = "\x0b\x87\xf8Q\xddC\x7f9\xc7\x99\x94\xb6oT\x0f\xa5\xea\x10i\xed\xad\xa1\xce\xfa";
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[9] = false;
        c7[16] = 24442085698677;
        c7[11] = r15;
        c7[12] = r16;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[10] = c7[11][c7[13]];
        c7[12] = r15;
        c7[13] = r16;
        c7[15] = "\xbb\xdf\x03\xa4Dm\xcf\x9a\xb0";
        c7[14] = c7[13](c7[15], c7[16]);
        c7[11] = c7[12][c7[14]];
        c7[13] = r15;
        c7[16] = "A\x12wAw\\\xea\xa2";
        c7[14] = r16;
        c7[15] = c7[14](c7[16], c7[17]);
        c7[12] = c7[13][c7[15]];
        c7[14] = 35161123504117;
        c7[13] = function(arg1_51, ...)
            r85.Rare.maxSpend = r86(arg1_51);
            return; 
        end;
        c7[1] = {
            [c7[2]] = c7[3],
            [c7[4]] = c7[5],
            [c7[6]] = c7[7],
            [c7[8]] = c7[9],
            [c7[10]] = c7[11],
            [c7[12]] = c7[13]
        };
        c7[6] = 15079042194285;
        rf.CreateInput(rf, c7[1]);
        c7[10] = 12407850768017;
        c7[2] = r15;
        c7[12] = 6822427839592;
        c7[9] = 27633028182595;
        c7[5] = "\xfb\xf6LMV\xd3\x0c\x8by\xde\xc48\x080F\x9eKhk\xf6\x93\x8c";
        c7[3] = r16;
        c7[4] = c7[3](c7[5], c7[6]);
        c7[7] = "\xebs\x17S";
        c7[1] = c7[2][c7[4]];
        rf.CreateSection(rf, c7[1]);
        c7[8] = 8231578996473;
        c7[13] = 4654733592695;
        c7[17] = 10167136473726;
        c7[11] = "\x10Tx\xa5";
        c7[4] = r15;
        c7[5] = r16;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[1] = "CreateToggle";
        c7[1] = rf[c7[1]];
        c7[3] = c7[4][c7[6]];
        c7[5] = r15;
        c7[15] = "qs\x15\x9b";
        c7[6] = r16;
        c7[8] = "\xcd\xd6y\x94\xb7k|\xa9-W\xd6e\x85\x9cN\xa4_I";
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[6] = r15;
        c7[7] = r16;
        c7[9] = "\xdd\xfa\n2\x9f^\x0b7Y}\xa4j";
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[8] = r15;
        c7[9] = r16;
        c7[6] = false;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[7] = c7[8][c7[10]];
        c7[16] = 12634295637755;
        c7[9] = r15;
        c7[10] = r16;
        c7[12] = "\xca\xaaL$|\xda\"\xaf\xa8fh";
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[10] = r15;
        c7[11] = r16;
        c7[13] = "\x8f\xe0\xc6G-x4\xce";
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[10] = function(arg1_52, ...)
            M = arg1_52;
            r85.Epic.enabled = M;
            r84 = r85.Common.enabled or (r85.Uncommon.enabled or (r85.Rare.enabled or (r85.Epic.enabled or (r85.Legendary.enabled or r85.Mythic.enabled))));
            return; 
        end;
        c7[2] = {
            [c7[3]] = c7[4],
            [c7[5]] = c7[6],
            [c7[7]] = c7[8],
            [c7[9]] = c7[10]
        };
        c7[11] = 12356130215545;
        c7[13] = 10408243516142;
        c7[1] = c7[1](rf, c7[2]);
        c7[8] = 34823979433816;
        c7[14] = 1613843809007;
        c7[4] = r15;
        c7[10] = 16219011112320;
        c7[7] = "]\xb6E\xba";
        c7[5] = r16;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[9] = 28445666243518;
        c7[3] = c7[4][c7[6]];
        c7[8] = "\xc2$Z\xe1c\x80ie\x1c:\x8f\xe4\xe11P\x13K\x86";
        c7[12] = 18758846587423;
        c7[5] = r15;
        c7[6] = r16;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[6] = r15;
        c7[9] = "\xd1\x16m\x12\x0e,\x94\xe4\xb2\x1bb\xb4";
        c7[7] = r16;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[10] = "";
        c7[7] = r15;
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[11] = "\x02i\xa7G\xdcAE\x9c\x94k\n\xeb\x87\xbe\x7f";
        c7[6] = c7[7][c7[9]];
        c7[8] = r15;
        c7[9] = r16;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[12] = "\xf5\xb5s\xf3\xd7`\xb8L\xaa8";
        c7[7] = c7[8][c7[10]];
        c7[9] = r15;
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[13] = "`kp\xd1\xdeV\x8a\xd5dN\"\x17S\xf9&\x03z\x86\x7f\xd0u\xcar\xee";
        c7[8] = c7[9][c7[11]];
        c7[10] = r15;
        c7[11] = r16;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[12] = r15;
        c7[10] = false;
        c7[13] = r16;
        c7[14] = c7[13](c7[15], c7[16]);
        c7[1] = "CreateInput";
        c7[11] = c7[12][c7[14]];
        c7[13] = r15;
        c7[14] = r16;
        c7[16] = "zf\x01\x1c^\x18h";
        c7[15] = c7[14](c7[16], c7[17]);
        c7[12] = c7[13][c7[15]];
        c7[17] = "\x1c1g\xb2\x1aVU\xcf";
        c7[14] = r15;
        c7[15] = r16;
        c7[1] = rf[c7[1]];
        c7[16] = c7[15](c7[17], c7[18]);
        c7[13] = c7[14][c7[16]];
        c7[14] = function(arg1_53, ...)
            M = tonumber(arg1_53);
            if M then
                v3 = M > 0;
            end;
            if M then
                Z = v5(v1);
                r85.Epic.maxBuyQuantity = Z;
            end;
            return; 
        end;
        c7[2] = {
            [c7[3]] = c7[4],
            [c7[5]] = c7[6],
            [c7[7]] = c7[8],
            [c7[9]] = c7[10],
            [c7[11]] = c7[12],
            [c7[13]] = c7[14]
        };
        c7[7] = "\xee\xf8w\x88";
        c7[1] = c7[1](rf, c7[2]);
        c7[18] = 10467554415370;
        c7[4] = r15;
        c7[5] = r16;
        c7[8] = 27891545584316;
        c7[6] = c7[5](c7[7], c7[8]);
        c7[8] = "K\x00\xa2\xf6\xc4\x88B\xa9\xc1E\x0cV\x82~0\x9f\xd0jw";
        c7[3] = c7[4][c7[6]];
        c7[5] = r15;
        c7[9] = 4936816494842;
        c7[6] = r16;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[10] = 25221143326176;
        c7[4] = c7[5][c7[7]];
        c7[13] = 31827105036772;
        c7[1] = "CreateInput";
        c7[6] = r15;
        c7[9] = "\x02\xd9\x0c\xc6\x8c\x1e@6\x95h9w";
        c7[7] = r16;
        c7[11] = 32546279193395;
        c7[12] = 4913567893744;
        c7[14] = 6311977831291;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[10] = "";
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[11] = "HE\xbf\x1aWx/\x0e\xc3\xb0\x8a`!\xef\xda";
        c7[6] = c7[7][c7[9]];
        c7[8] = r15;
        c7[9] = r16;
        c7[17] = 2664150861016;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[16] = 30795088558084;
        c7[7] = c7[8][c7[10]];
        c7[12] = "S\xdcX\xfb$\x9aZ4\xac\xc5";
        c7[9] = r15;
        c7[10] = r16;
        c7[15] = "}5l\xe3";
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[10] = r15;
        c7[13] = "\xd9Na\xae\x98\xaaS\xf6j\xf3\x98\xa6B\x1e\xd3D\x86m\x02:-\xfb\\g";
        c7[11] = r16;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[10] = false;
        c7[12] = r15;
        c7[13] = r16;
        c7[14] = c7[13](c7[15], c7[16]);
        c7[11] = c7[12][c7[14]];
        c7[16] = "f#\xd3b\x0eX\xcdk\xae";
        c7[13] = r15;
        c7[14] = r16;
        c7[15] = c7[14](c7[16], c7[17]);
        c7[17] = "\xed\x8b\xc1\xaa\x1e~\xb3Q";
        c7[1] = rf[c7[1]];
        c7[12] = c7[13][c7[15]];
        c7[14] = r15;
        c7[15] = r16;
        c7[16] = c7[15](c7[17], c7[18]);
        c7[13] = c7[14][c7[16]];
        c7[14] = function(arg1_54, ...)
            r85.Epic.maxSpend = r86(arg1_54);
            return; 
        end;
        c7[2] = {
            [c7[3]] = c7[4],
            [c7[5]] = c7[6],
            [c7[7]] = c7[8],
            [c7[9]] = c7[10],
            [c7[11]] = c7[12],
            [c7[13]] = c7[14]
        };
        c7[1] = c7[1](rf, c7[2]);
        c7[1] = "CreateSection";
        c7[3] = r15;
        c7[6] = "\x1f\xde\x8c\xc0\x7f\xc0>\xd7\xe4F\xc5\xd3'\xc8\x07a\x93\x9f\xa0\xa1\x86\xc4\xe5\xda\xbd\xbb\xeb";
        c7[9] = 355269558437;
        c7[8] = "\xb9C\xbe>";
        c7[4] = r16;
        c7[7] = 3304055064066;
        c7[11] = 12109153261062;
        c7[13] = 7179065560335;
        c7[10] = 22079750727721;
        c7[5] = c7[4](c7[6], c7[7]);
        c7[1] = rf[c7[1]];
        c7[2] = c7[3][c7[5]];
        c7[1] = c7[1](rf, c7[2]);
        c7[5] = r15;
        c7[6] = r16;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[6] = r15;
        c7[7] = r16;
        c7[9] = "\x11i\xcc\x0f\x03\xe32\xf3\xdbsj\x9e\x17\xb3\xece~\xddN\xa5\x9f\xf6\xec";
        c7[8] = c7[7](c7[9], c7[10]);
        c7[15] = 5039588739370;
        c7[16] = "$h\xe5|";
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[8] = r16;
        c7[10] = "\x18\x83\xd9[\xff0H\xac)\x94\xfb\xaa";
        c7[9] = c7[8](c7[10], c7[11]);
        c7[14] = 6395182959521;
        c7[6] = c7[7][c7[9]];
        c7[9] = r15;
        c7[12] = "p8\xec\xda";
        c7[7] = false;
        c7[10] = r16;
        c7[18] = 32379602467557;
        c7[2] = "CreateToggle";
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[10] = r15;
        c7[11] = r16;
        c7[13] = "\xae\xc1\xc1\xef2+gC8t\xd58\xe1\x8b\xfc\xa0";
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[2] = rf[c7[2]];
        c7[14] = "=k){\x11\x8c\xcc3";
        c7[11] = r15;
        c7[12] = r16;
        c7[17] = 27895777145533;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[10] = c7[11][c7[13]];
        c7[11] = function(arg1_55, ...)
            M = arg1_55;
            r85.Legendary.enabled = M;
            r84 = r85.Common.enabled or (r85.Uncommon.enabled or (r85.Rare.enabled or (r85.Epic.enabled or (r85.Legendary.enabled or r85.Mythic.enabled))));
            return; 
        end;
        c7[3] = {
            [c7[4]] = c7[5],
            [c7[6]] = c7[7],
            [c7[8]] = c7[9],
            [c7[10]] = c7[11]
        };
        c7[12] = 11727827408213;
        c7[2] = c7[2](rf, c7[3]);
        c7[15] = 14391978269229;
        c7[5] = r15;
        c7[11] = 33428969471182;
        c7[6] = r16;
        c7[8] = "{\x0e\x15^";
        c7[9] = 15085094476656;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[10] = 11116244898872;
        c7[4] = c7[5][c7[7]];
        c7[9] = "8O\x1d\xcee4\xe5\x1e\x82w\x16Q\xaa\x8b_T[\r\x95\x9c\xf8\xdb\x98";
        c7[6] = r15;
        c7[7] = r16;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[13] = 17428222730163;
        c7[10] = "\xacx,tm\x01U|\xe1\x9f\xaa\xb0";
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[14] = 29039685924050;
        c7[6] = c7[7][c7[9]];
        c7[8] = r15;
        c7[11] = "";
        c7[9] = r16;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[12] = "\xee\x89\x9a\xa4oX\x88X\xfaX\x0bjS\x03\x8b";
        c7[7] = c7[8][c7[10]];
        c7[9] = r15;
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[10] = r15;
        c7[13] = ".\xf9\xc2LlB2\xca=9";
        c7[11] = r16;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[11] = r15;
        c7[12] = r16;
        c7[14] = "\xfe\x05\x07\n\xd4(\xda\xff\x87\x85\xb9<i\x85\x0b9\xc4\xaa\x13\xe0\xbaS\xfa\x8e";
        c7[13] = c7[12](c7[14], c7[15]);
        c7[10] = c7[11][c7[13]];
        c7[13] = r15;
        c7[14] = r16;
        c7[15] = c7[14](c7[16], c7[17]);
        c7[17] = "?\xf9\xa0@Q\xe4\xa6\xbcR\xad\x9c\xa7";
        c7[11] = false;
        c7[12] = c7[13][c7[15]];
        c7[14] = r15;
        c7[15] = r16;
        c7[16] = c7[15](c7[17], c7[18]);
        c7[13] = c7[14][c7[16]];
        c7[18] = "\x99\xd1\xc7B\xb2Y1\xee";
        c7[15] = r15;
        c7[16] = r16;
        c7[2] = "CreateInput";
        c7[17] = c7[16](c7[18], c7[19]);
        c7[14] = c7[15][c7[17]];
        c7[2] = rf[c7[2]];
        c7[15] = function(arg1_56, ...)
            M = tonumber(arg1_56);
            if M then
                v3 = M > 0;
            end;
            if M then
                Z = v5(v1);
                r85.Legendary.maxBuyQuantity = Z;
            end;
            return; 
        end;
        c7[3] = {
            [c7[4]] = c7[5],
            [c7[6]] = c7[7],
            [c7[8]] = c7[9],
            [c7[10]] = c7[11],
            [c7[12]] = c7[13],
            [c7[14]] = c7[15]
        };
        c7[2] = c7[2](rf, c7[3]);
        c7[5] = r15;
        c7[18] = 30723041474530;
        c7[6] = r16;
        c7[9] = 11178684814421;
        c7[24] = 36865310737;
        c7[12] = 17573867773943;
        c7[16] = "\xef\x9f\x1b\xb2";
        c7[15] = 17230344888151;
        c7[10] = 8124613365447;
        c7[17] = 34422801972893;
        c7[8] = "uW\x1a\xcc";
        c7[7] = c7[6](c7[8], c7[9]);
        c7[2] = "CreateInput";
        c7[4] = c7[5][c7[7]];
        c7[6] = r15;
        c7[2] = rf[c7[2]];
        c7[7] = r16;
        c7[9] = "\xe9(\\\xda| \x98\xd0S\x9b\xb8\x0cNW\xc6\xc0\xa9\xeb+(.\x8dh\xc8";
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[10] = "5?11\xac\xc5t\xcaO\x95p\xdd";
        c7[11] = 4729565481114;
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[13] = 13164202104818;
        c7[8] = r15;
        c7[11] = "";
        c7[14] = 11548238370049;
        c7[9] = r16;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[7] = c7[8][c7[10]];
        c7[9] = r15;
        c7[12] = " L/\xa3>\x9fC\xcd\xa9\x9f\xd8[\xe6\r\xa3";
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[10] = r15;
        c7[13] = "\xf6\xc88\xfd&Hgv\x94$";
        c7[11] = r16;
        c7[19] = 461296484566;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[14] = "Z\xce\x1f\x97\x8af\xd0\xea7\xa5\x8dO(\x0c\xa7!84\xa5{~R\xf1\xd5";
        c7[9] = c7[10][c7[12]];
        c7[11] = r15;
        c7[12] = r16;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[10] = c7[11][c7[13]];
        c7[13] = r15;
        c7[11] = false;
        c7[14] = r16;
        c7[15] = c7[14](c7[16], c7[17]);
        c7[12] = c7[13][c7[15]];
        c7[14] = r15;
        c7[15] = r16;
        c7[17] = "<X\xbc\x089.\xa1\xc9\xe7H\xbd~\xc5\xa0";
        c7[16] = c7[15](c7[17], c7[18]);
        c7[13] = c7[14][c7[16]];
        c7[18] = "\xda\x1b3\xa5Wa\x85\x8c";
        c7[15] = r15;
        c7[16] = r16;
        c7[17] = c7[16](c7[18], c7[19]);
        c7[14] = c7[15][c7[17]];
        c7[15] = function(arg1_57, ...)
            r85.Legendary.maxSpend = r86(arg1_57);
            return; 
        end;
        c7[3] = {
            [c7[4]] = c7[5],
            [c7[6]] = c7[7],
            [c7[8]] = c7[9],
            [c7[10]] = c7[11],
            [c7[12]] = c7[13],
            [c7[14]] = c7[15]
        };
        c7[2] = c7[2](rf, c7[3]);
        c7[2] = "CreateSection";
        c7[4] = r15;
        c7[8] = 31510915823953;
        c7[14] = 27418832155103;
        c7[13] = "D\x05Q\x03";
        c7[10] = 2370508899407;
        c7[5] = r16;
        c7[7] = "O\x03\xac\xbf\x93\xd8\x8f\x96)\x87\xab\r\xb7\xe7\x14\xd9\xea\xae\x98\xde\x99\x8bb\x12";
        c7[9] = "\xb0\x96W\xd4";
        c7[6] = c7[5](c7[7], c7[8]);
        c7[3] = c7[4][c7[6]];
        c7[2] = rf[c7[2]];
        c7[2] = c7[2](rf, c7[3]);
        c7[6] = r15;
        c7[3] = "CreateToggle";
        c7[7] = r16;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[15] = 15944446303488;
        c7[11] = 2190108492795;
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[12] = 19905128784949;
        c7[10] = "Z\x8cL\x7f\xbb\x9a\x94\xd4?q\xc6\xd5,D\x0eq]\x05\x94\xc0\x93\xa7";
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[11] = "D\x8b\xe7h\xadZ\xd8\x86\x87\xe4\xfe8";
        c7[6] = c7[7][c7[9]];
        c7[8] = r15;
        c7[9] = r16;
        c7[19] = 14279553489401;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[7] = c7[8][c7[10]];
        c7[8] = false;
        c7[10] = r15;
        c7[11] = r16;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[11] = r15;
        c7[14] = "\xea|\x8eTS\x98Z\xdf\xf4\x96$R\xdf";
        c7[12] = r16;
        c7[16] = 13236158257171;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[10] = c7[11][c7[13]];
        c7[3] = rf[c7[3]];
        c7[17] = "T\x04\xc4C";
        c7[12] = r15;
        c7[15] = "p\xdb\xbaRO\xeaN\xf1";
        c7[13] = r16;
        c7[14] = c7[13](c7[15], c7[16]);
        c7[11] = c7[12][c7[14]];
        c7[12] = function(arg1_58, ...)
            M = arg1_58;
            r85.Mythic.enabled = M;
            r84 = r85.Common.enabled or (r85.Uncommon.enabled or (r85.Rare.enabled or (r85.Epic.enabled or (r85.Legendary.enabled or r85.Mythic.enabled))));
            return; 
        end;
        c7[4] = {
            [c7[5]] = c7[6],
            [c7[7]] = c7[8],
            [c7[9]] = c7[10],
            [c7[11]] = c7[12]
        };
        c7[11] = 16106474806604;
        c7[3] = c7[3](rf, c7[4]);
        c7[6] = r15;
        c7[7] = r16;
        c7[9] = "\x10\xca\x003";
        c7[13] = 16359603592642;
        c7[10] = 4811365222592;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[10] = "\x1a\xb3~\x104\xa9gs\x1aCe\n\xc2\xa3\x10\x82m\x83\xf3\xe9";
        c7[7] = r15;
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[12] = 19320222475044;
        c7[11] = "v\xb5D\xe0\x9c\xc7\xf1\xb0\xa3\xccP\x10";
        c7[6] = c7[7][c7[9]];
        c7[8] = r15;
        c7[9] = r16;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[12] = "";
        c7[7] = c7[8][c7[10]];
        c7[14] = 33336819694755;
        c7[9] = r15;
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[10] = r15;
        c7[11] = r16;
        c7[18] = 33798116179322;
        c7[13] = "\xe0\x05\xcd\xd9\xe1\xff\xbcZ\x03P,\xadb\xca\xfb";
        c7[12] = c7[11](c7[13], c7[14]);
        c7[15] = 18558652342722;
        c7[9] = c7[10][c7[12]];
        c7[11] = r15;
        c7[3] = "CreateInput";
        c7[14] = "\\\x83\x1a\xd1&gz\x0f\xba\x81";
        c7[16] = 11898272961956;
        c7[12] = r16;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[10] = c7[11][c7[13]];
        c7[3] = rf[c7[3]];
        c7[12] = r15;
        c7[13] = r16;
        c7[15] = "\xd3\x00A\xb8\x9e#e\xe9u>\xff`\xfdX\xdc\x05G\x06\xf8\xfe\x92uMq";
        c7[14] = c7[13](c7[15], c7[16]);
        c7[11] = c7[12][c7[14]];
        c7[14] = r15;
        c7[12] = false;
        c7[15] = r16;
        c7[16] = c7[15](c7[17], c7[18]);
        c7[18] = "f~T\x15\xd4\x02\x97\xf4\xaa";
        c7[13] = c7[14][c7[16]];
        c7[15] = r15;
        c7[16] = r16;
        c7[17] = c7[16](c7[18], c7[19]);
        c7[19] = "\xa9j\x88S\xd9\x06\xf6C";
        c7[14] = c7[15][c7[17]];
        c7[16] = r15;
        c7[17] = r16;
        c7[18] = c7[17](c7[19], c7[20]);
        c7[15] = c7[16][c7[18]];
        c7[16] = function(arg1_59, ...)
            M = tonumber(arg1_59);
            if M then
                v3 = M > 0;
            end;
            if M then
                Z = v5(v1);
                r85.Mythic.maxBuyQuantity = Z;
            end;
            return; 
        end;
        c7[4] = {
            [c7[5]] = c7[6],
            [c7[7]] = c7[8],
            [c7[9]] = c7[10],
            [c7[11]] = c7[12],
            [c7[13]] = c7[14],
            [c7[15]] = c7[16]
        };
        c7[18] = 4377958385654;
        c7[12] = 8884522438697;
        c7[14] = 28081574851348;
        c7[17] = "\x1e#\x05\xba";
        c7[3] = c7[3](rf, c7[4]);
        c7[13] = 11175771952212;
        c7[9] = "ca;\xd3";
        c7[6] = r15;
        c7[10] = 30415697753939;
        c7[7] = r16;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[5] = c7[6][c7[8]];
        c7[7] = r15;
        c7[10] = "\xfb.\x08)/{\x12\xc7\xf9I\x88\xb3Md\xed\x00N\xf8\x18iY";
        c7[11] = 14845416577792;
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[8] = r15;
        c7[11] = "M\x9fv\xab\xc1\xc1\xcbf\xe60\xe4\x05";
        c7[9] = r16;
        c7[10] = c7[9](c7[11], c7[12]);
        c7[15] = 16204076965241;
        c7[7] = c7[8][c7[10]];
        c7[12] = "";
        c7[9] = r15;
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[10] = r15;
        c7[11] = r16;
        c7[13] = "\xe4\x9c\xa8ML1\xb7/\xd9\xaf\xd2\x006h\x88";
        c7[19] = 67086794783;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[11] = r15;
        c7[14] = " \x9e\xff\x19\xd0\xb1\xc7/~\x9a";
        c7[3] = "CreateInput";
        c7[12] = r16;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[15] = "\x8d\xbf{o\xce\xbc\x87\xd0\x98\x19\xa9\xc2\x1d7b\x99\x88`\xc0_\x1c\x87\xa5\x89";
        c7[20] = 12356632893050;
        c7[10] = c7[11][c7[13]];
        c7[12] = r15;
        c7[13] = r16;
        c7[16] = 3052091065741;
        c7[14] = c7[13](c7[15], c7[16]);
        c7[11] = c7[12][c7[14]];
        c7[14] = r15;
        c7[12] = false;
        c7[15] = r16;
        c7[16] = c7[15](c7[17], c7[18]);
        c7[3] = rf[c7[3]];
        c7[13] = c7[14][c7[16]];
        c7[18] = "@\xafQ\x0fS\xf0\xd7yl\x1bi";
        c7[15] = r15;
        c7[16] = r16;
        c7[17] = c7[16](c7[18], c7[19]);
        c7[14] = c7[15][c7[17]];
        c7[16] = r15;
        c7[19] = "\xbf\xb9MLn\x9e\x9ay";
        c7[17] = r16;
        c7[18] = c7[17](c7[19], c7[20]);
        c7[15] = c7[16][c7[18]];
        c7[16] = function(arg1_60, ...)
            r85.Mythic.maxSpend = r86(arg1_60);
            return; 
        end;
        c7[4] = {
            [c7[5]] = c7[6],
            [c7[7]] = c7[8],
            [c7[9]] = c7[10],
            [c7[11]] = c7[12],
            [c7[13]] = c7[14],
            [c7[15]] = c7[16]
        };
        c7[3] = c7[3](rf, c7[4]);
        c7[8] = "\x96\xef\x88\xc9\"\xe3\x8cho\xf8";
        c7[11] = 20860369217009;
        c7[5] = r15;
        c7[3] = "CreateTab";
        c7[6] = r16;
        c7[9] = 14372579777060;
        c7[10] = 12245327681094;
        c7[7] = c7[6](c7[8], c7[9]);
        c7[4] = c7[5][c7[7]];
        c7[5] = nil;
        c7[20] = 9660311884178;
        c7[3] = v4[c7[3]];
        c7[9] = "\xea\xbf/L\xf4&\x0f\xddxC\xf5D\xd3\xd1\xb2i_D\x07J\xa6\x9a=";
        c7[3] = c7[3](v4, c7[4], c7[5]);
        c7[4] = "CreateSection";
        c7[6] = r15;
        c7[7] = r16;
        c7[8] = c7[7](c7[9], c7[10]);
        c7[14] = "}\x98\xb7\x1bQP\x1e";
        c7[5] = c7[6][c7[8]];
        c7[4] = c7[3][c7[4]];
        c7[10] = "Y\xde\xfd\xdd\xb3XA\xc5\xe3\x1ac!\xcc\x81\xe7x\x88H\xc2a<,(\xfa|\xd7";
        c7[4] = c7[4](c7[3], c7[5]);
        c7[7] = r15;
        c7[8] = r16;
        c7[9] = c7[8](c7[10], c7[11]);
        c7[6] = c7[7][c7[9]];
        c7[7] = nil;
        c7[15] = 12403986765456;
        c7[10] = "Color3";
        c7[9] = Env[c7[10]];
        c7[11] = r15;
        c7[5] = "CreateLabel";
        c7[12] = r16;
        c7[13] = c7[12](c7[14], c7[15]);
        c7[10] = c7[11][c7[13]];
        c7[5] = c7[3][c7[5]];
        c7[8] = c7[9][c7[10]];
        c7[11] = 255;
        c7[12] = 255;
        c7[10] = 255;
        c7[9] = c7[8](c7[10], c7[11], c7[12]);
        c7[8] = false;
        c7[5] = c7[5](c7[3], c7[6], c7[7], c7[9], c7[8]);
        c7[8] = "os";
        c7[17] = "_$\xcb\x1e\xf5\x1e\x1e";
        c7[14] = 19392976233286;
        c7[6] = 79;
        c7[13] = 12327127422572;
        U[c7[6]] = c7[5];
        c7[7] = Env[c7[8]];
        c7[12] = "o'7\xf6-";
        c7[9] = r15;
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[5] = c7[7][c7[8]];
        c7[7] = c7[5]();
        c7[5] = 80;
        U[c7[5]] = c7[7];
        c7[18] = 3253214266858;
        c7[9] = "task";
        c7[8] = Env[c7[9]];
        c7[13] = "\x9c\xcbr_\xc8";
        c7[10] = r15;
        c7[11] = r16;
        c7[12] = c7[11](c7[13], c7[14]);
        c7[9] = c7[10][c7[12]];
        c7[7] = c7[8][c7[9]];
        c7[13] = 32265642703536;
        c7[19] = "\xa9\x12\xf7\xb4'";
        c7[9] = function(...)
            v5 = task.wait;
            while v5(1) do
                v1 = math.floor(os.clock() - U[c7[5]]);
                v5 = U[c7[6]];
                v5.Set(v5, string.format("\xe2\x8f\xb3 Session Time: %02d:%02d:%02d", math.floor(v1 / 3600), math.floor(v1 % 3600 / 60), v1 % 60), nil, Color3.fromRGB(255, 255, 255), false); 
            end;
            return; 
        end;
        c7[8] = c7[7](c7[9]);
        c7[9] = r15;
        c7[7] = "CreateSection";
        c7[7] = c7[3][c7[7]];
        c7[12] = "%\x04T\xca\x0c\xb7\x14\xaf\xad\xcciSg\xf4\xf4\x10\xc8z\xa5A\x8c";
        c7[14] = 349691216034;
        c7[10] = r16;
        c7[11] = c7[10](c7[12], c7[13]);
        c7[8] = c7[9][c7[11]];
        c7[7] = c7[7](c7[3], c7[8]);
        c7[10] = r15;
        c7[11] = r16;
        c7[13] = "T@y\xa3 \xb2^G\xb6(>\xacmM\xcf\x1ff\xdf\x92\r\x82\xaf\n\x89v\xfb\xbfE\x7f";
        c7[12] = c7[11](c7[13], c7[14]);
        c7[13] = "Color3";
        c7[9] = c7[10][c7[12]];
        c7[12] = Env[c7[13]];
        c7[14] = r15;
        c7[15] = r16;
        c7[16] = c7[15](c7[17], c7[18]);
        c7[15] = 255;
        c7[13] = c7[14][c7[16]];
        c7[11] = c7[12][c7[13]];
        c7[14] = 255;
        c7[10] = nil;
        c7[13] = 255;
        c7[8] = "CreateLabel";
        c7[8] = c7[3][c7[8]];
        c7[12] = c7[11](c7[13], c7[14], c7[15]);
        c7[11] = false;
        c7[8] = c7[8](c7[3], c7[9], c7[10], c7[12], c7[11]);
        c7[10] = "game";
        c7[9] = 81;
        c7[16] = 27205930496380;
        U[c7[9]] = c7[8];
        c7[15] = "\xcc \xce{\x1b\x0c~";
        c7[8] = Env[c7[10]];
        c7[12] = r15;
        c7[10] = "GetService";
        c7[13] = r16;
        c7[14] = c7[13](c7[15], c7[16]);
        c7[10] = c7[8][c7[10]];
        c7[11] = c7[12][c7[14]];
        c7[10] = c7[10](c7[8], c7[11]);
        c7[15] = "_\x1d$n{\x85\x1a\xd6\xe3\x1e\x1b";
        c7[12] = r15;
        c7[13] = r16;
        c7[16] = 16999753621228;
        c7[14] = c7[13](c7[15], c7[16]);
        c7[11] = c7[12][c7[14]];
        c7[8] = c7[10][c7[11]];
        c7[11] = 82;
        U[c7[11]] = c7[8];
        c7[15] = "task";
        c7[13] = 83;
        c7[8] = function(...)
            v5 = U[c7[11]];
            v1 = v5.FindFirstChild(v5, "leaderstats");
            if not v1 then
                return 0;
            end;
            M = v1.FindFirstChild(v1, "Wins");
            if not M then
                return 0;
            end;
            return M.Value; 
        end;
        c7[12] = c7[8]();
        U[c7[13]] = c7[12];
        c7[14] = Env[c7[15]];
        c7[16] = r15;
        c7[17] = r16;
        c7[18] = c7[17](c7[19], c7[20]);
        c7[15] = c7[16][c7[18]];
        c7[12] = c7[14][c7[15]];
        c7[18] = "(\x0e\x0b\x11\xc2AT\xfcl\xa0k#\xbc|7\xa1/\x0c\xef\xeea~\xbb";
        c7[15] = function(...)
            v5 = U[c7[11]];
            v1 = v5.WaitForChild(v5, "leaderstats");
            M = v1.WaitForChild(v1, "Wins");
            U[c7[13]] = M.Value;
            p = r15;
            while task.wait(1) do
                q = M.Value - U[c7[13]];
                if q < 0 then
                    q = 0;
                end;
                p = U[c7[9]];
                p.Set(p, "\xf0\x9f\x92\xb5 Wins Earned (Session): " .. tostring(q), nil, Color3.fromRGB(255, 255, 255), false); 
            end;
            return; 
        end;
        c7[14] = c7[12](c7[15]);
        c7[19] = 5293142641056;
        c7[15] = r15;
        c7[16] = r16;
        c7[17] = c7[16](c7[18], c7[19]);
        c7[18] = "Color3";
        c7[14] = c7[15][c7[17]];
        c7[15] = nil;
        c7[17] = Env[c7[18]];
        c7[19] = r15;
        c7[20] = r16;
        c7[21] = c7[20](c7[22], c7[23]);
        c7[12] = "CreateLabel";
        c7[18] = c7[19][c7[21]];
        c7[16] = c7[17][c7[18]];
        c7[12] = c7[3][c7[12]];
        c7[18] = 255;
        c7[20] = 255;
        c7[19] = 255;
        c7[17] = c7[16](c7[18], c7[19], c7[20]);
        c7[16] = false;
        c7[12] = c7[12](c7[3], c7[14], c7[15], c7[17], c7[16]);
        c7[14] = 84;
        U[c7[14]] = c7[12];
        c7[15] = "game";
        c7[20] = "v*\xed\xfdP\x0e\x99";
        c7[12] = Env[c7[15]];
        c7[17] = r15;
        c7[18] = r16;
        c7[21] = 26101491642234;
        c7[15] = "GetService";
        c7[19] = c7[18](c7[20], c7[21]);
        c7[23] = "`\xd8\xda\xfc\xbf";
        c7[16] = c7[17][c7[19]];
        c7[15] = c7[12][c7[15]];
        c7[15] = c7[15](c7[12], c7[16]);
        c7[17] = r15;
        c7[20] = "\xe8|\xc6\xfb\x12\xde]\x05\xc1h\xb6";
        c7[21] = 26153511858066;
        c7[18] = r16;
        c7[19] = c7[18](c7[20], c7[21]);
        c7[16] = c7[17][c7[19]];
        c7[12] = c7[15][c7[16]];
        c7[16] = 85;
        c7[19] = "task";
        U[c7[16]] = c7[12];
        c7[18] = Env[c7[19]];
        c7[12] = function(...)
            v5 = U[c7[16]];
            v1 = v5.FindFirstChild(v5, "leaderstats");
            if not v1 then
                return 0;
            end;
            M = v1.FindFirstChild(v1, "Wins");
            if not M then
                return 0;
            end;
            return M.Value; 
        end;
        c7[20] = r15;
        c7[21] = r16;
        c7[22] = c7[21](c7[23], c7[24]);
        c7[19] = c7[20][c7[22]];
        c7[17] = c7[18][c7[19]];
        c7[19] = function(...)
            v5 = U[c7[16]];
            v1 = v5.WaitForChild(v5, "leaderstats");
            M = v1.WaitForChild(v1, "Wins");
            v3 = task.wait(1);
            while v3 do
                v2 = (os.clock() - os.clock()) / 60;
                v5 = v2 > 0;
                v3 = U[c7[14]];
                v3.Set(v3, string.format("\xf0\x9f\x93\x88 Wins per Minute: %.2f", 0 and (M.Value - M.Value) / v2), nil, Color3.fromRGB(255, 255, 255), false); 
            end;
            return; 
        end;
        c7[18] = c7[17](c7[19]);
        c7[17] = "CreateTab";
        c7[19] = r15;
        c7[22] = "\xba\x80\xf1\xab\x83\xf7(\x81\n\xcc";
        c7[23] = 33431922588879;
        c7[20] = r16;
        c7[17] = v4[c7[17]];
        c7[21] = c7[20](c7[22], c7[23]);
        c7[18] = c7[19][c7[21]];
        c7[24] = 6152305380144;
        c7[19] = nil;
        c7[17] = c7[17](v4, c7[18], c7[19]);
        c7[20] = r15;
        c7[21] = r16;
        c7[18] = "CreateSection";
        c7[23] = "\xfaS\x9e\xef1\x9bl";
        c7[22] = c7[21](c7[23], c7[24]);
        c7[19] = c7[20][c7[22]];
        c7[18] = c7[17][c7[18]];
        c7[18] = c7[18](c7[17], c7[19]);
        c7[21] = r15;
        c7[24] = "\xbc\xed\x96\xf4\xb2\xce\x024\xc6\xc91K\x1cE\xbb\xaf\xf5\xf6\xd2\xcc";
        c7[22] = r16;
        c7[23] = c7[22](c7[24], c7[25]);
        c7[20] = c7[21][c7[23]];
        c7[21] = 4483362458;
        c7[24] = "Color3";
        c7[23] = Env[c7[24]];
        c7[25] = r15;
        c7[26] = r16;
        c7[27] = c7[26](c7[28], c7[29]);
        c7[24] = c7[25][c7[27]];
        c7[28] = 5122154891601;
        c7[19] = "CreateLabel";
        c7[22] = c7[23][c7[24]];
        c7[26] = 255;
        c7[25] = 255;
        c7[24] = 255;
        c7[23] = c7[22](c7[24], c7[25], c7[26]);
        c7[27] = 32036581456454;
        c7[22] = false;
        c7[19] = c7[17][c7[19]];
        c7[19] = c7[19](c7[17], c7[20], c7[21], c7[23], c7[22]);
        c7[23] = r15;
        c7[26] = "u`\xf84";
        c7[24] = r16;
        c7[25] = c7[24](c7[26], c7[27]);
        c7[27] = "\x99\xe4\xd4\xed#\xf8\x1b\xeb\xf4\xa1\xe3\xc6s\"[\x16\xaa";
        c7[22] = c7[23][c7[25]];
        c7[29] = 4878703200479;
        c7[24] = r15;
        c7[25] = r16;
        c7[26] = c7[25](c7[27], c7[28]);
        c7[20] = "CreateButton";
        c7[23] = c7[24][c7[26]];
        c7[20] = c7[17][c7[20]];
        c7[25] = r15;
        c7[26] = r16;
        c7[28] = "[\xd6D\xfe7\xfc\xb8\x97";
        c7[27] = c7[26](c7[28], c7[29]);
        c7[28] = 11976465110472;
        c7[24] = c7[25][c7[27]];
        c7[25] = function(...)
            setclipboard("https://discord.gg/HsqbWfNb9B");
            v5 = r24;
            v5.Notify(v5, {
                ["Title"] = "Clipboard",
                ["Content"] = "Successfully copied to clipboard!",
                ["Duration"] = 6.5,
                ["Image"] = 4483362458
            });
            return; 
        end;
        c7[29] = 13794122832151;
        c7[21] = {
            [c7[22]] = c7[23],
            [c7[24]] = c7[25]
        };
        c7[20] = c7[20](c7[17], c7[21]);
        c7[27] = "2\x8b\x8d\x02/\xf9t";
        c7[22] = "game";
        c7[21] = Env[c7[22]];
        c7[24] = r15;
        c7[22] = "GetService";
        c7[25] = r16;
        c7[22] = c7[21][c7[22]];
        c7[26] = c7[25](c7[27], c7[28]);
        c7[23] = c7[24][c7[26]];
        c7[28] = "\x86\xd3Y;\x91\x10NE#\x031";
        c7[22] = c7[22](c7[21], c7[23]);
        c7[23] = "game";
        c7[21] = Env[c7[23]];
        c7[25] = r15;
        c7[26] = r16;
        c7[27] = c7[26](c7[28], c7[29]);
        c7[23] = "GetService";
        c7[26] = "http_request";
        c7[23] = c7[21][c7[23]];
        c7[24] = c7[25][c7[27]];
        c7[23] = c7[23](c7[21], c7[24]);
        c7[24] = U[M];
        c7[21] = 86;
        U[c7[21]] = c7[23];
        c7[25] = Env[c7[26]];
        c7[23] = c7[25] or c7[27];
        v5 = c7[24];
        c7[2] = nil;
        c7[29] = "\xb153\xac\xdb\xd6\xcb\xe1\x1c\xcc\xfe";
        c7[24] = 95;
        c7[7] = nil;
        c7[9] = nil;
        c7[1] = nil;
        c7[11] = nil;
        U[c7[24]] = c7[23];
        c7[26] = r15;
        c7[30] = 28637695407127;
        c7[27] = r16;
        c7[5] = nil;
        c7[28] = c7[27](c7[29], c7[30]);
        c7[25] = c7[26][c7[28]];
        c7[23] = c7[22][c7[25]];
        c7[25] = 96;
        c7[30] = 17038369808126;
        U[c7[25]] = c7[23];
        c7[3] = nil;
        c7[26] = r15;
        c7[27] = r16;
        c7[29] = "$-\xa1\x16\xe6\x199\xc2\xdd\xbf\x12\xba\xa2\xbb\x12\xf4\xda\x9a\xee\xc7\x00\x83F\x9a";
        c7[28] = c7[27](c7[29], c7[30]);
        c7[23] = c7[26][c7[28]];
        c7[37] = "\xf7<\xe3\xbe\xa8";
        c7[30] = "n\x80\x9d,\xa1fC\xd2\x98\x93\xba\xd3\xbf#7\r\x9cn\x83\xf3\x00\xf8\xb1\xc4\r\x1eJ\x01R\xbc";
        c7[4] = nil;
        c7[18] = nil;
        c7[26] = 97;
        U[c7[26]] = c7[23];
        c7[10] = nil;
        c7[14] = nil;
        c7[20] = nil;
        c7[27] = r15;
        c7[31] = 17351656431503;
        c7[28] = r16;
        c7[29] = c7[28](c7[30], c7[31]);
        c7[23] = c7[27][c7[29]];
        c7[17] = nil;
        c7[33] = "task";
        c7[27] = 98;
        c7[38] = 13169442494452;
        c7[32] = 28674560717864;
        c7[15] = nil;
        U[c7[27]] = c7[23];
        c7[16] = nil;
        c7[31] = "\x19\xcb\xe2\xee\xa4jh6\xac\xe7\xfa\xadJ\xf2\xe1\x02p\xf4!z\x87\x96_\xc6e\xde\xb1\xf2\xa4\xcd\xe9^";
        c7[28] = r15;
        c7[29] = r16;
        c7[30] = c7[29](c7[31], c7[32]);
        c7[23] = c7[28][c7[30]];
        c7[28] = 99;
        U[c7[28]] = c7[23];
        c7[23] = U[c7[21]];
        c7[30] = false;
        c7[29] = "GenerateGUID";
        c7[29] = c7[23][c7[29]];
        c7[29] = c7[29](c7[23], c7[30]);
        c7[23] = 100;
        c7[19] = nil;
        U[c7[23]] = c7[29];
        c7[30] = 101;
        c7[31] = function(...)
            C = U[c7[21]];
            U[c7[24]]({
                ["Url"] = U[c7[28]],
                ["Method"] = "POST",
                ["Headers"] = {
                    ["Content-Type"] = "application/json"
                },
                ["Body"] = C.JSONEncode(C, {
                    ["player"] = U[c7[25]].Name,
                    ["session_id"] = U[c7[23]],
                    ["game"] = U[c7[26]]
                })
            });
            return; 
        end;
        c7[28] = nil;
        U[c7[30]] = c7[31];
        c7[29] = function(...)
            C = U[c7[21]];
            U[c7[24]]({
                ["Url"] = U[c7[27]],
                ["Method"] = "POST",
                ["Headers"] = {
                    ["Content-Type"] = "application/json"
                },
                ["Body"] = C.JSONEncode(C, {
                    ["player"] = U[c7[25]].Name,
                    ["session_id"] = U[c7[23]],
                    ["game"] = U[c7[26]]
                })
            });
            return; 
        end;
        c7[22] = nil;
        c7[8] = nil;
        c7[26] = nil;
        c7[12] = nil;
        c7[31] = c7[29]();
        c7[21] = nil;
        c7[32] = Env[c7[33]];
        c7[23] = nil;
        c7[34] = r15;
        c7[13] = nil;
        c7[35] = r16;
        c7[6] = nil;
        c7[25] = nil;
        c7[24] = nil;
        c7[36] = c7[35](c7[37], c7[38]);
        c7[33] = c7[34][c7[36]];
        c7[31] = c7[32][c7[33]];
        c7[27] = nil;
        c7[33] = function(...)
            while true do
                task.wait(60);
                U[c7[30]](); 
            end;
            return; 
        end;
        c7[29] = nil;
        c7[30] = nil;
        c7[32] = c7[31](c7[33]);
        return;
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
