function ChkTab=Sim_ScheduleRenew_QC(ChkTab,Para,Static)
%%
for i=1:Para(1).Sum
   ChkTab(1).State(i,2)=ChkTab(1).State(i,2)+Static.Accu;          %״̬��ʱ������ʱ�䲽��
   ChkTab(1).Positn(i,3)=ChkTab(1).Positn(i,3)+Static.Accu;      %λ�ü�ʱ������ʱ�䲽��
   if ChkTab(1).State(i,1)==3   %��ǰQC������ҵ״̬
     if ChkTab(1).State(i,2)>=ChkTab(1).State(i,3)  %����ҵʱ�������˹涨Ҫ��
       ChkTab(1).State(i,1)=0;   %״̬��Ϊ0����׼��״̬
       ChkTab(1).State(i,2)=0;   %��ʱ����0
       ChkTab(1).State(i,3)=0;   %Ԥ��״̬�仯����ʱ��ҲΪ0
     end
   end
end



    
