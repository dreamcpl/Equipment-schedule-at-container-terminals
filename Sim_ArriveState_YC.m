function ChkTab=Sim_ArriveState_YC(ChkTab,Para,Static)
%%
for i=1:Para(2).OutSum
    if ChkTab(2).State(i,1)==1         %��ʻ״̬
      if ChkTab(2).Positn{1,5}(i,1)==1   %�������������ƶ������������ƶ���
           if ChkTab(2).State(i,1)==1 && ChkTab(2).Positn{1,4}(i,1)==0     %������ʻ״̬  ����  û�б�����YC����
             if ChkTab(2).Positn{1,2}(i,2)>ChkTab(2).Positn{1,1}(i,2)      %������ʻ
                if ChkTab(2).Positn{1,2}(i,2)-ChkTab(2).Positn{1,1}(i,2)-Static.BaySecYC*Static.Accu>0
                   ChkTab(2).Positn{1,1}(i,2)=ChkTab(2).Positn{1,1}(i,2)+Static.BaySecYC*Static.Accu;
                else
                   ChkTab(2).State(i,1)=2;            %�ȴ�����
                   ChkTab(2).Positn{1,3}(i,1)=0;  %����λ�ü�ʱ��
                end
             elseif ChkTab(2).Positn{1,2}(i,2)<ChkTab(2).Positn{1,1}(i,2)  %������ʻ
                if ChkTab(2).Positn{1,1}(i,2)-ChkTab(2).Positn{1,2}(i,2)-Static.BaySecYC*Static.Accu>0
                   ChkTab(2).Positn{1,1}(i,2)=ChkTab(2).Positn{1,1}(i,2)-Static.BaySecYC*Static.Accu;
                else
                   ChkTab(2).State(i,1)=2;   %�ȴ�����
                   ChkTab(2).Positn{1,3}(i,1)=0;  %����λ�ü�ʱ��
                end
             elseif ChkTab(2).Positn{1,2}(i,2)==ChkTab(2).Positn{1,1}(i,2) %ͬһλ����ʻ
                      ChkTab(2).State(i,1)=2;   %�ȴ�����
                      ChkTab(2).Positn{1,3}(i,1)=0;  %����λ�ü�ʱ��
             end
          elseif ChkTab(2).State(i,1)==2     %�ȴ�YT״̬
                   ChkTab(2).Positn{1,3}(i,1)=ChkTab(1).Positn{1,3}(i,1)+Static.Accu;                   
          end
      elseif ChkTab(2).Positn{1,5}(i,1)==2    %�������������ƶ�����������ƶ���
           if ChkTab(2).State(i,2)>=ChkTab(2).State(i,3)   %Ԥ��ʱ���Ѿ�����
               %%�豸λ����Ϣ���£�Ŀ����������λ��
               ChkTab(2).Positn{1,1}(i,1)=ChkTab(2).Positn{1,2}(i,1);
               ChkTab(2).Positn{1,1}(i,2)=ChkTab(2).Positn{1,2}(i,2);  %ֱ�Ӱ�������Ŀ�건λ���д����������ǵȴ�YT״̬
               ChkTab(2).Positn{1,3}(i,1)=0;  %����λ�ü�ʱ��
               ChkTab(2).Positn{1,5}(i,1)=1;  %�ƶ�ģʽ��Ϊ�������ƶ�
           end
      end
    end
end

