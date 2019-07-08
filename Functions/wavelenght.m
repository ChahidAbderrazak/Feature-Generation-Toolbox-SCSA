%% computes the eigenfuntion wide
%% used SCSA GUI and Fundation

 function  [amplitud ,w_list]=wavelenght(Totale_time,Kpsin3,zero_lim)
dim=min(size(Kpsin3));
for j=1:dim
w_min(j)=min(find(Kpsin3(:,j)>zero_lim));
w_max(j)=max(find(Kpsin3(:,j)>zero_lim));
amplitud(j)=sqrt(max(Kpsin3(:,j)));
end
w_all_waves=Totale_time(w_max)-Totale_time(w_min);
w_list=w_all_waves./[1:dim];
end