function [ChkTab,Cwi]=Sim_AssignTask_QC(ChkTab,Para,Bwi,Cwi,QCwi,Swi)
%%
for i=1:Para(1).Sum
    if ChkTab(1).State(i,1)==4
       continue
    elseif ChkTab(1).State(i,1)==0    %״̬0ֱ�ӱ�Ϊ״̬2
       ChkTab(1).State(i,1)=2; 
    elseif ChkTab(1).State(i,1)==2
       %�����û��YC�뵱ǰQC�󶨣�Ҳû��YT�뵱ǰQC�󶨣�����Ҫ���Ǹ���ǰQC���������ˡ�
       if isempty(find(ChkTab(1).EqpBod{1,1}(:,1)==i)) && isempty(find(ChkTab(3).EqpBod(:,3)==i))
           %��YC�����������Ҳû�е�ǰQC������Ǽǣ��Ǿ�˵����ǰ�����Ѿ�����ˣ���Ҫ�л�����һ�������ˡ�
           if isempty(ChkTab(1).EqpNeed) || isempty(find(ChkTab(1).EqpNeed(:,1)==i))
              ChkTab(1).Progrs(i,1)=ChkTab(1).Progrs(i,1)+1;    %�����ȡ������+1
              jobnum=QCwi(i,ChkTab(1).Progrs(i,1));                  %��ȡ������              
           else %�����YC������������е�ǰQC������Ǽǣ��Ǿ͵��ŵ�Sim_AssignTask_YCģ�����氲��YC�ˡ�
              continue
          end
          if jobnum==0   %��������0��˵���ǽ�ֹ�����Ѿ���������мȶ�����
             ChkTab(1).State(i,1)=4;
             ChkTab(1).State(i,4)=0;
          else
              %��Ϊ��ʻ״̬
              ChkTab(1).State(i,1)=1;     %��ʻ״̬
              ChkTab(1).State(i,2)=0;     %״̬�仯��ʱ������
              %Ŀ��λ�øı�
              tempinfo=Bwi(find(Bwi(:,1)==jobnum),:);
              ChkTab(1).Positn(i,2)=tempinfo(1,2);
              ChkTab(1).Positn(i,3)=0;   %�����ʱ������
          end
       end
    end
end