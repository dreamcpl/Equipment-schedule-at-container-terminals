function ChkTab=Sim_StaTimCount(ChkTab,Para,Static)
%%%%%%%%%%%%%%%%%%��������˼·%%%%%%%%%%%%%%%%%%
%��ģ������ͳ�Ƹ��豸���ڸ�״̬��ʱ�䣬��ӷ������豸��ҵ�ɱ��ļ�����̡�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%ͳ�Ƹ����Ÿ�״̬ʱ��
for i=1:Para(1).Sum
     %%״̬0��״̬2���ǵȴ�
     if ChkTab(1).State(i,1)==0 || ChkTab(1).State(i,1)==2
        ChkTab(1).StaTim(i,1)=ChkTab(1).StaTim(i,1)+Static.Accu;
      %%״̬1������ʻ
     elseif ChkTab(1).State(i,1)==1
        ChkTab(1).StaTim(i,2)=ChkTab(1).StaTim(i,2)+Static.Accu;
     %%״̬3����ִ������
     elseif ChkTab(1).State(i,1)==3
        ChkTab(1).StaTim(i,3)=ChkTab(1).StaTim(i,3)+Static.Accu;
     end
end
%%%%ͳ�Ƹ����Ÿ�״̬ʱ��
for i=1:Para(2).OutSum
     %%״̬4��״̬2���ǵȴ�
     if ChkTab(2).State(i,1)==4 || ChkTab(2).State(i,1)==2
        ChkTab(2).StaTim(i,1)=ChkTab(2).StaTim(i,1)+Static.Accu;
      %%״̬1������ʻ
     elseif ChkTab(2).State(i,1)==1
        ChkTab(2).StaTim(i,2)=ChkTab(2).StaTim(i,2)+Static.Accu;
     %%״̬3����ִ������
     elseif ChkTab(2).State(i,1)==3
        ChkTab(2).StaTim(i,3)=ChkTab(2).StaTim(i,3)+Static.Accu;
     end
end
%%%%ͳ�Ƹ�������״̬ʱ��
for i=1:Para(3).Sum
     %%ͳ�Ƶȴ�ʱ��
     if ChkTab(3).State(i,1)==0 || ChkTab(3).State(i,1)==12 || ChkTab(3).State(i,1)==22 || ChkTab(3).State(i,1)==24 ...
                 || ChkTab(3).State(i,1)==32 || ChkTab(3).State(i,1)==42 || ChkTab(3).State(i,1)==6
        ChkTab(3).StaTim(i,1)=ChkTab(3).StaTim(i,1)+Static.Accu;
      %%ͳ�ƿճ���ʻʱ��
     elseif ChkTab(3).State(i,1)==11 || ChkTab(3).State(i,1)==30 || ChkTab(3).State(i,1)==31 || ChkTab(3).State(i,1)==50
        ChkTab(3).StaTim(i,2)=ChkTab(3).StaTim(i,2)+Static.Accu;
     %%ͳ��������ʻʱ��
     elseif ChkTab(3).State(i,1)==21 || ChkTab(3).State(i,1)==41
        ChkTab(3).StaTim(i,3)=ChkTab(3).StaTim(i,3)+Static.Accu;
        %%ͳ��װж��ҵʱ��
     elseif ChkTab(3).State(i,1)==13 || ChkTab(3).State(i,1)==23 || ChkTab(3).State(i,1)==33 || ChkTab(3).State(i,1)==43
        ChkTab(3).StaTim(i,4)=ChkTab(3).StaTim(i,4)+Static.Accu;
     end
end