function JugRst=Main_YCJobJudge(CWI)
%%%%%%%%��ģ�鹦�������YC�������������������������ƫ�����������޳�
global SYwi
[~,~,~,Para,~]=Main_VarState();
JobMax=max(SYwi(3,:));     %ѡ�����������������ֵ
JobMin=min(SYwi(3,:));      %ѡ����������������Сֵ
JobLine=JobMax*2;
JobAmt=zeros(1,Para(2).OutSum);     %����������������ͳ������
for i=1:size(SYwi,2)
      JobAmt(1,CWI(4,i))=JobAmt(1,CWI(4,i))+SYwi(3,i);
end
YCJobMax=max(JobAmt);   %ѡ����ҵ�����ĳ���
YCJobMin=min(JobAmt);     %ѡ����ҵ����С�ĳ���
YCJobGap=YCJobMax-YCJobMin;
if YCJobGap>JobLine
    JugRst=1;
else
    JugRst=0;
end