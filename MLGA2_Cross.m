function Cmi=MLGA2_Cross(MLGA,Cmi)
%%%%%%%%%%%%%%%%%%ģ������˼·%%%%%%%%%%%%%%%%%%
%���ѡ����������Ⱦɫ�壬����������Ⱦɫ���е�0ȡ�������ѡ����ͬλ�õ�
%Ƭ�ν��л��������������ĸ��塣
%%%%%%%%%%%%%���������ü���ע������%%%%%%%%%%%%%
%1.�趨����Ƭ�γ��ȡ�
%2.ѡ�񸸴�Ⱦɫ�壺�������ѡ����������Ⱦɫ�壬���뽻�������
%3.���������
%4.����洢��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%����Ƭ�γ���
pl=1;
%%%%%%%%1 ���̶�ѡ�񽻲�Ⱦɫ��
for k=1:MLGA(1).ChmSum
    %%%%%%1.1 ���ѡ������Ⱦɫ��
    pick=rand(1,2);
    while prod(pick)==0       %�������ֵ�ﲻ����0
          pick=rand(1,2);
    end
    index=ceil(pick.*MLGA(1).ChmSum); %�����Ⱦɫ����
    %%%%%%1.2 �ж��Ƿ���н���
    pick=rand;                %�ж��ٸ�Ⱦɫ���Ҫ���ж��ٴ����̶�
    while pick==0
          pick=rand;
    end
    if pick>MLGA(2).CroPro
       continue
    end
    %%%%%%%%2 ���н������
    f1=Cmi{3,index(1)}(4,:);   f2=Cmi{3,index(2)} (4,:);      %ѡ����Ⱦɫ��
    val=ceil(rand(size(f1,2)-pl));                               %����Ƭ����ʼ��
    f1cp=f1(val:val+pl-1);   f2cp=f2(val:val+pl-1);    %ȡ������Ƭ��
    f1(val:val+pl-1)=[];     f2(val:val+pl-1)=[];      %ɾ����Ӧλ��Ƭ��
    %����Ƭ��
    object=f1;pos=val;num=pl;
    result=Fun_InsertLane(object,pos,num);
    f1=result;   f1(val+1:val+pl)=f2cp;
    object=f2;pos=val;num=pl;
    result=Fun_InsertLane(object,pos,num);
    f2=result;   f2(val+1:val+pl)=f1cp;
    %�洢���
    Cmi{3,index(1)}(4,:)=f1;  Cmi{3,index(2)}(4,:)=f2;    
end

