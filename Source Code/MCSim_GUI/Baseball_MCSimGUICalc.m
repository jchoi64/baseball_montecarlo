%Author: Junwoo Choi
%Version: 4
%This program is designed to test the optimal batting lineup for producing
%the most runs per game using Monte Carlo simulations. This program uses 
%purely the offensive stats of the hitting team and ignores the defending team.

%Assumptions:
%1. No errors are made by fielders or runners
%2. Player stats are taken to be context neutral (ex. a sacrifice fly is is
%the same as a flyout when a batters flyout rate is calculated)
%3. 9 inning games
%4. Players are never substituted (i.e. no pinch hitters)
%5. Runner on first only advances to third on doubles*
%6. Runner in scoring positon (second and third) always score on a hit*
%7. Runner on first only advances to second on a single*
%8. Outs are either strikeout, groundout or flyout (lineout is considered
%equivalent to a strikeout in terms of productivity)*
%9. Groundout with runner on first always leads to a 2-1 double play
%10. Players not on first base will advance on a groundout*
%11. Only Players on third will tagup on a flyout*
%*May change in future versions*

%--------------------------------------------------------------------------

function [Score, PA, SO, GO, FO, Walks,Hits, OneB, TwoB, ThreeB, HR, R, RBI, PA_T, SO_T, GO_T, FO_T, Walks_T, Hits_T, OneB_T, TwoB_T, ThreeB_T, HR_T, R_T, RBI_T]=Baseball_MCSimGUICalc(NatObp,HitP,OneBP,TwoBP,ThreeBP,HRP,SOP,innings,n)

%Flyball/Groundball data for now is using averages as there is no database
%GBP=GB%/(GB%+FB%), FBP=FB%/(GB%+FB%) or 1-GBP
GBP=[0.6;0.6;0.6;0.6;0.6;0.6;0.6;0.6;0.6];
FBP=1-GBP;
IFFB=[0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1;0.1];
IFH=[0.06;0.06;0.06;0.06;0.06;0.06;0.06;0.06;0.06];
%Initialze Vectors
%n=# of iterations
PA=zeros(9,n);
SO=zeros(9,n);
GO=zeros(9,n);
FO=zeros(9,n);
Hits=zeros(9,n);
OneB=zeros(9,n);
TwoB=zeros(9,n);
ThreeB=zeros(9,n);
HR=zeros(9,n);
Walks=zeros(9,n);
RBI=zeros(9,n);
R=zeros(9,n);
BaseState=zeros(3,1);
Outs=0;
j=1;
Score=zeros(n,1);

for k=1:n
for i=1:innings
    
    while Outs < 3
        
        tmp=rand;
        %Check to see if player makes it on base
        if tmp > NatObp(j)
            PA(j,k)=PA(j,k)+1;
            tmp4=rand;
            if tmp4 < SOP(j)
                SO(j,k)=SO(j,k)+1;
                Outs=Outs+1;
            else
                tmp5=rand;
                if tmp5 < GBP(j)
                    GO(j,k)=GO(j,k)+1;
                    [Score(k),BaseState,RBI,R,Outs]=UpdateBases_2(Score(k),BaseState,-1,RBI,R,j,Outs,k);
                else
                    FO(j,k)=FO(j,k)+1;
                    [Score(k),BaseState,RBI,R,Outs]=UpdateBases_2(Score(k),BaseState,-2,RBI,R,j,Outs,k);
                end
            end
            j=NextHitter(j);

        
        else 
            tmp2 = rand;
            PA(j,k)=PA(j,k)+1;
            
            
            %[NewScore, NewRef, NewRbi, NewRun]=(Score, Ref, h, PlayerRbi, PlayerRun,j)
            %Checks if player made it on base with walk or hit 
            if tmp2 < HitP(j)
               tmp3=rand;
               %Checks if hit is a single,double,triple or HR
               if tmp3 < OneBP(j)
                   OneB(j,k)=OneB(j,k)+1;
                   [Score(k),BaseState,RBI,R,Outs]=UpdateBases_2(Score(k),BaseState,1,RBI,R,j,Outs,k); 
               elseif tmp3 < OneBP(j)+TwoBP(j)
                   TwoB(j,k)=TwoB(j,k)+1;
                   [Score(k),BaseState,RBI,R,Outs]=UpdateBases_2(Score(k),BaseState,2,RBI,R,j,Outs,k);
               elseif tmp3 < OneBP(j)+TwoBP(j)+ThreeBP(j)
                   ThreeB(j,k)=ThreeB(j,k)+1;
                   [Score(k),BaseState,RBI,R,Outs]=UpdateBases_2(Score(k),BaseState,3,RBI,R,j,Outs,k);
               else
                   HR(j,k)=HR(j,k)+1;
                   [Score(k),BaseState,RBI,R,Outs]=UpdateBases_2(Score(k),BaseState,4,RBI,R,j,Outs,k);
               end
               Hits(j,k)=Hits(j,k)+1;
               
            else
                Walks(j,k)=Walks(j,k)+1;
                [Score(k),BaseState,RBI,R,Outs]=UpdateBases_2(Score(k),BaseState,5,RBI,R,j,Outs,k);
            end
            j=NextHitter(j);
            
        end
        
    end
    BaseState=zeros(3,1);
    Outs = 0;
end
j=1;
end

PA_T=zeros(9,1);
SO_T=zeros(9,1);
GO_T=zeros(9,1);
FO_T=zeros(9,1);
Walks_T=zeros(9,1);
Hits_T=zeros(9,1);
OneB_T=zeros(9,1);
TwoB_T=zeros(9,1);
ThreeB_T=zeros(9,1);
HR_T=zeros(9,1);
R_T=zeros(9,1);
RBI_T=zeros(9,1);
for i=1:9
    PA_T(i)=sum(PA(i,:));
    SO_T(i)=sum(SO(i,:));
    GO_T(i)=sum(GO(i,:));
    FO_T(i)=sum(FO(i,:));
    Walks_T(i)=sum(Walks(i,:));
    Hits_T(i)=sum(Hits(i,:));
    OneB_T(i)=sum(OneB(i,:));
    TwoB_T(i)=sum(TwoB(i,:));
    ThreeB_T(i)=sum(ThreeB(i,:));
    HR_T(i)=sum(HR(i,:));
    R_T(i)=sum(R(i,:));
    RBI_T(i)=sum(RBI(i,:));
end
%Double checking 
%BA=Hits(1)/PA(1)
%SLG=(OneB(1)+2*TwoB(1)+3*ThreeB(1)+4*HR(1))/PA(1)
%Score1=sum(R)-sum(Score)
%Score2=sum(RBI)-sum(Score)

%T=table(Names,sum(SO),sum(FO),sum(GO),sum(Walks),sum(OneB),sum(TwoB),sum(ThreeB),sum(HR),sum(R),sum(RBI))

%--------------------------------------------------------------------------

