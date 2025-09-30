-- iPhone UI Full Fix – semua tombol muncul
local Players = game:GetService("Players")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer


_G.WataX_Replay = _G.WataX_Replay or false


if not _G.WataX_Replay then
    warn("Replay")
    return
end


local gui = player:WaitForChild("PlayerGui")
if gui:FindFirstChild("iPhoneUI") then gui.iPhoneUI:Destroy() end


local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "iPhoneUI"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = gui

local Phone = Instance.new("Frame")
Phone.Name = "Phone"
Phone.Parent = ScreenGui
Phone.Size = UDim2.new(0,180,0,360)
Phone.Position = UDim2.new(0.5,-90,0.5,-180)
Phone.AnchorPoint = Vector2.new(0.5,0.5)
Phone.BackgroundColor3 = Color3.fromRGB(0,0,0)
Phone.Active,Phone.Draggable = true,true
Instance.new("UICorner",Phone).CornerRadius = UDim.new(0,30)


local Wall = Instance.new("ImageLabel")
Wall.Parent = Phone
Wall.Size = UDim2.new(1,0,1,0)
Wall.Position = UDim2.new(0,0,0,0)
Wall.BorderSizePixel = 0
Wall.BackgroundTransparency = 1
Instance.new("UICorner",Wall).CornerRadius = UDim.new(0,30) 
Wall.Image = "rbxassetid://86094373990161"
Wall.ScaleType = Enum.ScaleType.Fit
Wall.BackgroundTransparency = 0   -- uji
Wall.BackgroundColor3 = Color3.fromRGB(0,0,0)


local Bar = Instance.new("Frame")
Bar.Parent = Phone
Bar.Size = UDim2.new(1,-20,0,18)
Bar.Position = UDim2.new(0,10,0,6)
Bar.BackgroundTransparency = 1
for i,v in ipairs{
    {"WataX",0}, {"09:41",0.35}, {"🔋100%",0.72}
} do
    local L = Instance.new("TextLabel")
    L.Parent = Bar
    L.Size = UDim2.new(0.3,0,1,0)
    L.Position = UDim2.new(v[2],0,0,0)
    L.Text = v[1]
    L.Font = Enum.Font.GothamSemibold
    L.TextSize = 12
    L.BackgroundTransparency = 1
    L.TextColor3 = Color3.new(1,1,1)
end


