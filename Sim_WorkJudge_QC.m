function ChkTab=Sim_WorkJudge_QC(ChkTab,Para)
%%
for i=1:Para(1).Sum
   if ChkTab(1).State(i,1)==2  &&   ChkTab(1).Positn(i,4)==0%���Ŵ��ڵȴ�״̬����û�б������������谭
        YTnum=ChkTab(1).EqpBod{1,2}(i,1); %ʶ���һ������
        if YTnum~=0
           if ChkTab(1).State(i,4)==1 &&  ChkTab(3).State(YTnum,1)==42          %�����װ��QC����YTҲ�ڵȴ�QC
               ChkTab(1).State(i,1)=3;           %QC��Ϊ��ҵ״̬
               ChkTab(1).State(i,2)=0;           %��ʱ������
               ChkTab(1).State(i,3)=Para(1).Load;
               ChkTab(3).State(YTnum,1)=43;      %YT״̬��Ϣ�����
               ChkTab(3).State(YTnum,2)=0;
               ChkTab(3).State(YTnum,3)=Para(3).QCLoad;
           elseif ChkTab(1).State(i,4)==2   &&  ChkTab(3).State(YTnum,1)==12      %�����ж��QC����YTҲ�ڵȴ�QC
               ChkTab(1).State(i,1)=3;           %QC��Ϊ��ҵ״̬
               ChkTab(1).State(i,2)=0;           %��ʱ������
               ChkTab(1).State(i,3)=Para(1).Unload;
               ChkTab(3).State(YTnum,1)=13;      %YT״̬��Ϣ�����
               ChkTab(3).State(YTnum,2)=0;
               ChkTab(3).State(YTnum,3)=Para(3).QCUnload; 
           end
        end
   end
end