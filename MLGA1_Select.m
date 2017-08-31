function Cmi=MLGA1_Select(MLGA,Cmi)
%%%%%%%%%%%%%%%%%%模块整体思路%%%%%%%%%%%%%%%%%%
%采用轮盘赌方式选择染色体，将其直接传送至下一代。
%轮盘赌：小球有一定的初始速度，随着小球移动，自身能量逐渐减小，总会停在某个
%格子内。不同于真实场景，算法中小球一定移动不了一整圈。
%%%%%%%%%%%%%各步骤作用及其注意事项%%%%%%%%%%%%%
%1.生成随机数：该随机数就是小球的初始能量，该能量不能是0。
%2.轮盘赌：小球滚动，并最终落入某个格子，即选中染色体。
%3.染色体遗传：直接将选中的染色体传送至下一代种群中。
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
tcmi=Cmi;  %直接将选择的染色体的全部内容转移到新一代染色体中
%%%%%%%%轮盘赌选择方式
for i=1:MLGA(1).ChmSum
    pick=rand;
    while pick==0
          pick=rand;
    end
    for j=1:MLGA(1).ChmSum
        pick=pick-Cmi{7,j};
        if pick<0
           index=j;
           break
        end
    end
    Cmi(:,index)=tcmi(:,index); %由该步可知，高适应度染色体在一代中所占比例将逐渐上升到100%
end 
%%%%%%%%最佳个体直接传递
ObVal=zeros(1,MLGA(1).ChmSum);
for i=1:MLGA(1).ChmSum
     ObVal(1,i)=Cmi{5,i}(1,3);
end
[~,pos]=min(ObVal);
Cmi(:,pos)=tcmi(:,pos);