%function calib_gui(mode)

% calib_gui(mode)
%
% Runs the Camera Calibration Toolbox.
% Set mode to 1 to run the memory efficient version.
% Any other value for mode will run the normal version (see documentation)
%
% INFORMATION ABOUT THE MEMORY EFFICIENT MODE FOR THE CAMERA CALIBRATION TOOLBOX:
%
% If your calibration images are large, or if you calibrate using a lot of images, you may have experienced memory problems
% in Matlab when using the calibration toolbox (OUT OF MEMORY errors). If this is the case, you can now run the
% new memory efficient version of the toolbox that loads every image one by one without storing them all in memory.
% If you choose to run the standard version of the toolbox now, you can always switch to the other memory efficient mode
% later in case the OUT OF MEMORY error message is encountered. The two modes of operation are totally compatible.

cell_list = {};

fig_number = 1;
%%
%亚像素圆阈值检测
circle_type="dark";%dark代表圆形比原始图像整体颜色更深，bright代表颜色比原始图像整体颜色更浅
if circle_type=="dark"
    background_color=255;
else
    background_color=0;
end
radiusRange=[5,20]; %待检测圆像素半径
edgeThresh=0.6;%待检测圆圆度阈值
Sensitivity=0.95;%待检圆敏感度阈值
%%
title_figure = 'Camera Calibration Toolbox - Select mode of operation:';

cell_list{1,1} = {'Standard (all the images are stored in memory)','circle_calib_gui_normal;'};
cell_list{2,1} = {'Memory efficient (the images are loaded one by one)','calib_gui_no_read;'};
cell_list{3,1} = {'Exit',['disp(''Bye. To run again, type calib_gui.''); close(' num2str(fig_number) ');']};

show_window(cell_list,fig_number,title_figure,290,18,0,'clean',12);