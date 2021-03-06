% Cleaned-up version of init_calib.m

fprintf(1,'\nProcessing image %d...\n',kk);

eval(['I = I_' num2str(kk) ';']);

if exist(['wintx_' num2str(kk)]),
    
    eval(['wintxkk = wintx_' num2str(kk) ';']);
    
    if ~isempty(wintxkk) & ~isnan(wintxkk),
        
        eval(['wintx = wintx_' num2str(kk) ';']);
        eval(['winty = winty_' num2str(kk) ';']);
        
    end;
end;


fprintf(1,'Using (wintx,winty)=(%d,%d) - Window size = %dx%d      (Note: To reset the window size, run script clearwin)\n',wintx,winty,2*wintx+1,2*winty+1);
%fprintf(1,'Note: To reset the window size, clear wintx and winty and run ''Extract grid corners'' again\n');

figure(2);
image(I);
colormap(map);
set(2,'color',[1 1 1]);

title(['Click on the four extreme corners of the rectangular pattern (first corner = origin)... Image ' num2str(kk)]);

disp('Click on the four extreme corners of the rectangular complete pattern (the first clicked corner is the origin)...');

x= [];y = [];
corner_x= [];corner_y = [];
figure(2); hold on;
     [corner_x,corner_y,c]=ginput(1);  %手动选取目标区域
     m(1)=corner_x;
     n(1)=corner_y;
     plot(corner_x,corner_y,'r');
     k=2;
     while(c==1)
      [x1,y1,c1]=ginput(1);
      if c1==1
      m(k)=x1;
      n(k)=y1;
      plot(corner_x,corner_y,'r');
      line([m(k-1) m(k)],[n(k-1) n(k)]);
      k=k+1;
      c=c1;
      else
         break
      end
     end
line([m(k-1) m(1)],[n(k-1) n(1)]);
drawnow;
hold off;
BW = roipoly(I,m,n);  %感兴趣区域提取的二值图像
 
obj=I;
obj(BW==0)=background_color;  %原图中显示目标区域
%亚像素圆检测
%radiusRange=[5,20];
%edgeThresh=0.6;
%Sensitivity=0.95;
%circle_type="dark";
figure(3);
imshow(obj); 
[centers,radii,metric] = imfindcircles(obj ,radiusRange,'Method','phasecode', 'ObjectPolarity',circle_type,'EdgeThreshold',edgeThresh,'Sensitivity',Sensitivity)
circlepic=viscircles(centers, radii,'Color','b');

centers1=sortrows(centers,[1,2],{'descend' 'descend'})
x = centers1(:,1);
y = centers1(:,2);
  
n_sq_v = input(['Number of circles along the v direction ([]=' num2str(n_sq_v_default) ') = ']); %6
if isempty(n_sq_v), n_sq_v = n_sq_v_default; end;
n_sq_u = input(['Number of circles along the u direction ([]=' num2str(n_sq_u_default) ') = ']); %6
if isempty(n_sq_u), n_sq_u = n_sq_u_default; end; 

sort2D=centers1
R(1,:)=x;
R(2,:)=y;
R(3,:)=1;
x_mean1=x(2)-x(1);
y_mean1=y(2)-y(1);
CHANGBIAN=sqrt(x_mean1 .^2+y_mean1 .^2);
M=[x_mean1/CHANGBIAN y_mean1/CHANGBIAN 0;
   -y_mean1/CHANGBIAN x_mean1/CHANGBIAN 0;
   0 0 1];
R1=M*R;

x_mean = mean(R1(1,:));
y_mean = mean(R1(2,:));
x_v = R1(1,:) - x_mean;
y_v = R1(2,:) - y_mean;
x_junzhi=sqrt(sum(x_v.^2))/size(centers,1);
y_junzhi=sqrt(sum(y_v.^2))/size(centers,1);
if y_mean<0
   y_v=-y_v;
end
if x_junzhi>y_junzhi
    beipaixufangxiang=x_v;
    paixuzhou=1;
else
    beipaixufangxiang=y_v;
    paixuzhou=2;
end
[xfangxiang,indx] = sort(beipaixufangxiang);
 sort3D(:,:)=sort2D(indx,:);
    for i=0:n_sq_u-1,
    sort4D=sort3D(i*n_sq_v+1:i*n_sq_v+n_sq_v,:);
    [yfangxiang,indy] = sort(sort4D(:,paixuzhou));
    sort5D(i*n_sq_v+1:i*n_sq_v+n_sq_v,:)=sort4D(indy,:);
    end
