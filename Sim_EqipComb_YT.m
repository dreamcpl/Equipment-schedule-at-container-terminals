function ChkTab=Sim_EqipComb_YT(ChkTab,QCwi)
%%
global TskCod JobCod Swi
sta00YT=find(ChkTab(3).State(:,1)==00);  %״̬��00�ļ���
sta24YT=find(ChkTab(3).State(:,1)==24);  %״̬��24�ļ���
%%�龰һ���м�����ɽ��������ڽ���YC���ȴ�������Ҳ�г���YC��Ҫ����.
while ~isempty(sta24YT) && ~isempty(ChkTab(2).EqpNeed) && ~isempty(find(ChkTab(2).EqpNeed(:,2)==1))
      %%%%%����һ��YT���Ÿ���һ̨����YC
      LoadNeed=ChkTab(2).EqpNeed(find(ChkTab(2).EqpNeed(:,2)==1),:);
      YCnum=LoadNeed(1,1);
      YTnum=sta24YT(1,1);
      if ChkTab(2).EqpBod(YCnum,1)==0
         ChkTab(2).EqpBod(YCnum,1)=YTnum;
      else
         ChkTab(2).EqpBod(YCnum,2)=YTnum;
      end
      %�󶨹�ϵ��Ϣ����
      ChkTab(3).EqpBod(YTnum,2)=YCnum;
      ChkTab(3).EqpBod(YTnum,3)=ChkTab(1).EqpBod{1,1}(find(ChkTab(1).EqpBod{1,1}(:,2)==YCnum),1);
      %������Ϣ�洢
               %����������Ϣ�洢(����YC)
      JobInfo=ChkTab(2).Swi{1,YCnum}; %��ȡ�洢�� YC���񻺴�� �ж�Ӧ��������Ϣ
      Cood=JobCod(find(Swi(:,1)==JobInfo(1,1) & Swi(:,2)==JobInfo(1,2) & Swi(:,3)==JobInfo(1,3) & Swi(:,4)==JobInfo(1,4)),:);
      ChkTab(3).Positn{1,3}(YTnum,:)=Cood;
               %����������Ϣ�洢(����QC)
      QCNum=ChkTab(3).EqpBod(YTnum,3);
      TskNum=QCwi(QCNum,ChkTab(1).Progrs(QCNum,1));
      Cood=TskCod(TskNum,:);
      ChkTab(3).Positn{1,5}(YTnum,:)=Cood;
      %YT��ҵ״̬����
      ChkTab(3).State(YTnum,1)=31; %״̬��Ϊ�����YC��ʻ������ǽ���YC��
      ChkTab(3).State(YTnum,2)=0;  %״̬�仯��ʱ������
      TT=Sim_Cite_MvTmCl_YT(ChkTab,YTnum);
      ChkTab(3).State(YTnum,3)=TT; %Ԥ��״̬�л�ʱ��
      %��ԭ����Ϣ��������¼
      sta24YT(1,:)=[];
      temp=find(ChkTab(2).EqpNeed(:,2)==1);
      temp=temp(1,1);
      ChkTab(2).EqpNeed(temp,:)=[]; 
end
%%�龰�����м�����ɽ��������ڽ���YC���ȴ�������û�г���YC��Ҫ������ֱ���ü���ȥ���ߣ�����Ӱ�쳡�ڽ�ͨ��
while ~isempty(sta24YT) && ~isempty(ChkTab(2).EqpNeed) && isempty(find(ChkTab(2).EqpNeed(:,2)==1))
      YTnum=sta24YT(1,1);
      %YT��ҵ״̬����--�൱��һ��ֻ��һ��YTʻ�򰶱ߣ��������з��½������ӵ�YT��ʻ�򰶱�
      ChkTab(3).State(YTnum,1)=50; %״̬��Ϊ�򰶱���ʻ
      ChkTab(3).State(YTnum,2)=0;  %״̬�仯��ʱ������
      TT=Sim_Cite_MvTmCl_YT(ChkTab,YTnum);
      ChkTab(3).State(YTnum,3)=TT; %Ԥ��״̬�л�ʱ��
      %��ԭ����Ϣ��������¼
      sta24YT(1,:)=[];
