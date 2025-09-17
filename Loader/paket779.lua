

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local lp = Players.LocalPlayer
local playerGui = lp:WaitForChild("PlayerGui")


local MENUS = {
    ["AUTO WALK"] = {
        { name = "BYPASS", link = "https://raw.githubusercontent.com/WataXScript/WataXMountAtin/main/Loader/WataX.lua" },
        { name = "Mount Atin", link = "https://raw.githubusercontent.com/WataXScript/WataXMountAtin/main/Loader/mainmap792.lua" },
        { name = "EKSPEDISI ANTARTIKA", link = "https://raw.githubusercontent.com/WataXScript/WataXAntartika157/main/Loader/mainmap273.lua" },
        { name = "Mount Yahayuk", link = "https://raw.githubusercontent.com/WataXScript/WataXMountYahayuk1/main/Loader/mainmap970.lua" },
        { name = "Mount Daun", link = "https://raw.githubusercontent.com/WataXScript/WataXMountDaun/main/Loader/mainmap926.lua" },
        { name = "Mount Arunika", link = "https://raw.githubusercontent.com/WataXScript/WataXMountArunika/main/Loader/mainmap991.lua" },
        { name = "Mount Ravika", link = "https://raw.githubusercontent.com/WataXScript/WataXMountRavika/main/Loader/mainmap449.lua" },
        { name = "Mount Lembayana", link = "https://raw.githubusercontent.com/WataXScript/WataXMountLembayana/main/Loader/mainmap772.lua" },

    },
    ["CHEAT MENU"] = {
        { name = "Fly", link = "https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/fly.lua" },
        { name = "INF JUMP", link = "https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/infjump.lua" },
    },
    ["FIX LAG"] = {
        { name = "Potato Mode", link = "https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/Potato.lua" },
       
    },
}


local function safeExecute(rawUrl)
    if type(rawUrl) ~= "string" or rawUrl == "" then
        warn("[WataX] invalid url")
        return
    end

    local httpGetFuncs = {
        function(url) return (syn and syn.request and syn.request{Url = url, Method="GET"} and syn.request{Url = url, Method="GET"}.Body) end,
        function(url) return (http and http.request and http.request{Url = url, Method="GET"} and http.request{Url = url, Method="GET"}.Body) end,
        function(url) return (request and request(url)) end,
        function(url) return (game:HttpGet(url)) end,
        function(url) return (game.HttpGet and game:HttpGet(url)) end,
    }
    local body
    for _,fn in ipairs(httpGetFuncs) do
        local success, ret = pcall(fn, rawUrl)
        if success and ret and type(ret) == "string" then
            body = ret
            break
        end
    end

    if not body then
        warn("[WataX] Gagal ambil raw. Pastikan executor lo support HttpGet/request.")
        return
    end

    local ok2, err = pcall(function() loadstring(body)() end)
    if not ok2 then
        warn("[WataX] Error saat execute:", err)
    end
end


local function make(parent, class, props)
    local obj = Instance.new(class)
    for k,v in pairs(props or {}) do
        if k == "Parent" then obj.Parent = v else obj[k] = v end
    end
    obj.Parent = parent
    return obj
end


for _,v in pairs(playerGui:GetChildren()) do
    if v.Name == "WataX_UI" then v:Destroy() end
end


local screen = Instance.new("ScreenGui")
screen.Name = "WataX_UI"
screen.ResetOnSpawn = false
screen.Parent = playerGui
screen.ZIndexBehavior = Enum.ZIndexBehavior.Global


local main = make(screen, "Frame", {
    Name = "Main",
    Size = UDim2.new(0, 420, 0, 340),
    Position = UDim2.new(0.25, 0, 0.18, 0),
    BackgroundColor3 = Color3.fromRGB(20,20,25),
    BorderSizePixel = 0,
    ClipsDescendants = true,
})
make(main, "UICorner", {CornerRadius = UDim.new(0, 12)})


make(main, "UIGradient", {
    Color = ColorSequence.new{
        ColorSequenceKeypoint.new(0, Color3.fromRGB(36, 42, 77)),
        ColorSequenceKeypoint.new(1, Color3.fromRGB(15, 18, 30)),
    },
    Rotation = 45,
})


make(main, "UIStroke", {Color = Color3.fromRGB(200,200,210), Thickness = 1, Transparency = 0.85})


local header = make(main, "Frame", {
    Name = "Header",
    Size = UDim2.new(1, 0, 0, 38),
    BackgroundColor3 = Color3.fromRGB(28,30,45),
    BorderSizePixel = 0,
})
make(header, "UICorner", {CornerRadius = UDim.new(0, 12)})