% sort5D(:,1)=x
% sort5D(:,2)=y
x=sort5D(:,1)
y=sort5D(:,2)
 figure(2);
 image(I); 
 hold on
 plot(sort5D(1,1),sort5D(1,2),'go');
 plot(sort5D(:,1),sort5D(:,2));
 hold off;
% 
% 
% % Sort the corners:
% x_mean = mean(x);
% y_mean = mean(y);
% x_v = x - x_mean;
% y_v = y - y_mean;
% 
% theta = atan2(-y_v,x_v);
% [junk,ind] = sort(theta);
% 
% [junk,ind] = sort(mod(theta-theta(1),2*pi));
% 
% %ind = ind([2 3 4 1]);
% 
% ind = ind([4 3 2 1]); %-> New: the Z axis is pointing uppward
% 
% x = x(ind);
% y = y(ind);
% x1= x(1); x2 = x(2); x3 = x(3); x4 = x(4);
% y1= y(1); y2 = y(2); y3 = y(3); y4 = y(4);
% 
% 
% % Find center:
% p_center = cross(cross([x1;y1;1],[x3;y3;1]),cross([x2;y2;1],[x4;y4;1]));
% x5 = p_center(1)/p_center(3);
% y5 = p_center(2)/p_center(3);
% 
% % center on the X axis:
% x6 = (x3 + x4)/2;
% y6 = (y3 + y4)/2;
% 
% % center on the Y axis:
% x7 = (x1 + x4)/2;
% y7 = (y1 + y4)/2;
% 
% % Direction of displacement for the X axis:
% vX = [x6-x5;y6-y5];
% vX = vX / norm(vX);
% 
% % Direction of displacement for the X axis:
% vY = [x7-x5;y7-y5];
% vY = vY / norm(vY);
% 
% % Direction of diagonal:
% vO = [x4 - x5; y4 - y5];
% vO = vO / norm(vO);
% 
% delta = 30;
% 
% 
% figure(2); 
% image(I);
% colormap(map);
% hold on;
% plot([x;x(1)],[y;y(1)],'g-');
% plot(x,y,'og');
% hx=text(x6 + delta * vX(1) ,y6 + delta*vX(2),'X');
% set(hx,'color','g','Fontsize',14);
% hy=text(x7 + delta*vY(1), y7 + delta*vY(2),'Y');
% set(hy,'color','g','Fontsize',14);
% hO=text(x4 + delta * vO(1) ,y4 + delta*vO(2),'O','color','g','Fontsize',14);
% hold off;



   

n_sq_v_default = n_sq_v;
n_sq_u_default = n_sq_u;


if (exist('dX')~=1)|(exist('dY')~=1), % This question is now asked only once
    % Enter the size of each square
    
    dX = input(['Size dX of each square along the X direction ([]=' num2str(dX_default) 'mm) = ']);
    dY = input(['Size dY of each square along the Y direction ([]=' num2str(dY_default) 'mm) = ']);
    if isempty(dX), dX = dX_default; else dX_default = dX; end;
    if isempty(dY), dY = dY_default; else dY_default = dY; end;
    
else
    
    fprintf(1,['Size of each square along the X direction: dX=' num2str(dX) 'mm\n']);
    fprintf(1,['Size of each square along the Y direction: dY=' num2str(dY) 'mm   (Note: To reset the size of the squares, clear the variables dX and dY)\n']);
    %fprintf(1,'Note: To reset the size of the squares, clear the variables dX and dY\n');
    
end;



% Compute the inside points through computation of the planar homography (collineation)

a00 = [x(1);y(1);1];
a10 = [x(2);y(2);1];
a11 = [x(3);y(3);1];
a01 = [x(4);y(4);1];


% Compute the planar collineation: (return the normalization matrix as well)

[Homo,Hnorm,inv_Hnorm] = compute_homography([a00 a10 a11 a01],[0 1 1 0;0 0 1 1;1 1 1 1]);


% Build the grid using the planar collineation:

