%Author: Junwoo Choi
%Version: 4
%This program is designed to test the optimal batting lineup for producing
%the most runs per game using Monte Carlo simulations. This program uses 
%purely the offensive stats of the hitting team and ignores the defending team.

%Assumptions:
%1. No errors are made by fielders or runners
%2. An adjusted PA is used where every time a hitter comes up to bat,
%regardless of outcome results in a PA
%3. From assumption 2, player stats such as BA, OBP, SLG are
%adjusted to assume an independent stat that ignores the state of the game
%and uses PA over AB
%4. 9 inning games
%5. Players are never substituted (i.e. no pinch hitters)
%6. Runner on first only advances to third on doubles*
%7. Runner in scoring positon (second and third) always score on a hit*
%8. Runner on first only advances to second on a single*
%9. Outs are either strikeout, groundout or flyout (lineout is considered
%equivalent to a strikeout in terms of productivity)*
%10. Groundout with runner on first always leads to a 2-1 double play
%11. Players not on first base will advance on a groundout*
%12. Only Players on third will tagup on a flyout*
%*May change in future versions*

%--------------------------------------------------------------------------
clear
clc

%Player Data
%batter naming convention:
%year-last name-first name-01
%if last name is larger than 5 letters, only put first 5
%if more than one player has the same letter combination, change 01 to 02
%etc.
%example: Buster Posey, 2010 info
%Name=2010poseybu01
%Current version cannot pull data from a player that has been traded during
%the regular season
%order of names typed will be the order of the batting lineup
[NatObp, HitP, OneBP, TwoBP, ThreeBP, HRP, SOP, GBP, FBP, Names]= Readexcel;

%Initialze Vectors
PA=zeros(9,1);
SO=zeros(9,1);
GO=zeros(9,1);
FO=zeros(9,1);
Hits=zeros(9,1);
OneB=zeros(9,1);
TwoB=zeros(9,1);
ThreeB=zeros(9,1);
HR=zeros(9,1);
Walks=zeros(9,1);
RBI=zeros(9,1);
R=zeros(9,1);
BaseState=zeros(3,1);
Outs=0;
Innings=9;
j=1;

%n=# of iterations
n=10000;
Score=zeros(n,1);

for k=1:n
for i=1:Innings
    
    while Outs < 3
        
        tmp=rand;
        %Check to see if player makes it on base
        if tmp > NatObp(j)
            PA(j)=PA(j)+1;
            tmp4=rand;
            if tmp4 < SOP(j)
                SO(j)=SO(j)+1;
                Outs=Outs+1;
            else
                tmp5=rand;
                if tmp5 < GBP(j)
                    GO(j)=GO(j)+1;
                    [Score(k),BaseState,RBI,R,Outs]=UpdateBases(Score(k),BaseState,-1,RBI,R,j,Outs);
                else
                    FO(j)=FO(j)+1;
                    [Score(k),BaseState,RBI,R,Outs]=UpdateBases(Score(k),BaseState,-2,RBI,R,j,Outs);
                end
            end
            j=NextHitter(j);

        
        else 
            tmp2 = rand;
            PA(j)=PA(j)+1;
            
            
            %[NewScore, NewRef, NewRbi, NewRun]=(Score, Ref, h, PlayerRbi, PlayerRun,j)
            %Checks if player made it on base with walk or hit 
            if tmp2 < HitP(j)
               tmp3=rand;
               %Checks if hit is a single,double,triple or HR
               if tmp3 < OneBP(j)
                   OneB(j)=OneB(j)+1;
                   [Score(k),BaseState,RBI,R,Outs]=UpdateBases(Score(k),BaseState,1,RBI,R,j,Outs); 
               elseif tmp3 < OneBP(j)+TwoBP(j)
                   TwoB(j)=TwoB(j)+1;
                   [Score(k),BaseState,RBI,R,Outs]=UpdateBases(Score(k),BaseState,2,RBI,R,j,Outs);
               elseif tmp3 < OneBP(j)+TwoBP(j)+ThreeBP(j)
                   ThreeB(j)=ThreeB(j)+1;
                   [Score(k),BaseState,RBI,R,Outs]=UpdateBases(Score(k),BaseState,3,RBI,R,j,Outs);
               else
                   HR(j)=HR(j)+1;
                   [Score(k),BaseState,RBI,R,Outs]=UpdateBases(Score(k),BaseState,4,RBI,R,j,Outs);
               end
               Hits(j)=Hits(j)+1;
               
            else
                Walks(j)=Walks(j)+1;
                [Score(k),BaseState,RBI,R,Outs]=UpdateBases(Score(k),BaseState,5,RBI,R,j,Outs);
            end
            j=NextHitter(j);
            
        end
        
    end
    BaseState=zeros(3,1);
    Outs = 0;
end
j=1;
end

AvgRGame=sum(Score)/n

%Double checking 
%BA=Hits(1)/PA(1)
%SLG=(OneB(1)+2*TwoB(1)+3*ThreeB(1)+4*HR(1))/PA(1)
%Score1=sum(R)-sum(Score)
%Score2=sum(RBI)-sum(Score)

T=table(Names,SO,FO,GO,Walks,OneB,TwoB,ThreeB,HR,R,RBI)

%--------------------------------------------------------------------------
