function [NewScore, NewState, NewRbi, NewRun, NewOuts] = UpdateBases_2(Score, State, h, PlayerRbi, PlayerRun,j, Outs,k)
%0=Base Empty
%#=Base Occupied
%# refers to player in batting order
%[third;second;first]
%ex. [0;1;3] Runners on first and second

NewRbi=PlayerRbi;
NewRun=PlayerRun;
NewScore=Score;
NewOuts=Outs;

%Hit is a single
if h==1
    
    Temp1=State>0;
    
     if Temp1 == [0;0;0]
         NewState= [0;0;j];
     end
     
     if Temp1 == [0;0;1]
         NewState= [0;State(3);j];
     end
     
     if Temp1 == [0;1;0]
         NewScore=Score+1;
         NewState= [0;0;j];
         NewRbi(j,k)=PlayerRbi(j,k)+1;
         NewRun(State(2),k)=PlayerRun(State(2),k)+1;         
     end
     
     if Temp1 == [1;0;0]
         NewScore=Score+1;
         NewState= [0;0;j];         
         NewRbi(j,k)=PlayerRbi(j,k)+1;
         NewRun(State(1),k)=PlayerRun(State(1),k)+1;         
     end
     
     if Temp1 == [0;1;1]
         NewScore=Score+1;
         NewState= [0;State(3);j];
         NewRbi(j,k)=PlayerRbi(j,k)+1;
         NewRun(State(2),k)=PlayerRun(State(2),k)+1;
     end
     
     if Temp1 == [1;1;1]
         NewScore=Score+2;
         NewState= [0;State(3);j];
         NewRbi(j,k)=PlayerRbi(j,k)+2;
         NewRun(State(1),k)=PlayerRun(State(1),k)+1;
         NewRun(State(2),k)=PlayerRun(State(2),k)+1;
     end
     
     if Temp1 == [1;0;1]
         NewScore=Score+1;
         NewState= [0;State(3);j];
         NewRbi(j,k)=PlayerRbi(j,k)+1;
         NewRun(State(1),k)=PlayerRun(State(1),k)+1;
     end
     
     if Temp1 == [1;1;0]
         NewScore=Score+2;
         NewState= [0;0;j];
         NewRbi(j,k)=PlayerRbi(j,k)+2;
         NewRun(State(1),k)=PlayerRun(State(1),k)+1;
         NewRun(State(2),k)=PlayerRun(State(2),k)+1;         
     end    

end

%Hit is a double
if h==2
    
    Temp2=State>0;
    
     if Temp2 == [0;0;0]
         NewState= [0;j;0];
     end
     
     if Temp2 == [0;0;1]
         NewState= [State(3);j;0];
     end
     
     if Temp2 == [0;1;0]
         NewScore=Score+1;
         NewState= [0;j;0];
         NewRbi(j,k)=PlayerRbi(j,k)+1;
         NewRun(State(2),k)=PlayerRun(State(2),k)+1;         
     end
     
     if Temp2 == [1;0;0]
         NewScore=Score+1;
         NewState= [0;j;0];         
         NewRbi(j,k)=PlayerRbi(j,k)+1;
         NewRun(State(1),k)=PlayerRun(State(1),k)+1;         
     end
     
     if Temp2 == [0;1;1]
         NewScore=Score+1;
         NewState= [State(3);j;0];
         NewRbi(j,k)=PlayerRbi(j,k)+1;
         NewRun(State(2),k)=PlayerRun(State(2),k)+1;
     end
     
     if Temp2 == [1;1;1]
         NewScore=Score+2;
         NewState= [State(3);j;0];
         NewRbi(j,k)=PlayerRbi(j,k)+2;
         NewRun(State(1),k)=PlayerRun(State(1),k)+1;
         NewRun(State(2),k)=PlayerRun(State(2),k)+1;
     end
     
     if Temp2 == [1;0;1]
         NewScore=Score+1;
         NewState= [State(3);j;0];
         NewRbi(j,k)=PlayerRbi(j,k)+1;
         NewRun(State(1),k)=PlayerRun(State(1),k)+1;
     end
     
     if Temp2 == [1;1;0]
         NewScore=Score+2;
         NewState= [0;j;0];
         NewRbi(j,k)=PlayerRbi(j,k)+2;
         NewRun(State(1),k)=PlayerRun(State(1),k)+1;
         NewRun(State(2),k)=PlayerRun(State(2),k)+1;         
     end
    
end

%Hit is a triple
if h==3
    
    Temp3=State>0;
    NewScore=Score+sum(Temp3);
    NewState=[j;0;0];
    NewRbi(j,k)=PlayerRbi(j,k)+sum(Temp3);
    if Temp3(1)==1
        NewRun(State(1),k)=PlayerRun(State(1),k)+1;
    end
    
    if Temp3(2)==1
        NewRun(State(2),k)=PlayerRun(State(2),k)+1;
    end
    
    if Temp3(3)==1
        NewRun(State(3),k)=PlayerRun(State(3),k)+1;
    end
    
    
end

%Hit is a home run
if h==4
    
    Temp4=State>0;
    NewScore=Score+sum(Temp4)+1;
    NewState=[0;0;0];
    NewRbi(j,k)=PlayerRbi(j,k)+sum(Temp4)+1;
    NewRun(j,k)=PlayerRun(j,k)+1;
    if Temp4(1)==1
        NewRun(State(1),k)=PlayerRun(State(1),k)+1;
    end
    
    if Temp4(2)==1
        NewRun(State(2),k)=PlayerRun(State(2),k)+1;
    end
    
    if Temp4(3)==1
        NewRun(State(3),k)=PlayerRun(State(3),k)+1;
    end
    
