function Cmi=Main_RptChk(Cmi,num)
global QCRec YCRec Bwi Swi SYwi
[~,~,Glob,Para,Cost]=Main_VarState();
YCTask=Cmi{3,num}(4,:);   %��ǰ���ŵ�������
QCTask=Cmi{2,num};   %��ǰ���ŵ�������
CWI=Cmi{3,num};
QCwi=Cmi{4,num};
%�ԱȰ����ظ���¼
%���ǿ��ļ�����ֱ�ӽ��м���
if isempty(QCRec)    
     %����¼�¼
     QCRec=QCTask; 
     YCRec{1,1}=YCTask;
     %������Ƚ��
     [SimRzt,RepCwi]=Main_Simulation(Para,QCwi,Bwi,Swi,CWI,Cost,Glob); %����ģ�飨V1.2��
     Temp=[SimRzt.Makespan SimRzt.CostSum SimRzt.CmpSum SimRzt.QCUtRo SimRzt.YCUtRo SimRzt.YTUtRo];
     %��Ӽ�����
     %����޸����
     YCRec{1,2}=RepCwi(4,:);
     %��Ӽ�����
     YCRec{1,3}=Temp;
     %��ӵ�Ⱦɫ����Ϣ��¼ϵͳ
     Cmi{3,num}=RepCwi;          %V1.2���Ӵ���
     Cmi{5,num}=Temp;
     Cmi{6,num}=1/SimRzt.CmpSum;
     return
end
%�����ǿ��ļ���������Ų�
for i=1:size(QCRec,1)
     for j=1:size(QCRec,2)
          if QCRec(i,j)~=QCTask(1,j)
              if i==size(QCRec,1)  %��������һ��Ҳ���ظ���������¼�¼
                 QCRec=[QCRec;QCTask]; 
                 temp=YCRec{i,1};
                 temp=[temp;YCTask];
                 temp=[temp;YCTask];
                 YCRec{1,1}=temp;
                 %������Ƚ��
                 [SimRzt,RepCwi]=Main_Simulation(Para,QCwi,Bwi,Swi,CWI,Cost,Glob); %����ģ�飨V1.2��
                 Temp=[SimRzt.Makespan SimRzt.CostSum SimRzt.CmpSum SimRzt.QCUtRo SimRzt.YCUtRo SimRzt.YTUtRo];
                 %��Ӽ�����
                 %����޸����
                 temp2=YCRec{i,2};
                 temp2=[temp2;RepCwi(4,:)];
                 YCRec{i,2}=temp2;
                 %��Ӽ�����
                 temp3=YCRec{i,3};
                 temp3=[temp3;Temp];
                 YCRec{i,3}=temp3;
                 %��ӵ�Ⱦɫ����Ϣ��¼ϵͳ
                 Cmi{3,num}=RepCwi;          %V1.2���Ӵ���
                 Cmi{5,num}=Temp;
                 Cmi{6,num}=1/SimRzt.CmpSum;
                 return
              else
                 break
              end
          end
     end
     %�Ų鳡�ż�¼
    temp=YCRec{i,1};
    %������ż�¼�ǿյģ�������¼�¼
    if isempty(temp)
        %������Ƚ��
         [SimRzt,RepCwi]=Main_Simulation(Para,QCwi,Bwi,Swi,CWI,Cost,Glob); %����ģ�飨V1.2��
         Temp=[SimRzt.Makespan SimRzt.CostSum SimRzt.CmpSum SimRzt.QCUtRo SimRzt.YCUtRo SimRzt.YTUtRo];
         %��Ӽ�����
         %����޸����
         temp2=YCRec{i,2};
         temp2=[temp2;RepCwi(4,:)];
         YCRec{i,2}=temp2;
         %��Ӽ�����
         temp3=YCRec{i,3};
         temp3=[temp3;Temp];
         YCRec{i,3}=temp3;
         %��ӵ�Ⱦɫ����Ϣ��¼ϵͳ
         Cmi{3,num}=RepCwi;          %V1.2���Ӵ���
         Cmi{5,num}=Temp;
         Cmi{6,num}=1/SimRzt.CmpSum;
         return
    else %������ǿյģ����Ҽ�¼
        for m=1:size(temp,1)
              for n=1:size(temp,2)
                    if temp(m,n)~=YCTask(1,n)
                          if n==size(temp,1)  %��������һ��Ҳ���ظ���������¼�¼
                             QCRec=[QCRec;QCTask]; 
                             temp=YCRec{i,1};
                             temp=[temp;YCTask];
                             %������Ƚ��
                             [SimRzt,RepCwi]=Main_Simulation(Para,QCwi,Bwi,Swi,CWI,Cost,Glob);; %����ģ�飨V1.2��
                             Temp=[SimRzt.Makespan SimRzt.CostSum SimRzt.CmpSum SimRzt.QCUtRo SimRzt.YCUtRo SimRzt.YTUtRo];
                             %��Ӽ�����
                             %����޸����
                             temp2=YCRec{i,2};
                             temp2=[temp2;RepCwi(4,:)];
                             YCRec{i,2}=temp2;
                             %��Ӽ�����
                             temp3=YCRec{i,3};
                             temp3=[temp3;Temp];
                             YCRec{i,3}=temp3;
                             %��ӵ�Ⱦɫ����Ϣ��¼ϵͳ
                             Cmi{3,num}=RepCwi;          %V1.2���Ӵ���
                             Cmi{5,num}=Temp;
                             Cmi{6,num}=1/SimRzt.CmpSum;
                             return
                          else
                             break
                          end
                    end
              end
              %�ҵ��ظ�����Ŀ���ҳ���������¼
              %��Ӽ�����
              YCChrom=[];
              for j=1:size(QCTask,2)
                   WNum=QCTask(1,j);
                   TSgCm=SYwi(:,find(SYwi(1,:)==WNum));
                   YCChrom=[YCChrom,TSgCm];
              end
              YCChrom(4,:)=YCTask;
              Cmi{3,num}=YCChrom;          %�޸����Ⱦɫ��
              Cmi{5,num}=YCRec{i,3}(m,:);          %���Ƚ��
              sum=YCRec{i,3}(m,3);
              Cmi{6,num}=1/sum;
              return
         end
    end     
end
    