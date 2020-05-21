%Author: Junwoo Choi
%Version: 2
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
%*May change in future versions*



clear
clc

%Player stats (will be moved to another file in future versions)
%NatObp = (H+BB+IBB+HBP)/(PA+IBB)
NatObp=[0.3638;0.4;0.4;0.4;0.4;0.4;0.4;0.4;0.4];

%HitP = H/(H+BB+IBB+HBP)
HitP=[0.7607;0.4;0.4;0.4;0.4;0.4;0.4;0.4;0.4];

%OneBP= 1B/H
OneBP=[81/124;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25];
%TwoBP= 2B/H
TwoBP=[23/124;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25];
%ThreeBP= 3B/H
ThreeBP=[2/124;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25];
%HRP= HR/H
HRP=[18/124;0.25;0.25;0.25;0.25;0.25;0.25;0.25;0.25];

%Initialze Vectors
PA=zeros(9,1);
SO=zeros(9,1);
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
k=1;
%j=Batting order position
j=1;
%n=# of iterations
n=162;
Score=zeros(n,1);

while k < n+1
for i=1:Innings
    
    while Outs < 3
        
        tmp=rand;
        %Check to see if player makes it on base
        if tmp > NatObp(j)
            Outs=Outs+1;
            PA(j)=PA(j)+1;
            SO(j)=SO(j)+1;
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
                   [Score(k),BaseState,RBI,R]=UpdateBases(Score(k),BaseState,1,RBI,R,j); 
               elseif tmp3 < OneBP(j)+TwoBP(j)
                   TwoB(j)=TwoB(j)+1;
                   [Score(k),BaseState,RBI,R]=UpdateBases(Score(k),BaseState,2,RBI,R,j);
               elseif tmp3 < OneBP(j)+TwoBP(j)+ThreeBP(j)
                   ThreeB(j)=ThreeB(j)+1;
                   [Score(k),BaseState,RBI,R]=UpdateBases(Score(k),BaseState,3,RBI,R,j);
               else
                   HR(j)=HR(j)+1;
                   [Score(k),BaseState,RBI,R]=UpdateBases(Score(k),BaseState,4,RBI,R,j);
               end
               Hits(j)=Hits(j)+1;
               
            else
                Walks(j)=Walks(j)+1;
                [Score(k),BaseState,RBI,R]=UpdateBases(Score(k),BaseState,5,RBI,R,j);
            end
            j=NextHitter(j);
            
        end
        
    end
    BaseState=zeros(3,1);
    Outs = 0;
end
j=1;
k=k+1;

end

AvgRGame=sum(Score)/k

%Double checking 
% BA=Hits(1)/PA(1)
% SLG=(OneB(1)+2*TwoB(1)+3*ThreeB(1)+4*HR(1))/PA(1)
% Score1=sum(R)-sum(Score)
% Score2=sum(RBI)-sum(Score)

T=table(SO,Walks,OneB,TwoB,ThreeB,HR,R,RBI)
