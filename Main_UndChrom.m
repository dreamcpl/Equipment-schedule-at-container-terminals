function Cmi=Main_UndChrom(Cmi,MLGA,Para,SYwi)
%%%%%%%%%%%%%���������ü���ע������%%%%%%%%%%%%%
%��SYwi��3�У��ֱ��������š�������š�ĳ������ĳ�����ڵļ�װ������
%��YCChrom��SYwi���򻯳���������Ϣ���Ļ�������ӵ�4�У�������ű��롣
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:MLGA(1).ChmSum
    YCChrom=[];
    for j=1:size(Cmi{2,i},2)
         WNum=Cmi{2,i}(1,j);
         TSgCm=SYwi(:,find(SYwi(1,:)==WNum));
         YCChrom=[YCChrom,TSgCm];
    end
    YCChrom(4,:)=zeros(1,size(SYwi,2));
    YCChrom(4,:)=Fun_RandomNum(YCChrom(3,:),2,Para(2).OutSum);
    Cmi{3,i}=YCChrom;
end
    
