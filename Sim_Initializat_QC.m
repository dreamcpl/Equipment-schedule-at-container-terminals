function [ChkTab,Cwi]=Sim_Initializat_QC(ChkTab,Para,Swi,Bwi,Cwi,QCwi)
%%
ChkTab(1).EqpBod{1,1}=zeros(1,3);                    %����QC:YC��Ϊ�գ����������ҵ�ж�
ChkTab(1).EqpBod{1,2}=zeros(Para(1).Sum,1);  %����QC:YT��Ϊ�գ����������ҵ�ж�
for i=1:Para(1).Sum
      ChkTab(1).Progrs(i,1)=1;
      jobnum=QCwi(i,1); %���ﲻ����QC�ĵ�һ���������0���������Ϊ�������ǲ�⡣
      tempinfo=Bwi(find(Bwi(:,1)==jobnum),:);
      %λ��ֱ�Ӹ��µ���һ������ı�λ�����Ժ���Կ��ǳ���λ�ã�
      ChkTab(1).Positn(i,2)=tempinfo(1,2);
      ChkTab(1).Positn(i,1)=ChkTab(1).Positn(i,2);
      %װж���Ը���
      ChkTab(1).State(i,4)=tempinfo(1,4);
end