function Cmi=Main_FitCal(Cmi,Para,MLGA,Bwi,Swi,Cost,Glob)
%%%%%%%%%%%%%%%%%%��������˼·%%%%%%%%%%%%%%%%%%
%��Ⱦɫ�����Ӧ����Ϣ��Ҫ����գ�ɸѡ���ϸ�ĸ��壬���ȱ�������Ϣ����Ȼ
%���ŵĸ�����ͨ��ɸѡ�����Ա�����ĸ��塣
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%�����о�Ⱦɫ�����Ӧ��ֵ����Ϣ���
for i=1:MLGA(1).ChmSum
      Cmi{5,i}=[];      Cmi{6,i}=[];       Cmi{7,i}=[]; 
end
%%%%��������� 
for i=1:MLGA(1).ChmSum
     if isempty(Cmi{5,i})   %����ͨ��ɸѡ��Ⱦɫ�壬���ܲ������
        CWI=Cmi{3,i};
        QCwi=Cmi{4,i};
        %������Ƚ��
        [SimRzt,RepCwi]=Main_Simulation(Para,QCwi,Bwi,Swi,CWI,Cost,Glob); %����ģ�飨V1.2��
        Temp=[SimRzt.Makespan SimRzt.CostSum SimRzt.CmpSum SimRzt.QCUtRo SimRzt.YCUtRo SimRzt.YTUtRo];
        Cmi{3,i}=RepCwi;          %V1.2���Ӵ���
        Cmi{5,i}=Temp;
        Cmi{6,i}=1/SimRzt.CmpSum;
     end
end
%%%%������Ӧ�Ⱥ�
FitSum=0;
for i=1:MLGA(1).ChmSum
    FitSum=Cmi{6,i}+FitSum;
end
%%%%������Ӧ��ռ��
for i=1:MLGA(1).ChmSum
    Cmi{7,i}=Cmi{6,i}/FitSum;
end