local title = make(header, "TextLabel", {
    Name = "Title",
    Text = "🌆WataX Menu",
    Size = UDim2.new(1, -100, 1, 0),
    Position = UDim2.new(0, 12, 0, 0),
    BackgroundTransparency = 1,
    TextColor3 = Color3.fromRGB(240,240,250),
    TextXAlignment = Enum.TextXAlignment.Left,
    Font = Enum.Font.GothamBold,
    TextSize = 16,
})


local btnClose = make(header, "TextButton", {
    Name = "Close",
    Text = "×",
    Size = UDim2.new(0, 38, 1, 0),
    Position = UDim2.new(1, -38, 0, 0),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 20,
    TextColor3 = Color3.fromRGB(255,100,100),
})
local btnMin = make(header, "TextButton", {
    Name = "Min",
    Text = "—",
    Size = UDim2.new(0, 38, 1, 0),
    Position = UDim2.new(1, -76, 0, 0),
    BackgroundTransparency = 1,
    Font = Enum.Font.GothamBold,
    TextSize = 18,
    TextColor3 = Color3.fromRGB(200,200,200),
})


local body = make(main, "Frame", {
    Name = "Body",
    Position = UDim2.new(0, 12, 0, 46),
    Size = UDim2.new(1, -24, 1, -58),
    BackgroundTransparency = 1,
})


local left = make(body, "Frame", {
    Name = "Left",
    Size = UDim2.new(0, 188, 1, 0),
    BackgroundTransparency = 1,
})


local right = make(body, "Frame", {
    Name = "Right",
    Size = UDim2.new(1, -200, 1, 0),
    Position = UDim2.new(0, 200, 0, 0),
    BackgroundColor3 = Color3.fromRGB(18,18,24),
    BorderSizePixel = 0,
})
make(right, "UICorner", {CornerRadius = UDim.new(0, 10)})
make(right, "UIStroke", {Color = Color3.fromRGB(190,190,200), Transparency = 0.9, Thickness = 1})


make(main, "TextLabel", {
    Name = "Footer",
    Text = "Ui Loaded",
    Size = UDim2.new(1, -24, 0, 18),
    Position = UDim2.new(0, 12, 1, -24),
    BackgroundTransparency = 1,
    TextColor3 = Color3.fromRGB(170,170,180),
    Font = Enum.Font.Gotham,
    TextSize = 12,
    TextXAlignment = Enum.TextXAlignment.Left,
})


local miniIcon = make(screen, "TextButton", {
    Name = "MiniIcon",
    Text = "☰",
    Size = UDim2.new(0, 44, 0, 44),
    Position = UDim2.new(0, 18, 0.82, 0),
    BackgroundColor3 = Color3.fromRGB(32,36,60),
    Visible = false,
})
make(miniIcon, "UICorner", {CornerRadius = UDim.new(0, 8)})
make(miniIcon, "UIStroke", {Color = Color3.fromRGB(200,200,210), Transparency = 0.9, Thickness = 1})


local leftLayout = make(left, "UIListLayout", {Padding = UDim.new(0, 8)})
leftLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
leftLayout.SortOrder = Enum.SortOrder.LayoutOrder


local panels = {}


local function makePanel(menuName, items)
    local panel = make(right, "Frame", {
        Name = menuName .. "_Panel",
        Size = UDim2.new(1, -12, 1, -16),
        Position = UDim2.new(0, 6, 0, 8),
        BackgroundTransparency = 1,
        Visible = false,
    })
    make(panel, "TextLabel", {
        Name = "Heading",
        Text = menuName,
        Size = UDim2.new(1, 0, 0, 26),
        TextColor3 = Color3.fromRGB(240,240,250),
        BackgroundTransparency = 1,
        Font = Enum.Font.GothamSemibold,
        TextSize = 16,
        TextXAlignment = Enum.TextXAlignment.Left,
    })
    local scroller = make(panel, "ScrollingFrame", {
        Name = "Scroller",
        Size = UDim2.new(1, 0, 1, -30),
        Position = UDim2.new(0, 0, 0, 30),
        CanvasSize = UDim2.new(0, 0, 0, 0),
        ScrollBarThickness = 6,
        BackgroundTransparency = 1,
    })
    local list = make(scroller, "UIListLayout", {Padding = UDim.new(0, 8)})

    for i, item in ipairs(items) do
        local btn = make(scroller, "TextButton", {
            Name = "Item_"..i,
            Text = item.name,
            Size = UDim2.new(1, -12, 0, 40),
            Position = UDim2.new(0, 6, 0, 0),
            BackgroundColor3 = Color3.fromRGB(28,30,40),
            Font = Enum.Font.Gotham,
            TextSize = 14,
            TextColor3 = Color3.fromRGB(235,235,240),
        })
        make(btn, "UICorner", {CornerRadius = UDim.new(0, 8)})
        make(btn, "UIStroke", {Color = Color3.fromRGB(160,160,180), Transparency = 0.9, Thickness = 1})

        btn.MouseButton1Click:Connect(function()
            btn.Text = "Loading..."
            spawn(function()
                pcall(function() safeExecute(item.link) end)
                task.wait(0.5)
                btn.Text = item.name
            end)
        end)
    end

    local function updateCanvas()
        local canvas = 0
        for _,c in pairs(scroller:GetChildren()) do
            if c:IsA("TextButton") then
                canvas = canvas + c.Size.Y.Offset + list.Padding.Offset
            end
        end
        scroller.CanvasSize = UDim2.new(0,0,0, canvas + 12)
    end
    scroller.ChildAdded:Connect(function() task.wait(0.05); updateCanvas() end)
    scroller.ChildRemoved:Connect(function() task.wait(0.05); updateCanvas() end)
    updateCanvas()

    panel.Parent = right
    return panel
