function allot=Fun_BalaDis(num,sum,base)
%%%%����
allot=zeros(num,1);              %�����洢���
origin=randperm(sum+num-1);      %�������ϼ����
addition=zeros(sum+num+1,1);     %��originǰ������һ��0�����ֳ���num��С��
%%%%����num-1��0
origin(find(origin<=num-1))=0;
addition(2:sum+num)=origin;      %��1��sum+num-1����Ҫ����1
%%%%ͳ��ÿ������ֵ����ÿ��С����������Ԫ�صĸ���
zeropos=find(addition==0);
for i=1:num
    allot(i)=zeropos(i+1)-zeropos(i)-1;  %��Ҫ��ͷȥβ������1��4֮��ֻ��4-1-1=2������������4
end                                      %����ע�⡿����Ȼ�˴�û�б���0��Ԫ��С�εĳ��֣������ں��������޸�
%%%%������������õ�����⣨��������ֵ������
cycle=1;
while cycle==1
    [maxvalue,maxpos]=max(allot);
    [minvalue,minpos]=min(allot);
    if maxvalue-minvalue<=base && minvalue>0 %������ֵ�Ĳ�������ߣ�������СֵҲ������0
       cycle=0;
    else                                 %���base=1����ô���������������Ϊ1��ż�����ջ���ȡ�
       allot(maxpos)=allot(maxpos)-1;
       allot(minpos)=allot(minpos)+1;
    end
end
%%%%�����ս���������������Ϊ����Сֵ���Ǵӵ�һ��ֵ��ʼ������
temp1=allot;                  
temp2=randperm(num);          
for j=1:num                  
    allot(j)=temp1(temp2(j));
end