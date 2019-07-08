gen_data=gen_data1;

SCSA_reconstruction

% Plot the wavelent of the eigenfunctions
Plot_the_Wavelengths

%     set(handles.nb_eig,'string', sz_indx-1);
 msg22=strcat('The signal is reconstructed with  ',{' '},num2str(sz_indx-1),{' '},'negative eigenvalues.');
 set(handles.disp_Nh,'string', msg22);

     
% render the tablee
set(handles.t,'data',d);

%% compute performnace 
% yscsa3=yscsa3-(min(yscsa3)-min(gen_data));

MSE =1/immse(yscsa3,gen_data);
 %% compute Signal to Noise ratio   
[PSNR, SNR] = psnr(yscsa3,gen_data);
RLERR=(norm(yscsa3,1)-norm(gen_data,1))/norm(gen_data,1);

%% History of h values
set(handles.psnr_a1,'string',num2str(floor(PSNR))) ;
set(handles.h_a1,'string',num2str(floor(h))) ;
set(handles.Nh_a1,'string',num2str(floor(Nh))) ;

%% plot SCSA reconsrtucted signal results
axes(handles.axes3);
cla;

if norm(sig_noised3-gen_data)==0
    
%         plot (New_time, sig_orgin-mean2(sig_orgin),'g','LineWidth',3) 
        plot (Totale_time, gen_data ,'g','LineWidth',3)  
        hold on 
        plot (Totale_time, yscsa3 ,'r','LineStyle',':','LineWidth',3.5)            
        lgdd=legend('Reference signal','SCSA signal');

else
%        plot (New_time, sig_orgin-mean2(sig_orgin),'g','LineWidth',3) 
        plot (Totale_time, sig_noised3,'b','LineWidth',2) 
        hold on
        plot (Totale_time, gen_data ,'g','LineWidth',3)  
        hold on 
        plot (Totale_time, yscsa3 ,'r','LineStyle',':','LineWidth',3.5)            
        lgdd=legend('Noisy  Signal ','Reference signal','SCSA signal');

end





                
                
                
                set(lgdd,'FontSize',12); 
                xlabel('Temps (s)')
%                 xlim([0 10])
%                 ylabel('Signal')
                grid on                
                title( 'Positive signal reconstruction using SCSA')
%                 xlabel([ ' alpha = ', num2str(-alp)])%,' betha = ', num2str(betha),' A1 = ', num2str(A1)])
                xL = xlim;yL = ylim;
                if SCSA_slice>1
                    for iter=1:SCSA_slice
                        slice_border=Totale_time(iter*SCSA_Dw_fs);
                        line([slice_border slice_border], yL,'color','c','LineStyle',':','linewidth',2) %y-axis
                        line(xL, [0 0],'color','k','linewidth',2) %x-axis
                    end
                end
%% Play the output sound
set(handles.N_a1,'string', SCSA_Dw_fs );
set(handles.MSE_a1,'string', MSE );

set(handles.MSE_a1,'string', sprintf('%.1e',MSE) );


% sound(sig_orgin,Fs_audio);                     % original
% audiowrite('sig_orgin.wav',sig_orgin,Fs_audio)
% sound(sig_noised3,Fs_audio);                     % Noised
% audiowrite('sig_noised.wav',sig_noised,Fs_audio)
% sound(yscsa3,Fs_audio);                     % Denoised
% audiowrite('yscsa3.wav',yscsa3,Fs_audio)
% 



set(handles.up_plot,'enable','on') ;
set(handles.up_plot,'string',msg_butom) ;
toc
close(figure(100))

%% Frequencial analysis 
% [freq y_fft y_psd]=Fourier_of_signal(gen_data,yscsa3,One_Sec_rate);
 

% toc
% end

%% save the output SCSA signal
% 
% sv_sig=get(handles.save_sig_reuse,'Value');
% 
% if sv_sig == 1
%  save('scsa_data.mat','yscsa3','One_Sec_rate','gen_data','Totale_time')
% end 
% set(handles.save_sig_reuse,'Value',0)
set(handles.up_plot,'string',' Signal reconstruction ') ;