function result=Fun_InsertLane(object,pos,num)
tempbox=zeros(size(object,1),size(object,2)+num);
if pos==0             %������ڵ�һ�в���
   tempbox(:,num+1:size(object,2)+num)=object;
elseif pos==size(object,2)  %����������һ�в���
   tempbox(:,1:size(object,2))=object;
else                 %��������м����
   tempbox(:,1:pos)=object(:,1:pos);
   tempbox(:,pos+num+1:size(object,2)+num)=object(:,pos+1:size(object,2));
end
result=tempbox;