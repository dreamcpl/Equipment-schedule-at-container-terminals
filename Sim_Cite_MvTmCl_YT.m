function TT=Sim_Cite_MvTmCl_YT(ChkTab,YTnum)
%%%%%%%%%%%%���������ü���ע������%%%%%%%%%%%%%
%��ģ�������Ǽ��㼯���ڲ�ͬ�����䣬�Լ����ߺͶѳ�����ʻ��ʱ��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
[~,~,Glob,Para,~]=Main_VarState();
%����|(     00���ߴ���?  11����ڰ�����ʻ?12���ڰ��Ŵ��ȴ�?13ж��
                    %����|                   21����ڳ�����ʻ?22���ڳ��Ŵ��ȴ�?23ȡ��?  24�ڽ���YC����
                    %״̬|    30�Ӱ��������YC��ʻ?  31����ڳ�����ʻ?32���ڳ��Ŵ��ȴ�?33װ��?
                    %��Ϣ|                   41����ڰ�����ʻ?42���ڰ��Ŵ��ȴ�?43װ��?                   
                    %�б�| 50�ӽ���YC�򰶱���ʻ  6�����������   ) 

if ChkTab(3).State(YTnum,1)==11  %�Ӱ�������ڰ�����ʻ
    SP=ChkTab(3).Positn{1,6}(YTnum,:);  %��ʼ����
    TP=ChkTab(3).Positn{1,4}(YTnum,:);  %��ֹ����
    X1=SP(1,1); Y1=SP(1,2);
    X2=TP(1,1); Y2=TP(1,2);
    %������ʻ����
    TDx=abs(X1-X2);
    TDy=abs(Y1-Y2);
    TD=TDx+TDy;
    %������ʻʱ��
    TT=TD/Para(3).ULSpeed; %�˴�Ӧ��ʹ�ÿ�����ʻ�ٶ�
elseif ChkTab(3).State(YTnum,1)==21  %�ӽ��ڰ�������ڳ�����ʻ
    SP=ChkTab(3).Positn{1,4}(YTnum,:);  %��ʼ����
    TP=ChkTab(3).Positn{1,2}(YTnum,:);  %��ֹ����
    X1=SP(1,1); Y1=SP(1,2);
    X2=TP(1,1); Y2=TP(1,2);
    %�ҳ�·������
    for i=1:Glob.BloLine
         if X1>=(i-1)*(Glob.BLKHW+Glob.RoadWidth) && X1<i*(Glob.BLKHW+Glob.RoadWidth)
            XM=(i-1)*(Glob.BLKHW+Glob.RoadWidth);
         elseif X1<0
             XM=0;
         elseif X1>=Glob.BloLine*(Glob.BLKHW+Glob.RoadWidth)
             XM=Glob.BloLine*(Glob.BLKHW+Glob.RoadWidth);
         end
    end
    %������ʻ����
    TDx=abs(X1-XM)+abs(X2-XM);
    TDy=abs(Y1-Y2);
    TD=TDx+TDy;
    %������ʻʱ��
    TT=TD/Para(3).FLSpeed; %�˴�Ӧ��ʹ��������ʻ�ٶ�
elseif ChkTab(3).State(YTnum,1)==30  %�Ӱ�������ڳ�����ʻ
    SP=ChkTab(3).Positn{1,6}(YTnum,:);  %��ʼ����
    TP=ChkTab(3).Positn{1,3}(YTnum,:);  %��ֹ����
    X1=SP(1,1); Y1=SP(1,2);
    X2=TP(1,1); Y2=TP(1,2);
    %�ҳ�·������
    for i=1:Glob.BloLine
         if X1>=(i-1)*(Glob.BLKHW+Glob.RoadWidth) && X1<i*(Glob.BLKHW+Glob.RoadWidth)
            XM=(i-1)*(Glob.BLKHW+Glob.RoadWidth);
         elseif X1<0
             XM=0;
         elseif X1>=Glob.BloLine*(Glob.BLKHW+Glob.RoadWidth)
             XM=Glob.BloLine*(Glob.BLKHW+Glob.RoadWidth);
         end
    end
    %������ʻ����
    TDx=abs(X1-XM)+abs(X2-XM);
    TDy=abs(Y1-Y2);
    TD=TDx+TDy;
    %������ʻʱ��
    TT=TD/Para(3).ULSpeed; %�˴�Ӧ��ʹ�ÿ�����ʻ�ٶ�
