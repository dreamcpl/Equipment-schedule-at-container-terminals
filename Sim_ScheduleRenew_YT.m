function ChkTab=Sim_ScheduleRenew_YT(ChkTab,Para,Static)
%%%��ģ��ֻ���𼯿���ҵ���̵Ľ����ж���������ʻ������û�е�������ArriveState_YT��ִ�еġ�
%%
for i=1:Para(3).Sum
    YTnum=i;
   ChkTab(3).State(i,2)=ChkTab(3).State(i,2)+Static.Accu;  %״̬��ʱ������ʱ�䲽��
   %������ʱδ�漰λ�õı䶯Ӱ�죬���û��λ�ü�ʱ��
    if ChkTab(3).State(i,2)>=ChkTab(3).State(i,3)
        if  ChkTab(3).State(i,1)==13            %����QC��װ��
            %%��ҵ״̬��Ϣ����
            ChkTab(3).State(i,1)=21;             %�����YC����ʻ
            ChkTab(3).State(i,2)=0;
            TT=Sim_Cite_MvTmCl_YT(ChkTab,YTnum);
            ChkTab(3).State(YTnum,3)=TT; %Ԥ��״̬�л�ʱ��
            %%�豸�󶨹�ϵ���£������QC��ϵ��
            QCnum=ChkTab(3).EqpBod(i,3);
            ChkTab(1).EqpBod{1,2}(QCnum,1)=0;    %QC:YT�� 
            temp=ChkTab(1).EqpBod{1,2}(QCnum,:); %��YT��QC�����Ŷӱ����Ƴ�
            temp=temp(find(temp~=0));
            if ~isempty(temp)
               ChkTab(1).EqpBod{1,2}(QCnum,:)=0;
               ChkTab(1).EqpBod{1,2}(QCnum,1:size(temp,2))=temp;
            end
            ChkTab(3).EqpBod(i,3)=0;          %YT:YC:QC��
        elseif ChkTab(3).State(i,1)==23            %����YC��װ��
            %%��ҵ״̬��Ϣ����
            ChkTab(3).State(i,1)=24;                  %����YC����
            ChkTab(3).State(i,2)=0;
            ChkTab(3).State(i,3)=10;
            %%�豸�󶨹�ϵ���£������YC��ϵ��
            YCnum=ChkTab(3).EqpBod(i,2); 
            ChkTab(2).EqpBod(YCnum,1)=0;    %YC:YT��
            if ChkTab(2).EqpBod(YCnum,2)~=0
              ChkTab(2).EqpBod(YCnum,1)=ChkTab(2).EqpBod(YCnum,2);
              ChkTab(2).EqpBod(YCnum,2)=0;
            end
            ChkTab(3).EqpBod(i,2)=0;          %YT:YC:QC��
        elseif ChkTab(3).State(i,1)==24       %����YC���ȴ�
            %%��ҵ״̬��Ϣ����
            ChkTab(3).State(i,1)=50;             %�ӽ���YC�򰶱���ʻ
            ChkTab(3).State(i,2)=0;
            TT=Sim_Cite_MvTmCl_YT(ChkTab,YTnum);
            ChkTab(3).State(YTnum,3)=TT; %Ԥ��״̬�л�ʱ��
        elseif ChkTab(3).State(i,1)==33      %���ڳ��Ŵ�װ��
            %%��ҵ״̬��Ϣ����
            ChkTab(3).State(i,1)=41;             %����ڰ�����ʻ
            ChkTab(3).State(i,2)=0;
            TT=Sim_Cite_MvTmCl_YT(ChkTab,YTnum);
            ChkTab(3).State(YTnum,3)=TT; %Ԥ��״̬�л�ʱ��
            %%�豸�󶨹�ϵ���£������YC��ϵ��
            YCnum=ChkTab(3).EqpBod(i,2); 
            ChkTab(2).EqpBod(YCnum,1)=0;    %YC:YT��
            if ChkTab(2).EqpBod(YCnum,2)~=0
              ChkTab(2).EqpBod(YCnum,1)=ChkTab(2).EqpBod(YCnum,2);
              ChkTab(2).EqpBod(YCnum,2)=0;
            end
            ChkTab(3).EqpBod(i,2)=0;          %YT:YC:QC��
        elseif ChkTab(3).State(i,1)==43       %���ڰ��Ŵ�װ��
            %%��ҵ״̬��Ϣ����
            ChkTab(3).State(i,1)=0;               %��ҵ״̬
            ChkTab(3).State(i,2)=0;
            ChkTab(3).State(i,3)=0;
            %%�豸�󶨹�ϵ���£������QC��ϵ��
            QCnum=ChkTab(3).EqpBod(i,3);
            ChkTab(1).EqpBod{1,2}(QCnum,1)=0;    %QC:YT�� 
            temp=ChkTab(1).EqpBod{1,2}(QCnum,:); %��YT��QC�����Ŷӱ����Ƴ�
            temp=temp(find(temp~=0));
            if ~isempty(temp)
               ChkTab(1).EqpBod{1,2}(QCnum,:)=0;
               ChkTab(1).EqpBod{1,2}(QCnum,1:size(temp,2))=temp;
            end
            ChkTab(3).EqpBod(i,3)=0;          %YT:YC:QC��
        end
    end
end



    
    
    