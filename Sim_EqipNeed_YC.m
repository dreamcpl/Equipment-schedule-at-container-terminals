function ChkTab=Sim_EqipNeed_YC(ChkTab,Para)
%%
global Bwi
temp=ChkTab(2).EqpNeed;
for i=1:Para(2).OutSum
    %%��Ϊ״̬4�����ų�
    if ChkTab(2).State(i,1)==4
       continue
    end
    %%���ظ��Ǽ�
    if ~isempty(ChkTab(2).EqpNeed)  %�ж�������Ƿ�Ϊ��
       if ~isempty(find(ChkTab(2).EqpNeed (:,1)==i)) %����Ѿ��Ǽǹ�,�Ͳ��ظ��Ǽ�
          continue
       end
    end
    %%��������Ľ����̶ȣ���YC��Ų���ǰ�滹�Ǻ���
    if ChkTab(2).EqpBod(i,:)==0      %û�а󶨵�YT
       if ChkTab(2).Progrs(i,1)==ChkTab(2).Progrs(i,3) && ChkTab(2).Progrs(i,2)<=1     
           %�������һջ��û�������ӣ��Ͳ������ˡ�
           continue
       else
          %��ȡ��ǰ�����������
          TaskNum=ChkTab(2).Swi{1,i}(ChkTab(2).Progrs(i,1));
          %��ȡ��ǰ����������װж����
          LDC=Bwi(find(Bwi(:,1)==TaskNum),4);
          LDC=LDC(1,:);
          %����ǰ������еǼ�
          temp=[ i,LDC;temp];
       end
    elseif ChkTab(2).EqpBod(i,1)~=0 && ChkTab(2).EqpBod(i,2)==0  %ֻ����һ��YT
       if ChkTab(2).State(i,2)==3       %����ִ�������״̬
          if ChkTab(2).Progrs(i,1)==ChkTab(2).Progrs(i,3) && ChkTab(2).Progrs(i,2)<=2  
              %�������һջ������һ�����ӣ��Ͳ�������
             continue
          else
              %��ȡ��ǰ�����������
              TaskNum=ChkTab(2).Swi{1,i}(ChkTab(2).Progrs(i,1));
              %��ȡ��ǰ����������װж����
              LDC=Bwi(find(Bwi(:,1)==TaskNum),4);
              LDC=LDC(1,:);
              %����ǰ������еǼ�
              temp=[temp;i,LDC];
          end
       end
    end    
end
ChkTab(2).EqpNeed=temp;