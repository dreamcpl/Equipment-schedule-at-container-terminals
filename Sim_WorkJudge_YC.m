function ChkTab=Sim_WorkJudge_YC(ChkTab,Para)
%%
%%%%��ǰģ������Ƿ���punishment_YCģ����������ã���Ϊpunishment_YCģ��ʵʱ���YC���谭״̬
for i=1:Para(2).OutSum
    %ֻ�е�   YC�Ѿ��ڵȴ�YT��  ����  YC���Ǳ��谭״̬   ����ִ����ҵ    
        if ChkTab(2).State(i,1)==2 && ChkTab(2).Positn{1,4}(i,1)==0   %�����Ѿ��ڵȴ�YT������û���ܵ�����
           YTnum=ChkTab(2).EqpBod(i,1);     %��ȡ�󶨵ĵ�һ��YT�ı��
               if YTnum~=0                    %��YC����YT
                      if ChkTab(2).State(i,4)==1 && ChkTab(3).State(YTnum,1)==32       %����װ��YC��YT�ڵȴ�YC
                         ChkTab(2).State(i,1)=3;                        %YC��ʼִ����ҵ
                         ChkTab(2).State(i,2)=0;                                  
                         ChkTab(2).State(i,3)=Para(2).Load;
                         ChkTab(3).State(YTnum,1)=33;           %YT��ʼִ����ҵ
                         ChkTab(3).State(YTnum,2)=0;
                         ChkTab(3).State(YTnum,3)=Para(3).YCUnload;
                      elseif ChkTab(2).State(i,4)==2 && ChkTab(3).State(YTnum,1)==22    %����ж��YC��YT�ڵȴ�YC
                         ChkTab(2).State(i,1)=3;                        %YC��ʼִ����ҵ
                         ChkTab(2).State(i,2)=0;                               
                         ChkTab(2).State(i,3)=Para(2).Unload;
                         ChkTab(3).State(YTnum,1)=23;           %YT��ʼִ����ҵ
                         ChkTab(3).State(YTnum,2)=0;
                         ChkTab(3).State(YTnum,3)=Para(3).YCLoad;
                      end
               end
        end
end



    
    
    