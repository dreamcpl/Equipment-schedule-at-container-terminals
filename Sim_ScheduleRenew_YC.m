function ChkTab=Sim_ScheduleRenew_YC(ChkTab,Para,Static)
%%
for i=1:Para(2).OutSum
    ChkTab(2).State(i,2)=ChkTab(2).State(i,2)+Static.Accu;                        %״̬��ʱ������ʱ�䲽��
    ChkTab(2).Positn{1,3}(i,1)=ChkTab(2).Positn{1,3}(i,1)+Static.Accu;   %λ�ü�ʱ������ʱ�䲽��
    if ChkTab(2).State(i,1)==3            %��ǰYC������ҵ״̬
        if ChkTab(2).State(i,2)>=ChkTab(2).State(i,3)  %����ҵʱ�������˹涨Ҫ��
           ChkTab(2).State(i,1)=0;          %״̬��Ϊ0����׼��״̬
           ChkTab(2).State(i,2)=0;          %��ʱ����0
           ChkTab(2).State(i,3)=0;          %Ԥ��״̬�仯����ʱ��ҲΪ0
        end 
    end    
end




    
    
    