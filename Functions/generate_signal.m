%%
    %**********************************************************************
    %                        Waves signal generaion                       *
    %**********************************************************************

 % Author:  Abderrazak Chahid
 % aberrazak.chahid@gmail.com
 % Advicor : Professor Taous_Meriem Laleg . EMAN Group KAUST
 % taousmeriem.laleg@kaust.edu.sa 
 
 %% Description
 % Script generates signal of different form : square sin exponential ....
 

 % Done: Oct, 10th 2015
 
 %% input parapeters
 % sig_num: signal numero 
 % Data_size:  fundamental signal size before sampling
 % Fs : sampling frequency to sample the Data_size signal  
 % alp,beta : function variable scale
 % A1,A2   : amplitude scale
 
 %% output parapeters
 % signal of size Data_size/Fs
 
 
function [sig t]=generate_signal(sig_num,Fs,Data_size,alp,beta,A1,A2)
t=(1-Data_size)/(2*Fs):1/Fs:(Data_size-1)/(2*Fs);
t3=0:1/Fs:(Data_size-1)/(Fs);
%% Generate the serie of signals 

switch sig_num
    case 1
        disp('Signal = A1')
        sig=A1*ones([1,Data_size]);
        
    case 2
        if alp>10 
            alp=10;
        end

        if beta>10
            beta=10;
        end

        alp=abs(alp);
        beta=abs(beta);
        disp('Signal = A1*Rect(t/alpha) repeated alpha times of  periode 1/alpha')
        sig=zeros([1,floor(Data_size)]);
        alpha0=floor(Data_size/(2*alp));
        
        for i=1:2:2*alp
        sig(1+(i-1)*alpha0:i*alpha0)=A1*ones([1,alpha0]);
        end
        sig=circshift(sig',floor(alpha0/2))';
%         sig6=(A1).*sig1;
%         sig2=[zeros([1,floor(Data_size/(4*beta))]) ones([1,floor(Data_size/(2*beta))]) zeros([1,floor(Data_size/(4*beta))])];

%         sig7=(A2).*sig2;
%         sig10= sig6;
%         for kkk=2:alp
%             sig10=[sig10 sig6];
%         end
%         
%         sig20=sig7;
%         for kkk=2:beta
%             sig20=[sig20 sig7];
%         end
%         sig=sig10+sig20;
%         
        
     case 3        
        disp('Signal = A1*t + A2*t')
        sig1=A1.*t3;
        sig2=A2.*t3;
%         sig = abs(sig1+circshift(sig2',floor(Data_size*0.5))');
        sig=sig1+sig2;
        t=t3;
     case 4
        disp('Signal = A1*t^2 + A2*t^2')
        sig1=A1.*t.^2;
        sig2=A2.*t.^2;
        
        sig =  sig1 +circshift(sig2',floor(Data_size*0.5))';
               
    case 5      
        disp('Signal = A1*Exp(alpha*t)u + A2*Exp(beta*t)u')
%         alp=-20;beta=-40;
        sig2=exp(t3.*(alp));
        sig1=exp(t3.*(beta));
%         sig = (A2/max(sig1))*circshift(sig1',floor(Data_size*0.10))'+ (A1/max(sig2))*circshift(sig2',floor(Data_size*0.5))';
         sig = A2*sig1+ A1*sig2;
         t=t3;

 
    case 6
        disp('Signal = A1*sin(2*pi*alp.*t)+A2*sin(2*pi*beta.*t)')
        sig1=A1*sin(2*pi*alp.*t3);
        sig2=A2*sin(2*pi*beta.*t3);
        sig=sig1+sig2;  
        t=t3;
        
    case 7
        disp('Signal = A1*sinc(alp.*t)+A2*sinc(beta.*t)')
        sig1=A1*sinc(10*alp.*t);
        sig2=A2*sinc(10*beta.*t);
        sig = sig1+circshift(sig2',floor(Data_size*0.5))';
        

    case 8
        disp('Signal = RC circuit decharge ')
        %% RC cicrcuit
        VS=10;RC=0.08;
        SW_vla=0.96;                                                                 % the output value to swithch decharge.
        Data_size;
        charg=Data_size/2;
        t1=-t3(1:charg);


        charg_phaz=(1-exp(t1./RC)) ;
        ind = min(find(charg_phaz>SW_vla));
        V_sat=charg-ind;
        Data_size2=V_sat+charg;
        saturation=charg_phaz(ind)*ones([1 V_sat]);
        
        t2=t3(1:charg);
        decharg_phaz=exp(-t2./RC)-1+charg_phaz(ind);
        sig=[charg_phaz(1:ind) saturation decharg_phaz] ;
% sig = circshift(sig',floor(-Data_size/2))';
        
    otherwise
        disp('num of the signal does mnot exist, PLZ choose an other one')
        disp('Signal = alpha')
        sig=0*ones([1,Data_size]);
end      





end