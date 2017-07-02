local t = Def.ActorFrame{};

if FILEMAN:DoesFileExist("Themes/Random/default.lua") then
t[#t+1] = LoadActor("../../../Random")..{
	OnCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	if song then
		if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'StaticBG') or GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'StaticBG') or song:HasBGChanges() then
		self:diffusealpha(0);
		else
		self:diffusealpha(1);
		end;
		end;
	end;
	CurrentSongChangedMessageCommand=function(self)
	local song = GAMESTATE:GetCurrentSong();
	if song then
		if GAMESTATE:PlayerIsUsingModifier(PLAYER_1,'StaticBG') or GAMESTATE:PlayerIsUsingModifier(PLAYER_2,'StaticBG') or song:HasBGChanges() then
		self:diffusealpha(0);
		else
		self:diffusealpha(1);
		end;
		end;
	end;
	};
end;
	--LoadActor("danger");
t[#t+1] = LoadActor("ScreenFilter");

return t;