local HighlightLibrary = loadstring(game:HttpGet("https://raw.githubusercontent.com/BaconCodesLua/Scripts/refs/heads/main/library/Highlight.lua"))()

local settings = {
    highlightEquipment = false,
    highlightNPCs = true,
    highlightClosets = true,
    highlightPlayers = true
}

local function applyHighlightIfMissing(model, highlightColor)
    if model:IsA("Model") and not model:FindFirstChildOfClass("Highlight") then
        HighlightLibrary.ApplyHighlight(model, {
            DepthMode = Enum.HighlightDepthMode.AlwaysOnTop,
            FillColor = highlightColor,
            FillTransparency = 0.3,
            OutlineColor = highlightColor,
            OutlineTransparency = 0.1
        })
    end
end

local function highlightModelsInFolder(folder, highlightColor)
    for _, item in ipairs(folder:GetChildren()) do
        applyHighlightIfMissing(item, highlightColor)
    end
end

local function highlightPlayers()
    for _, player in ipairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer and player.Character then
            applyHighlightIfMissing(player.Character, Color3.fromRGB(255, 255, 255))
        end
    end
end

while true do
    if settings.highlightEquipment then
        highlightModelsInFolder(workspace.Equipment, Color3.fromRGB(0, 255, 0))
        highlightModelsInFolder(workspace.Van.Equipment, Color3.fromRGB(0, 255, 0))
    end

    if settings.highlightNPCs then
        highlightModelsInFolder(workspace.NPCs, Color3.fromRGB(255, 0, 0))
    end

    if settings.highlightClosets then
        highlightModelsInFolder(workspace.Map.Closets, Color3.fromRGB(0, 255, 255))
    end

    if settings.highlightPlayers then
        highlightPlayers()
    end

    wait(0.5)
end
