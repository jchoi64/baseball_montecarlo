function [NatObp, HitP, OneBP, TwoBP, ThreeBP, HRP, SOP, GBP, FBP, Names, BA, OBP, SLG] = ReadexcelGUI(Name1,Name2,Name3,Name4,Name5,Name6,Name7,Name8,Name9,BattingInfo,Batters)

B(1)=find(Batters==Name1);
B(2)=find(Batters==Name2);
B(3)=find(Batters==Name3);
B(4)=find(Batters==Name4);
B(5)=find(Batters==Name5);
B(6)=find(Batters==Name6);
B(7)=find(Batters==Name7);
B(8)=find(Batters==Name8);
B(9)=find(Batters==Name9);

Names={Name1;Name2;Name3;Name4;Name5;Name6;Name7;Name8;Name9};
NatObp=zeros(9,1);
HitP=zeros(9,1);
OneBP=zeros(9,1);
TwoBP=zeros(9,1);
ThreeBP=zeros(9,1);
HRP=zeros(9,1);
SOP=zeros(9,1);
BA=zeros(10,1);
OBP=zeros(10,1);
SLG=zeros(10,1);

%Flyball/Groundball data for now is using averages as there is no database
%GBP=GB%/(GB%+FB%), FBP=FB%/(GB%+FB%) or 1-GBP
GBP=[0.6;0.6;0.6;0.6;0.6;0.6;0.6;0.6;0.6];
FBP=1-GBP;
%1=AB 2=R 3=H 4=2B 5=3B 6=HR 7= RBI 8=SB 9=CS 10=BB 11=SO 12=IBB 13=HBP
%14=SH 15=SF 16=GIDP
for i=1:9
    
%NatObp = (H+BB+HBP)/(PA)
NatObp(i)=(BattingInfo(B(i),3)+BattingInfo(B(i),10)+BattingInfo(B(i),13))/(BattingInfo(B(i),1)+BattingInfo(B(i),10)+BattingInfo(B(i),13)+BattingInfo(B(i),15));

%HitP = H/(H+BB+HBP)
HitP(i)=BattingInfo(B(i),3)/(BattingInfo(B(i),3)+BattingInfo(B(i),10)+BattingInfo(B(i),13));

%OneBP= 1B/H
OneBP(i)= (BattingInfo(B(i),3)-BattingInfo(B(i),6)-BattingInfo(B(i),5)-BattingInfo(B(i),4))/BattingInfo(B(i),3);

%TwoBP= 2B/H
TwoBP(i)=BattingInfo(B(i),4)/BattingInfo(B(i),3);

%ThreeBP= 3B/H
ThreeBP(i)=BattingInfo(B(i),5)/BattingInfo(B(i),3);

%HRP= HR/H
HRP(i)=BattingInfo(B(i),6)/BattingInfo(B(i),3);

%SOP=SO/((1-NatObp)*PA)
SOP(i)=BattingInfo(B(i),11)/((1-NatObp(i))*(BattingInfo(B(i),1)+BattingInfo(B(i),10)+BattingInfo(B(i),13)+BattingInfo(B(i),15)));

%BA=H/AB
BA(i)=BattingInfo(B(i),3)/BattingInfo(B(i),1);

%OBP=(H+BB+HBP)/(PA)
OBP(i)=(BattingInfo(B(i),3)+BattingInfo(B(i),10)+BattingInfo(B(i),13))/(BattingInfo(B(i),1)+BattingInfo(B(i),10)+BattingInfo(B(i),13)+BattingInfo(B(i),15));

%SLG=(1B+2*2B+3*3B+4*HR)/AB
SLG(i)=((BattingInfo(B(i),3)-BattingInfo(B(i),6)-BattingInfo(B(i),5)-BattingInfo(B(i),4))+2*BattingInfo(B(i),4)+3*BattingInfo(B(i),5)+4*BattingInfo(B(i),6))/BattingInfo(B(i),1);
end

BA(10)=sum(BA)/9;
OBP(10)=sum(OBP)/9;
SLG(10)=sum(SLG)/9;