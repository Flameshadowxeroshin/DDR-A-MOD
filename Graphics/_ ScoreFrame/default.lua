local t = Def.ActorFrame{};

--P1 ScoreFrame
if GAMESTATE:IsPlayerEnabled(PLAYER_1) then
	t[#t+1] = LoadActor("normal")..{
		InitCommand=cmd(x,SCREEN_LEFT+198;y,SCREEN_CENTER_Y+295;zoom,1.5);
	}
end

--P2 ScoreFrame
if GAMESTATE:IsPlayerEnabled(PLAYER_2) then
	t[#t+1] = LoadActor("normal")..{
		InitCommand=cmd(x,SCREEN_RIGHT-198;y,SCREEN_CENTER_Y+295;rotationy,180;zoom,1.5;);
	}
end

return t