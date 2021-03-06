local t = Def.ActorFrame {};

local s = {};

for pn in ivalues(GAMESTATE:GetHumanPlayers()) do
	s[#s+1] = LoadActor( 'grade.lua', pn );
	
	s[#s+1] = Def.ActorFrame {
		Condition=not GAMESTATE:IsCourseMode();
		InitCommand=cmd(zoom,0.65;x,pn==PLAYER_1 and -64 or 64;y,-34);
		
		LoadActor( 'difficultyback01' );
		
		LoadActor( 'difficultyback02' ) .. {
			SetMessageCommand=function(self,params)
				local SongOrCourse;
				local StepsOrTrail;
				
				if params.Song then
					SongOrCourse = params.Song;
					StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
				else
					SongOrCourse = params.Course;
					StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
				end
			
				if SongOrCourse and StepsOrTrail then
					local st = StepsOrTrail:GetStepsType();
					local diff = StepsOrTrail:GetDifficulty();
					local oneSteps = SongOrCourse:GetOneSteps(st, diff);
					
					if oneSteps then
						self:diffuse( CustomDifficultyToColor(diff) );
					end
				end
			end;
		};
		Def.BitmapText{
			Font="_geo 95 20px";
			InitCommand=cmd(xy,3,-10;zoomx,1.4;zoomy,1.4);
			SetMessageCommand=function(self,params)
				local SongOrCourse;
				local StepsOrTrail;
				local text = '';
				
				if params.Song then
					SongOrCourse = params.Song;
					StepsOrTrail = GAMESTATE:GetCurrentSteps(pn);
				else
					SongOrCourse = params.Course;
					StepsOrTrail = GAMESTATE:GetCurrentTrail(pn);
				end
			
				if SongOrCourse and StepsOrTrail then
					local st = StepsOrTrail:GetStepsType();
					local diff = StepsOrTrail:GetDifficulty();
					local oneSteps = SongOrCourse:GetOneSteps(st, diff);
					
					if oneSteps then
						self:settext( oneSteps:GetMeter() );
					end
				end
			end;
		};
	};
end

t[#t+1] = Def.ActorFrame {
	SetMessageCommand=function(self, params)
		if params.Index ~= nil then
			local index = params.Index;
			
			if index%3 == 0 then
				self:x(-300):y(107);
			elseif index%3 == 1 then
				self:x(0):y(0);
			else
				self:x(300):y(-107);
			end
			self:zoom(params.HasFocus and 2.2 or 1.8);
		end
	end;
	
	LoadActor( 'bright' ) .. {
		InitCommand=cmd(diffuseshift;effectcolor1,1,1,1,1;effectcolor2,1,1,1,0.5;effectclock,'beatnooffset');
		SetMessageCommand=function(self, params)
			if params.Index ~= nil then
				self:visible( params.HasFocus );
			end
		end;
	};		
	
	LoadActor( 'bg02' ) .. {
		InitCommand=cmd(y,6;diffusecolor,Color("Yellow");blend,Blend.Add;diffusealpha,0.5;thump;effectclock,'beat';effectmagnitude,0.9,1,0.9;effectoffset,0.35;);
		SetMessageCommand=function(self,params)
			if params.Index ~= nil then
				self:visible( params.HasFocus );
			end
		end;
	};	
	LoadActor( 'bg01' );
	
	Def.ActorFrame(s);
	
	Def.Quad {
		InitCommand=cmd(setsize,90,90;diffuse,color("#000000"));
	};
	Def.Sprite {
		Name="Banner";
		SetMessageCommand=function(self,params)
			local SongOrCourse;
			local path = THEME:GetPathG( '', '_missing' );
			
			if params.Song then
				SongOrCourse = params.Song;
			else
				SongOrCourse = params.Course;
			end
			
			if SongOrCourse then
				if not GAMESTATE:IsCourseMode() and SongOrCourse:HasJacket() then
					path = SongOrCourse:GetJacketPath();
				elseif SongOrCourse:HasBanner() then
					path = SongOrCourse:GetBannerPath();
				elseif SongOrCourse:HasBackground() then
					path = SongOrCourse:GetBackgroundPath();
				end
			end
			--- seems like scaletoclipped command is broken for non-square images??? - jindev
			if params.Index ~= nil then
				self:Load(path):scaletoclipped(90,90);
			end
		end;
	};
	Def.Sprite {
		Name="Banner";
		InitCommand=cmd(blend,Blend.Add;diffusealpha,0.4;thump;effectclock,'beat';effectmagnitude,1.0,1.1,1.0;effectoffset,0.35);
		SetMessageCommand=function(self,params)
			local SongOrCourse;
			local path = THEME:GetPathG( '', '_missing' );
			
			if params.Song then
				SongOrCourse = params.Song;
			else
				SongOrCourse = params.Course;
			end
			
			if params.Index ~= nil and SongOrCourse then
				if not GAMESTATE:IsCourseMode() and SongOrCourse:HasJacket() then
					path = SongOrCourse:GetJacketPath();
				elseif SongOrCourse:HasBanner() then
					path = SongOrCourse:GetBannerPath();
				elseif SongOrCourse:HasBackground() then
					path = SongOrCourse:GetBackgroundPath();
				end
				self:Load(path):scaletoclipped(90,90):visible(params.HasFocus);
			end
		end;
	};
	LoadFont( '_open sans semibold 24px' ) .. {
		InitCommand=cmd(y,65;zoom,0.6;maxwidth,220;diffuse,Color("White");strokecolor,color("0.15,0.15,0.0,0.9"));
		SetMessageCommand=function(self,params)
			local SongOrCourse;
			local text = '';
			
			if params.Song then
				SongOrCourse = params.Song;
			else
				SongOrCourse = params.Course;
			end
			
			if params.Index ~= nil and SongOrCourse then
				text = SongOrCourse:GetDisplayFullTitle();
				self:settext(text);
			end
		end;
	};
	LoadActor( 'bgNew' ) .. {
		InitCommand=cmd(visible,false);
		SetMessageCommand=function(self,params)
			local song = params.Song;
			
			if params.Index ~= nil and song then
				self:visible(PROFILEMAN:IsSongNew(song));
			end
		end;
	};
	--Selection cursor
	Def.ActorFrame {
		SetMessageCommand=function(self,params)
			if params.Index ~= nil then
				self:visible( params.HasFocus );
			end
		end;
		OffCommand=cmd(stopeffect;sleep,0.2;diffusealpha,0);
		
		LoadActor( 'cursor' ) .. {
			InitCommand=cmd(x,-92;bounce;effectmagnitude,6,0,0;effectclock,'beatnooffset');
		};
		LoadActor( 'cursor' ) .. {
			InitCommand=cmd(x,92;zoomx,-1;bounce;effectmagnitude,-6,0,0;effectclock,'beatnooffset');
		};
	};
};	

return t