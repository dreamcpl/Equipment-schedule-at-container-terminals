function [SimRzt,RepCwi]=Main_Simulation(Para,QCwi,Bwi,Swi,Cwi,Cost,Glob)
%%%%%%%%%%%%%���������ü���ע������%%%%%%%%%%%%%
%��ϸ�������˵���ĵ�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%���벿��
RepCwi=Cwi;                            %���޸�Ⱦɫ��ΪRepCwi��V1.2������䣩
%%%%%%%%1.��������
[ChkTab,Static]=Sim_VarState(Para);
%%%%%%%%2.�豸��ʼ��
[ChkTab,Cwi]=Sim_Initializat_QC(ChkTab,Para,Swi,Bwi,Cwi,QCwi); %��V1.2�޸�ģ�飩
ChkTab=Sim_Initializat_YC(ChkTab,Para);
ChkTab=Sim_Initializat_YT(ChkTab,Para);
%%
%%%%%%%%3.�������
for T=0:Static.Accu:Static.End      %��ʱ
%     T
    %%%%��������
%     if T>10000 & floor(T/200)==T/200
%        OutPut=Test_Print(T,ChkTab,Cwi);
%     end
    %%%%�������ģ��
    [ChkTab,Cwi]=Sim_AssignTask_QC(ChkTab,Para,Bwi,Cwi,QCwi,Swi); %��V1.2�޸�ģ�飩
    ChkTab=Sim_AssignTask_YC(ChkTab,Para,Swi);
    %%%%�豸��ģ��
    ChkTab=Sim_EqipComb_YC(ChkTab,Para);
    ChkTab=Sim_EqipComb_YT(ChkTab,QCwi);
    %%%%����״̬ģ��
    ChkTab=Sim_ArriveState_QC(ChkTab,Para,Static);
    ChkTab=Sim_ArriveState_YC(ChkTab,Para,Static);
    ChkTab=Sim_ArriveState_YT(ChkTab,Para);    
    %%%%��ҵ�ͷ�ģ��
%     ChkTab=Sim_Punishment_QC(ChkTab,Para); %
    [ChkTab,Finval]=Sim_Punishment_YC(ChkTab,Para,Glob);
    if Finval~=0
       break
    end  
    %%%ִ���ж�ģ��
    ChkTab=Sim_WorkJudge_QC(ChkTab,Para);
    ChkTab=Sim_WorkJudge_YC(ChkTab,Para);
    %%%%���ȸ���ģ��
    ChkTab=Sim_ScheduleRenew_QC(ChkTab,Para,Static);
    ChkTab=Sim_ScheduleRenew_YC(ChkTab,Para,Static);
    ChkTab=Sim_ScheduleRenew_YT(ChkTab,Para,Static);
    %%%%����Ǽ�ģ��
    [ChkTab,Cwi]=Sim_EqipNeed_QC(ChkTab,Para,Cwi,QCwi); %��V1.2�޸�ģ�飩
    ChkTab=Sim_EqipNeed_YC(ChkTab,Para);
    %%%%Ⱦɫ���޸���V1.2����ģ��--YC��̬���ȣ�
    [ChkTab,RepCwi]=Sim_YCDSS(ChkTab,RepCwi);  %��V1.2��̬�����޸�ģ�飩
    %%%%�豸״̬ͳ�ƣ�V1.3��ģ�飩�����ڼ���ɱ�
    ChkTab=Sim_StaTimCount(ChkTab,Para,Static);
    %%%%�����ж�ģ��
    Finval=Sim_EndJudge(ChkTab,Para,T,Static);    
    if Finval~=0
       break
    end    
end
%%
%%%%������
SimRzt=Sim_Output(ChkTab,Para,T,Finval,Cost);