end

%Batter is walked
if h==5
    
    Temp5=State>0;
    
     if Temp5 == [0;0;0]
         NewState= [0;0;j];
     end
     
     if Temp5 == [0;0;1]
         NewState= [0;State(3);j];
     end
     
     if Temp5 == [0;1;0]
         NewState= [0;State(2);j];
     end
     
     if Temp5 == [1;0;0]
         NewState= [State(1);0;j];
     end
     
     if Temp5 == [0;1;1]
         NewState= [State(2);State(3);j];
     end
     
     if Temp5 == [1;1;1]
         NewScore=Score+1;
         NewState= [State(2);State(3);j];
         NewRbi(j,k)=PlayerRbi(j,k)+1;
         NewRun(State(1),k)=PlayerRun(State(1),k)+1;
     end
     
     if Temp5 == [1;0;1]
         NewState= [State(1);State(3);j];
     end
     
     if Temp5 == [1;1;0]
         NewState= [State(1);State(2);j];
     end
    
end

%Hit is a groundout
if h==-1
    
    Temp6=State>0;
    
     if Temp6 == [0;0;0]
         NewState= [0;0;0];
         NewOuts=Outs+1;
     end
     
     if Temp6 == [0;0;1]
         if Outs < 1
            NewState= [0;0;0];
            NewOuts=Outs+2;
         else
            NewState=[0;0;0];
            NewOuts=3;
         end
     end
     
     if Temp6 == [0;1;0]
        NewState= [State(2);0;0];
        NewOuts=Outs+1;
     end
     
     if Temp6 == [1;0;0]
         NewState= [0;0;0];
         NewOuts=Outs+1;
         if Outs < 2
             NewScore=Score+1;
             NewRbi(j,k)=PlayerRbi(j,k)+1;
             NewRun(State(1),k)=PlayerRun(State(1),k)+1;
         end
             
     end
     
     if Temp6 == [0;1;1]
         if Outs < 1
            NewState= [State(2);0;0];
            NewOuts=Outs+2;
         else
            NewState=[0;0;0];
            NewOuts=3;
         end
     end
     
     if Temp6 == [1;1;1]
         if Outs < 1
            NewState= [State(2);0;0];
            NewOuts=Outs+2;
            NewScore=Score+1;
            NewRbi(j,k)=PlayerRbi(j,k)+1;
            NewRun(State(1),k)=PlayerRun(State(1),k)+1;
         else
            NewState=[0;0;0];
            NewOuts=3;
         end
     end
     
     if Temp6 == [1;0;1]
         if Outs < 1
            NewState= [0;0;0];
            NewOuts=Outs+2;
            NewScore=Score+1;
            NewRbi(j,k)=PlayerRbi(j,k)+1;
            NewRun(State(1),k)=PlayerRun(State(1),k)+1;
         else
            NewState=[0;0;0];
            NewOuts=3;
         end
     end
     
     if Temp6 == [1;1;0]
         if Outs < 2
            NewState= [State(2);0;0];
            NewOuts=Outs+1;
            NewScore=Score+1;
            NewRbi(j,k)=PlayerRbi(j,k)+1;
            NewRun(State(1),k)=PlayerRun(State(1),k)+1;
         else
            NewState=[0;0;0];
            NewOuts=3;
         end
     end    
    
end

%Hit is a flyout
if h==-2
    
    Temp7=State>0;
    
     if Temp7 == [0;0;0]
         NewState= [0;0;0];
         NewOuts=Outs+1;
     end
     
     if Temp7 == [0;0;1]
         NewState= [0;0;State(3)];
         NewOuts=Outs+1;
     end
     
     if Temp7 == [0;1;0]
        NewState= [0;State(2);0];
        NewOuts=Outs+1;
     end
     
     if Temp7 == [1;0;0]
         NewState= [0;0;0];
         NewOuts=Outs+1;
         if Outs < 2
             NewScore=Score+1;
             NewRbi(j,k)=PlayerRbi(j,k)+1;
             NewRun(State(1),k)=PlayerRun(State(1),k)+1;
         end
             
     end
     
     if Temp7 == [0;1;1]
         NewState=[0;State(2);State(3)];
         NewOuts=Outs+1;
     end
     
     if Temp7 == [1;1;1]
         NewState= [0;State(2);State(3)];
         NewOuts=Outs+1;
         if Outs < 2
             NewScore=Score+1;
             NewRbi(j,k)=PlayerRbi(j,k)+1;
             NewRun(State(1),k)=PlayerRun(State(1),k)+1;
         end
     end
     
     if Temp7 == [1;0;1]
         NewState= [0;0;State(3)];
         NewOuts=Outs+1;
         if Outs < 2
             NewScore=Score+1;
             NewRbi(j,k)=PlayerRbi(j,k)+1;
             NewRun(State(1),k)=PlayerRun(State(1),k)+1;
         end
     end
     
     if Temp7 == [1;1;0]
         NewState= [0;State(2);0];
         NewOuts=Outs+1;
         if Outs < 2
             NewScore=Score+1;
             NewRbi(j,k)=PlayerRbi(j,k)+1;
             NewRun(State(1),k)=PlayerRun(State(1),k)+1;
         end
     end 
    
end