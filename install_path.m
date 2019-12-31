function install_path()
% Set path setup for Nucleo Simulink Package
disp('##### Set path setup for Nucleo Simulink Package #####');
% Path for current folder and subfolders
tgtpath = pwd;
addpath(genpath(tgtpath));
% Remove .git folder and subfolders
rmpath(genpath(fullfile(tgtpath,'.git')));
% Save path
sl_refresh_customizations;
savepath;
disp('##### Set path setup COMPLETE #####');