axes(handles.axes11);
cla;
plot (spectre1 ,'b','LineWidth',3)  
hold on 
plot (spectre2 ,'r','LineWidth',3.5)            
lgdd=legend('Positive dataset ','Negative dataset ');
title('SCSA features [Eigenvalues]')