function MovTim=Sim_Cite_MvTmCl_YC(ChkTab,i)
%%%%%%%%%%%%���������ü���ע������%%%%%%%%%%%%%
%��ģ�������Ǽ��㳡���ڲ�ͬ����������л�ʱ����ʱ��
%ע�⣺��������ʱ������YC���л�����ʱ�������ܵĵ�·������൱�ڽ���YC������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,~,Glob,Para,~]=Main_VarState();
OgBlk=ChkTab(2).Positn{1,1}(i,1);
AmBlk=ChkTab(2).Positn{1,2}(i,1);
lane=Glob.BloLine;
[X1,Y1]=Fun_Num2RowLane(OgBlk,lane);    %��ʼ��������
[X2,Y2]=Fun_Num2RowLane(AmBlk,lane);   %Ŀ����������
%%
%���1������ʼ������Ŀ��������ͬһ������
%����һ��ֱ�ӱ�Ϊ��ʻģʽ1�����������л���������������YC������У�ʼ�մ��ھ���״̬��
%��������������ʻģʽ2������ʱ�䵽�˵Ļ���ֱ�ӱ�Ϊ��Ӧ��λ��
if  AmBlk==OgBlk
    MovTim=abs(ChkTab(2).Positn{1,1}(i,2)-ChkTab(2).Positn{1,2}(i,2))*Para(2).MovBay;
%���2����Ŀ��������������Ŀ�����������е����
elseif   X2<X1
     MovTim=(X1-X2-1)*(Para(2).MovHDB+Glob.BaySum*Para(2).MovBay)+Para(2).MovHDB+abs(Y1-Y2)*Para(2).MovVDB+(ChkTab(2).Positn{1,1}(i,2)+Glob.BaySum-ChkTab(2).Positn{1,2}(i,2))*Para(2).MovBay;
%���3����Ŀ��������Ŀ��������ͬ��
elseif   X2==X1  &&   AmBlk~=OgBlk
     MovTim=abs(Y1-Y2)*Para(2).MovVDB+(ChkTab(2).Positn{1,1}(i,2)+ChkTab(2).Positn{1,2}(i,2))*Para(2).MovBay;
%���4����Ŀ��������������Ŀ�����������е��Ҳ�
elseif   X2>X1
     MovTim=(X2-X1-1)*(Para(2).MovHDB+Glob.BaySum*Para(2).MovBay)+Para(2).MovHDB+abs(Y1-Y2)*Para(2).MovVDB+(ChkTab(2).Positn{1,2}(i,2)+Glob.BaySum-ChkTab(2).Positn{1,1}(i,2))*Para(2).MovBay;
end