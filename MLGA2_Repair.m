function Cmi=MLGA2_Repair(Cmi,MLGA,Para)
%%%%%%%%%%%%%%%%%%��������˼·%%%%%%%%%%%%%%%%%%
%��ͬ�������޸������涨����ÿ��Ⱦɫ�嶼�����޸���ֱ�������ض���ΧҪ�󼴿ɣ�
%�˴�������޸���������Ŵ��㷨�Ŵ��������涨���Ŵ��������ʣ��Դ�������ĸ�
%�尴��һ���ĸ��ʽ����޸���һֱ�޸������ܸ��Ӿ���Ϊ֮��
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:MLGA(1).ChmSum
        %%%%%%%%�ж��Ƿ���б���
        pick=rand;
        if pick>MLGA(2).RepPro
           continue;
        end
        %%%%%%%%ѡ���޸�����
        pick=rand;
        while pick==0
              pick=rand;
        end
        index=ceil(pick*MLGA(1).ChmSum);
        %%%%%%%%�޸�����
        RId=Cmi{3,index};
        NRId=RId;
        Gap=10000;
        while 1
              %%%%ͳ�Ƹ����ŵ���ҵ��
              JobSum=zeros(Para(2).OutSum,1);
              for j=1:size(RId,2)
                   JobSum(RId(4,j),1)=JobSum(RId(4,j),1)+RId(3,j);
              end
              NGap=max(JobSum)-min(JobSum);
              %%%%����޸�������С����ҵ��������µĽ������ɵĽ��
              if NGap<Gap
                 Gap=NGap;
                 RId=NRId;
                 [~,MinYCNum]=min(JobSum);
                 [~,MaxYCNum]=max(JobSum);
                 %%%%��Ⱦɫ�����������
                 order=randperm(size(RId,2));
                 %%%%�ҵ���һ����ҵ����YC���У����滻�����ٵ�YC����
                 for k=1:size(RId,2)
                       if RId(4,order(1,k))==MaxYCNum
                           RId(4,order(1,k))=MinYCNum;
                           break
                       end
                 end
                 NRId=RId;
              else
                  break
              end
        end
        %%%%%%%%�洢�޸����
        Cmi{3,index}=RId;
end