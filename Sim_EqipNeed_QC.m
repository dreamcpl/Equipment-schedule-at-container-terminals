function [ChkTab,Cwi]=Sim_EqipNeed_QC(ChkTab,Para,Cwi,QCwi)
%%
global Bwi
for i=1:Para(1).Sum
   %%���ܴ���������ҵ���ǰQC��ţ�˵���Ѿ��Ǽ�����
   if ~isempty(ChkTab(1).EqpNeed) && ~isempty(find(ChkTab(1).EqpNeed(:,1)==i))
      continue
   end
   %%�����ܴ�Ⱦɫ�����ҵ������ţ�˵���Ѿ��Ǽǹ���YC���������
   jobnum=QCwi(i,ChkTab(1).Progrs(i,1));
   if isempty(find(Cwi(1,:)==jobnum))
      continue
   end
   %%������ܹ���Ⱦɫ�����ҵ������ţ�˵��������Ҫ�Ǽǵ�YC������е���Ϣ
    temp=Cwi(:,find(Cwi(1,:)==jobnum));
    temp=temp';
    temp=temp(1,:); %��ʱ����Ϊһ̨����������������Ӧĳ̨���ţ���������ظ��Ǽǵ����󣬱�������һ�εǼ�һ����Ϣ
    LDC=Bwi(find(Bwi(:,1)==jobnum),4);
    LDC=LDC(1,:);
    QCnum=i;
    temp=[QCnum,temp,LDC];
    ChkTab(1).EqpNeed=[ChkTab(1).EqpNeed;temp];
    Cwi(:,find(Cwi(1,:)==temp(1,2) & Cwi(2,:)==temp(1,3)))=[]; %����һ��ɾ��������������ź��������ܹ�Ψһȷ��һ��������Ϣ��
end