x_l = ((0:n_sq_v-1)'*ones(1,n_sq_u))/n_sq_v;
y_l = (ones(n_sq_v,1)*(0:n_sq_u-1))/n_sq_u;
pts = [x_l(:) y_l(:) ones((n_sq_v)*(n_sq_u),1)]';

XX = Homo*pts;
XX = XX(1:2,:) ./ (ones(2,1)*XX(3,:));


% Complete size of the rectangle

W = n_sq_v*dX;
L = n_sq_u*dY;



XX = sort5D'

figure(2);
hold on;
plot(XX(1,:),XX(2,:),'r+');
title('The red crosses should be close to the image corners');
hold off;

disp('If the guessed grid corners (red crosses on the image) are not close to the actual corners,');
disp('it is necessary to enter an initial guess for the radial distortion factor kc (useful for subpixel detection)');
quest_distort = input('Need of an initial guess for distortion? ([]=no, other=yes) ');

quest_distort = ~isempty(quest_distort);

if quest_distort,
    % Estimation of focal length:
    c_g = [size(I,2);size(I,1)]/2 + .5;
    f_g = Distor2Calib(0,[[x(1) x(2) x(4) x(3)] - c_g(1);[y(1) y(2) y(4) y(3)] - c_g(2)],1,1,4,W,L,[-W/2 W/2 W/2 -W/2;L/2 L/2 -L/2 -L/2; 0 0 0 0],100,1,1);
    f_g = mean(f_g);
    script_fit_distortion;
end;
%%%%%%%%%%%%%%%%%%%%% END ADDITIONAL STUFF IN THE CASE OF HIGHLY DISTORTED IMAGES %%%%%%%%%%%%%





Np = (n_sq_v)*(n_sq_u);

disp('Corner extraction...');

grid_pts = XX


%save all_corners x y grid_pts

grid_pts = grid_pts - 1; % subtract 1 to bring the origin to (0,0) instead of (1,1) in matlab (not necessary in C)



ind_corners = [1 n_sq_v (n_sq_v)*n_sq_u (n_sq_v)*(n_sq_u)]; % index of the 4 corners
ind_orig = (n_sq_v)*(n_sq_u-1) + 1;
xorig = grid_pts(1,ind_orig);
yorig = grid_pts(2,ind_orig);
dxpos = mean([grid_pts(:,ind_orig) grid_pts(:,ind_orig+1)]');
dypos = mean([grid_pts(:,ind_orig) grid_pts(:,ind_orig-n_sq_v-1)]');


x_box_kk = [grid_pts(1,:)-(wintx+.5);grid_pts(1,:)+(wintx+.5);grid_pts(1,:)+(wintx+.5);grid_pts(1,:)-(wintx+.5);grid_pts(1,:)-(wintx+.5)];
y_box_kk = [grid_pts(2,:)-(winty+.5);grid_pts(2,:)-(winty+.5);grid_pts(2,:)+(winty+.5);grid_pts(2,:)+(winty+.5);grid_pts(2,:)-(winty+.5)];

figure(3);
image(I); colormap(map); hold on;
plot(grid_pts(1,1)+1,grid_pts(2,1)+1,'go');
%plot(grid_pts(1,:)+1,grid_pts(2,:)+1,'r+');
plot(grid_pts(1,:)+1,grid_pts(2,:)+1);
%plot(x_box_kk+1,y_box_kk+1,'-b');
%plot(grid_pts(1,ind_corners)+1,grid_pts(2,ind_corners)+1,'mo');
%plot(xorig+1,yorig+1,'*m');

xlabel('Xc (in camera frame)');
ylabel('Yc (in camera frame)');
title('Extracted corners');
zoom on;
drawnow;
hold off;

Xi = reshape(([0:n_sq_v-1]*dX)'*ones(1,n_sq_u),Np,1)';
Yi = reshape(ones(n_sq_v,1)*[0:n_sq_u-1]*dY,Np,1)';
Zi = zeros(1,Np);

Xgrid = [Xi;Yi;Zi];


% All the point coordinates (on the image, and in 3D) - for global optimization:

x = grid_pts;
X = Xgrid;


% Saves all the data into variables:

eval(['dX_' num2str(kk) ' = dX;']);
eval(['dY_' num2str(kk) ' = dY;']);  

eval(['wintx_' num2str(kk) ' = wintx;']);
eval(['winty_' num2str(kk) ' = winty;']);

eval(['x_' num2str(kk) ' = x;']);
eval(['X_' num2str(kk) ' = X;']);

eval(['n_sq_v_' num2str(kk) ' = n_sq_v;']);
eval(['n_sq_u_' num2str(kk) ' = n_sq_u;']);
