function Cmi=MLGA1_Cross(MLGA,Para,Cmi)
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
    QCnum=ceil(rand*Para(1).Sum);                %ѡ��һ̨����
    f1=Cmi{4,index(1)}(QCnum,:); f2=Cmi{4,index(2)}(QCnum,:);      %���������������
    f1(f1==0)=[];         f2(f2==0)=[];            %ȥ�������0
    %���ȥ��0֮��ֻʣ��һ������λ�����޷����棬ֱ�ӵ���һ��Ⱦɫ��
    if size(f1,2)==1
        continue
    end
    val=ceil(rand(size(f1,2)-pl));                     %����Ƭ����ʼ��
    f1cp=f1(val:val+pl-1);   f2cp=f2(val:val+pl-1);        %ȡ������Ƭ��
    for i=1:pl                                   %ɾ���Է��ظ�Ƭ��
        f1(f1==f2cp(i))=[];
        f2(f2==f1cp(i))=[];
    end
    %����Ƭ��
    object=f1;pos=val;num=pl;
    result=Fun_InsertLane(object,pos,num);
    f1=result;   f1(val+1:val+pl)=f2cp;
    object=f2;pos=val;num=pl;
    result=Fun_InsertLane(object,pos,num);
    f2=result;   f2(val+1:val+pl)=f1cp;
    %�����Ž���洢
    Cmi{4,index(1)}(QCnum,1:size(f1,2))=f1;
    Cmi{4,index(2)}(QCnum,1:size(f2,2))=f2;
    %Ⱦɫ��������洢
    Cmi{2,index(1)}=MLGA_Encode(Cmi{4,index(1)});
    Cmi{2,index(2)}=MLGA_Encode(Cmi{4,index(2)});
end