end
%%�龰�����м����ڰ��ߵȴ��������н���YC��Ҫ������ֱ���ü���ȥ��YC��Ӧ�İ��Ŵ��ȴ�����汾��Ϊֱ���ڰ��Ŵ�ִ������
while ~isempty(sta00YT) && ~isempty(ChkTab(2).EqpNeed) && ~isempty(find(ChkTab(2).EqpNeed(:,2)==2))
      %%%%%����һ��YT���Ÿ���һ̨YC
       UnloadNeed=ChkTab(2).EqpNeed(find(ChkTab(2).EqpNeed(:,2)==2),:);
      YCnum=UnloadNeed(1,1);
      YTnum=sta00YT(1,1);
      if ChkTab(2).EqpBod(YCnum,1)==0
         ChkTab(2).EqpBod(YCnum,1)=YTnum;
      else
         ChkTab(2).EqpBod(YCnum,2)=YTnum;
      end
      %�󶨹�ϵ��Ϣ����
      ChkTab(3).EqpBod(YTnum,2)=YCnum;
      ChkTab(3).EqpBod(YTnum,3)=ChkTab(1).EqpBod{1,1}(find(ChkTab(1).EqpBod{1,1}(:,2)==YCnum),1);
      %������Ϣ�洢
               %����������Ϣ�洢(����YC)
      JobInfo=ChkTab(2).Swi{1,YCnum}; %��ȡ�洢�� YC���񻺴�� �ж�Ӧ��������Ϣ
      Cood=JobCod(find(Swi(:,1)==JobInfo(1,1) & Swi(:,2)==JobInfo(1,2) & Swi(:,3)==JobInfo(1,3) & Swi(:,4)==JobInfo(1,4)),:);
      ChkTab(3).Positn{1,2}(YTnum,:)=Cood;
               %����������Ϣ�洢(����QC)
      QCNum=ChkTab(3).EqpBod(YTnum,3);
      TskNum=QCwi(QCNum,ChkTab(1).Progrs(QCNum,1));
      Cood=TskCod(TskNum,:);
      ChkTab(3).Positn{1,4}(YTnum,:)=Cood;
      %YT��ҵ״̬����
      ChkTab(3).State(YTnum,1)=11; %״̬��Ϊ�����QC��ʻ
      ChkTab(3).State(YTnum,2)=0;   %״̬�仯��ʱ������
      TT=Sim_Cite_MvTmCl_YT(ChkTab,YTnum);
      ChkTab(3).State(YTnum,3)=TT; %Ԥ��״̬�л�ʱ��
      %��ԭ����Ϣ��������¼
      sta00YT(1,:)=[];
      temp=find(ChkTab(2).EqpNeed(:,2)==2);
      temp=temp(1,1);
      ChkTab(2).EqpNeed(temp,:)=[]; 
end
%%�龰��:�м����ڰ��ߵȴ�,�����г���YC��Ҫ����?ֱ���ü���ȥ��YC���ȴ�
while ~isempty(sta00YT) && ~isempty(ChkTab(2).EqpNeed) && ~isempty(find(ChkTab(2).EqpNeed(:,2)==1))
      %%%%%����һ��YT���Ÿ���һ̨YC
      LoadNeed=ChkTab(2).EqpNeed(find(ChkTab(2).EqpNeed(:,2)==1),:);
      YCnum=LoadNeed(1,1);
      YTnum=sta00YT(1,1);
      if ChkTab(2).EqpBod(YCnum,1)==0
         ChkTab(2).EqpBod(YCnum,1)=YTnum;
      else
         ChkTab(2).EqpBod(YCnum,2)=YTnum;
      end
      %%�󶨹�ϵ��Ϣ����
      ChkTab(3).EqpBod(YTnum,2)=YCnum;
      ChkTab(3).EqpBod(YTnum,3)=ChkTab(1).EqpBod{1,1}(find(ChkTab(1).EqpBod{1,1}(:,2)==YCnum),1);
      %������Ϣ�洢
               %����������Ϣ�洢(����YC)
      JobInfo=ChkTab(2).Swi{1,YCnum}; %��ȡ�洢�� YC���񻺴�� �ж�Ӧ��������Ϣ
      Cood=JobCod(find(Swi(:,1)==JobInfo(1,1) & Swi(:,2)==JobInfo(1,2) & Swi(:,3)==JobInfo(1,3) & Swi(:,4)==JobInfo(1,4)),:);
      ChkTab(3).Positn{1,3}(YTnum,:)=Cood;
               %����������Ϣ�洢(����QC)
      QCNum=ChkTab(3).EqpBod(YTnum,3);
      TskNum=QCwi(QCNum,ChkTab(1).Progrs(QCNum,1));
      Cood=TskCod(TskNum,:);
      ChkTab(3).Positn{1,5}(YTnum,:)=Cood;
      %%��ҵ״̬��Ϣ����
      ChkTab(3).State(YTnum,1)=30; %״̬��Ϊ�����YC��ʻ������ǰ��ߡ�
      ChkTab(3).State(YTnum,2)=0;  %״̬�仯��ʱ������
      TT=Sim_Cite_MvTmCl_YT(ChkTab,YTnum);
      ChkTab(3).State(YTnum,3)=TT; %Ԥ��״̬�л�ʱ��
      %%�豸������Ϣ����
      sta00YT(1,:)=[];
      temp=find(ChkTab(2).EqpNeed(:,2)==1);
      temp=temp(1,1);
      ChkTab(2).EqpNeed(temp,:)=[]; 
end
