function[xc,good,bad,type]=circle_cornerfinder(xt,I,wintx,winty,wx2,wy2);
number_of_markers=20;
 object=cell(length(filename1),1);  %����Ŀ�����ݿ�
 environment=cell(length(filename1),1);  %�����������ݿ�
     image=imread(fullfile(pathname,filename1{i}));
     %a=rgb2gray(image);
     a=image;
     figure
     imshow(a);
     hold on;
     [x,y,c]=ginput(1);  %�ֶ�ѡȡĿ������
     m(1)=x;
     n(1)=y;
     plot(x,y,'r');
     k=2;
     while(c==1)
      [x1,y1,c1]=ginput(1);
      if c1==1
      m(k)=x1;
      n(k)=y1;
      plot(x,y,'r');
      line([m(k-1) m(k)],[n(k-1) n(k)]);
      k=k+1;
      c=c1;
      else
         break
      end
     end
     line([m(k-1) m(1)],[n(k-1) n(1)]);
     BW = roipoly(a,m,n);  %����Ȥ������ȡ�Ķ�ֵͼ��
 
    obj=a;
    env=a;
    obj(BW==0)=255;  %ԭͼ����ʾĿ������
    env(BW~=0)=0;  %ԭͼ����ʾ��������
    %figure
    %imshow(obj);
    %figure
    %imshow(env);
    object{i}=obj;
    environment{i}=env;
    save(strcat('object',num2str(i),'.mat'),'obj');
    save(strcat('environment',num2str(i),'.mat'),'env');
    %close all;
 
  radiusRange=[4,10];
  method=[];
  edgeThresh=0.5;
  Sensitivity=0.95;
  
[centers,radii,metric] = imfindcircles(obj ,radiusRange,'Method','phasecode', 'ObjectPolarity','dark','EdgeThreshold',edgeThresh,'Sensitivity',Sensitivity)
figure(1),imshow(obj),title('ԭͼ')  
figure(2),imshow(BW),title('��Ե')  
circlepic=viscircles(centers, radii,'Color','b');

%���  
fprintf(1,'\n---------------Բͳ��----------------\n');  
[r,c]=size(centers);%r=size(circleParaXYR,1);  
fprintf(1,'  ����%d��Բ\n',r);%Բ�ĸ���  
fprintf(1,'  Բ��     �뾶\n');%Բ�ĸ���  
for n=1:r  
fprintf(1,'%d ��%d��%d��  %d\n',n,centers(n,1),centers(n,2),radii(n));  
centers_int(n,1)=floor(centers(n,2))
centers_int(n,2)=floor(centers(n,1))
end  
pic=im2bw(image,0);
pic(:,:)=1;
n=length(centers(:,1));
% if n~=number_of_markers
%     errordlg('��⵽��marker���������ò���������minr����maxr','��������~')
% end
for s=1:n
pic(centers_int(s,1), centers_int(s,2))=0;
pic(centers_int(s,1)-1, centers_int(s,2))=0;
pic(centers_int(s,1)-2, centers_int(s,2))=0;
pic(centers_int(s,1)-3, centers_int(s,2))=0;
pic(centers_int(s,1)-4, centers_int(s,2))=0;
pic(centers_int(s,1)+1, centers_int(s,2))=0;
pic(centers_int(s,1)+2, centers_int(s,2))=0;
pic(centers_int(s,1)+3, centers_int(s,2))=0;
pic(centers_int(s,1)+4, centers_int(s,2))=0;
pic(centers_int(s,1), centers_int(s,2)-1)=0;
pic(centers_int(s,1), centers_int(s,2)-2)=0;
pic(centers_int(s,1), centers_int(s,2)-3)=0;
pic(centers_int(s,1), centers_int(s,2)-4)=0;
pic(centers_int(s,1), centers_int(s,2)+1)=0;
pic(centers_int(s,1), centers_int(s,2)+2)=0;
pic(centers_int(s,1), centers_int(s,2)+3)=0;
pic(centers_int(s,1), centers_int(s,2)+4)=0;
end
figure;
imshow(pic);
yuanxinzuobiao=centers_int(:,1:2);
[ax,ix] = sort(yuanxinzuobiao(:,2));
sort2D(:,1)=yuanxinzuobiao(ix,1);
sort2D(:,2)=yuanxinzuobiao(ix,2);
if s==110
filename1a = ['E:\��˳\�����Զ����о���\����ʦ\��е�۱궨��\�����ض�ά����\' filename{i}(1:(end-4)), '.txt'];
dlmwrite(filename1a,sort2D,'delimiter', '\t','precision','%8.4f');

adressString = ['E:\��˳\�����Զ����о���\����ʦ\��е�۱궨��\�����ش����ı궨ͼƬ\' filename{i}(1:(end-4)), '.jpg'];
imwrite(pic,adressString);
end
%  filename1 = ['C:\Users\sushun\Desktop\2018.10.15\2018-10-31�궨Kinnect\ͼ������\',filename(1:(end-4)),'.txt'];
%close all;
figure;
imshow(pic)
figure;
plot(sort2D(:,1),sort2D(:,2));
hold on
plot(sort2D(:,1),sort2D(:,2),'ro');
%clearvars -except filename filename1 pathname
%close all

 
 