elseif ChkTab(3).State(YTnum,1)==31 %�ӽ��ڳ�������ڳ�����ʻ
    SP=ChkTab(3).Positn{1,2}(YTnum,:);  %��ʼ����
    TP=ChkTab(3).Positn{1,3}(YTnum,:);  %��ֹ����
    X1=SP(1,1); Y1=SP(1,2);
    X2=TP(1,1); Y2=TP(1,2);
    %�ҳ�·������
    for i=1:Glob.BloLine
         if X1>=(i-1)*(Glob.BLKHW+Glob.RoadWidth) && X1<i*(Glob.BLKHW+Glob.RoadWidth)
            XM=i*(Glob.BLKHW+Glob.RoadWidth);
         elseif X1<0
             XM=0;
         elseif X1>=Glob.BloLine*(Glob.BLKHW+Glob.RoadWidth)
             XM=Glob.BloLine*(Glob.BLKHW+Glob.RoadWidth);
         end
    end
    %������ʻ����
    TDx=abs(X1-XM)+abs(X2-XM);
    TDy=abs(Y1-Y2);
    TD=TDx+TDy;
    %������ʻʱ��
    TT=TD/Para(3).ULSpeed; %�˴�Ӧ��ʹ�ÿ�����ʻ�ٶ�
elseif ChkTab(3).State(YTnum,1)==41 %�ӳ��ڳ�������ڰ�����ʻ
    SP=ChkTab(3).Positn{1,3}(YTnum,:);  %��ʼ����
    TP=ChkTab(3).Positn{1,5}(YTnum,:);  %��ֹ����
    X1=SP(1,1); Y1=SP(1,2);
    X2=TP(1,1); Y2=TP(1,2);
    %�ҳ�·������
    for i=1:Glob.BloLine
         if X1>=(i-1)*(Glob.BLKHW+Glob.RoadWidth) && X1<i*(Glob.BLKHW+Glob.RoadWidth)
            XM=i*(Glob.BLKHW+Glob.RoadWidth);
         elseif X1<0
             XM=0;
         elseif X1>=Glob.BloLine*(Glob.BLKHW+Glob.RoadWidth)
             XM=Glob.BloLine*(Glob.BLKHW+Glob.RoadWidth);
         end
    end
    %������ʻ����
    TDx=abs(X1-XM)+abs(X2-XM);
    TDy=abs(Y1-Y2);
    TD=TDx+TDy;
    %������ʻʱ��
    TT=TD/Para(3).FLSpeed; %�˴�Ӧ��ʹ��������ʻ�ٶ�
elseif ChkTab(3).State(YTnum,1)==50 %�ӽ��ڳ����򰶱���ʻ
    
    SP=ChkTab(3).Positn{1,2}(YTnum,:);  %��ʼ����
    TP=ChkTab(3).Positn{1,6}(YTnum,:);  %��ֹ����
    X1=SP(1,1); Y1=SP(1,2);
    X2=TP(1,1); Y2=TP(1,2);
    %�ҳ�·������
    for i=1:Glob.BloLine
         if X1>=(i-1)*(Glob.BLKHW+Glob.RoadWidth) && X1<i*(Glob.BLKHW+Glob.RoadWidth)
            XM=i*(Glob.BLKHW+Glob.RoadWidth);
         elseif X1<0
             XM=0;
         elseif X1>=Glob.BloLine*(Glob.BLKHW+Glob.RoadWidth)
             XM=Glob.BloLine*(Glob.BLKHW+Glob.RoadWidth);
         end
    end
    %������ʻ����
    TDx=abs(X1-XM)+abs(X2-XM);
    TDy=abs(Y1-Y2);
    TD=TDx+TDy;
    %������ʻʱ��
    TT=TD/Para(3).ULSpeed; %�˴�Ӧ��ʹ�ÿ�����ʻ�ٶ�
end