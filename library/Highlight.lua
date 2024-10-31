local HighlightLibrary = {}
local RunService = game:GetService("RunService")

local function generateRandomName()
    local characters = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    local name = ""
    for i = 1, 10 do
        local randIndex = math.random(1, #characters)
        name = name .. string.sub(characters, randIndex, randIndex)
    end
    return name
end

function HighlightLibrary.ApplyHighlight(object, options)
    if not object then return end

    local highlight = Instance.new("Highlight")
    highlight.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
    highlight.FillColor = Color3.fromRGB(86, 255, 0)
    highlight.FillTransparency = 0.5
    highlight.OutlineColor = Color3.fromRGB(86, 255, 0)
    highlight.OutlineTransparency = 0

    if options then
        highlight.DepthMode = options.DepthMode or highlight.DepthMode
        highlight.FillColor = options.FillColor or highlight.FillColor
        highlight.FillTransparency = options.FillTransparency or highlight.FillTransparency
        highlight.OutlineColor = options.OutlineColor or highlight.OutlineColor
        highlight.OutlineTransparency = options.OutlineTransparency or highlight.OutlineTransparency
    end

    highlight.Parent = object

    task.spawn(function()
        while highlight.Parent do
            highlight.Name = generateRandomName()
            task.wait(1)
        end
    end)

    return highlight
end

function HighlightLibrary.RemoveHighlight(object)
    if object and object:FindFirstChildOfClass("Highlight") then
        object:FindFirstChildOfClass("Highlight"):Destroy()
    end
end

return HighlightLibrary