local apps = {
    {name="Auto Walk", emoji="🚶", color=Color3.fromRGB(52,152,219)},
    {name="Create Walk", emoji="🧭", color=Color3.fromRGB(46,204,113)},
    {name="Cheat Menu", emoji="🛠️", color=Color3.fromRGB(231,76,60)},
    {name="Fitur Lain", emoji="✨", color=Color3.fromRGB(155,89,182)},
    {name="Fix Lag", emoji="⚡", color=Color3.fromRGB(241,196,15)},
    {name="Wallpaper", emoji="🖼️", color=Color3.fromRGB(0,170,255)},
}
local pages = {
    ["Auto Walk"] = {
        {text="BYPASS", link="https://raw.githubusercontent.com/WataXScript/WataXMountAtin/main/Loader/WataX.lua"},
        {text="Mount Atin", link="https://raw.githubusercontent.com/WataXScript/WataXMountAtin/main/Loader/mainmap792.lua"},
        {text="Mount Yahayuk",  link="https://raw.githubusercontent.com/WataXScript/WataXMountYahayuk1/main/Loader/mainmap970.lua"},
        {text="Mount Daun",  link="https://raw.githubusercontent.com/WataXScript/WataXMountDaun/main/Loader/mainmap926.lua"},
        {text="Mount Arunika",  link="https://raw.githubusercontent.com/WataXScript/WataXMountArunika/main/Loader/mainmap991.lua"},
        {text="Mount Lembayana",  link="https://raw.githubusercontent.com/WataXScript/WataXMountLembayana/main/Loader/mainmap772.lua"},
        {text="Mount YNTKTS",  link="https://raw.githubusercontent.com/WataXScript/WataXMount700YntKts/main/Loader/mainmap437.lua"},
        {text="Mount Sakahayang",  link="https://raw.githubusercontent.com/WataXScript/WataXMount977Sakahayang/main/Loader/mainmap925.lua"},
        {text="Mount Hana",  link="https://raw.githubusercontent.com/WataXScript/WataX4007MountHana/main/Loader/mainmap337.lua"},
        {text="Mount Stecu",  link="https://raw.githubusercontent.com/WataXScript/WataXStecuMount43/main/Loader/mainmap672.lua"},
        {text="Mount Ckptw",  link="https://raw.githubusercontent.com/WataXScript/WataXMountCkptw/main/Loader/mainmap691.lua"},
        {text="Mount Ravika",  link="https://raw.githubusercontent.com/WataXScript/WataXMountRavika/main/Loader/mainmap449.lua"},
        {text="Mount Batu",  link="https://raw.githubusercontent.com/WataXScript/WataXMountBatu/main/Loader/mainmap498.lua"},
        {text="Antartika Normal",  link="https://raw.githubusercontent.com/WataXScript/WataXAntartika157/main/Loader/mainmap273.lua"},
    },
    ["Create Walk"] = {
        {text="Menu Create", link="https://raw.githubusercontent.com/WataXScript/CreateAuto/refs/heads/main/Loader/Loader.lua"},
    },
    ["Cheat Menu"] = {
        {text="Fly & Rusuh & Tp",  link="https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/rusuh2.lua"},
        {text="Tp Menu", link="https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/tp.lua"},
        {text="INF Jump", link="https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/infjump.lua"},
    },
    ["Fitur Lain"] = {
        {text="Rollback", link="https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/RB.lua"},
        {text="Auto Respawn", link="https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/afk.lua"},
    },
    ["Fix Lag"] = {
        {text="Potato Mode",  link="https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/Potato.lua"},

    },
    ["Wallpaper"] = {
    {text="Wallpaper 1", action=function() Wall.Image = "rbxassetid://86094373990161" end},
    {text="Wallpaper 2", action=function() Wall.Image = "rbxassetid://108675956620950" end},
    {text="Wallpaper 3", action=function() Wall.Image = "rbxassetid://82001465364029" end},
},
}


local AppContainer = Instance.new("Frame")
AppContainer.Parent = Phone
AppContainer.BackgroundTransparency = 1
AppContainer.Size = UDim2.new(1,-14,0,200)
AppContainer.Position = UDim2.new(0,7,1,-170)
local Grid = Instance.new("UIGridLayout",AppContainer)
Grid.CellSize = UDim2.new(0,50,0,60)
Grid.CellPadding = UDim2.new(0,8,0,6)
Grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
Grid.FillDirectionMaxCells = 4


local Page = Instance.new("Frame")
Page.Parent = Phone
Page.Size = UDim2.new(1,-14,1,-50)
Page.Position = UDim2.new(0,7,0,20)
Page.BackgroundColor3 = Color3.fromRGB(20,20,20)
Page.Visible = false
Instance.new("UICorner",Page).CornerRadius = UDim.new(0,20)


local Back = Instance.new("TextButton")
Back.Parent = Page
Back.Size = UDim2.new(0,60,0,26)
Back.Position = UDim2.new(0,10,0,8)
Back.Text = "← Back"
Back.BackgroundColor3 = Color3.fromRGB(45,45,45)
Back.Font = Enum.Font.Gotham
Back.TextColor3 = Color3.new(1,1,1)
Back.TextSize = 14
Instance.new("UICorner",Back).CornerRadius = UDim.new(0,8)
Back.MouseButton1Click:Connect(function() Page.Visible = false end)


local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = Page
Scroll.Size = UDim2.new(1,-20,1,-60)
Scroll.Position = UDim2.new(0,10,0,40)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 6
Scroll.CanvasSize = UDim2.new(0,0,0,0)

local Layout = Instance.new("UIListLayout")
Layout.Parent = Scroll
Layout.Padding = UDim.new(0,8)
Layout.SortOrder = Enum.SortOrder.LayoutOrder
Layout.FillDirection = Enum.FillDirection.Vertical


