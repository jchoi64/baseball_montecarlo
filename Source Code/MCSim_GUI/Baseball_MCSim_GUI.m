
function varargout = Baseball_MCSim_GUI(varargin)
% BASEBALL_MCSIM_GUI MATLAB code for Baseball_MCSim_GUI.fig
%      BASEBALL_MCSIM_GUI, by itself, creates a new BASEBALL_MCSIM_GUI or raises the existing
%      singleton*.
%
%      H = BASEBALL_MCSIM_GUI returns the handle to a new BASEBALL_MCSIM_GUI or the handle to
%      the existing singleton*.
%
%      BASEBALL_MCSIM_GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in BASEBALL_MCSIM_GUI.M with the given input arguments.
%
%      BASEBALL_MCSIM_GUI('Property','Value',...) creates a new BASEBALL_MCSIM_GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Baseball_MCSim_GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Baseball_MCSim_GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Baseball_MCSim_GUI

% Last Modified by GUIDE v2.5 22-Oct-2017 18:24:50

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Baseball_MCSim_GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @Baseball_MCSim_GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before Baseball_MCSim_GUI is made visible.
function Baseball_MCSim_GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Baseball_MCSim_GUI (see VARARGIN)

% Choose default command line output for Baseball_MCSim_GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
[YearTemp,NameTemp] = xlsread('BattingData.xlsx',1,'A2:B102817');
BattingInfo=xlsread('BattingData.xlsx',1,'H2:W102817');
Batters=string(YearTemp)+string(NameTemp);
setappdata(0,'BatterName',Batters);
setappdata(0,'BatterInfo',BattingInfo);


