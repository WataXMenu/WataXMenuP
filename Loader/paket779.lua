local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local HttpService = game:GetService("HttpService")
local player = Players.LocalPlayer
local gui = player:WaitForChild("PlayerGui")

if gui:FindFirstChild("iPhoneUI") then gui.iPhoneUI:Destroy() end

local ScreenGui = Instance.new("ScreenGui")
ScreenGui.Name = "iPhoneUI"
ScreenGui.IgnoreGuiInset = true
ScreenGui.ResetOnSpawn = false
ScreenGui.Parent = gui


local mainColor = Color3.fromRGB(140, 80, 255)
local hoverBright = Color3.fromRGB(180, 100, 255)
local bgTrans = 0.35

local function tween(obj, props, dur)
	TweenService:Create(obj, TweenInfo.new(dur or 0.25, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), props):Play()
end


local Phone = Instance.new("Frame")
Phone.Name = "Phone"
Phone.Parent = ScreenGui
Phone.Size = UDim2.new(0, 180, 0, 360)
Phone.Position = UDim2.new(0.5, -90, 0.5, -180)
Phone.AnchorPoint = Vector2.new(0.5, 0.5)
Phone.BackgroundColor3 = Color3.fromRGB(15, 15, 25)
Phone.BackgroundTransparency = bgTrans
Phone.Active, Phone.Draggable = true, true
Instance.new("UICorner", Phone).CornerRadius = UDim.new(0, 30)
local stroke = Instance.new("UIStroke", Phone)
stroke.Thickness = 2
stroke.Color = mainColor
stroke.Transparency = 0.5


local Bar = Instance.new("Frame")
Bar.Parent = Phone
Bar.Size = UDim2.new(1, -20, 0, 18)
Bar.Position = UDim2.new(0, 10, 0, 6)
Bar.BackgroundTransparency = 1
for _, v in ipairs({
	{"WataX", 0},
	{"09:41", 0.35},
	{"🔋100%", 0.72},
}) do
	local L = Instance.new("TextLabel")
	L.Parent = Bar
	L.Size = UDim2.new(0.3, 0, 1, 0)
	L.Position = UDim2.new(v[2], 0, 0, 0)
	L.Text = v[1]
	L.Font = Enum.Font.GothamSemibold
	L.TextSize = 12
	L.BackgroundTransparency = 1
	L.TextColor3 = Color3.fromRGB(220, 200, 255)
end


local Header = Instance.new("Frame")
Header.Parent = Phone
Header.Size = UDim2.new(1, -20, 0, 80)
Header.Position = UDim2.new(0, 10, 0, 28)
Header.BackgroundTransparency = 1

local Logo = Instance.new("ImageLabel")
Logo.Parent = Header
Logo.Size = UDim2.new(0, 60, 0, 60)
Logo.Position = UDim2.new(0.5, -30, 0, 0)
Logo.BackgroundTransparency = 1
Logo.Image = "rbxassetid://7072718362" 
Logo.ScaleType = Enum.ScaleType.Fit

local Name = Instance.new("TextLabel")
Name.Parent = Header
Name.Size = UDim2.new(1, 0, 0, 18)
Name.Position = UDim2.new(0, 0, 1, -16)
Name.BackgroundTransparency = 1
Name.Font = Enum.Font.GothamBold
Name.TextSize = 14
Name.TextColor3 = Color3.fromRGB(255, 255, 255)
Name.Text = player.DisplayName

local Status = Instance.new("TextLabel")
Status.Parent = Header
Status.Size = UDim2.new(1, 0, 0, 16)
Status.Position = UDim2.new(0, 0, 1, 2)
Status.BackgroundTransparency = 1
Status.Font = Enum.Font.GothamSemibold
Status.TextSize = 13
Status.Text = "STATUS : VIP"
Status.TextColor3 = Color3.fromRGB(255, 0, 255)


task.spawn(function()
	local hue = 0
	while task.wait(0.1) do
		hue += 0.02
		if hue > 1 then hue = 0 end
		Status.TextColor3 = Color3.fromHSV(hue, 1, 1)
	end
end)


local apps = {
	{name = "Auto Walk", emoji = "🚶"},
	{name = "Create Walk", emoji = "🧭"},
	{name = "Cheat Menu", emoji = "🛠️"},
	{name = "Fitur Lain", emoji = "✨"},
	{name = "Fix Lag", emoji = "⚡"},
}

