function varargout = Assignment1(varargin)
%ASSIGNMENT1 M-file for Assignment1.fig
%      ASSIGNMENT1, by itself, creates a new ASSIGNMENT1 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT1 returns the handle to a new ASSIGNMENT1 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT1('Property','Value',...) creates a new ASSIGNMENT1 using the
%      given property value pairs. Unrecognized properties are passed via
%      varargin to Assignment1_OpeningFcn.  This calling syntax produces a
%      warning when there is an existing singleton*.
%
%      ASSIGNMENT1('CALLBACK') and ASSIGNMENT1('CALLBACK',hObject,...) call the
%      local function named CALLBACK in ASSIGNMENT1.M with the given input
%      arguments.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Assignment1

% Last Modified by GUIDE v2.5 09-Dec-2021 09:59:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Assignment1_OpeningFcn, ...
                   'gui_OutputFcn',  @Assignment1_OutputFcn, ...
                   'gui_LayoutFcn',  [], ...
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


% --- Executes just before Assignment1 is made visible.
function Assignment1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   unrecognized PropertyName/PropertyValue pairs from the
%            command line (see VARARGIN)

% Choose default command line output for Assignment1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Assignment1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Assignment1_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Upload.
function Upload_Callback(hObject, eventdata, handles)
% hObject    handle to Upload (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=uigetfile('*.*');
a=imread(a);
axes(handles.axes1);
imshow(a);
setappdata(0,'a',a)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in GrayImg.
function GrayImg_Callback(hObject, eventdata, handles)
% hObject    handle to GrayImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
gray_img=rgb2gray(a);
axes(handles.axes3);
imshow(gray_img);


% --- Executes on button press in BinaryImg.
function BinaryImg_Callback(hObject, eventdata, handles)
% hObject    handle to BinaryImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
bin=im2bw(a);
axes(handles.axes3);
imshow(bin);


% --- Executes on button press in HistImg.
function HistImg_Callback(hObject, eventdata, handles)
% hObject    handle to HistImg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
a=getappdata(0,'a');
ah=a;
ah=rgb2gray(ah);
axes(handles.axes3);
imhist(ah);


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Interpotation.
function Interpotation_Callback(hObject, eventdata, handles)
% hObject    handle to Interpotation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
val= get(handles.interpolationMenu,'value');

switch val
    case 1
        a=getappdata(0,'a');
        nn=imresize(a,0.3,'nearest');
        axes(handles.axes3);
        imshow(nn)
    case 2
        a=getappdata(0,'a');
        bl=imresize(a,0.3,'bilinear');
        axes(handles.axes3);
        imshow(bl)
    
    case 3
        a=getappdata(0,'a');
        bc=imresize(a,0.3,'bicubic');
        axes(handles.axes3);
        imshow(bc)
    otherwise
        dis('no interpolation')
end


% --- Executes on selection change in interpolationMenu.
function interpolationMenu_Callback(hObject, eventdata, handles)
% hObject    handle to interpolationMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns interpolationMenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from interpolationMenu


% --- Executes during object creation, after setting all properties.
function interpolationMenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to interpolationMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in AddNoise.
function AddNoise_Callback(hObject, eventdata, handles)
% hObject    handle to AddNoise (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
N = get(handles.Noisepopupmenu,'value');
switch N
    case 2
        a=getappdata(0,'a');
        salt=imnoise(a,'salt & pepper',0.02);
        axes(handles.axes3);
        imshow(salt);
    case 3
        a=getappdata(0,'a');
        gau=imnoise(a,'gaussian',0,0.02); %Gassian Noise with mean 0 and vaiance 0.01
        axes(handles.axes3);
        imshow(gau);
    case 4
        a=getappdata(0,'a');
        a=rgb2gray(a);
        a=imresize(a,[256,256],'nearest');
        mynoise=6+(sqrt(255)*randn(256,256));
        mynoiseimg=double(a) + mynoise;
        axes(handles.axes3);
        imshow(mynoiseimg,[]);
    case 5
        a=getappdata(0,'a');
        a=rgb2gray(a);
        a=imresize(a,[256,256],'nearest');
        [x,y]=meshgrid(1:256,1:256);
        mysinesoidalnoise=15*sin(2*pi/14*x+2*pi/14*y);
        mynoiseimg1=double(a) + mysinesoidalnoise;
        axes(handles.axes3);
        imshow(mynoiseimg1,[]);
    otherwise
        disp('no any noise apply to the image');
end



% --- Executes on selection change in Noisepopupmenu.
function Noisepopupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to Noisepopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Noisepopupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Noisepopupmenu


% --- Executes during object creation, after setting all properties.
function Noisepopupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Noisepopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in Filterpopupmenu.
function Filterpopupmenu_Callback(hObject, eventdata, handles)
% hObject    handle to Filterpopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns Filterpopupmenu contents as cell array
%        contents{get(hObject,'Value')} returns selected item from Filterpopupmenu


% --- Executes during object creation, after setting all properties.
function Filterpopupmenu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Filterpopupmenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in filter.
function filter_Callback(hObject, eventdata, handles)
% hObject    handle to filter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
F = get(handles.Filterpopupmenu,'value');
switch F
    case 2
        a=getappdata(0,'a');
        img1=a;
        GaussianFilter = imgaussfilt(img1,2); %with std dev=2
        img2 = img1-GaussianFilter; 
        img3 = img1+img2;
        axes(handles.axes3);
        imshow(img3);
    case 3
        a=getappdata(0,'a');
        img1=a;
        GaussianFilter = imgaussfilt(img1,2); %with std dev=2
        img2 = img1-GaussianFilter; 
        img3 = img1+img2*4.5;
        axes(handles.axes3);
        imshow(img3);
    case 4
        a=getappdata(0,'a');
        a=rgb2gray(a);
        a=imresize(a,[256,256],'nearest');
        mynoise=6+(sqrt(255)*randn(256,256));
        mynoiseimg=double(a) + mynoise;
        axes(handles.axes3);
        imshow(mynoiseimg,[]);
    case 5
        a=getappdata(0,'a');
        a=rgb2gray(a);
        BoxFilter = conv2(single(a), ones(3)/9, 'same');
        axes(handles.axes3);
        imshow(BoxFilter, []);
    case 6
        a=getappdata(0,'a');
        a=rgb2gray(a);
        WtFilter = conv2(single(a), [1,2,1;2,4,2;1,2,1]/16, 'same');
        axes(handles.axes3);
        imshow(WtFilter, []);
    otherwise
        disp('no filter apply');
end



% --- Executes on selection change in popupmenu4.
function popupmenu4_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu4 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu4


% --- Executes during object creation, after setting all properties.
function popupmenu4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
FD = get(handles.FDpopupmenu,'value');
switch FD
    case 2
        %FF2 CODE
        
    case 3
        %low ideal pass
        a=getappdata(0,'a');
        input_image = rgb2gray(a);
        [M,N] = size(input_image);
        FT_img = fft2(double(input_image));
        D0 = 30;
        u = 0:(M-1);
        idx = find(u>M/2);
        u(idx) = u(idx)-M;
        v = 0:(N-1);
        idy = find(v>N/2);
        v(idy) = v(idy)-N;
        [V, U] = meshgrid(v, u);
        D = sqrt(U.^2+V.^2);
        H = double(D<=D0);
        G = H.*FT_img;
        output_img = real(ifft2(double(G)));
        axes(handles.axes2);
        imshow(output_img, [ ]);
    case 4
        %gaussian lps
        a=getappdata(0,'a');
        org_img = rgb2gray(a);
        football = imnoise(org_img,'salt & pepper',0.02); %'salt & pepper')
        PQ = paddedsize(size(football));
        D0 = 0.05*PQ(1);
        H = lpfilter('gaussian',PQ(1),PQ(2),D0);
        F = fft2(double(football),size(H,1),size(H,2));
        LPFS_football = H.*F;
        LPF_football = real(ifft2(LPFS_football));
        LPF_football = LPF_football(1:size(football,1),1:size(football,2));
        axes(handles.axes2);
        imshow(LPF_football,[])
    case 6
        %ideal hpf
        a=getappdata(0,'a');
        input_image=rgb2gray(a);
        [M, N] = size(input_image);
        FT_img = fft2(double(input_image));
        D0 = 10;
        u = 0:(M-1);
        idx = find(u>M/2);
        u(idx) = u(idx)-M;
        v = 0:(N-1);
        idy = find(v>N/2);
        v(idy) = v(idy)-N;
        [V, U] = meshgrid(v, u);
        D = sqrt(U.^2+V.^2);
        H = double(D > D0);
        G = H.*FT_img;
        output_image = real(ifft2(double(G)));
        axes(handles.axes2);
        imshow(output_image, [ ]);
    case 5
        %Butterworth LPF
        a=getappdata(0,'a');
        input_image=rgb2gray(a);
        [M, N] = size(input_image);
        FT_img = fft2(double(input_image));
        n = 2; 
        D0 = 20;
        u = 0:(M-1);
        v = 0:(N-1);
        idx = find(u > M/2);
        u(idx) = u(idx) - M;
        idy = find(v > N/2);
        v(idy) = v(idy) - N;
        [V, U] = meshgrid(v, u);
        D = sqrt(U.^2 + V.^2);
        H = 1./(1 + (D./D0).^(2*n));
        G = H.*FT_img;
        output_image = real(ifft2(double(G)));
        axes(handles.axes2);
        imshow(output_image, [ ]);
    case 8
        %Butterworth HPF
        a=getappdata(0,'a');
        input_image=rgb2gray(a);
        [M, N] = size(input_image);
        FT_img = fft2(double(input_image));
        n = 2;
        D0 = 20;
        u = 0:(M-1);
        v = 0:(N-1);
        idx = find(u > M/2);
        u(idx) = u(idx) - M;
        idy = find(v > N/2);
        v(idy) = v(idy) - N;
        [V, U] = meshgrid(v, u);
        D = sqrt(U.^2 + V.^2);
        H = 1./(1 + (D./D0).^(2*n));
        G = H.*(1-FT_img);
        output_image = real(ifft2(double(G)));
        axes(handles.axes2);
        imshow(output_image, [ ]);
    case 7
        %gaussian hps
        a=getappdata(0,'a');
        footBall=rgb2gray(a);
        PQ = paddedsize(size(footBall));
        D0 = 0.05*PQ(1);
        H = hpfilter('gaussian', PQ(1), PQ(2), D0);
        F=fft2(double(footBall),size(H,1),size(H,2));
        HPFS_football = H.*F;
        HPF_football=real(ifft2(HPFS_football));
        HPF_football=HPF_football(1:size(footBall,1), 1:size(footBall,2));
        axes(handles.axes2);
        imshow(HPF_football, []);
    otherwise
        disp('no filter of frequency domain apply');
end
