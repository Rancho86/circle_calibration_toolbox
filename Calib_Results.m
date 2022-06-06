% Intrinsic and Extrinsic Camera Parameters
%
% This script file can be directly executed under Matlab to recover the camera intrinsic and extrinsic parameters.
% IMPORTANT: This file contains neither the structure of the calibration objects nor the image coordinates of the calibration points.
%            All those complementary variables are saved in the complete matlab data file Calib_Results.mat.
% For more information regarding the calibration model visit http://www.vision.caltech.edu/bouguetj/calib_doc/


%-- Focal length:
fc = [ 659.609257145533430 ; 665.971551294229580 ];

%-- Principal point:
cc = [ 279.309577963322060 ; 233.650825663860390 ];

%-- Skew coefficient:
alpha_c = 0.000000000000000;

%-- Distortion coefficients:
kc = [ 0.496172270113204 ; -9.429586198249917 ; 0.014123773905540 ; 0.026184780584744 ; 0.000000000000000 ];

%-- Focal length uncertainty:
fc_error = [ 326.717310309153730 ; 329.093440248763220 ];

%-- Principal point uncertainty:
cc_error = [ 29.817642556496487 ; 41.911876039820449 ];

%-- Skew coefficient uncertainty:
alpha_c_error = 0.000000000000000;

%-- Distortion coefficients uncertainty:
kc_error = [ 0.712413642626604 ; 31.598903703711770 ; 0.022930999519335 ; 0.029422730308927 ; 0.000000000000000 ];

%-- Image size:
nx = 512;
ny = 424;


%-- Various other variables (may be ignored if you do not use the Matlab Calibration Toolbox):
%-- Those variables are used to control which intrinsic parameters should be optimized

n_ima = 20;						% Number of calibration images
est_fc = [ 1 ; 1 ];					% Estimation indicator of the two focal variables
est_aspect_ratio = 1;				% Estimation indicator of the aspect ratio fc(2)/fc(1)
center_optim = 1;					% Estimation indicator of the principal point
est_alpha = 0;						% Estimation indicator of the skew coefficient
est_dist = [ 1 ; 1 ; 1 ; 1 ; 0 ];	% Estimation indicator of the distortion coefficients


%-- Extrinsic parameters:
%-- The rotation (omc_kk) and the translation (Tc_kk) vectors for every calibration image and their uncertainties

%-- Image #1:
omc_1 = [ 1.847630e+00 ; 2.413076e+00 ; -1.530802e-01 ];
Tc_1  = [ -6.650316e+01 ; -1.633224e+02 ; 1.212274e+03 ];
omc_error_1 = [ 3.501403e-02 ; 5.253628e-02 ; 9.387654e-02 ];
Tc_error_1  = [ 5.460199e+01 ; 7.561588e+01 ; 5.937095e+02 ];

%-- Image #2:
omc_2 = [ 1.405532e+00 ; 2.712960e+00 ; -1.288728e-01 ];
Tc_2  = [ -5.812888e+00 ; -1.722895e+02 ; 1.208315e+03 ];
omc_error_2 = [ 2.528642e-02 ; 5.410568e-02 ; 1.014147e-01 ];
Tc_error_2  = [ 5.439761e+01 ; 7.514629e+01 ; 5.934655e+02 ];

%-- Image #3:
omc_3 = [ 1.989442e+00 ; 2.255560e+00 ; -3.168112e-02 ];
Tc_3  = [ -2.498381e+01 ; -1.307770e+02 ; 1.192603e+03 ];
omc_error_3 = [ 4.116852e-02 ; 4.851150e-02 ; 8.277978e-02 ];
Tc_error_3  = [ 5.376611e+01 ; 7.448757e+01 ; 5.885427e+02 ];

%-- Image #4:
omc_4 = [ 2.280439e+00 ; 2.027773e+00 ; -6.149891e-02 ];
Tc_4  = [ -2.942963e+01 ; -8.314458e+01 ; 1.197547e+03 ];
omc_error_4 = [ 5.032413e-02 ; 4.527012e-02 ; 1.095696e-01 ];
Tc_error_4  = [ 5.403114e+01 ; 7.500166e+01 ; 5.906429e+02 ];

%-- Image #5:
omc_5 = [ 2.143117e+00 ; 2.100176e+00 ; -7.177007e-02 ];
Tc_5  = [ -2.410767e+01 ; -9.630577e+01 ; 1.190849e+03 ];
omc_error_5 = [ 4.706512e-02 ; 4.898294e-02 ; 8.524586e-02 ];
Tc_error_5  = [ 5.374585e+01 ; 7.451418e+01 ; 5.854701e+02 ];

%-- Image #6:
omc_6 = [ 1.835151e+00 ; 2.392401e+00 ; -1.308567e-01 ];
Tc_6  = [ -3.017955e+01 ; -1.498240e+02 ; 1.199722e+03 ];
omc_error_6 = [ 3.645599e-02 ; 5.308745e-02 ; 8.827295e-02 ];
Tc_error_6  = [ 5.407234e+01 ; 7.478842e+01 ; 5.881327e+02 ];

%-- Image #7:
omc_7 = [ 1.980538e+00 ; 2.306714e+00 ; -8.108969e-02 ];
Tc_7  = [ -8.775605e+01 ; -1.573914e+02 ; 1.202623e+03 ];
omc_error_7 = [ 3.988688e-02 ; 5.162694e-02 ; 9.654152e-02 ];
Tc_error_7  = [ 5.422849e+01 ; 7.505371e+01 ; 5.915739e+02 ];

