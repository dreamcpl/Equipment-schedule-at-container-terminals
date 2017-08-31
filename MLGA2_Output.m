function OutPut=MLGA2_Output(Cmi,MLGA,FG,SG,Bwi,Swi,Para,Cost,Glob)
%%%%%%%%%%%%%%%%%%%%%ע��%%%%%%%%%%%%%%%%%%%%%
%�������������������庯���÷������ݣ��뻬������������в鿴��������������
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
global LastBestTime
OutPut=1;
% LastBestTime=0;             %��¼��Ѽ�¼������ʱ��
LastBestGeneration=1;    %��¼��Ѽ�¼�����Ĵ�
%%
%%%%ѡ�����Ⱦɫ��
ObVal=zeros(1,MLGA(1).ChmSum);
for i=1:MLGA(1).ChmSum
     ObVal(1,i)=Cmi{5,i}(1,3);
end
[~,pos]=min(ObVal);
BestInfo=Cmi(:,pos); %ת�����Ⱦɫ��������Ϣ
%%
%%%%%%%%�Ե�һ�����д���
if FG==1 && SG==1 %��һ��txt��¼ÿ�����ֵ
    LastBestTime=toc; %��¼��Ѽ�¼������ʱ��
    dlmwrite('OutputResult\BestQCwi.txt',BestInfo{4,1},'delimiter','\t');
    dlmwrite('OutputResult\BestYCwi.txt',BestInfo{3,1},'delimiter','\t');
    TBest=[FG,SG,BestInfo{5,1},floor(toc)];
    dlmwrite('OutputResult\BestQbjVal.txt',TBest,'delimiter','\t');
    dlmwrite('OutputResult\Output.txt',TBest,'delimiter','\t');
    return
end
%%
BestObjVal=textread('OutputResult\BestQbjVal.txt');
BestSumVal=BestObjVal(1,3);
NewBestSumVal=BestInfo{5,1}(1,3);
if NewBestSumVal<BestSumVal
    LastBestTime=toc; %��¼��Ѽ�¼������ʱ��
    LastBestGeneration=FG;
    dlmwrite('OutputResult\BestQCwi.txt',BestInfo{4,1},'delimiter','\t');
    dlmwrite('OutputResult\BestYCwi.txt',BestInfo{3,1},'delimiter','\t');
    TBest=[FG,SG,BestInfo{5,1},floor(toc)];
    dlmwrite('OutputResult\BestQbjVal.txt',TBest,'delimiter','\t');
    dlmwrite('OutputResult\Output.txt',TBest,'-append','delimiter','\t');
else
    TBest=[FG,SG,BestObjVal(1,3:end-1),floor(toc)];
    dlmwrite('OutputResult\Output.txt',TBest,'-append','delimiter','\t');
    PresentTime=toc;
    if PresentTime-LastBestTime>=10800     %�������3��Сʱ�����������ý��
        OutPut=2;                                             %û�в������õĽ�������ó������
        return
    end
end