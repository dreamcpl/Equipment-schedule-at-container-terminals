function ChkTab=Sim_ArriveState_QC(ChkTab,Para,Static)
%%
for i=1:Para(1).Sum
    if ChkTab(1).State(i,1)==1         %��ʻ״̬
       if ChkTab(1).Positn(i,2)>ChkTab(1).Positn(i,1)      %������ʻ
          if ChkTab(1).Positn(i,2)-ChkTab(1).Positn(i,1)-Static.BaySecYC*Static.Accu>0
             ChkTab(1).Positn(i,1)=ChkTab(1).Positn(i,1)+Static.BaySecYC*Static.Accu;
          else
             ChkTab(1).Positn(i,1)=ChkTab(1).Positn(i,2);
             ChkTab(1).State(i,1)=2;   %�ȴ�����
             ChkTab(1).Positn(i,3)=0;  %����λ�ü�ʱ��
          end
       elseif ChkTab(1).Positn(i,2)<ChkTab(1).Positn(i,1)  %������ʻ
          if ChkTab(1).Positn(i,1)-ChkTab(1).Positn(i,2)-Static.BaySecYC*Static.Accu>0
             ChkTab(1).Positn(i,1)=ChkTab(1).Positn(i,1)-Static.BaySecYC*Static.Accu;
          else
             ChkTab(1).Positn(i,1)=ChkTab(1).Positn(i,2);
             ChkTab(1).State(i,1)=2;   %�ȴ�����
             ChkTab(1).Positn(i,3)=0;  %����λ�ü�ʱ��
          end
       elseif ChkTab(1).Positn(i,2)==ChkTab(1).Positn(i,1) %ͬһλ����ʻ
          ChkTab(1).State(i,1)=2;   %�ȴ�����
          ChkTab(1).Positn(i,3)=0;  %����λ�ü�ʱ��
       end
    end
end