end


for menuName, items in pairs(MENUS) do
    local leftBtn = make(left, "TextButton", {
        Name = menuName .. "_Btn",
        Text = menuName,
        Size = UDim2.new(1, 0, 0, 44),
        BackgroundColor3 = Color3.fromRGB(35,37,52),
        Font = Enum.Font.GothamSemibold,
        TextSize = 14,
        TextColor3 = Color3.fromRGB(240,240,250),
    })
    make(leftBtn, "UICorner", {CornerRadius = UDim.new(0, 8)})
    make(leftBtn, "UIStroke", {Color = Color3.fromRGB(180,180,200), Transparency = 0.9, Thickness = 1})

    local arrow = make(leftBtn, "TextLabel", {
        Name = "Arrow",
        Text = "⌄",
        Size = UDim2.new(0, 20, 1, 0),
        Position = UDim2.new(1, -26, 0, 0),
        BackgroundTransparency = 1,
        Font = Enum.Font.Gotham,
        TextSize = 14,
        TextColor3 = Color3.fromRGB(200,200,210),
    })

    local panel = makePanel(menuName, items)
    panels[menuName] = panel

    local open = false
    leftBtn.MouseButton1Click:Connect(function()
        TweenService:Create(leftBtn, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(46,48,68)}):Play()
        task.wait(0.12)
        TweenService:Create(leftBtn, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(35,37,52)}):Play()

        for nm, pn in pairs(panels) do
            if pn ~= panel and pn.Visible then
                pn.Visible = false
            end
        end

        open = not open
        panel.Visible = open
        arrow.Text = open and "⌃" or "⌄"
    end)
end


for _,v in pairs(left:GetChildren()) do
    if v:IsA("TextButton") then
        v.MouseEnter:Connect(function()
            TweenService:Create(v, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(46,48,68)}):Play()
        end)
        v.MouseLeave:Connect(function()
            TweenService:Create(v, TweenInfo.new(0.12), {BackgroundColor3 = Color3.fromRGB(35,37,52)}):Play()
        end)
    end
end


local dragging, dragInput, dragStart, startPos
local savedPos = nil
local function getInputPosition(input)
    return Vector2.new(input.Position.X, input.Position.Y)
end

header.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
        dragging = true
        dragStart = getInputPosition(input)
        startPos = main.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
                savedPos = main.Position
            end
        end)
    end
end)

header.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
        dragInput = input
    end
end)

UserInputService.InputChanged:Connect(function(input)
    if input == dragInput and dragging and startPos then
        local delta = getInputPosition(input) - dragStart
        local viewport = workspace.CurrentCamera and workspace.CurrentCamera.ViewportSize or Vector2.new(1920, 1080)
        local absSize = main.AbsoluteSize
        local newX = startPos.X.Offset + delta.X
        local newY = startPos.Y.Offset + delta.Y
        newX = math.clamp(newX, 0, math.max(0, viewport.X - absSize.X))
        newY = math.clamp(newY, 0, math.max(0, viewport.Y - absSize.Y))
        main.Position = UDim2.new(0, newX, 0, newY)
    end
end)


if savedPos then
    main.Position = savedPos
end

-- Minimize & close logic
btnClose.MouseButton1Click:Connect(function() screen:Destroy() end)
btnMin.MouseButton1Click:Connect(function()
    TweenService:Create(main, TweenInfo.new(0.25), {Size = UDim2.new(0, 160, 0, 44)}):Play()
    task.wait(0.25)
    main.Visible = false
    miniIcon.Visible = true
end)
miniIcon.MouseButton1Click:Connect(function()
    main.Visible = true
    miniIcon.Visible = false
    main.Size = UDim2.new(0, 160, 0, 44)
    TweenService:Create(main, TweenInfo.new(0.25), {Size = UDim2.new(0, 420, 0, 340)}):Play()
end)

print("[WataX] UI loaded")
