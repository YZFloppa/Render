local Players = game:GetService("Players")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local objs = game:GetObjects("rbxassetid://14033898270")
local import = objs[1]
import.Parent = ReplicatedStorage
local index = {
	{
		name = "wood_sword",
		offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
		model = import:WaitForChild("Wood_Sword"),
	},	
	{
		name = "stone_sword",
		offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
		model = import:WaitForChild("Stone_Sword"),
	},
	{
		name = "iron_sword",
		offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
		model = import:WaitForChild("Iron_Sword"),
	},
	{
		name = "diamond_sword",
		offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
		model = import:WaitForChild("Diamond_Sword"),
	},
	{
		name = "emerald_sword",
		offset = CFrame.Angles(math.rad(0), math.rad(-100), math.rad(-90)),
		model = import:WaitForChild("Emerald_Sword"),
	},
	{
		name = "wood_pickaxe",
		offset = CFrame.Angles(math.rad(0), math.rad(-190), math.rad(-95)),
		model = import:WaitForChild("Wood_Pickaxe"),
	},
	{
		name = "stone_pickaxe",
		offset = CFrame.Angles(math.rad(0), math.rad(-190), math.rad(-95)),
		model = import:WaitForChild("Stone_Pickaxe"),
	},
	{
		name = "iron_pickaxe",
		offset = CFrame.Angles(math.rad(0), math.rad(-190), math.rad(-95)),
		model = import:WaitForChild("Iron_Pickaxe"),
	},
	{
		name = "diamond_pickaxe",
		offset = CFrame.Angles(math.rad(0), math.rad(80), math.rad(-95)),
		model = import:WaitForChild("Diamond_Pickaxe"),
	},	
	{
		name = "wood_axe",
		offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
		model = import:WaitForChild("Wood_Axe"),
	},	
	{
		name = "stone_axe",
		offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
		model = import:WaitForChild("Stone_Axe"),
	},	
	{
		name = "iron_axe",
		offset = CFrame.Angles(math.rad(0), math.rad(-10), math.rad(-95)),
		model = import:WaitForChild("Iron_Axe"),
	},	
	{
		name = "diamond_axe",
		offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(-95)),
		model = import:WaitForChild("Diamond_Axe"),
	},	
	{
		name = "fireball",
		offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
		model = import:WaitForChild("Fireball"),
	},	
	{
		name = "telepearl",
		offset = CFrame.Angles(math.rad(0), math.rad(-90), math.rad(90)),
		model = import:WaitForChild("Telepearl"),
	},
}
shared.SnoopyTexturePack = Workspace.Camera.Viewmodel.ChildAdded:Connect(function(tool)	
	if not tool:IsA("Accessory") then return end	
	for _, v in ipairs(index) do	
		if v.name == tool.Name then		
			for _, part in ipairs(tool:GetDescendants()) do
				if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then				
					part.Transparency = 1
				end			
			end		
			local model = v.model:Clone()
			model.CFrame = tool:WaitForChild("Handle").CFrame * v.offset
			model.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
			model.Parent = tool			
			local weld = Instance.new("WeldConstraint", model)
			weld.Part0 = model
			weld.Part1 = tool:WaitForChild("Handle")			
			local tool2 = Players.LocalPlayer.Character:WaitForChild(tool.Name)			
			for _, part in ipairs(tool2:GetDescendants()) do
				if part:IsA("BasePart") or part:IsA("MeshPart") or part:IsA("UnionOperation") then				
					part.Transparency = 1				
				end			
			end			
			local model2 = v.model:Clone()
			model2.Anchored = false
			model2.CFrame = tool2:WaitForChild("Handle").CFrame * v.offset
			model2.CFrame *= CFrame.Angles(math.rad(0), math.rad(-50), math.rad(0))
			if v.name:match("sword") or v.name:match("blade") then
				model2.CFrame *= CFrame.new(.5, 0, -1.1) - Vector3.new(0, 0, -.3)
			elseif v.name:match("axe") and not v.name:match("pickaxe") and v.name:match("diamond") then
				model2.CFrame *= CFrame.new(.08, 0, -1.1) - Vector3.new(0, 0, -.9)
			elseif v.name:match("axe") and not v.name:match("pickaxe") and not v.name:match("diamond") then
				model2.CFrame *= CFrame.new(-.2, 0, -2.4) + Vector3.new(0, 0, 2.12)
			else
				model2.CFrame *= CFrame.new(.2, 0, -.09)
			end
			model2.Parent = tool2
			local weld2 = Instance.new("WeldConstraint", model)
			weld2.Part0 = model2
			weld2.Part1 = tool2:WaitForChild("Handle")
		end
	end
end)