%-- Image #8:
omc_8 = [ 1.885647e+00 ; 2.370523e+00 ; -1.211091e-01 ];
Tc_8  = [ -7.263046e+01 ; -1.864106e+02 ; 1.207787e+03 ];
omc_error_8 = [ 3.706506e-02 ; 5.382166e-02 ; 9.272682e-02 ];
Tc_error_8  = [ 5.448870e+01 ; 7.523476e+01 ; 5.920635e+02 ];

%-- Image #9:
omc_9 = [ 1.855381e+00 ; 2.451453e+00 ; -1.221945e-01 ];
Tc_9  = [ -3.903352e+01 ; -1.642235e+02 ; 1.205396e+03 ];
omc_error_9 = [ 3.694163e-02 ; 5.311091e-02 ; 1.094316e-01 ];
Tc_error_9  = [ 5.429198e+01 ; 7.514520e+01 ; 5.917480e+02 ];

%-- Image #10:
omc_10 = [ 1.862187e+00 ; 2.439308e+00 ; -8.177022e-02 ];
Tc_10  = [ -4.176023e+01 ; -1.681216e+02 ; 1.200755e+03 ];
omc_error_10 = [ 3.682851e-02 ; 5.230768e-02 ; 1.076151e-01 ];
Tc_error_10  = [ 5.412050e+01 ; 7.482961e+01 ; 5.910900e+02 ];

%-- Image #11:
omc_11 = [ 1.550294e+00 ; 2.639306e+00 ; -1.102986e-01 ];
Tc_11  = [ -3.875124e+00 ; -2.013229e+02 ; 1.213569e+03 ];
omc_error_11 = [ 2.851827e-02 ; 5.488593e-02 ; 1.039363e-01 ];
Tc_error_11  = [ 5.469863e+01 ; 7.540272e+01 ; 5.960234e+02 ];

%-- Image #12:
omc_12 = [ 2.015217e+00 ; 2.276691e+00 ; -8.588242e-02 ];
Tc_12  = [ -6.036358e+01 ; -1.761065e+02 ; 1.207855e+03 ];
omc_error_12 = [ 4.052542e-02 ; 5.108548e-02 ; 9.684536e-02 ];
Tc_error_12  = [ 5.447942e+01 ; 7.528481e+01 ; 5.935823e+02 ];

%-- Image #13:
omc_13 = [ 1.845752e+00 ; 2.417301e+00 ; -1.384505e-01 ];
Tc_13  = [ -2.968247e+01 ; -1.859768e+02 ; 1.205008e+03 ];
omc_error_13 = [ 3.599264e-02 ; 5.385152e-02 ; 9.814289e-02 ];
Tc_error_13  = [ 5.432514e+01 ; 7.501970e+01 ; 5.901492e+02 ];

%-- Image #14:
omc_14 = [ 1.558600e+00 ; 2.622360e+00 ; -1.019523e-01 ];
Tc_14  = [ 5.975727e+00 ; -2.024575e+02 ; 1.211634e+03 ];
omc_error_14 = [ 2.919624e-02 ; 5.514118e-02 ; 1.005267e-01 ];
Tc_error_14  = [ 5.461398e+01 ; 7.526150e+01 ; 5.952691e+02 ];

%-- Image #15:
omc_15 = [ 1.862087e+00 ; 2.435653e+00 ; -1.097398e-01 ];
Tc_15  = [ -4.082677e+01 ; -1.614931e+02 ; 1.205584e+03 ];
omc_error_15 = [ 3.688169e-02 ; 5.249127e-02 ; 1.062859e-01 ];
Tc_error_15  = [ 5.431491e+01 ; 7.514877e+01 ; 5.924292e+02 ];

%-- Image #16:
omc_16 = [ 1.958765e+00 ; 2.252368e+00 ; -1.293239e-01 ];
Tc_16  = [ -7.919957e+01 ; -1.620581e+02 ; 1.198377e+03 ];
omc_error_16 = [ 4.042038e-02 ; 5.291296e-02 ; 7.971005e-02 ];
Tc_error_16  = [ 5.405370e+01 ; 7.475419e+01 ; 5.873282e+02 ];

%-- Image #17:
omc_17 = [ 1.987380e+00 ; 2.263298e+00 ; -5.413397e-02 ];
Tc_17  = [ -5.059496e+01 ; -1.420693e+02 ; 1.198600e+03 ];
omc_error_17 = [ 4.040289e-02 ; 4.922728e-02 ; 8.578248e-02 ];
Tc_error_17  = [ 5.404315e+01 ; 7.482202e+01 ; 5.908082e+02 ];

%-- Image #18:
omc_18 = [ 2.146297e+00 ; 2.110084e+00 ; -1.264822e-01 ];
Tc_18  = [ -1.840374e+01 ; -1.332921e+02 ; 1.203735e+03 ];
omc_error_18 = [ 4.790674e-02 ; 5.217503e-02 ; 9.106900e-02 ];
Tc_error_18  = [ 5.430445e+01 ; 7.521154e+01 ; 5.887781e+02 ];

%-- Image #19:
omc_19 = [ 2.139862e+00 ; 2.122354e+00 ; -5.543054e-02 ];
Tc_19  = [ -4.442436e+01 ; -1.495499e+02 ; 1.197874e+03 ];
omc_error_19 = [ 4.484531e-02 ; 4.789281e-02 ; 8.698128e-02 ];
Tc_error_19  = [ 5.403087e+01 ; 7.475528e+01 ; 5.899158e+02 ];

%-- Image #20:
omc_20 = [ 2.264209e+00 ; 2.001727e+00 ; -7.800300e-02 ];
Tc_20  = [ -7.332495e+01 ; -1.397555e+02 ; 1.206358e+03 ];
omc_error_20 = [ 4.773566e-02 ; 4.651475e-02 ; 8.952899e-02 ];
Tc_error_20  = [ 5.441811e+01 ; 7.538837e+01 ; 5.931452e+02 ];

