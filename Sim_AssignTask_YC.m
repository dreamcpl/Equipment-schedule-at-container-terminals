function ChkTab=Sim_AssignTask_YC(ChkTab,Para,Swi)
%%
for i=1:Para(2).OutSum
   if ChkTab(2).State(i,1)==0        %δ���Ź������״̬      
     if ChkTab(2).Progrs(i,2)>1              %���������������1
       ChkTab(2).Progrs(i,2)=ChkTab(2).Progrs(i,2)-1;   %���1
       ChkTab(2).State(i,1)=2;
     else
       ChkTab(2).Progrs(i,1)=ChkTab(2).Progrs(i,1)+1;
       if ChkTab(2).Progrs(i,1)>ChkTab(2).Progrs(i,3)  %�Ѿ�ִ������������������
         ChkTab(2).State(i,1)=4;       %״̬��Ϊ�������
         ChkTab(2).State(i,4)=0;       %װж״̬���
         ChkTab(2).Progrs(i,1)=ChkTab(2).Progrs(i,1)-1;
         %%�󶨹�ϵ��Ϣ����
         ChkTab(1).EqpBod{1,1}(find(ChkTab(1).EqpBod{1,1}(:,2)==i),:)=[]; %ɾ����QC�󶨹�ϵ
         continue
       else 
         tempinfo=ChkTab(2).Swi{1,i}(ChkTab(2).Progrs(i,1),:);  %�ӵ�ǰYC��ȫ��������ժȡ����ǰջλ�������Ϣ
         %%��ҵ������Ϣ����
         ChkTab(2).Progrs(i,2)=tempinfo(1,5);      %ת�Ƶ�ǰջλ��װ�����
         %%��ҵ״̬��Ϣ����
         ChkTab(2).State(i,1)=1;    %(������ʻ)
         ChkTab(2).State(i,4)=tempinfo(1,6);         %����װж����
         %%�豸λ����Ϣ����
         ChkTab(2).Positn{1,2}(i,1)=tempinfo(1,2);
         ChkTab(2).Positn{1,2}(i,2)=tempinfo(1,3);
         ChkTab(2).Positn{1,2}(i,3)=tempinfo(1,4);
         if ChkTab(2).State(i,1)==4  %�������˵�ǰ�������񣬾�����ʻ״̬��Ϊ2
           ChkTab(2).Positn{1,3}(i,1)=0;  %λ�ü�ʱ������
           ChkTab(2).Positn{1,4}(i,1)=0;  %����״̬����
           ChkTab(2).Positn{1,5}(i,1)=2;  %��ʻģʽ��Ϊ2
         else
           ChkTab(2).Positn{1,5}(i,1)=1;
         end
       end
     end
   end
end
%%%%�ο�YC�������״̬Ϊ4��YC���д�������Ϊ��YC�������������ʱ���еĴ���
for i=1:Para(2).OutSum
    %%���YC����״̬4������������ϲ�û�и�YC����������YC
    if ChkTab(2).State(i,1)~=4 || isempty(ChkTab(1).EqpNeed)  || isempty(find(ChkTab(1).EqpNeed(:,5)==i)) 
       continue
    end
    %%ͨ�����󣬼��ɰ���YC
    %%�豸����Ϣ�仯
    val=find(ChkTab(1).EqpNeed(:,5)==i);    %�ҵ�������Ŀ(�����ҵ����)
    row=ChkTab(1).EqpNeed(val(1),:);         %ֻҪ�ҵ��ĵ�һ���ǼǼ�¼����������¼��������Ϣ����Ǩ�ƣ�
    temp=[row(1,1),row(1,5),row(1,2)];        %�Ǽǵ�QC:YC�󶨱�
    ChkTab(1).EqpBod{1,1}=[ChkTab(1).EqpBod{1,1};temp];
    %%���񻺴���Ϣ�仯(��������ϢǨ�Ƶ�YC������Ϣ����)
    TWI=Swi(find(Swi(:,1)==row(1,2) & Swi(:,2)==row(1,3)),:);
    ChkTab(2).Swi{1,i}=[ChkTab(2).Swi{1,i};TWI];
    %%���������Ϣ�仯
    ChkTab(2).Progrs(i,1)=ChkTab(2).Progrs(i,1)+1;
    ChkTab(2).Progrs(i,2)=ChkTab(2).Swi{1,i}(ChkTab(2).Progrs(i,1),5);
    ChkTab(2).Progrs(i,3)=size(ChkTab(2).Swi{1,i},1);
    %%�豸λ����Ϣ�仯(Ŀ��λ�ñ仯������״̬�ȱ仯���ƶ�ģʽ�仯)
    ChkTab(2).Positn{1,2}(i,1)=ChkTab(2).Swi{1,i}(ChkTab(2).Progrs(i,1),2);    %Ŀ�������仯
    ChkTab(2).Positn{1,2}(i,2)=ChkTab(2).Swi{1,i}(ChkTab(2).Progrs(i,1),3);    %Ŀ�건λ�仯
    ChkTab(2).Positn{1,2}(i,3)=ChkTab(2).Swi{1,i}(ChkTab(2).Progrs(i,1),4);    %Ŀ��ջλ�仯
    ChkTab(2).Positn{1,3}(i,1)=0;     %����λ�ü�ʱ������
    ChkTab(2).Positn{1,4}(i,1)=0;     %���谭״̬����
    ChkTab(2).Positn{1,5}(i,1)=2;     %������л�ģʽ
    if ChkTab(2).Progrs(i,1)==1
        ChkTab(2).Positn{1,1}(i,1)=ChkTab(2).Positn{1,2}(i,1);
        ChkTab(2).Positn{1,1}(i,2)=ChkTab(2).Positn{1,2}(i,2);
        ChkTab(2).Positn{1,1}(i,3)=ChkTab(2).Positn{1,2}(i,3);
    end
    %%��ǰYC״̬��Ϣ�仯 ���ҵ��󣬾Ϳ����õ�ǰYC����ִ�������ˣ�
    ChkTab(2).State(i,1)=1;
    ChkTab(2).State(i,2)=0;
    MovTim=Sim_Cite_MvTmCl_YC(ChkTab,i);  %���YC���ƶ�ģʽ�����ƶ�ʱ��
    ChkTab(2).State(i,3)=MovTim;     
    ChkTab(2).State(i,4)=row(1,6);
    %%�豸������Ϣ�仯(��������е���Ϣɾ����)
    ChkTab(1).EqpNeed(val(1),:)=[];
end