local function openPage(appName)
    
    
    for _,child in ipairs(Scroll:GetChildren()) do
        if not child:IsA("UIListLayout") then
            child:Destroy()
        end
    end
    local list = pages[appName]
    if list then
        for _,info in ipairs(list) do
            local b = Instance.new("TextButton")
            b.Parent = Scroll
            b.Size = UDim2.new(1,-10,0,40)
            b.BackgroundColor3 = Color3.fromRGB(40,40,40)
            b.Font = Enum.Font.Gotham
            b.TextSize = 16
            b.TextColor3 = Color3.new(1,1,1)
            b.Text = info.text
            Instance.new("UICorner",b).CornerRadius = UDim.new(0,12)
b.MouseButton1Click:Connect(function()
    if info.action then
        
        info.action()
    elseif info.link then
        
        local ok,err = pcall(function()
            local code = game:HttpGet(info.link)
            if loadstring then loadstring(code)() end
        end)
        if not ok then warn("Error:",err) end
    end
end)
        end
    else
        local lbl = Instance.new("TextLabel")
        lbl.Parent = Scroll
        lbl.Size = UDim2.new(1,-10,0,40)
        lbl.BackgroundTransparency = 1
        lbl.Text = "Belum ada tombol"
        lbl.Font = Enum.Font.Gotham
        lbl.TextSize = 16
        lbl.TextColor3 = Color3.fromRGB(200,200,200)
    end
    task.wait()
    Scroll.CanvasSize = UDim2.new(0,0,0,Layout.AbsoluteContentSize.Y + 10)
    Page.Visible = true
end


for _,app in ipairs(apps) do
    local Frame = Instance.new("Frame")
    Frame.Parent = AppContainer
    Frame.BackgroundTransparency = 1
    Frame.Size = UDim2.new(0,50,0,60)

    local Btn = Instance.new("TextButton")
    Btn.Parent = Frame
    Btn.Size = UDim2.new(0,50,0,50)
    Btn.BackgroundColor3 = app.color
    Btn.Text = ""
    Instance.new("UICorner",Btn).CornerRadius = UDim.new(1,0)

    local Emo = Instance.new("TextLabel")
    Emo.Parent = Btn
    Emo.Size = UDim2.new(1,0,1,0)
    Emo.BackgroundTransparency = 1
    Emo.Font = Enum.Font.GothamBold
    Emo.TextSize = 24
    Emo.Text = app.emoji
    Emo.TextColor3 = Color3.new(1,1,1)

    local Name = Instance.new("TextLabel")
    Name.Parent = Frame
    Name.Size = UDim2.new(1,0,0,12)
    Name.Position = UDim2.new(0,0,1,-12)
    Name.BackgroundTransparency = 1
    Name.Font = Enum.Font.Gotham
    Name.TextSize = 10
    Name.TextColor3 = Color3.new(1,1,1)
    Name.TextWrapped = true
    Name.Text = app.name

    Btn.MouseButton1Click:Connect(function()
        openPage(app.name)
    end)
end


local Bar2 = Instance.new("Frame")
Bar2.Parent = Phone
Bar2.Size = UDim2.new(0,60,0,6)
Bar2.Position = UDim2.new(0.5,-30,1,-18)
Bar2.BackgroundColor3 = Color3.fromRGB(220,220,220)
Instance.new("UICorner",Bar2).CornerRadius = UDim.new(1,0)

local Tap = Instance.new("TextButton")
Tap.Parent = Bar2
Tap.Size = UDim2.new(1,0,1,0)
Tap.BackgroundTransparency = 1
Tap.Text = ""
Tap.MouseButton1Click:Connect(function() Phone.Visible = false end)

local Open = Instance.new("TextButton")
Open.Parent = ScreenGui
Open.Size = UDim2.new(0,36,0,36)
Open.Position = UDim2.new(0.02,0,0.85,0)
Open.BackgroundColor3 = Color3.fromRGB(30,30,30)
Open.Text = "📱"
Open.Font = Enum.Font.SourceSansBold
Open.TextSize = 20
Open.TextColor3 = Color3.new(1,1,1)
Instance.new("UICorner",Open).CornerRadius = UDim.new(1,0)
Open.MouseButton1Click:Connect(function() Phone.Visible = true end)

_G.WataX_Replay = false