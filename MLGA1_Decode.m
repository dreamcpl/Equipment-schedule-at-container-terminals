function QCwi=MLGA1_Decode(object)
%%%%%%%%%%%%%%%%%%%%注意事项%%%%%%%%%%%%%%%%%%%%
%●不同场桥的任务数目可能不同，按照二维数组的特点，任务数目少的岸桥，最后可
%  能好多个0，但是对解码过程没有影响，因为遇到第一个0就切换到下一行。
%●为了方便仿真阶段判断岸桥任务是否结束，应该在每台岸桥任务最后加上0，表示结束。
%%%%%%%%%%%%%%%%%%%%程序步骤%%%%%%%%%%%%%%%%%%%%
%1.识别元素个数。
%2.依次读取元素，遇到0切换到下一个设备。
%3.拼接各设备。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%1.识别元素个数
rowsum=size(object,2);
row=1;
line=1;
QCwi=[];
%2.依次读取元素
for i=1:rowsum
    if object(1,i)==0
       QCwi(row,line)=0;
       row=row+1;
       line=1;
    else
       QCwi(row,line)=object(1,i);
       line=line+1;
    end
end