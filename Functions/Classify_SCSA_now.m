K=5;
type_clf= 'SVM';%'LR';% 
CV_type='KFold';%  'LOO';%                                   strcat(num2str(K),'-Folds_CV');%   

%% For test purpose, use small data set by rndom sampling

if exist('Xn')==0
    indp=find(y==1); Xp=X(indp,:); 
    indn=find(y==0); Xn=X(indn,:); 
end

%% get balanced data for training
Nn=size(Xn,1);  Np=size(Xp,1);  yp=ones(Np,1); yn=0*ones(Nn,1);
Ndata=min(Nn,Np);
X=[Xp(1:Ndata,:);Xn(1:Ndata,:)];
y=[yp(1:Ndata,:);yn(1:Ndata,:) ];




%% Find the optimal combination of the features  
feature_TAG={'h1'};        % features TAG to be combined
feature_type='SCSA_';


%% #########################   Display   ################################
fprintf('\n --> Run CV  classification using : ');
d_data0=string(strcat(feature_type(1:end-1),'-based Features'));
fprintf(' %s\n ',d_data0);

set(handles.listbox2,'string',strcat(' Run CV  classification using :  type:',{''},CV_type,{''},', KFolds=',num2str(K),',  testing size: ',num2str(size(X,1) ))) ;

%% ###################################################################
Path_classification='./Classification_results';
root_folder='./Classification_result/SCSA';
root_folder=strcat(Path_classification,'SCSA');

if exist(root_folder)~=7; mkdir(root_folder);end 


%% Find the optimal combination of the features  SCSA  
[F_SCSA, S_SCSA, B_SCSA, P_SCSA,AF_SCSA,SFP_SCSA,SK_features,INVK_features,Nh_all, Eigen_Spectrum]=SCSA_Transform_features(X,y,h,gm,fs);




%% Cross-Validation
SCSA_X=S_SCSA;
[Accuracy,Avg_Accuracy,Avg_sensitivity,Avg_specificity,Avg_precision,Avg_gmean,Avg_f1score,Avg_AUC]=Data_CrossValidation(SCSA_X, y,CV_type, K,type_clf)
        
        
set(handles.N_folds,'string', K );
set(handles.accurc,'string', Avg_Accuracy );
set(handles.Specific,'string', Avg_Accuracy );
set(handles.Sensitiv,'string', Avg_sensitivity );
 
%% Dispay lay the output features

indp=find(y==1); indn=find(y==0); 
    
axes(handles.axes11);
cla;
plot (SCSA_X(indp,:)' ,'b','LineWidth',3)  
hold on 
plot (SCSA_X(indn,:)' ,'r','LineWidth',3.5)            
lgdd=legend('Positive dataset ');
title('SCSA features [Eigenvalues]') 

set(handles.listbox2,'string',strcat(' Run CV  classification is done : Accuracy= ',num2str(Avg_Accuracy))) ;


% set(handles.Specific,'string', sprintf('%.1e',Avg_specificity) );



% % Save the SCSA features
% data_file=strcat(root_folder,'/SCSA_features',num2str(h),'.mat');
% %     data_file=strcat(root_folder,'/SCSA_features.mat');
% 
% %     save(data_file,'F_SCSA', 'S_SCSA', 'B_SCSA', 'P_SCSA', 'AF_SCSA','SFP_SCSA','SK_features','Nh_all','y');
% %     save(data_file,'S_SCSA', 'B_SCSA','SK_features','Nh_all','INVK_features','y');%'AF_SCSA'
% Xh=F_SCSA;
% %     save(data_file,'S_SCSA', 'B_SCSA','INVK_features','Nh_all','y');
%  save(data_file,'S_SCSA','X','Xh','Nh_all','y');
% %     load(data_file,'S_SCSA','X','Xh','Nh_all','y');
% 
% %     save(strcat('./SCSA_features',num2str(h),'.mat'),'S_SCSA','X','Xh','Nh_all','y');
% 
% %% Test all possible conbinaisons of SCSA features and get the optimal combination
% [SCSA_X, op_comb, op_comb_name, perform_output,Acc]=Find_the_optimal_feature_combination(data_file,feature_TAG,K,CV_type,type_clf);
%  %% Add the optimal results to the used h
% SCSA_parameters_op(1,cnt)=h;
% SCSA_parameters_op(2,cnt)=op_comb.Accuracy;
% SCSA_parameters_op(3,cnt)=op_comb.Vector_Size;
% SCSA_parameters_op(4,cnt)=mean(Nh_all);
% 
% op_combinaison(cnt,:)=op_comb
% op_comb_name{cnt}=op_comb_name;
% cnt=cnt+1;
% 
% 
% if Acc_op<Acc
%     SCSA_X_op=SCSA_X;sz_SCSA=size(SCSA_X_op,2);
%     List_Features=op_comb;
%     h_op=h;
% 
%     % {'Vector_Size','Accuracy','Sensitivity','Specificity','Precision','Gmean','F1score'};
%     CV_results_op=[sz_SCSA, op_comb.Accuracy,op_comb.Sensitivity,op_comb.Specificity,op_comb.Precision,op_comb.Gmean,op_comb.F1score0,op_comb.AUC];
% 
%     %{'Dataset','Configuration','size','Method','parameters','CV','Classifier'}
%     CV_config_op={noisy_file,num2str(Conf_Elctr), num2str(size(X,1)),feature_type(1:end-1), strcat('h=',num2str(h),', Nh=',num2str(op_comb.Mean_Nh),', ',op_comb.Combination),CV_type,type_clf };
%     %{'Dataset','Configuration','size','L','step','Method','parameters','CV','K','Classifier'}
%     CV_config_op={noisy_file,num2str(Conf_Elctr), num2str(size(X,1)),num2str(L_max),num2str(Frame_Step),feature_type(1:end-1), strcat('h=',num2str(h),', Nh=',num2str(op_comb.Mean_Nh),', ',op_comb.Combination),CV_type,num2str(K),type_clf };
% 
% 
% 
% 
% end
% 
%  clearvars op_comb perform_output data_file 
%      
     
     