function ChkTab=Sim_ArriveState_YT(ChkTab,Para)
%%%��ģ��ֻ���𼯿���ʻ���̵ĵ����ж���������ҵ������û�н�������ScheduleRenew��ִ�еġ�
%%
for i=1:Para(3).Sum
   if ChkTab(3).State(i,2)>=ChkTab(3).State(i,3)
        if ChkTab(3).State(i,1)==11              %�������QC��
               ChkTab(3).State(i,1)=12;               %��������Ϣ�Ǽǲ���������
               QCnum=ChkTab(3).EqpBod(i,3);
               temp=ChkTab(1).EqpBod{1,2}(QCnum,:);
               temp=temp(find(temp~=0));
               temp=[temp,i];
               ChkTab(1).EqpBod{1,2}(QCnum,:)=0;
               ChkTab(1).EqpBod{1,2}(QCnum,1:size(temp,2))=temp;
        elseif ChkTab(3).State(i,1)==21       %�������YC��
               ChkTab(3).State(i,1)=22;            
        elseif ChkTab(3).State(i,1)==30       %�������YC(�Ӱ��߳���)
               ChkTab(3).State(i,1)=32; 
        elseif ChkTab(3).State(i,1)==31       %�������YC�����ӽ���YC������
               ChkTab(3).State(i,1)=32;                   
        elseif ChkTab(3).State(i,1)==41       %�������QC��
               ChkTab(3).State(i,1)=42;               %��������Ϣ�Ǽǲ���������
               QCnum=ChkTab(3).EqpBod(i,3);
               temp=ChkTab(1).EqpBod{1,2}(QCnum,:);
               temp=temp(find(temp~=0));
               temp=[temp,i];
               ChkTab(1).EqpBod{1,2}(QCnum,:)=0;
               ChkTab(1).EqpBod{1,2}(QCnum,1:size(temp,2))=temp;
        elseif ChkTab(3).State(i,1)==50            %�ӽ���YC�򰶱���ʻ
                %%��ҵ״̬��Ϣ����
                ChkTab(3).State(i,1)=00;        
                ChkTab(3).State(i,2)=0;
                ChkTab(3).State(i,3)=0; %Ԥ��״̬�л�ʱ��
         end
   end
end

