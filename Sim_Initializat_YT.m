function ChkTab=Sim_Initializat_YT(ChkTab,Para)
%%
for i=1:Para(3).Sum
   %%%%��ʼ���󶨹�ϵ��
   ChkTab(3).EqpBod(i,1)=i;
   ChkTab(3).Positn{1,6}(i,:)=Para(3).StartPoint;
end

    
    
    