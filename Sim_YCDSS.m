function [ChkTab,RepCwi]=Sim_YCDSS(ChkTab,RepCwi)
%%%%%%%%%%%%%���������ü���ע������%%%%%%%%%%%%%
%%%�°�DSS��ʵ������ʻʱ��Ϊ���ݵ�YC��̬���Ȳ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if ~isempty(ChkTab(1).EqpNeed) && ~isempty(find(ChkTab(2).State(:,1)==4))
   S4YCnum=find(ChkTab(2).State(:,1)==4);         %�ҵ�����״̬Ϊ4��YC���YCnum
   for i=1:size(S4YCnum,1)
        YCnum=S4YCnum(i,1);          %��ȡ��į״̬Ϊ4��YC���
        MovTim=Sim_Cite_MvTmCl_YC(ChkTab,YCnum);  %������ʻʱ��
        S4YCnum(i,2)=MovTim;         %�洢��ʻʱ��ļ�����
   end
   [~,seq]=min(S4YCnum(:,2));        %������ֵ��Ӧ������
   BestYC=S4YCnum(seq,1);            %��õĳ��ű��
   ChkTab(1).EqpNeed(1,5)=BestYC;                %�ѵ�һ̨�������QC����������޸�ΪBestYC
   NeedInfo=ChkTab(1).EqpNeed(1,:);               %��Ⱦɫ���в��ҵ���Ӧ����Ŀ
   LineNum=find(RepCwi(1,:)==NeedInfo(1,2) & RepCwi(2,:)==NeedInfo(1,3));
   RepCwi(4,LineNum)=BestYC;                        %����Ӧ��Ŀ�е�YC��������޸�ΪBestYC
end

    
    