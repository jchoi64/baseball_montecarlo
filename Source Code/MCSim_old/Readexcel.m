function [NatObp, HitP, OneBP, TwoBP, ThreeBP, HRP, SOP, GBP, FBP, Names] = Readexcel(~)

[YearTemp,NameTemp] = xlsread('BattingData.xlsx',1,'A2:B102817');
BattingInfo=xlsread('BattingData.xlsx',1,'H2:W102817');
Batters=string(YearTemp)+string(NameTemp);
while 1
    prompt='please enter batters name: ';
    Name1=input(prompt,'s');
    Temp1=find(Batters==Name1);
    if Temp1 > 0
        break
    end
    disp('batter not found, please reinput')
end
while 1
    Name2=input(prompt,'s');
    Temp2=find(Batters==Name2);
    if Temp2 > 0
        break
    end
    disp('batter not found, please reinput')
end
while 1
    Name3=input(prompt,'s');
    Temp3=find(Batters==Name3);
    if Temp3 > 0
        break
    end
    disp('batter not found, please reinput')
end
while 1
    Name4=input(prompt,'s');
    Temp4=find(Batters==Name4);
    if Temp4 > 0
        break
    end
    disp('batter not found, please reinput')
end
while 1
    Name5=input(prompt,'s');
    Temp5=find(Batters==Name5);
    if Temp5 > 0
        break
    end
    disp('batter not found, please reinput')
end
while 1
    Name6=input(prompt,'s');
    Temp6=find(Batters==Name6);
    if Temp6 > 0
        break
    end
    disp('batter not found, please reinput')
end
while 1
    Name7=input(prompt,'s');
    Temp7=find(Batters==Name7);
    if Temp7 > 0
        break
    end
    disp('batter not found, please reinput')
end
while 1
    Name8=input(prompt,'s');
    Temp8=find(Batters==Name8);
    if Temp8 > 0
        break
    end
    disp('batter not found, please reinput')
end
while 1
    Name9=input(prompt,'s');
    Temp9=find(Batters==Name9);
    if Temp9 > 0
        break
    end
    disp('batter not found, please reinput')
end

%1=AB 2=R 3=H 4=2B 5=3B 6=HR 7= RBI 8=SB 9=CS 10=BB 11=SO 12=IBB 13=HBP
%14=SH 15=SF 16=GIDP
B=[Temp1;Temp2;Temp3;Temp4;Temp5;Temp6;Temp7;Temp8;Temp9];
Names={Name1;Name2;Name3;Name4;Name5;Name6;Name7;Name8;Name9};
NatObp=zeros(9,1);
HitP=zeros(9,1);
OneBP=zeros(9,1);
TwoBP=zeros(9,1);
ThreeBP=zeros(9,1);
HRP=zeros(9,1);
SOP=zeros(9,1);

%Flyball/Groundball data for now is using averages as there is no database
%GBP=GB%/(GB%+FB%), FBP=FB%/(GB%+FB%) or 1-GBP
GBP=[0.6;0.6;0.6;0.6;0.6;0.6;0.6;0.6;0.6];
FBP=1-GBP;

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

end