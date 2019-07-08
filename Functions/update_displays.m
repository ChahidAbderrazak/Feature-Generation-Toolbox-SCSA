%% Generate the  signal data
global cname filename rep
high_rate=1024;                                                             % maximun matrix size to use for one single SCSA per Second
   
%% generate noise 
%% the signal parameters    
h=str2double(get(handles.H_paramtr,'string')) ;
fs=str2double(get(handles.fs,'string') );
   
% medical sigals arterial pressure
% ext = './Input_Data/*.mat';  
% [filename rep]= uigetfile({ext}, 'File selector')  ;

load(cname); 

 One_Sec_rate=Fs;                  % sample per second  
 n_sec=1
 data_sec=One_Sec_rate*n_sec;
 

get_randr = randi([1 size(Xp,1)],1,1);
gen_data1=Xp( get_randr,:);
gen_data2=Xn(get_randr,:);


for i=1:length(gen_data1)
    if gen_data1(i)<0 | gen_data2(i)<0
        Ind=1;
        break
    else 
        Ind = 0;
    end 
end  
 


%% generate noise 
sz_data=max(size(gen_data1));
e_data= rand(1, sz_data);
set(handles.listbox2,'string',' You will process your loaded data') ;
disp(' You will process your loaded data')
Totale_time=t;




    