function Finval=Sim_EndJudge(ChkTab,Para,T,Static)
%%
%%���ʱ�䵽�˻�û�������Ͱ����2����
if T>=Static.End-Static.Accu
    Finval=2;
end
%%YC�Ƿ񲻷��ϰ�ȫ����Լ��
for i=1:Para(2).Sum
    if ChkTab(1).Positn(i,4)==2
       Finval=2;
       break
    end
end
%%QC�Ƿ񲻷��ϰ�ȫ����Լ��
% for i=1:Para(1).Sum
%     if ChkTab(1).Positn(i,4)==2
%        Finval=2;
%        break
%     end
% end
%%QC�Ƿ���Ͻ�������
for i=1:Para(1).Sum
    if ChkTab(1).State(i,1)~=4
       Finval=0;
       break
    elseif ChkTab(1).State(i,1)==4 && i==Para(1).Sum
       Finval=1;
       break
    end
end

    
    
    