% UIWAIT makes Baseball_MCSim_GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Baseball_MCSim_GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function input1_Callback(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input1 as text
%        str2double(get(hObject,'String')) returns contents of input1 as a double


% --- Executes during object creation, after setting all properties.
function input1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input2_Callback(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input2 as text
%        str2double(get(hObject,'String')) returns contents of input2 as a double


% --- Executes during object creation, after setting all properties.
function input2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input3_Callback(hObject, eventdata, handles)
% hObject    handle to input3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input3 as text
%        str2double(get(hObject,'String')) returns contents of input3 as a double


% --- Executes during object creation, after setting all properties.
function input3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input4_Callback(hObject, eventdata, handles)
% hObject    handle to input4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input4 as text
%        str2double(get(hObject,'String')) returns contents of input4 as a double


% --- Executes during object creation, after setting all properties.
function input4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input5_Callback(hObject, eventdata, handles)
% hObject    handle to input5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input5 as text
%        str2double(get(hObject,'String')) returns contents of input5 as a double


% --- Executes during object creation, after setting all properties.
function input5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input6_Callback(hObject, eventdata, handles)
% hObject    handle to input6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input6 as text
%        str2double(get(hObject,'String')) returns contents of input6 as a double


% --- Executes during object creation, after setting all properties.
function input6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input7_Callback(hObject, eventdata, handles)
% hObject    handle to input7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input7 as text
%        str2double(get(hObject,'String')) returns contents of input7 as a double


% --- Executes during object creation, after setting all properties.
function input7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input8_Callback(hObject, eventdata, handles)
% hObject    handle to input8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input8 as text
%        str2double(get(hObject,'String')) returns contents of input8 as a double


% --- Executes during object creation, after setting all properties.
function input8_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function input9_Callback(hObject, eventdata, handles)
% hObject    handle to input9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of input9 as text
%        str2double(get(hObject,'String')) returns contents of input9 as a double


% --- Executes during object creation, after setting all properties.
function input9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to input9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%Obtain batter info from excel sheet
Batter=getappdata(0,'BatterName');
Batting=getappdata(0,'BatterInfo');
Name1=get(handles.input1,'string');
Name2=get(handles.input2,'string');
Name3=get(handles.input3,'string');
Name4=get(handles.input4,'string');
Name5=get(handles.input5,'string');
Name6=get(handles.input6,'string');
Name7=get(handles.input7,'string');
Name8=get(handles.input8,'string');
Name9=get(handles.input9,'string');

%place holder
Names=0;

%Calculate batter percentages
[NatObp, HitP, OneBP, TwoBP, ThreeBP, HRP, SOP, GBP, FBP, Names, BA, OBP, SLG]=ReadexcelGUI(Name1,Name2,Name3,Name4,Name5,Name6,Name7,Name8,Name9,Batting,Batter);
OPS=OBP+SLG;

%Batter data is put into respective tables
set(handles.uitable2,'Data',[BA OBP SLG OPS]);
set(handles.uitable2,'ColumnName',{'BA';'OBP';'SLG';'OPS'});
set(handles.uitable2,'RowName',{char(Name1);char(Name2);char(Name3);char(Name4);char(Name5);char(Name6);char(Name7);char(Name8);char(Name9); 'Team Avg'});

%Calculate Runs Scored
innings=str2double(get(handles.innings,'string'));
n=str2double(get(handles.iterations,'string'));
[Score, PA, SO, GO, FO, Walks,Hits, OneB, TwoB, ThreeB, HR, R, RBI, PA_T, SO_T, GO_T, FO_T, Walks_T, Hits_T, OneB_T, TwoB_T, ThreeB_T, HR_T, R_T, RBI_T]=Baseball_MCSimGUICalc(NatObp,HitP,OneBP,TwoBP,ThreeBP,HRP,SOP,innings,n);
AvgRGame=sum(Score)/n;

%Scores are put into respective tables
set(handles.boxscore_T,'Data',[SO_T GO_T FO_T Walks_T OneB_T TwoB_T ThreeB_T HR_T R_T RBI_T]);
set(handles.boxscore_T,'ColumnName',{'SO';'GO';'FO';'Walks';'1B';'2B';'3B';'HR';'R';'RBI'});
set(handles.boxscore_T,'RowName',{char(Name1);char(Name2);char(Name3);char(Name4);char(Name5);char(Name6);char(Name7);char(Name8);char(Name9)});
set(handles.text5,'string',AvgRGame);
set(handles.boxscore_A,'Data',[SO_T GO_T FO_T Walks_T OneB_T TwoB_T ThreeB_T HR_T R_T RBI_T]/n);
set(handles.boxscore_A,'ColumnName',{'SO';'GO';'FO';'Walks';'1B';'2B';'3B';'HR';'R';'RBI'});
set(handles.boxscore_A,'RowName',{char(Name1);char(Name2);char(Name3);char(Name4);char(Name5);char(Name6);char(Name7);char(Name8);char(Name9)});

%Histogram of runs scored
histogram(Score,max(Score));
xlabel('Runs Scored');
ylabel('Frequency (# of Games)');
sd=std(Score);
set(handles.stddev,'string',sd);



function iterations_Callback(hObject, eventdata, handles)
% hObject    handle to iterations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iterations as text
%        str2double(get(hObject,'String')) returns contents of iterations as a double


% --- Executes during object creation, after setting all properties.
function iterations_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iterations (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function innings_Callback(hObject, eventdata, handles)
% hObject    handle to innings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of innings as text
%        str2double(get(hObject,'String')) returns contents of innings as a double


% --- Executes during object creation, after setting all properties.
function innings_CreateFcn(hObject, eventdata, handles)
% hObject    handle to innings (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in sampleteam.
function sampleteam_Callback(hObject, eventdata, handles)
% hObject    handle to sampleteam (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.input1,'string',{'2016spande01'});
set(handles.input2,'string',{'2016panikjo01'});
set(handles.input3,'string',{'2016beltbr01'});
set(handles.input4,'string',{'2016poseybu01'});
set(handles.input5,'string',{'2016crawfbr01'});
set(handles.input6,'string',{'2016pencehu01'});
set(handles.input7,'string',{'2016parkeja03'});
set(handles.input8,'string',{'2016tomlike01'});
set(handles.input9,'string',{'2016bumgama01'});
