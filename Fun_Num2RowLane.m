function [X,Y]=Fun_Num2RowLane(num,lane)
%%%%%%%%%%%%%���������ü���ע������%%%%%%%%%%%%%
%��ģ��Ŀ�����ڼ����num�������к��С�
%ע�⣺X�൱�����У���Y�����С�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
val=floor(num/lane);
if num==val*lane
   Y=val;
   X=lane;
elseif num>val*lane
   Y=val+1;
   X=num-val*lane;
end