% Totale_time= [0:1:sz_data-1]./high_rate;
% SCSA_Dw_fs=high_rate/fs;
SCSA_Dw_fs=sz_data/fs;

set(handles.Data_size,'string',num2str(sz_data)) ;
set(handles.feh,'string',num2str(SCSA_Dw_fs)) ;

Totale_time= Totale_time((1:fs:end));
gen_data=gen_data((1:fs:end));
sig_noised3=sig_noised2((1:fs:end));

sz_data=max(size(gen_data));
% if sz_data<SCSA_Dw_fs
% 
% SCSA_Dw_fs=sz_data;
% % fs=1;
% end
%     
 SCSA_slice=floor(sz_data/SCSA_Dw_fs); 
 
% set(handles.slice,'string',num2str(SCSA_slice)) ;


    %% Plot the signal 
%     axes(handles.axes22);
    axes(handles.axes3);
    N_data=max(size(sig_noised3));
    cla;
    plot (Totale_time(1:N_data), sig_noised3,'b','LineWidth',2) 
    xL = xlim;yL = ylim;
    line(xL, [0 0],'color','k','linewidth',2) %x-axis
    line([0 0], yL,'color','k','linewidth',2) %y-axis
    lgdd=legend('Noisy signal');
    set(lgdd,'FontSize',15); 

var_x=sqrt(var(sig_noised3));
% set(handles.var_x,'string',num2str((var_x))) ;

mean_x=mean(sig_noised3);  
%     set(handles.mean_x,'string',num2str((mean_x))) ;
    
    
    h_stoch=0.3/var_x;