function result=Fun_RandomNum(object,mode,num)
%%%%%%%%%%%%%���������ü���ע������%%%%%%%%%%%%%
%mode����ʾ���������һά�����ģʽ��1��ʾ��������2��ʾ��������
%�ú����������ǣ���object��ÿ��Ԫ�ض���1��num��Χ�ڵ���������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
if mode==1
   for i=1:size(object,1)
       object(i)=ceil(rand*num);
   end
elseif mode==2
   for i=1:size(object,2)
       object(i)=ceil(rand*num);
   end
end
result=object;