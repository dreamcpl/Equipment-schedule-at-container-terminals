clc;clear;tic
%%
%%%%%%%%%%%%%%%%%%�����������%%%%%%%%%%%%%%%%%%
%1.���������Ҫ�����������Ϣ�����������������š���װ����������֪��
%2.���������Ѵ�λ����Ϣ��֪��
%3.���谶���ƶ�����Ҫʱ�䡣
%%%%%%%%%%%%%���������ü���ע������%%%%%%%%%%%%%
%1.����ģ�飺��ֹ��ͬȾɫ���ٴμ��㣬���Ӧ������Ⱦɫ���¼����
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%
%%%%%%%%һ����������
global Bwi Swi SYwi TskCod JobCod QCRec YCRec
dlmwrite('OutputResult\AverageResultSum.txt',0,'delimiter','\t');
QCRec=[];
YCRec=cell(1,3);
[Cmi,MLGA,Glob,Para,Cost]=Main_VarState();
Bwi=textread('����������Ϣ.txt');
EX=importdata('����������Ϣ.txt');  QCwi=EX.data;
TskCod=textread('������������.txt');
Swi=textread('�ѳ�������Ϣ.txt');
JobCod=textread('�ѳ���������.txt');
SYwi=textread('�򻯶ѳ�������Ϣ.txt');
%%%%%%%%����������ҵ����
Cmi=Main_Firgen(Cmi,MLGA,Para,QCwi); %���ɳ�ʼ��Ⱥ
% for i=1:MLGA(1).Iter  %ģʽ1���涨��������
i=0;  while 1 ;  i=i+1;       %ģʽ2�����MLGA2_Output���γɹ涨����������ʱ��
        Cmi=Main_UndChrom(Cmi,MLGA,Para,SYwi); %�²�Ⱦɫ������
        for j=1:MLGA(2).Iter
                Cmi=Main_FitCal(Cmi,Para,MLGA,Bwi,Swi,Cost,Glob);
                OutPut=MLGA2_Output(Cmi,MLGA,i,j,Bwi,Swi,Para,Cost,Glob);
                if OutPut==2               %��������������Ǿ���ǰ����
                    return
                end
                Cmi=MLGA2_Select(MLGA,Cmi);
                Cmi=MLGA2_Cross(MLGA,Cmi);              %�²㽻��ģ��
                Cmi=MLGA2_Mutation(MLGA,Para,Cmi); %�²����ģ��
        end
        Cmi=MLGA1_Select(MLGA,Cmi);           %ѡ��ģ��
        Cmi=MLGA1_Cross(MLGA,Para,Cmi);    %�ϲ㽻��ģ��
        Cmi=MLGA1_Mutation(MLGA,Para,Cmi); %�ϲ����ģ��       
        Cmi=MLGA1_Encode(Cmi,MLGA);          %�仯��İ����������±���
end