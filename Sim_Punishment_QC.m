function ChkTab=Sim_Punishment_QC(ChkTab,Para)
%%
ChkTab(1).Positn(:,4)=0;    %�ܸ���״̬ÿ�ζ��Ȼָ���Ȼ���ٽ�������
for i=1:Para(1).Sum-1
    %%���������û��QC���ڰ�YC��״̬��˵����ǰQC����û�й�����ֱ������ȥ
    if isempty(ChkTab(1).EqpBod{1,1})
        return
    end
    %%���Ϊi��i+1��QC�У�ֻҪ��һ�����ڹ������Ͳ��ÿ��ǳͷ�(û�б��󶨣����ǻ�û���ڹ���)
    if isempty(find(ChkTab(1).EqpBod{1,1}(:,1)==i)) || isempty(find(ChkTab(1).EqpBod{1,1}(:,1)==i+1))
       continue
    end
    %%С���QCӦ���ڴ���QC��ߣ�����Ⱦɫ����Ч����������QC��Խ������֡�
    if ChkTab(1).Positn(i+1,1)-ChkTab(1).Positn(i,1)<=0
       ChkTab(1).Positn(i,4)=2;    %�ܸ���״̬Ϊ2,����ЧȾɫ��
       return
    elseif ChkTab(1).Positn(i+1,1)-ChkTab(1).Positn(i,1)>0 && ChkTab(1).Positn(i+1,1)-ChkTab(1).Positn(i,1)<=Para(2).SfDs
       if ChkTab(1).State(i,1)==2 && ChkTab(1).State(i+1,1)==2
         if ChkTab(1).Positn(i+1,3)-ChkTab(1).Positn(i,3)>0
           ChkTab(1).Positn(i,4)=1;
           ChkTab(1).Positn(i+1,4)=0;
         elseif ChkTab(1).Positn(i+1,3)-ChkTab(1).Positn(i,3)<0
           ChkTab(1).Positn(i,4)=0;
           ChkTab(1).Positn(i+1,4)=1;
         elseif ChkTab(1).Positn(i+1,3)-ChkTab(1).Positn(i,3)==0
           if rand>=0.5
              ChkTab(1).Positn(i,4)=1;
              ChkTab(1).Positn(i+1,4)=0;
           elseif rand>0.5
              ChkTab(1).Positn(i,4)=0;
              ChkTab(1).Positn(i+1,4)=1;
           end
         end
       end
    elseif ChkTab(1).Positn(i+1,1)-ChkTab(1).Positn(i,1)>Para(2).SfDs
       ChkTab(1).Positn(i,4)=0;
       ChkTab(1).Positn(i+1,4)=0;
    end
end

