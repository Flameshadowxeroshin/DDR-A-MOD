--[[
This script was taken from KENp's DDR X2 theme
and was recoded by FlameyBoy and Inorizushi
]]--

local ProfileInfoCache = {}
setmetatable(ProfileInfoCache, {__index =
function(table, ind)
    local out = {}
    local prof = PROFILEMAN:GetLocalProfileFromIndex(ind-1)
    out.SongsAndCoursesPercentCompleteAllDifficultiesSingle = prof:GetSongsAndCoursesPercentCompleteAllDifficulties('StepsType_Dance_Single')
    out.SongsAndCoursesPercentCompleteAllDifficultiesDouble = prof:GetSongsAndCoursesPercentCompleteAllDifficulties('StepsType_Dance_Double')
    out.TotalCaloriesBurned = prof:GetTotalCaloriesBurned()
    out.CaloriesBurnedToday = prof:GetCaloriesBurnedToday()
    out.LastPlayedSong = prof:GetLastPlayedSong()
    out.DisplayName = prof:GetDisplayName()
    out.NumTotalSongsPlayed = prof:GetNumTotalSongsPlayed()
    out.UserTable = prof:GetUserTable()
    rawset(table, ind, out)
    return out
end
})

function GetLocalProfiles()
	local t = {};

	for p = 0,PROFILEMAN:GetNumLocalProfiles()-1 do
		local profile=PROFILEMAN:GetLocalProfileFromIndex(p);
		local ProfileCard = Def.ActorFrame {

			LoadFont("_dfphsgothic-w9") .. {
				Text=profile:GetDisplayName();
				InitCommand=cmd(maxwidth,150;diffusealpha,0.3;shadowlength,1;y,-10;zoomx,0.8;zoomy,0.8;ztest,true);
				OffCommand=cmd(linear,0.3;zoomy,0;diffusealpha,0);
			};
			LoadFont("_dfghsgothic-w7") .. {
				InitCommand=cmd(maxwidth,150;diffusealpha,0.3;shadowlength,1;y,8;zoom,0.5;vertspacing,-8;ztest,true);
				BeginCommand=function(self)
					local numSongsPlayed = profile:GetNumTotalSongsPlayed();
					local s = numSongsPlayed == 1 and "Song" or "Songs";
					local numLevel =  math.ceil(numSongsPlayed);
					-- todo: localize
					--self:settext( numSongsPlayed.." "..s.." Played" );
					self:settext("TOTAL STAGES: "..numLevel);
				end;
				OffCommand=cmd(linear,0.3;zoomy,0;diffusealpha,0);
			};

		};
		t[#t+1]=ProfileCard;
	end;


	return t;
end;

--�d�����e����---------------------------
function LoadCard(cColor,cColor2,Player,IsJoinFrame)
	local t = Def.ActorFrame {
		LoadActor( THEME:GetPathG("ScreenSelectProfile","CardBackground") ) .. {
			InitCommand=cmd(shadowlength,0;zoomy,0;diffuse,cColor);
			OnCommand=cmd(sleep,0.3;linear,0.3;zoomy,1;);
			OffCommand=function(self)
				if IsJoinFrame then
					(cmd(sleep,0.5;linear,0.2;zoomy,0.100;diffusealpha,0))(self);
				else
					(cmd(linear,0.2;zoomy,0.100;diffusealpha,0))(self);
				end
			end;
		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","LvBackground") ) .. {
			InitCommand=cmd(shadowlength,0;zoom,0;y,-40;x,-90;diffuse,cColor2);
			OnCommand=cmd(sleep,0.3;linear,0.3;zoom,1;);
			OffCommand=cmd(linear,0.02;zoom,0.100;diffusealpha,0);
		};

		LoadActor( THEME:GetPathG("ScreenSelectProfile","LvWord") ) .. {
			InitCommand=cmd(shadowlength,0;zoom,0;y,-10;x,-90;diffuse,cColor2);
			OnCommand=cmd(sleep,0.3;linear,0.3;zoom,1;);
			OffCommand=cmd(linear,0.02;zoom,0.100;diffusealpha,0);
		};

		-- LoadActor( THEME:GetPathG("ScreenSelectProfile","BestWord") ) .. {
			-- InitCommand=cmd(shadowlength,0;zoom,0;y,-40;x,-12;diffuse,cColor2;);
			-- OnCommand=cmd(sleep,0.3;linear,0.3;zoom,0.8;playcommand,"Animate");
			-- OffCommand=cmd(stoptweening;linear,0.02;zoom,0.100;diffusealpha,0);
			-- AnimateCommand=cmd(sleep,2;smooth,0.05;rotationz,10;smooth,0.05;rotationz,-10;smooth,0.05;rotationz,0;queuecommand,"Animate");
		-- };


		LoadActor( THEME:GetPathG("ScreenSelectProfile","DancerNameWord") ) .. {
			InitCommand=cmd(shadowlength,0;zoom,0;y,-165;x,-69;diffuse,cColor2;);
			OnCommand=cmd(sleep,0.3;linear,0.3;zoom,0.8;playcommand,"Animate");
			OffCommand=cmd(stoptweening;linear,0.02;zoom,0.100;diffusealpha,0);
			AnimateCommand=cmd(sleep,2;smooth,0.1;zoomx,0.85;smooth,0.1;zoomx,0.8;queuecommand,"Animate");
		};

		-- LoadActor( THEME:GetPathG("ScreenSelectProfile","TotalStagesWord") ) .. {
			-- InitCommand=cmd(shadowlength,0;zoom,0;y,-115;x,-69;diffuse,cColor2;);
			-- OnCommand=cmd(sleep,0.3;linear,0.3;zoom,0.8;playcommand,"Animate");
			-- OffCommand=cmd(stoptweening;linear,0.02;zoom,0.100;diffusealpha,0);
			-- AnimateCommand=cmd(sleep,2;smooth,0.1;zoomx,0.85;smooth,0.1;zoomx,0.8;queuecommand,"Animate");
		-- };

		LoadActor( THEME:GetPathG("ScreenSelectProfile","AbilityLevelWord") ) .. {
			InitCommand=cmd(shadowlength,0;zoom,0;y,-115;x,-69;diffuse,cColor2;);
			OnCommand=cmd(sleep,0.3;linear,0.3;zoom,0.8;playcommand,"Animate");
			OffCommand=cmd(stoptweening;linear,0.02;zoom,0.100;diffusealpha,0);
			AnimateCommand=cmd(sleep,2;smooth,0.1;zoomx,0.85;smooth,0.1;zoomx,0.8;queuecommand,"Animate");
		};

		LoadActor( THEME:GetPathG("ScreenSelectProfile","DDR-CodeWord") ) .. {
			InitCommand=cmd(shadowlength,0;zoom,0;y,-90;x,-69;diffuse,cColor2;);
			OnCommand=cmd(sleep,0.3;linear,0.3;zoom,0.8;playcommand,"Animate");
			OffCommand=cmd(stoptweening;linear,0.02;zoom,0.100;diffusealpha,0);
			AnimateCommand=cmd(sleep,2;smooth,0.1;zoomx,0.85;smooth,0.1;zoomx,0.8;queuecommand,"Animate");
		};

			--�W�U�ج[------------
		LoadActor( THEME:GetPathG("ScreenSelectProfile","CardFrameA") )..{
			Name = "Frame";
			InitCommand=cmd(x,-3;y,0;zoom,0);
			OnCommand=cmd(linear,0.3;zoom,0.82;linear,0.3;y,-186);
			OffCommand=function(self)
				if IsJoinFrame then
					(cmd(sleep,0.5;linear,0.2;y,0.100;linear,0.2;diffusealpha,0))(self);
				else
					(cmd(linear,0.2;y,0.100;linear,0.2;diffusealpha,0))(self);
				end
			end;

		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","CardFrameA") )..{
			Name = "Frame";
			InitCommand=cmd(x,-3;y,0;zoom,0);
			OnCommand=cmd(linear,0.3;zoom,0.82;linear,0.3;y,186);
			OffCommand=function(self)
				if IsJoinFrame then
					(cmd(sleep,0.5;linear,0.2;y,0.100;linear,0.2;diffusealpha,0))(self);
				else
					(cmd(linear,0.2;y,0.100;linear,0.2;diffusealpha,0))(self);
				end
			end;
		};

	};

	return t
end



function SetRank02(Rank02, minValue)

	if minValue >=1.98 then
		Rank02 = "True God";
	elseif minValue >=1.80 then
		Rank02 = "Dazu God";
	elseif minValue >=1.60 then
		Rank02 = "God";
	elseif minValue >=1.40 then
		Rank02 = "Deity";
	elseif minValue >=1.20 then
		Rank02 = "Phoenix";
	elseif minValue >=1.00 then
		Rank02 = "Dragon";
	elseif minValue >=0.85 then
		Rank02 = "Emperor";
	elseif minValue >=0.70 then
		Rank02 = "King";
	elseif minValue >=0.55 then
		Rank02 = "Shogun";
	elseif minValue >=0.40 then
		Rank02 = "Noble";
	elseif minValue >=0.30 then
		Rank02 = "Knight";
	elseif minValue >=0.20 then
		Rank02 = "Samurai";
	elseif minValue >=0.10 then
		Rank02 = "Warrior";
	elseif minValue >0 then
		Rank02 = "Beginner";
	else
		Rank02 = "???";

	end

	return Rank02;
end


function SetRankFromRadarValue(selectRank, SingleTable, DoubleTable)
	local Rank01;
	local Rank02 = "123";

	local singleMax = math.max(SingleTable[1],SingleTable[2],SingleTable[3],SingleTable[4],SingleTable[5]);
	local doubleMax = math.max(DoubleTable[1],DoubleTable[2],DoubleTable[3],DoubleTable[4],DoubleTable[5]);
	local singleMin = math.min(SingleTable[1],SingleTable[2],SingleTable[3],SingleTable[4],SingleTable[5]);
	local doubleMin = math.min(DoubleTable[1],DoubleTable[2],DoubleTable[3],DoubleTable[4],DoubleTable[5]);

	local totalMax = math.max(SingleTable[1],SingleTable[2],SingleTable[3],SingleTable[4],SingleTable[5],
								DoubleTable[1],DoubleTable[2],DoubleTable[3],DoubleTable[4],DoubleTable[5]);

	-- local totalMin = math.min(SingleTable[1],SingleTable[2],SingleTable[3],SingleTable[4],SingleTable[5],
								-- DoubleTable[1],DoubleTable[2],DoubleTable[3],DoubleTable[4],DoubleTable[5]);

	if totalMax == SingleTable[1] or totalMax==DoubleTable[1] then
		Rank01 = "Stream";
	elseif totalMax == SingleTable[2] or totalMax==DoubleTable[2] then
		Rank01 = "Voltage";
	elseif totalMax == SingleTable[3] or totalMax==DoubleTable[3] then
		Rank01 = "Air";
	elseif totalMax == SingleTable[4] or totalMax==DoubleTable[4] then
		Rank01 = "Freeze";
	else
		Rank01 = "Chaos";
	end

	if (totalMax == SingleTable[1] or
		totalMax == SingleTable[2] or
		totalMax == SingleTable[3] or
		totalMax == SingleTable[4] or
		totalMax == SingleTable[5]) then

		Rank02 = SetRank02(Rank02,singleMin);
	else
		Rank02 = SetRank02(Rank02,doubleMin);
	end

	if Rank02 == "???" then
		Rank01 ="???"
	end

	selectRank:settext(Rank01.." ".. Rank02);
end;


function LoadPlayerStuff(Player)

	local t = {};
	local pn = (Player == PLAYER_1) and 1 or 2;


	t[#t+1] = Def.ActorFrame {
		Name = 'JoinFrame';
		LoadCard(Color('Outline'),color('0,0,0,0'),Player,true);

		-- LoadFont("_dfghsgothic-w7") .. {
			-- Text="Press &START; to join.";
			-- InitCommand=cmd(shadowlength,1);
			-- OnCommand=cmd(diffuseshift;effectcolor1,Color('White');effectcolor2,color("0.5,0.5,0.5"));
			-- OffCommand=cmd(linear,0.3;zoomy,0;diffusealpha,0);
		-- };

		LoadActor( THEME:GetPathG("ScreenSelectProfile","Start") ) .. {
			InitCommand=cmd(zoomy,0;diffuseshift;effectcolor1,Color('White');effectcolor2,color("#A5A6A5");playcommand,"Animate");
			OnCommand=cmd(zoomy,0;sleep,0.5;linear,0.1;zoomy,1);
			AnimateCommand=cmd(smooth,0.1;zoomx,1.05;smooth,0.1;zoomx,1.0;queuecommand,"Animate");
			OffCommand=cmd(sleep,0.5;linear,0.1;zoomy,0;diffusealpha,0);
		};

	};

	t[#t+1] = Def.ActorFrame {
		Name = 'BigFrame';
		LoadCard(PlayerColor(),color('1,1,1,1'),Player,false);
	};
	t[#t+1] = Def.ActorFrame {
		Name = 'SmallFrame';
		InitCommand=cmd(y,96);

		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(zoomto,40,30;x,40;y,-70);
			OnCommand=cmd(diffusealpha,0;sleep,0.5;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(zoomto,40,30;x,-90;y,-40);
			OnCommand=cmd(diffusealpha,0;sleep,0.6;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(zoomto,40,30;x,-80;y,30);
			OnCommand=cmd(diffusealpha,0;sleep,0.7;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(zoomto,40,30;x,80;y,30);
			OnCommand=cmd(diffusealpha,0;sleep,0.8;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};
		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarValueBack") )..{
			InitCommand=cmd(zoomto,40,30;x,90;y,-40);
			OnCommand=cmd(diffusealpha,0;sleep,0.9;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.1;zoomy,0;diffusealpha,0);
		};

		LoadActor( THEME:GetPathG("ScreenSelectProfile","MyGrooveRadarBack") )..{
			InitCommand=cmd(zoom,0.8;y,-5);
			OnCommand=cmd(diffusealpha,0;sleep,0.9;linear,0.2;diffusealpha,1);
			OffCommand=cmd(linear,0.01;zoom,0;diffusealpha,0);
		};

		-- Def.Quad {
			-- InitCommand=cmd(zoomto,250-10,40+2);
			-- OnCommand=cmd(diffuse,Color('Black');diffusealpha,0.5;fadeleft,0.25;faderight,0.25;);
			-- OffCommand=cmd(linear,0.3;zoomy,0;diffusealpha,0);
		-- };
		-- Def.Quad {
			-- InitCommand=cmd(zoomto,250-10,40);
			-- OnCommand=cmd(diffuse,PlayerColor(Player);fadeleft,0.25;faderight,0.25;glow,color("1,1,1,0.25"));
			-- OffCommand=cmd(linear,0.3;zoomy,0;diffusealpha,0);
		-- };
		-- Def.Quad {
			-- InitCommand=cmd(zoomto,250-10,40;y,-40/2+20);
			-- OnCommand=cmd(diffuse,Color("Black");fadebottom,1;fadeleft,0.25;faderight,0.25;diffusealpha,0.35);
			-- OffCommand=cmd(linear,0.3;zoomy,0;diffusealpha,0);
		-- };
		-- Def.Quad {
			-- InitCommand=cmd(zoomto,250-10,1;y,-40/2+1);
			-- OnCommand=cmd(diffuse,PlayerColor(Player);glow,color("1,1,1,0.25");fadeleft,0.25;faderight,0.25;);
			-- OffCommand=cmd(linear,0.3;zoomy,0;diffusealpha,0);
		-- };
	};
	t[#t+1] = Def.ActorScroller{
		Name = 'Scroller';
		NumItemsToDraw=1;

		OnCommand=cmd(draworder,1000;y,96;SetFastCatchup,true;SetMask,0,58;SetSecondsPerItem,0.15);
		TransformFunction=function(self, offset, itemIndex, numItems)
			local focus = scale(math.abs(offset),0,2,1,0);
			self:visible(false);
			self:y(math.floor( offset*40 ));

		end;
		children = GetLocalProfiles();
		OffCommand=cmd(linear,0.3;zoomy,0;diffusealpha,0);
	};


	t[#t+1] = Def.ActorFrame {
		Name = "EffectFrame";
	};

	--�U���d��-----------------
	-- t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile","PlayerNameCard") )..{
		-- Name = "Frame";
		-- InitCommand=cmd(y,160;zoomx,0);
		-- OnCommand=cmd(sleep,0.3;linear,0.3;zoomx,1);
		-- OffCommand=cmd(sleep,0.5;linear,0.2;zoomx,0.03;diffusealpha,0.5;sleep,0.1;diffusealpha,0);

	-- };


	-- t[#t+1] = LoadFont("_dfphsgothic-w9") .. {
		-- Text="Player Name";
		-- InitCommand=cmd(diffusealpha,0;zoom,0.5;x,-70;y,135;shadowlength,1;diffuse,color("1,1,0.3,0"));
		-- OnCommand=cmd(sleep,0.5;linear,0.3;diffusealpha,1);
		-- OffCommand=cmd(linear,0.3;zoomy,0;diffusealpha,0);
	-- };


	t[#t+1] = LoadFont("_sveningsson Bold 60px") .. {
		Name = 'SelectedProfileText';
		InitCommand=cmd(horizalign,left;x,-102;y,-142;zoom,0.4;shadowlength,1;diffuse,color("1,1,1,0");strokecolor,Color("Outline");maxwidth,400);
		OnCommand=cmd(sleep,0.8;linear,0.5;diffusealpha,1);
		OffCommand=cmd(stoptweening;linear,0.01;zoomy,0;diffusealpha,0);
	};

	t[#t+1] = LoadFont("_sveningsson Bold 60px") .. {
		Name = 'SelectedProfileLevel';
		InitCommand=cmd(x,-92;y,-44;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("0.1,1,0.1,1");strokecolor,Color("Outline");maxwidth,50);
		OnCommand=cmd(sleep,0.7;linear,0.05;diffusealpha,1;zoomy,0.8;zoomx,1;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};

	t[#t+1] = LoadFont("_sveningsson Bold 60px") .. {
		Name = 'selectedTotalCaloriesBurned';
		InitCommand=cmd(x,67;y,-42;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,350);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.25;zoomx,0.2;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};

	t[#t+1] = LoadFont("_sveningsson Bold 60px") .. {
		Name = 'selectSongsPlayed';
		InitCommand=cmd(x,50;y,-112;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,150);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.3;zoomx,0.4;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};

	t[#t+1] = LoadFont("_sveningsson Bold 60px") .. {
		Name = 'selectHonorName';
		InitCommand=cmd(horizalign,center;skewx,-0.35;x,50;y,-115;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.8,1");strokecolor,Color("Outline");maxwidth,200);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.3;zoomx,0.3;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};



	t[#t+1] = Def.Sprite{
		Name = 'selectedMostSongPlayed';
		InitCommand=cmd(x,65;y,-32;zoom,0;scaletoclipped,0,0;);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;diffuse,color("1,1,1,1");scaletoclipped,40,40;);
		OffCommand=cmd(stoptweening;linear,0.1;scaletoclipped,0,0;);
	};

		t[#t+1] = Def.Sprite{
		Name = 'selectedHonorPic';
		InitCommand=cmd(x,75;y,-149;zoom,0;scaletoclipped,0,0;);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;scaletoclipped,50,50;);
		OffCommand=cmd(stoptweening;linear,0.1;scaletoclipped,0,0;);
	};

	t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile","LvBar") ) .. {
			Name = 'selectLvBarBack';
			InitCommand=cmd(diffusealpha,0;y,0;x,-4);
			OnCommand=cmd(sleep,0.3;linear,0.3;diffusealpha,1;diffuse,color("0.4,0.4,0.4,1"));
			OffCommand=cmd(stoptweening;linear,0.02;zoom,0.100;diffusealpha,0);

	};

	t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile","LvBar") ) .. {
			Name = 'selectLvBar';
			InitCommand=cmd(diffusealpha,0;y,0;x,-4;cropright,1);
			OnCommand=cmd(sleep,0.3;linear,0.3;diffusealpha,1;);
			OffCommand=cmd(stoptweening;linear,0.02;zoom,0.100;diffusealpha,0);

		};


	t[#t+1]=LoadFont("_sveningsson Bold 60px") .. {
		Name = 'selectTotalAttackrateWord';
		InitCommand=cmd(x,-10;y,-62;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,320);
		OnCommand=function(self)
			self:settext("Achievement / ");
			(cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.15;zoomx,0.25))(self);
		end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};

	t[#t+1] = LoadFont("_sveningsson Bold 60px") .. {
		Name = 'selectPercentComplete';
		InitCommand=cmd(x,65;y,-62;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,220);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.3;zoomx,0.35;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	t[#t+1]=LoadFont("_sveningsson Bold 60px") .. {
		Name = 'selectTotalCalWord';
		InitCommand=cmd(x,-10;y,-42;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.1,1");strokecolor,Color("Outline");maxwidth,320);
		OnCommand=function(self)
			self:settext("Today Burned / ");
			(cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.15;zoomx,0.25))(self);
		end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	t[#t+1]=LoadFont("_sveningsson Bold 60px") .. {
		Name = 'selectRank';
		InitCommand=cmd(x,20;y,-20;skewx,-0.35;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,350);
		OnCommand=function(self)
			(cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.25;zoomx,0.25))(self);
		end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};

	t[#t+1] = LoadFont("_sveningsson Bold 60px") .. {
		Name = 'selectPlayerUID';
		InitCommand=cmd(x,40;y,-90;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,color("1,1,0.9,1");strokecolor,Color("Outline");maxwidth,420);
		OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,0.22;zoomx,0.27;);
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};




	t[#t+1] =LoadFont("_compacta blk bt 14px") .. {
		InitCommand=cmd(x,0;y,-185;zoom,0;diffuse,color("1,1,1,1");strokecolor,Color("Outline");maxwidth,270;shadowlength,3);
		OnCommand=function(self)
			if Player== PLAYER_1 then
				self:settext("PLAYER:1");
				self:diffuse(ColorLightTone(PlayerColor(PLAYER_1)));
			else
				self:settext("PLAYER:2");
				self:diffuse(PlayerColor(PLAYER_2));
			end
			(cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoomy,1;zoomx,1.35))(self);
		end;
		OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
	};
	------MyGrooveRadar
	if (Player == PLAYER_1) then
		t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile", "GrooveRadar" ),1,0.2,0.2,0.2,0.5,PLAYER_1,'single')..{
			Name = "GVRD1S";
			InitCommand=cmd(x,0;y,99;zoom,0.56;diffusealpha,0;diffuse,PlayerColor(PLAYER_1));
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
			OffCommand=cmd(linear,0.05;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_S1';
			InitCommand=cmd(horizalign,right;x,40+17;y,18;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_S2';
			InitCommand=cmd(horizalign,right;x,-90+17;y,48;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_S3';
			InitCommand=cmd(horizalign,right;x,-80+17;y,118;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_S4';
			InitCommand=cmd(horizalign,right;x,80+17;y,118;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_S5';
			InitCommand=cmd(horizalign,right;x,90+17;y,48;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};

		t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile", "GrooveRadar" ),1,0.2,0.2,0.2,0.5,PLAYER_1, 'double')..{
			Name = "GVRD1D";
			InitCommand=cmd(x,0;y,99;zoom,0.56;diffusealpha,0;diffuse,PlayerColor(PLAYER_2));
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
			OffCommand=cmd(linear,0.05;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_D1';
			InitCommand=cmd(horizalign,right;x,40+17;y,18+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_D2';
			InitCommand=cmd(horizalign,right;x,-90+17;y,48+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_D3';
			InitCommand=cmd(horizalign,right;x,-80+17;y,118+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_D4';
			InitCommand=cmd(horizalign,right;x,80+17;y,118+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD1Value_D5';
			InitCommand=cmd(horizalign,right;x,90+17;y,48+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};



	else
		t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile", "GrooveRadar" ),1,0.2,0.2,0.2,0.5,PLAYER_2,'single')..{
			Name = "GVRD2S";
			InitCommand=cmd(x,0;y,99;zoom,0.56;diffusealpha,0;diffuse,PlayerColor(PLAYER_1));
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
			OffCommand=cmd(linear,0.05;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_S1';
			InitCommand=cmd(horizalign,right;x,40+17;y,18;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_S2';
			InitCommand=cmd(horizalign,right;x,-90+17;y,48;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_S3';
			InitCommand=cmd(horizalign,right;x,-80+17;y,118;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_S4';
			InitCommand=cmd(horizalign,right;x,80+17;y,118;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_S5';
			InitCommand=cmd(horizalign,right;x,90+17;y,48;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_1);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};

		t[#t+1] = LoadActor( THEME:GetPathG("ScreenSelectProfile", "GrooveRadar" ),1,0.2,0.2,0.2,0.5,PLAYER_2, 'double')..{
			Name = "GVRD2D";
			InitCommand=cmd(x,0;y,99;zoom,0.56;diffusealpha,0;diffuse,PlayerColor(PLAYER_2));
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;);
			OffCommand=cmd(linear,0.05;diffusealpha,0);
		};

		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_D1';
			InitCommand=cmd(horizalign,right;x,40+17;y,18+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_D2';
			InitCommand=cmd(horizalign,right;x,-90+17;y,48+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_D3';
			InitCommand=cmd(horizalign,right;x,-80+17;y,118+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_D4';
			InitCommand=cmd(horizalign,right;x,80+17;y,118+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};
		t[#t+1]=LoadFont("_russellsquare 32px") .. {
			Name = 'GVRD2Value_D5';
			InitCommand=cmd(horizalign,right;x,90+17;y,48+14;zoom,0;diffuse,color("1,1,1,1");diffusebottomedge,PlayerColor(PLAYER_2);strokecolor,Color("Outline");maxwidth,220);
			OnCommand=cmd(sleep,0.9;linear,0.05;diffusealpha,1;zoom,0.35);
			OffCommand=cmd(stoptweening;linear,0.1;zoomy,0;diffusealpha,0);
		};

	end;



	return t;
end;

function UpdateInternal3(self, Player)
	local pn = (Player == PLAYER_1) and 1 or 2;
	local frame = self:GetChild(string.format('P%uFrame', pn));
	local scroller = frame:GetChild('Scroller');
	local seltext = frame:GetChild('SelectedProfileText');
	local joinframe = frame:GetChild('JoinFrame');
	local smallframe = frame:GetChild('SmallFrame');
	local bigframe = frame:GetChild('BigFrame');
	local selLevel = frame:GetChild('SelectedProfileLevel');
	local selTotalCalWord = frame:GetChild('selectTotalCalWord');
	local selTotalCaloriesBurned = frame:GetChild('selectedTotalCaloriesBurned');
	local selectRank = frame:GetChild('selectRank');
	local selectPlayerUID = frame:GetChild('selectPlayerUID');
	local selMostSongPlayed = frame:GetChild('selectedMostSongPlayed');
	local selHonorPic = frame:GetChild('selectedHonorPic');
	local selHonorName = frame:GetChild('selectHonorName');
	local selSongsPlayed = frame:GetChild('selectSongsPlayed');
	local selLvBarBack = frame:GetChild('selectLvBarBack');
	local selLvBar = frame:GetChild('selectLvBar');
	local selPercentComplete = frame:GetChild('selectPercentComplete');
	local selTotalAttackrateWord = frame:GetChild('selectTotalAttackrateWord');
	--MyGrooveRadar
	local selPlayerUID;
	local selGVRDSingle = (Player == PLAYER_1) and frame:GetChild('GVRD1S') or frame:GetChild('GVRD2S');
	local selGVRDDouble = (Player == PLAYER_1) and frame:GetChild('GVRD1D') or frame:GetChild('GVRD2D');
	local selGVRDValue_S1 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_S1') or frame:GetChild('GVRD2Value_S1');
	local selGVRDValue_S2 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_S2') or frame:GetChild('GVRD2Value_S2');
	local selGVRDValue_S3 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_S3') or frame:GetChild('GVRD2Value_S3');
	local selGVRDValue_S4 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_S4') or frame:GetChild('GVRD2Value_S4');
	local selGVRDValue_S5 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_S5') or frame:GetChild('GVRD2Value_S5');
	local selGVRDValue_D1 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_D1') or frame:GetChild('GVRD2Value_D1');
	local selGVRDValue_D2 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_D2') or frame:GetChild('GVRD2Value_D2');
	local selGVRDValue_D3 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_D3') or frame:GetChild('GVRD2Value_D3');
	local selGVRDValue_D4 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_D4') or frame:GetChild('GVRD2Value_D4');
	local selGVRDValue_D5 = (Player == PLAYER_1) and frame:GetChild('GVRD1Value_D5') or frame:GetChild('GVRD2Value_D5');


	local PcntLarger;
	--local selMostCoursePlayed = frame:GetChild('selectedMostCoursePlayed');
	if GAMESTATE:IsHumanPlayer(Player) then
		frame:visible(true);
		if MEMCARDMAN:GetCardState(Player) == 'MemoryCardState_none' then
			--using profile if any
			joinframe:visible(false);
			smallframe:visible(true);
			bigframe:visible(false);
			seltext:visible(true);
			selectPlayerUID:visible(true);
			scroller:visible(true);
			selLevel:visible(true);
			selTotalCalWord:visible(true);
			selTotalCaloriesBurned:visible(true);
			selectRank:visible(true);
			selMostSongPlayed:visible(false);
			selSongsPlayed:visible(false);
			selHonorPic:visible(true);
			selHonorName:visible(true);
			selLvBarBack:visible(true);
			selLvBar:visible(true);
			selPercentComplete:visible(true);
			selTotalAttackrateWord:visible(true);
			selGVRDSingle:visible(true);
			selGVRDDouble:visible(true);
			selGVRDValue_S1:visible(true);
			selGVRDValue_S2:visible(true);
			selGVRDValue_S3:visible(true);
			selGVRDValue_S4:visible(true);
			selGVRDValue_S5:visible(true);
			selGVRDValue_D1:visible(true);
			selGVRDValue_D2:visible(true);
			selGVRDValue_D3:visible(true);
			selGVRDValue_D4:visible(true);
			selGVRDValue_D5:visible(true);

			local ind = SCREENMAN:GetTopScreen():GetProfileIndex(Player);


			if ind > 0 then
				local profile = PROFILEMAN:GetLocalProfileFromIndex(ind-1);
				local PcntCompleteSingle = ProfileInfoCache[ind].SongsAndCoursesPercentCompleteAllDifficultiesSingle;
				local PcntCompleteDouble = ProfileInfoCache[ind].SongsAndCoursesPercentCompleteAllDifficultiesDouble;
				--HonorName

				if PcntCompleteSingle>PcntCompleteDouble then
					PcntLarger = PcntCompleteSingle;
				else
					PcntLarger = PcntCompleteDouble;
				end
				PcntLarger = PcntLarger*100;

				if PcntLarger==0 then
					selHonorName:settext('--');
					selHonorPic:Load(THEME:GetPathB("","_ability/000"));
				elseif PcntLarger>=0 and PcntLarger<10 then
					selHonorName:settext('stone');
					if PcntLarger >8 then selHonorPic:Load(THEME:GetPathB("","_ability/008"));
					elseif PcntLarger >6 then selHonorPic:Load(THEME:GetPathB("","_ability/006"));
					elseif PcntLarger >4 then selHonorPic:Load(THEME:GetPathB("","_ability/004"));
					elseif PcntLarger >2 then selHonorPic:Load(THEME:GetPathB("","_ability/002"));
					else selHonorPic:Load(THEME:GetPathB("","_ability/000"));
					end
				elseif PcntLarger>=10 and PcntLarger<20 then
					selHonorName:settext('soap bubble');
					if PcntLarger >18 then selHonorPic:Load(THEME:GetPathB("","_ability/018"));
					elseif PcntLarger >16 then selHonorPic:Load(THEME:GetPathB("","_ability/016"));
					elseif PcntLarger >14 then selHonorPic:Load(THEME:GetPathB("","_ability/014"));
					elseif PcntLarger >12 then selHonorPic:Load(THEME:GetPathB("","_ability/012"));
					else selHonorPic:Load(THEME:GetPathB("","_ability/010"));
					end
				elseif PcntLarger>=20 and PcntLarger<30 then
					selHonorName:settext('pencil');
					if PcntLarger >28 then selHonorPic:Load(THEME:GetPathB("","_ability/028"));
					elseif PcntLarger >26 then selHonorPic:Load(THEME:GetPathB("","_ability/026"));
					elseif PcntLarger >24 then selHonorPic:Load(THEME:GetPathB("","_ability/024"));
					elseif PcntLarger >22 then selHonorPic:Load(THEME:GetPathB("","_ability/022"));
					else selHonorPic:Load(THEME:GetPathB("","_ability/020"));
					end
				elseif PcntLarger>=30 and PcntLarger<40 then
					selHonorName:settext('macaron');
					if PcntLarger >38 then selHonorPic:Load(THEME:GetPathB("","_ability/038"));
					elseif PcntLarger >36 then selHonorPic:Load(THEME:GetPathB("","_ability/036"));
					elseif PcntLarger >34 then selHonorPic:Load(THEME:GetPathB("","_ability/034"));
					elseif PcntLarger >32 then selHonorPic:Load(THEME:GetPathB("","_ability/032"));
					else selHonorPic:Load(THEME:GetPathB("","_ability/030"));
					end
				elseif PcntLarger>=40 and PcntLarger<50 then
					selHonorName:settext('lotus');
					if PcntLarger >48 then selHonorPic:Load(THEME:GetPathB("","_ability/048"));
					elseif PcntLarger >46 then selHonorPic:Load(THEME:GetPathB("","_ability/046"));
					elseif PcntLarger >44 then selHonorPic:Load(THEME:GetPathB("","_ability/044"));
					elseif PcntLarger >42 then selHonorPic:Load(THEME:GetPathB("","_ability/042"));
					else selHonorPic:Load(THEME:GetPathB("","_ability/040"));
					end
				elseif PcntLarger>=50 and PcntLarger<60 then
					selHonorName:settext('beetle');
					if PcntLarger >58 then selHonorPic:Load(THEME:GetPathB("","_ability/058"));
					elseif PcntLarger >56 then selHonorPic:Load(THEME:GetPathB("","_ability/056"));
					elseif PcntLarger >54 then selHonorPic:Load(THEME:GetPathB("","_ability/054"));
					elseif PcntLarger >52 then selHonorPic:Load(THEME:GetPathB("","_ability/052"));
					else selHonorPic:Load(THEME:GetPathB("","_ability/050"));
					end
				elseif PcntLarger>=60 and PcntLarger<70 then
					selHonorName:settext('jellyfish');
					if PcntLarger >68 then selHonorPic:Load(THEME:GetPathB("","_ability/068"));
					elseif PcntLarger >66 then selHonorPic:Load(THEME:GetPathB("","_ability/066"));
					elseif PcntLarger >64 then selHonorPic:Load(THEME:GetPathB("","_ability/064"));
					elseif PcntLarger >62 then selHonorPic:Load(THEME:GetPathB("","_ability/062"));
					else selHonorPic:Load(THEME:GetPathB("","_ability/060"));
					end
				elseif PcntLarger>=70 and PcntLarger<80 then
					selHonorName:settext('hummingbird');
					if PcntLarger >78 then selHonorPic:Load(THEME:GetPathB("","_ability/078"));
					elseif PcntLarger >76 then selHonorPic:Load(THEME:GetPathB("","_ability/076"));
					elseif PcntLarger >74 then selHonorPic:Load(THEME:GetPathB("","_ability/074"));
					elseif PcntLarger >72 then selHonorPic:Load(THEME:GetPathB("","_ability/072"));
					else selHonorPic:Load(THEME:GetPathB("","_ability/070"));
					end
				elseif PcntLarger>=80 and PcntLarger<90 then
					selHonorName:settext('kaleidoscope');
					if PcntLarger >88 then selHonorPic:Load(THEME:GetPathB("","_ability/088"));
					elseif PcntLarger >86 then selHonorPic:Load(THEME:GetPathB("","_ability/086"));
					elseif PcntLarger >84 then selHonorPic:Load(THEME:GetPathB("","_ability/084"));
					elseif PcntLarger >82 then selHonorPic:Load(THEME:GetPathB("","_ability/082"));
					else selHonorPic:Load(THEME:GetPathB("","_ability/080"));
					end
				elseif PcntLarger>=90 and PcntLarger<100 then
					selHonorName:settext('prism');
					if PcntLarger >98 then selHonorPic:Load(THEME:GetPathB("","_ability/098"));
					elseif PcntLarger >96 then selHonorPic:Load(THEME:GetPathB("","_ability/096"));
					elseif PcntLarger >94 then selHonorPic:Load(THEME:GetPathB("","_ability/094"));
					elseif PcntLarger >92 then selHonorPic:Load(THEME:GetPathB("","_ability/092"));
					else selHonorPic:Load(THEME:GetPathB("","_ability/090"));
					end
				elseif PcntLarger>=100  then
					selHonorName:settext('prism');
					selHonorPic:Load(THEME:GetPathB("","_ability/100"));
				end
				selHonorPic:shadowlength(1);

				local Lv = math.ceil(math.sqrt(ProfileInfoCache[ind].TotalCaloriesBurned));
				local pcnt =(ProfileInfoCache[ind].TotalCaloriesBurned-((Lv-1)*(Lv-1))) /((Lv*Lv)-((Lv-1)*(Lv-1)));
				local totalPcnt = (PcntCompleteSingle + PcntCompleteDouble) / 2;
					--totalPcnt = PcntLarger;
				--local pcnt =((PROFILEMAN:GetLocalProfileFromIndex(ind-1):GetTotalCaloriesBurned())-((Lv-1)*(Lv-1))) /((Lv*Lv)-((Lv-1)*(Lv-1)));
				bigframe:visible(true);
				scroller:SetDestinationItem(ind-1);
				seltext:settext(ProfileInfoCache[ind].DisplayName);
				selLevel:settext(math.ceil(math.sqrt(ProfileInfoCache[ind].TotalCaloriesBurned) ));
				selTotalCaloriesBurned:settext(tostring(math.ceil(ProfileInfoCache[ind].CaloriesBurnedToday))..' kCals.');
				selMostSongPlayed:Load(GetSongGPath(ProfileInfoCache[ind].LastPlayedSong));
				selSongsPlayed:settext(tostring(math.ceil(ProfileInfoCache[ind].NumTotalSongsPlayed)));

				(cmd(stoptweening;linear,0.05;diffusealpha,1;decelerate,0.05;cropright,1-pcnt))(selLvBar);
				--selLvBar:cropright(1-pcnt);
				--selPercentComplete:settext(string.format("%6.2f", totalPcnt*100).." %");
				selPercentComplete:settext(string.format("%6.2f", PcntLarger).." %");

				selPlayerUID = PROFILEMAN:GetLocalProfileFromIndex(ind-1):GetGUID();
				selectPlayerUID:settext(string.upper(string.sub(selPlayerUID,1,4).."-"..string.sub(selPlayerUID,5,8)));

				local RadarValueTableSingle = {};
				local RadarValueTableDouble = {};

				local profileID = PROFILEMAN:GetLocalProfileIDFromIndex(ind-1)
				local prefs = ProfilePrefs.Read(profileID)
				if SN3Debug then
					ProfilePrefs.Save(profileID)
				end

				----------Single Radar
				--Stream--
				RadarValueTableSingle[1] = MyGrooveRadar.GetRadarData(profileID, 'single', 'stream')
                selGVRDValue_S1:settext(string.format("%0.0f", RadarValueTableSingle[1]*100));
                --Voltage--
                RadarValueTableSingle[2] = MyGrooveRadar.GetRadarData(profileID, 'single', 'voltage')
                selGVRDValue_S2:settext(string.format("%0.0f", RadarValueTableSingle[2]*100));
                --Air--
                RadarValueTableSingle[3] = MyGrooveRadar.GetRadarData(profileID, 'single', 'air')
                selGVRDValue_S3:settext(string.format("%0.0f", RadarValueTableSingle[3]*100));
				--Freeze--
                RadarValueTableSingle[4] = MyGrooveRadar.GetRadarData(profileID, 'single', 'freeze')
                selGVRDValue_S4:settext(string.format("%0.0f", RadarValueTableSingle[4]*100));
				--Chaos--
                RadarValueTableSingle[5] = MyGrooveRadar.GetRadarData(profileID, 'single', 'chaos')
                selGVRDValue_S5:settext(string.format("%0.0f", RadarValueTableSingle[5]*100));
        ----------Doubles Radar
        --Stream--
                RadarValueTableDouble[1] = MyGrooveRadar.GetRadarData(profileID, 'double', 'stream')
                selGVRDValue_D1:settext(string.format("%0.0f", RadarValueTableDouble[1]*100));
        --Voltage--
                RadarValueTableDouble[2] = MyGrooveRadar.GetRadarData(profileID, 'double', 'voltage')
                selGVRDValue_D2:settext(string.format("%0.0f", RadarValueTableDouble[2]*100));
        --Air--
                RadarValueTableDouble[3] = MyGrooveRadar.GetRadarData(profileID, 'double', 'air')
                selGVRDValue_D3:settext(string.format("%0.0f", RadarValueTableDouble[3]*100));
        --Freeze--
                RadarValueTableDouble[4] = MyGrooveRadar.GetRadarData(profileID, 'double', 'freeze')
                selGVRDValue_D4:settext(string.format("%0.0f", RadarValueTableDouble[4]*100));
        --Chaos--
                RadarValueTableDouble[5] = MyGrooveRadar.GetRadarData(profileID, 'double', 'chaos')
                selGVRDValue_D5:settext(string.format("%0.0f", RadarValueTableDouble[5]*100));

				-- Save the past values, which we will need later
				local pastValues = GetOrCreateChild(GAMESTATE:Env(), 'PastRadarValues')
				pastValues[Player] = DeepCopy(MyGrooveRadar.GetRadarTable(profileID))

				SetRankFromRadarValue(selectRank,RadarValueTableSingle,RadarValueTableDouble);

			else
				if SCREENMAN:GetTopScreen():SetProfileIndex(Player, 1) then
					bigframe:visible(false);
					scroller:SetDestinationItem(0);
					self:queuecommand('UpdateInternal2');
				else
					joinframe:visible(false);
					smallframe:visible(false);
					bigframe:visible(false);
					scroller:visible(false);
					seltext:settext('No profile');
					selectPlayerUID:settext('------------');
					selLevel:settext('No level info');
					selTotalCaloriesBurned:settext('No Played Songs Info');
					selectRank:settext('???');
					selMostSongPlayed:visible(false);
					selSongsPlayed:visible(false);
					selHonorPic:visible(false);
					selHonorName:visible(false);
					selLvBarBack:visible(true);
					selLvBar:visible(false);
					selPercentComplete:visible(false);
					selTotalAttackrateWord:visible(false);

					selGVRDSingle:visible(false);
					selGVRDValue_S1:visible(false);
					selGVRDValue_S2:visible(false);
					selGVRDValue_S3:visible(false);
					selGVRDValue_S4:visible(false);
					selGVRDValue_S5:visible(false);
          selGVRDDouble:visible(false);
					selGVRDValue_D1:visible(false);
					selGVRDValue_D2:visible(false);
					selGVRDValue_D3:visible(false);
					selGVRDValue_D4:visible(false);
					selGVRDValue_D5:visible(false);
				end;
			end;
		else
			--using card
			smallframe:visible(false);
			scroller:visible(false);
			seltext:settext('CARD');
			SCREENMAN:GetTopScreen():SetProfileIndex(Player, 0);
		end;
	else
		joinframe:visible(true);
		scroller:visible(false);
		seltext:visible(false);
		selectPlayerUID:visible(false);
		smallframe:visible(false);
		bigframe:visible(false);
		selLevel:visible(false);
		selTotalCalWord:visible(false);
		selTotalCaloriesBurned:visible(false);
		selectRank:visible(false);
		selMostSongPlayed:visible(false);
		selSongsPlayed:visible(false);
		selHonorPic:visible(false);
		selHonorName:visible(false);
		selLvBarBack:visible(false);
		selLvBar:visible(false);
		selPercentComplete:visible(false);
		selTotalAttackrateWord:visible(false);

		selGVRDSingle:visible(false);
		selGVRDValue_S1:visible(false);
		selGVRDValue_S2:visible(false);
		selGVRDValue_S3:visible(false);
		selGVRDValue_S4:visible(false);
		selGVRDValue_S5:visible(false);
    selGVRDDouble:visible(false);
		selGVRDValue_D1:visible(false);
		selGVRDValue_D2:visible(false);
		selGVRDValue_D3:visible(false);
		selGVRDValue_D4:visible(false);
		selGVRDValue_D5:visible(false);
	end;
end;

--�D�{��
local t = Def.ActorFrame {

	StorageDevicesChangedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	CodeMessageCommand = function(self, params)
		if params.Name == 'Start' or params.Name == 'Center' then
			MESSAGEMAN:Broadcast("StartButton");
			if not GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -1);
			else
				SCREENMAN:GetTopScreen():Finish();
			end;
		end;
		if params.Name == 'Up' or params.Name == 'Up2' or params.Name == 'DownLeft' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 1 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind - 1 ) then
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Down' or params.Name == 'Down2' or params.Name == 'DownRight' then
			if GAMESTATE:IsHumanPlayer(params.PlayerNumber) then
				local ind = SCREENMAN:GetTopScreen():GetProfileIndex(params.PlayerNumber);
				if ind > 0 then
					if SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, ind + 1 ) then
						MESSAGEMAN:Broadcast("DirectionButton");
						self:queuecommand('UpdateInternal2');
					end;
				end;
			end;
		end;
		if params.Name == 'Back' then
			if GAMESTATE:GetNumPlayersEnabled()==0 then
				SCREENMAN:GetTopScreen():Cancel();
			else
				MESSAGEMAN:Broadcast("BackButton");
				SCREENMAN:GetTopScreen():SetProfileIndex(params.PlayerNumber, -2);
			end;
		end;
	end;

	PlayerJoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	PlayerUnjoinedMessageCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	OnCommand=function(self, params)
		self:queuecommand('UpdateInternal2');
	end;

	UpdateInternal2Command=function(self)
		UpdateInternal3(self, PLAYER_1);
		UpdateInternal3(self, PLAYER_2);
	end;

	children = {
		Def.ActorFrame {
			Name = 'P1Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X-260;y,SCREEN_CENTER_Y;zoom,1.5);
			OnCommand=cmd();
			OffCommand=cmd();
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_1 then
					(cmd(zoomx,1.5;zoomy,0.15;linear,0.175;zoomy,1.5;))(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_1);
		};
		Def.ActorFrame {
			Name = 'P2Frame';
			InitCommand=cmd(x,SCREEN_CENTER_X+260;y,SCREEN_CENTER_Y;zoom,1.5);
			OnCommand=cmd();
			OffCommand=cmd();
			PlayerJoinedMessageCommand=function(self,param)
				if param.Player == PLAYER_2 then
					(cmd(zoomx,1.5;zoomy,0.15;linear,0.175;zoomy,1.5;))(self);
				end;
			end;
			children = LoadPlayerStuff(PLAYER_2);
		};
		-- sounds
		-- LoadActor( THEME:GetPathS("Common","start") )..{
			-- StartButtonMessageCommand=cmd(play);
		-- };
		-- LoadActor( THEME:GetPathS("Common","cancel") )..{
			-- BackButtonMessageCommand=cmd(play);
		-- };
		-- LoadActor( THEME:GetPathS("Common","value") )..{
			-- DirectionButtonMessageCommand=cmd(play);
		-- };
				-- sounds
		LoadActor( THEME:GetPathS("Common","start") )..{
			StartButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("","Profile_start") )..{
			StartButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("Common","cancel") )..{
			BackButtonMessageCommand=cmd(play);
		};
		LoadActor( THEME:GetPathS("","Profile_Move") )..{
			DirectionButtonMessageCommand=cmd(play);
		};
	};
};


return t;