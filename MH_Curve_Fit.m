function varargout = MH_Curve_Fit(varargin)
% MH_CURVE_FIT MATLAB code for MH_Curve_Fit.fig
%      MH_CURVE_FIT, by itself, creates a new MH_CURVE_FIT or raises the existing
%      singleton*.
%
%      H = MH_CURVE_FIT returns the handle to a new MH_CURVE_FIT or the handle to
%      the existing singleton*.
%
%      MH_CURVE_FIT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MH_CURVE_FIT.M with the given input arguments.
%
%      MH_CURVE_FIT('Property','Value',...) creates a new MH_CURVE_FIT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before MH_Curve_Fit_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to MH_Curve_Fit_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help MH_Curve_Fit

% Last Modified by GUIDE v2.5 07-Jun-2018 20:02:04

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @MH_Curve_Fit_OpeningFcn, ...
                   'gui_OutputFcn',  @MH_Curve_Fit_OutputFcn, ...
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


% --- Executes just before MH_Curve_Fit is made visible.
function MH_Curve_Fit_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to MH_Curve_Fit (see VARARGIN)

global n H V u k Et x y
global a T MS 

% Choose default command line output for MH_Curve_Fit
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes MH_Curve_Fit wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = MH_Curve_Fit_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit3_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function edit3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in load_button.
function load_button_Callback(hObject, eventdata, handles)
% hObject    handle to load_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y
cla(handles.GraphAxes);
[handles.fileName, handles.path] = uigetfile('*.xls','Select M-H curve file');
guidata(hObject, handles);
handles.fullFileName = strcat(handles.path, handles.fileName);
[x, y] = ReadExcel(handles.fullFileName,1,2);
guidata(hObject, handles);
plot (handles.GraphAxes, x,y,'LineWidth',2);
xlabel(handles.GraphAxes,'Magnetic Field (Oe)');
ylabel(handles.GraphAxes,'Magnetization (emu)');
title(handles.GraphAxes,'M-H Curves');
legend(handles.GraphAxes,'Experiment','Fitting');



%[numbers, colNames] = xlsread('fileName');
function [ x, y ] = ReadExcel(fileName, xCol, yCol)

%ReadExcel Gets data from specific columns for plotting
%   Get data from an xls file for specific columns, useful for 2D plotting
a = xlsread(fileName);
x = a(:,xCol); % make original Excel column into 'x'
y = a(:,yCol); % make original Excel column into 'y'

%cd(filepath1);


% --- Executes on button press in fit_button.
function fit_button_Callback(hObject, eventdata, handles)
% hObject    handle to fit_button (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.GraphAxes);
global n H V u k Et x y
global a T MS 
[x, y] = ReadExcel(handles.fullFileName,1,2);
guidata(hObject, handles);
%plot (handles.GraphAxes, x,y);
a = str2double(get(handles.edit1, 'String'));
T = str2double(get(handles.edit2, 'String'));
MS = str2double(get(handles.edit3, 'String'));

n=length(y);
H=x;
V=4/3*pi*(a/2*10^-7)^3;
u=V*MS;
k=1.3806504*10^-16;
Et=k*T;
for i=1:n
angle(i,1)=(u/Et)*H(i);
Mt(i,1)=MS.*langev(angle(i,1));
end
plot (handles.GraphAxes, x,y,'LineWidth',2);
xlabel(handles.GraphAxes,'Magnetic Field (Oe)');
ylabel(handles.GraphAxes,'Magnetization (emu)');
title(handles.GraphAxes,'M-H Curves');
legend(handles.GraphAxes,'Experiment','Fitting');
hold on
plot(handles.GraphAxes, H, Mt,'r:','LineWidth',2);
xlabel(handles.GraphAxes,'Magnetic Field (Oe)');
ylabel(handles.GraphAxes,'Magnetization (emu)');
title(handles.GraphAxes,'M-H Curves');
legend(handles.GraphAxes,'MH Exp','MH Fit');

function [M] = langev(x)
M = (coth(x) - 1./(x));


% --- Executes on button press in clear_graph.
function clear_graph_Callback(hObject, eventdata, handles)
% hObject    handle to clear_graph (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
cla(handles.GraphAxes);


% --- Executes on button press in AutoFit.
function AutoFit_Callback(hObject, eventdata, handles)
% hObject    handle to AutoFit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n H V u k Et x y
global a T MS 
global x0 MH_fit resnorm exitflag output max_sat Temperature Saturation

[x, y] = ReadExcel(handles.fullFileName,1,2);
guidata(hObject, handles);
%plot (handles.GraphAxes, x,y);
a = str2double(get(handles.edit1, 'String'));
T = str2double(get(handles.edit2, 'String'));
MS = str2double(get(handles.edit3, 'String'));

max_sat = max(y); % initial guess
Saturation = lsqnonlin(@AutoFit,max_sat)

set(handles.edit3, 'String',num2str(Saturation));

disp(resnorm) 
disp(exitflag) 
disp(output)



function res = AutoFit(Ms)
global x y k V a T
sizeNP = a;
Temp = T;
n=length(y);
H=x;
V=4/3*pi*(sizeNP/2*10^-7)^3;
u=V*Ms;
k=1.3806504*10^-16; % Boltzmann's constant
Et=k*Temp;
angle = zeros(n,1);
Mt = zeros(n,1);
for i=1:n
angle(i,1)=(u/Et)*H(i);
Mt(i,1)=Ms.*langev(angle(i,1));
end
res = Mt - y; % trying to minimize the the difference between exp. and fit





% --- Executes on button press in save_figure.
function save_figure_Callback(hObject, eventdata, handles)
% hObject    handle to save_figure (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
print(gcf,'-dpng','-r600','M_H_curve.png')
