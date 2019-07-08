
%% compute wavelemght list 
   zero_lim=8*10^-5;                            % limit where the widy wave of h=400 has ended
   [amplitud ,w_list]=wavelenght(Totale_time,Kpsin3,zero_lim);
   h_wave= [h_wave ;h w_list(1)];
   
 %%  show the eigenvalues in the table 

    % Define the data
    idx0=1;
    idx3=[idx3;0];
    sz_indx=max(size(idx3));


    d1=num2str(temp3);
    Nh=sz_indx-1;
    for kk=1:max(size(temp3))
        d{kk,1}=temp3(kk); 

        if (idx3(idx0)==kk && idx0<sz_indx)
            d{kk,4}='true';           
            d{kk,2}=num2str(w_list(idx0));
            d{kk,3}=num2str(amplitud(idx0));
            idx0=idx0+1;
                else
                d{kk,4}='false';
                d{kk,2}='0';
                d{kk,3}='0';
        end  
    end
    
    

if 0==1    
    %% Plot 3 first eigenfuction  
        T_psin=min(size(psin3));                                                                   % Number of eigenvalues and eigenfuction to plot
      col=hsv(T_psin+1);

      if T_psin>3
            frst_pssin=3;
        else
            frst_pssin=T_psin;
      end

       %% Plot 3 first  sqrt(eigenvalues) * (eigenfuction)^2 
      for N_psin=1:frst_pssin
      eval([strcat('axes(handles.Kpsin',num2str(N_psin)) ' );']);
      cla;
        plot (Totale_time, Kpsin3(:,N_psin)','color',col(N_psin,:),'LineWidth',1.5) ;
    %     lgndd=strcat('\surd \kappa_',num2str(N_psin),'* \Psi_',num2str(N_psin),'^2 ');
    %     lgndd=legend(lgndd,'Location','northwest')
    %     set(lgndd,'FontSize',15); 
        xL = xlim;yL = ylim;

                for iter=1:SCSA_slice
                    slice_border=Totale_time(iter*SCSA_Dw_fs);
                    line([slice_border slice_border], yL,'color','c','LineStyle',':','linewidth',2) %y-axis
                    line(xL, [0 0],'color','k','linewidth',2) %x-axis
                end
        % ylim([1.56.*yL])
      end

     %% Plot normally  3 first eigenfuctions
      for N_psin=1:frst_pssin
      eval([strcat('axes(handles.psin',num2str(N_psin)) ' );']);
      cla;
        plot (Totale_time, psin3(:,N_psin)','color',col(N_psin,:),'LineWidth',1.5) 
    %     lgndd=strcat('\kappa=',num2str(kappa(N_psin)));
    %     lgndd=legend(lgndd,'Location','northwest')
    %     set(lgndd,'FontSize',15); 
        xL = xlim;yL = ylim;

                for iter=1:SCSA_slice
                    slice_border=Totale_time(iter*SCSA_Dw_fs);
                    line([slice_border slice_border], yL,'color','c','LineStyle',':','linewidth',2) %y-axis
                    line(xL, [0 0],'color','k','linewidth',2) %x-axis
                end
        % ylim([1.56.*yL])
     end


    % psin4=h.*[psin3(:,1) psin3(:,2) psin3(:,3)]
    % 
    % figure(125);subplot(2,1,2);
    %             plot(Totale_time,psin4,'DisplayName','Signal')

     %% Plot all reconstruction eigenfuction of eigenvalues    
     axes(handles.psin4);
     cla;
     for N_psin=1:T_psin
        plot (Totale_time, Kpsin3(:,N_psin)','color',col(N_psin,:),'LineWidth',1.5) 
        hold on
        Eig_legend{N_psin}=strcat(' \lambda_{',num2str(N_psin),'} =',num2str(kappa(N_psin)));

     end

     hold off
      lgndd=legend(Eig_legend,'Location','northwest');%'Location','westoutside')%'Location','northwest')
      set(lgndd,'FontSize',15); 
      xL = xlim;yL = ylim;
      line(xL, [0 0],'color','k','linewidth',2); %x-axis

     % plot the slices separation   
                for iter=1:SCSA_slice
                    slice_border=Totale_time(iter*SCSA_Dw_fs);
                    line([slice_border slice_border], yL,'color','c','LineStyle',':','linewidth',2); %y-axis
                    line(xL, [0 0],'color','k','linewidth',2); %x-axis
                end
    %% plot speratelly sqrt(eigenvalues) * (eigenfuction)^2   
    %   for N_psin=1:T_psin %#
    %     figure(123)
    %     plot (Totale_time, psin3(:,N_psin)','color',col(N_psin,:),'LineWidth',1.5) 
    %     hold on
    %      Eig_legend{N_psin}=strcat('\Psi',num2str(N_psin),' of \kappa =',num2str(kappa(N_psin)));
    %     
    %  end
    %  
    %  hold off
    % %   lgndd=legend(Eig_legend,'Location','westoutside')%'Location','northwest')
    % %   set(lgndd,'FontSize',15); 
    %   xL = xlim;yL = ylim;
    %   line(xL, [0 0],'color','k','linewidth',2) %x-axis

    %   % plot the slices separation  
    %             for iter=1:SCSA_slice
    %                 slice_border=Totale_time(iter*SCSA_Dw_fs);
    %                 line([slice_border slice_border], yL,'color','c','LineStyle',':','linewidth',2) %y-axis
    %                 line(xL, [0 0],'color','k','linewidth',2) %x-axis
    %             end
    %   
    
end