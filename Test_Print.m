function OutPut=Test_Print(T,ChkTab,Cwi)
%%%%%%%%%%%%%%%%%%%%%ע��%%%%%%%%%%%%%%%%%%%%%
%'%6.2f %12.8f\r\n'���Ǹ����������ʽ���磺%6.2f��ʾ���۽���ж���λ�����
%                  �������ռ�����Ʊ����������λ�ã��������ÿո���������
%                  �������ұ�����λС��λ��ͬ��%12.8fռʮ����λ�ã���λС��
% \n �ǻ��У�Ӣ����New line����ʾʹ��굽����
% \r �ǻس���Ӣ����Carriage return����ʾʹ�������һ��
% \t tab�� ����
% rmdir('Data');  %ɾ��Data�ļ���
% delete J:/integrated scheduling optimization of YC and YT based on GA/Data
% mkdir('Data');  %����Data�ļ���
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
OutPut=1;
DataFile=['Data\',num2str(T),'.txt'];   %λ����J���ļ���ΪT.txt
dlmwrite(DataFile,T,'delimiter','\t');
dlmwrite(DataFile,Cwi,'-append','delimiter','\t');
dlmwrite(DataFile,'      QCJinDu','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(1).Progrs,'-append','delimiter','\t');
dlmwrite(DataFile,'      YCJinDu','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(2).Progrs,'-append','delimiter','\t');
dlmwrite(DataFile,'      QCState','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(1).State,'-append','delimiter','\t');
dlmwrite(DataFile,'      YCState','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(2).State,'-append','delimiter','\t');
dlmwrite(DataFile,'      YTState','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(3).State,'-append','delimiter','\t');
dlmwrite(DataFile,'      QCWeiZhi','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(1).Positn,'-append','delimiter','\t');
dlmwrite(DataFile,'      YCWeiZhi','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(2).Positn,'-append','delimiter','\t');
dlmwrite(DataFile,'      QCYCBangDing','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(1).EqpBod{1,1},'-append','delimiter','\t');
dlmwrite(DataFile,'      QCYTBangDing','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(1).EqpBod{1,2},'-append','delimiter','\t');
dlmwrite(DataFile,'      YCYTBangDing','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(2).EqpBod,'-append','delimiter','\t');
dlmwrite(DataFile,'      YTYCQCBangDing','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(3).EqpBod,'-append','delimiter','\t');
dlmwrite(DataFile,'      YCXuQiu','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(1).EqpNeed,'-append','delimiter','\t');
dlmwrite(DataFile,'      YTXuQiu','-append','delimiter','\t');
dlmwrite(DataFile,ChkTab(2).EqpNeed,'-append','delimiter','\t');