local pages = {
	["Auto Walk"] = {
		{text="Mount Atin", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/autoafk.lua"},
        {text="Mount Atin", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m1.lua"},
        {text="Mount Yahayuk", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m2.lua"},
        {text="Mount Kalista", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m12.lua"},
        {text="Mount Daun",  link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m3.lua"},
        {text="Mount Arunika",  link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m4.lua"},
        {text="Mount Lembayana",  link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m6.lua"},
        {text="Mount YNTKTS",  link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m8.lua"},
        {text="Mount Sakahayang",  link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m7.lua"},
        {text="Mount Hana",  link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m9.lua"},
        {text="Mount Stecu",  link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m10.lua"},
        {text="Mount Ckptw",  link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m11.lua"},
        {text="Mount Ravika",  link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m5.lua"},
        {text="Antartika Normal",  link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m14.lua"},
        {text="Mount Salvatore", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m15.lua"},
        {text="Mount Kirey", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m16.lua"},
        {text="Mount Pargoy", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m17.lua"},
        {text="Ekspedisi Kaliya", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m13.lua"},
		{text="Mount Forever", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m18.lua"},
        {text="Mount Mono", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m19.lua"},
        {text="Mount Yareuu", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m20.lua"},
        {text="Mount Serenity", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m21.lua"},
		{text="Mount Pedaunan", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m22.lua"},
        {text="Mount Pengangguran", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m23.lua"},
	    {text="Mount Bingung", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m24.lua"},
        {text="Mount Kawaii", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m25.lua"},
		{text="Mount Runia", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m26.lua"},
        {text="Mount Swiss", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m27.lua"},
		{text="Mount Aneh (hard)", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m28.lua"},
		{text="Mount Lirae", link="https://raw.githubusercontent.com/WataXMenu/WataXFull/refs/heads/main/m29.lua"},
				
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
    },
    ["Fix Lag"] = {
        {text="Potato Mode",  link="https://raw.githubusercontent.com/WataXScript/WataXCheat/main/Loader/Potato.lua"},

    },
}


local AppContainer = Instance.new("Frame")
AppContainer.Parent = Phone
AppContainer.BackgroundTransparency = 1
AppContainer.Size = UDim2.new(1, -14, 0, 200)
AppContainer.Position = UDim2.new(0, 7, 1, -170)

local Grid = Instance.new("UIGridLayout", AppContainer)
Grid.CellSize = UDim2.new(0, 50, 0, 60)
Grid.CellPadding = UDim2.new(0, 8, 0, 6)
Grid.HorizontalAlignment = Enum.HorizontalAlignment.Center
Grid.FillDirectionMaxCells = 4


local Page = Instance.new("Frame")
Page.Parent = Phone
Page.Size = UDim2.new(1, -14, 1, -50)
Page.Position = UDim2.new(0, 7, 0, 20)
Page.BackgroundColor3 = Color3.fromRGB(20, 10, 40)
Page.BackgroundTransparency = bgTrans + 0.1
Instance.new("UICorner", Page).CornerRadius = UDim.new(0, 20)
local pgStroke = Instance.new("UIStroke", Page)
pgStroke.Color = mainColor
pgStroke.Thickness = 1.6
pgStroke.Transparency = 0.4
Page.Visible = false

local Back = Instance.new("TextButton")
Back.Parent = Page
Back.Size = UDim2.new(0, 60, 0, 26)
Back.Position = UDim2.new(0, 10, 0, 8)
Back.Text = "← Back"
Back.BackgroundColor3 = Color3.fromRGB(45, 20, 60)
Back.BackgroundTransparency = 0.3
Back.Font = Enum.Font.Gotham
Back.TextColor3 = Color3.new(1, 1, 1)
Back.TextSize = 14
Instance.new("UICorner", Back).CornerRadius = UDim.new(0, 8)

local Scroll = Instance.new("ScrollingFrame")
Scroll.Parent = Page
Scroll.Size = UDim2.new(1, -20, 1, -60)
Scroll.Position = UDim2.new(0, 10, 0, 40)
Scroll.BackgroundTransparency = 1
Scroll.ScrollBarThickness = 6
Scroll.CanvasSize = UDim2.new(0, 0, 0, 0)
local Layout = Instance.new("UIListLayout", Scroll)
Layout.Padding = UDim.new(0, 8)


Back.MouseButton1Click:Connect(function()
	Page.Visible = false
	AppContainer.Visible = true
	Header.Visible = true
end)


local function openPage(appName)
	for _, c in ipairs(Scroll:GetChildren()) do
		if not c:IsA("UIListLayout") then c:Destroy() end
	end

	local list = pages[appName]
	if list then
		for _, info in ipairs(list) do
			local b = Instance.new("TextButton")
			b.Parent = Scroll
			b.Size = UDim2.new(1, -10, 0, 40)
			b.BackgroundColor3 = Color3.fromRGB(50, 20, 80)
			b.BackgroundTransparency = 0.3
			b.Font = Enum.Font.Gotham
			b.TextSize = 16
			b.TextColor3 = Color3.new(1, 1, 1)
			b.Text = info.text
			Instance.new("UICorner", b).CornerRadius = UDim.new(0, 12)
			local s = Instance.new("UIStroke", b)
			s.Color = mainColor
			s.Transparency = 0.6

			b.MouseEnter:Connect(function() tween(s, {Transparency = 0.1}, 0.15) end)
			b.MouseLeave:Connect(function() tween(s, {Transparency = 0.6}, 0.2) end)
			b.MouseButton1Click:Connect(function()
				local ok, err = pcall(function()
					local code = game:HttpGet(info.link)
					loadstring(code)()
				end)
				if not ok then warn("Error:", err) end
			end)
		end
	end

	task.wait()
	Scroll.CanvasSize = UDim2.new(0, 0, 0, Layout.AbsoluteContentSize.Y + 10)

	AppContainer.Visible = false
	Header.Visible = false
	Page.Visible = true
end


for _, app in ipairs(apps) do
	local Frame = Instance.new("Frame")
	Frame.Parent = AppContainer
	Frame.BackgroundTransparency = 1
	Frame.Size = UDim2.new(0, 50, 0, 60)

	local Btn = Instance.new("TextButton")
	Btn.Parent = Frame
	Btn.Size = UDim2.new(0, 50, 0, 50)
	Btn.BackgroundColor3 = Color3.fromRGB(40, 20, 80)
	Btn.BackgroundTransparency = 0.3
	Btn.Text = ""
	Instance.new("UICorner", Btn).CornerRadius = UDim.new(1, 0)
	local stroke = Instance.new("UIStroke", Btn)
	stroke.Color = mainColor
	stroke.Transparency = 0.6

	local Emo = Instance.new("TextLabel")
	Emo.Parent = Btn
	Emo.Size = UDim2.new(1, 0, 1, 0)
	Emo.BackgroundTransparency = 1
	Emo.Font = Enum.Font.GothamBold
	Emo.TextSize = 22
	Emo.Text = app.emoji
	Emo.TextColor3 = Color3.new(1, 1, 1)

	local Name = Instance.new("TextLabel")
	Name.Parent = Frame
	Name.Size = UDim2.new(1, 0, 0, 12)
	Name.Position = UDim2.new(0, 0, 1, -12)
	Name.BackgroundTransparency = 1
	Name.Font = Enum.Font.Gotham
	Name.TextSize = 10
	Name.TextColor3 = Color3.fromRGB(230, 220, 255)
	Name.TextWrapped = true
	Name.Text = app.name

	Btn.MouseEnter:Connect(function()
		tween(stroke, {Transparency = 0.1}, 0.15)
		tween(Btn, {BackgroundColor3 = hoverBright}, 0.2)
	end)
	Btn.MouseLeave:Connect(function()
		tween(stroke, {Transparency = 0.6}, 0.25)
		tween(Btn, {BackgroundColor3 = Color3.fromRGB(40, 20, 80)}, 0.25)
	end)
	Btn.MouseButton1Click:Connect(function() openPage(app.name) end)
end


local Bar2 = Instance.new("Frame")
Bar2.Parent = Phone
Bar2.Size = UDim2.new(0, 60, 0, 6)
Bar2.Position = UDim2.new(0.5, -30, 1, -18)
Bar2.BackgroundColor3 = mainColor
Bar2.BackgroundTransparency = 0.5
Instance.new("UICorner", Bar2).CornerRadius = UDim.new(1, 0)

local Tap = Instance.new("TextButton")
Tap.Parent = Bar2
Tap.Size = UDim2.new(1, 0, 1, 0)
Tap.BackgroundTransparency = 1
Tap.Text = ""
Tap.MouseButton1Click:Connect(function() Phone.Visible = false end)


local Open = Instance.new("TextButton")
Open.Parent = ScreenGui
Open.Size = UDim2.new(0, 36, 0, 36)
Open.Position = UDim2.new(0.02, 0, 0.85, 0)
Open.BackgroundColor3 = Color3.fromRGB(30, 10, 50)
Open.BackgroundTransparency = 0.4
Open.Text = "📱"
Open.Font = Enum.Font.SourceSansBold
Open.TextSize = 20
Open.TextColor3 = Color3.new(1, 1, 1)
Instance.new("UICorner", Open).CornerRadius = UDim.new(1, 0)
local os = Instance.new("UIStroke", Open)
os.Color = mainColor
os.Transparency = 0.5
Open.MouseButton1Click:Connect(function() Phone.Visible = true end)
