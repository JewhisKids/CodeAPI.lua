function SeraphFuckWeapon()local a=SeraphFrame.activeController;local b=a.blades[1]if not b then return end;while b.Parent~=game.Players.LocalPlayer.Character do b=b.Parent end;return b end;function getHits(c)local d={}local e=workspace.Enemies:GetChildren()local f=workspace.Characters:GetChildren()for g=1,#e do local h=e[g]local i=h:FindFirstChildOfClass("Humanoid")if i and i.RootPart and i.Health>0 and game.Players.LocalPlayer:DistanceFromCharacter(i.RootPart.Position)<c+15 then table.insert(d,i.RootPart)end end;for g=1,#f do local h=f[g]if h~=game.Players.LocalPlayer.Character then local i=h:FindFirstChildOfClass("Humanoid")if i and i.RootPart and i.Health>0 and game.Players.LocalPlayer:DistanceFromCharacter(i.RootPart.Position)<c+15 then table.insert(d,i.RootPart)end end end;return d end
function Boost()spawn(function()game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(SeraphFuckWeapon()))end)end;function Unboost()spawn(function()game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("unequipWeapon",tostring(SeraphFuckWeapon()))end)end
Attack=function()spawn(function()local a=SeraphFrame.activeController;if a and a.equipped then task.spawn(function()if tick()-cdnormal>0.5 then a:attack()cdnormal=tick()Animation.AnimationId=a.anims.basic[2]Animation.AnimationId=a.anims.basic[2]a.humanoid:LoadAnimation(Animation):Play(2,2)a.humanoid:LoadAnimation(Animation):Play(1,1)game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit",getHits(150),2,"")else Animation.AnimationId=a.anims.basic[2]Animation.AnimationId=a.anims.basic[2]a.humanoid:LoadAnimation(Animation):Play(2,2)a.humanoid:LoadAnimation(Animation):Play(1,1)game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit",getHits(150),2,"")end end)end end)end
tjw1=true;task.spawn(function()local a=game.Players.LocalPlayer;local b=require(a.PlayerScripts.CombatFramework.Particle)local c=require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)if not shared.orl then shared.orl=c.wrapAttackAnimationAsync end;if not shared.cpc then shared.cpc=b.play end;if tjw1 then pcall(function()c.wrapAttackAnimationAsync=function(d,e,f,g,h)local i=c.getBladeHits(e,f,g)if i then b.play=function()end;d:Play(15.25,15.25,15.25)h(i)b.play=shared.cpc;d:Stop()end end end)end end)local j=game.Players.LocalPlayer;local k=require(j.PlayerScripts.CombatFramework.Particle)local l=require(game:GetService("ReplicatedStorage").CombatFramework.RigLib)task.spawn(function()pcall(function()if not shared.orl then shared.orl=l.wrapAttackAnimationAsync end;if not shared.cpc then shared.cpc=k.play end;spawn(function()require(game.ReplicatedStorage.Util.CameraShaker):Stop()game:GetService("RunService").Stepped:Connect(function()l.wrapAttackAnimationAsync=function(a,b,c,d,m)local n=l.getBladeHits(b,c,d)if n then if _G.FastAttack or getgenv().SuperFast then k.play=function()end;a:Play(10.1,9.1,8.1)m(n)k.play=shared.cpc;wait(a.length)a:Play(10.1,9.1,8.1)a:Stop()else m(n)k.play=shared.cpc;wait(a.length)a:Play(10.1,9.1,8.1)a:Stop()end end end end)end)end)end)
spawn(function()while task.wait()do if _G.FastAttack then pcall(function()local a=getupvalues(require(game:GetService("Players").LocalPlayer.PlayerScripts.CombatFramework))[2]a.activeController.hitboxMagnitude=12480;a.activeController.timeToNextAttack=0;a.activeController.attacking=false;a.activeController.increment=3;a.activeController.blocking=false;a.activeController:attack()end)end end end)
local a=game.Players.LocalPlayer;local b=debug.getupvalues(require(a.PlayerScripts.CombatFramework))local c=b[2]function GetCurrentBlade()local d=c.activeController;local e=d.blades[1]if not e then return end;while e.Parent~=game.Players.LocalPlayer.Character do e=e.Parent end;return e end;function AttackNoCD()local f=c.activeController;for g=1,1 do local h=require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(a.Character,{a.Character.HumanoidRootPart},150)local i={}local j={}for k,l in pairs(h)do if l.Parent:FindFirstChild("HumanoidRootPart")and not j[l.Parent]then table.insert(i,l.Parent.HumanoidRootPart)j[l.Parent]=true end end;h=i;if#h>0 then local m=debug.getupvalue(f.attack,5)local n=debug.getupvalue(f.attack,6)local o=debug.getupvalue(f.attack,4)local p=debug.getupvalue(f.attack,7)local q=(m*798405+o*727595)%n;local r=o*798405(function()q=(q*n+r)%1099511627776;m=math.floor(q/n)o=q-m*n end)()p=p+1;debug.setupvalue(f.attack,5,m)debug.setupvalue(f.attack,6,n)debug.setupvalue(f.attack,4,o)debug.setupvalue(f.attack,7,p)pcall(function()for k,l in pairs(f.animator.anims.basic)do l:Play()end end)if a.Character:FindFirstChildOfClass("Tool")and f.blades and f.blades[1]then game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(q/1099511627776*16777215),p)game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit",h,g,"")end end end end
spawn(function()game:GetService("RunService").RenderStepped:Connect(function()if _G.FastAttack==true then game.Players.LocalPlayer.Character.Stun.Value=0;game.Players.LocalPlayer.Character.Humanoid.Sit=false;game.Players.LocalPlayer.Character.Busy.Value=false end end)end)
spawn(function()while task.wait()do pcall(function()if _G.FastAttack then repeat task.wait(1)local a=CbFw2.activeController;for b=1,30 do local c=require(game.ReplicatedStorage.CombatFramework.RigLib).getBladeHits(plr.Character,{plr.Character.HumanoidRootPart},150)local d={}local e={}for f,g in pairs(c)do if g.Parent:FindFirstChild("HumanoidRootPart")and not e[g.Parent]then table.insert(d,g.Parent.HumanoidRootPart)e[g.Parent]=true end end;c=d;if#c>0 then local h=debug.getupvalue(a.attack,5)local i=debug.getupvalue(a.attack,6)local j=debug.getupvalue(a.attack,4)local k=debug.getupvalue(a.attack,7)local l=(h*798405+j*727595)%i;local m=j*798405(function()l=(l*i+m)%1099511627776;h=math.floor(l/i)j=l-h*i end)()k=k+1;debug.setupvalue(a.attack,5,h)debug.setupvalue(a.attack,6,i)debug.setupvalue(a.attack,4,j)debug.setupvalue(a.attack,7,k)pcall(function()if plr.Character:FindFirstChildOfClass("Tool")and a.blades and a.blades[1]then a.animator.anims.basic[1]:Play(0.01,0.01,0.01)game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("weaponChange",tostring(GetCurrentBlade()))game.ReplicatedStorage.Remotes.Validator:FireServer(math.floor(l/1099511627776*16777215),k)game:GetService("ReplicatedStorage").RigControllerEvent:FireServer("hit",c,b,"")end end)end end until not _G.FastAttack end end)end end)
require(game.ReplicatedStorage.Util.CameraShaker):Stop()
