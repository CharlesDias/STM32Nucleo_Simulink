# Notes:
1. The rtwoptions(index).callback function is triggered when you:
  - Load the model.
  - Update any configuration settings in the Configuration Parameters dialog box.
  - Build the model.

2. The file nucleo_make_rtw_hook.m is caller automatically during the builder process


  rtwoptions(4).tooltip       = ['See TLC file for how to user reserved '...
    ' keyword ''hDlg'', and ''hSrc''.'];
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % NOTE: the variables "hDlg" and "hSrc" here are reserved keywords 	       %
  %       representing handles to the Simulation Parameter dialog figure and   %
  %       its source object.  Do not reference these variables  except         %
  %       when calling the dialog API functions:                               %
  %       slConfigUISetVal, slConfigUIGetVal, and slConfigUISetEnabled.        %
  %       See the MATLAB function  usertargetcallback.m for examples. You can  %
  %       also write your MATLAB code directly in one of the callback fields.  %    
  %       If you intent to modify an option outside of the host configuration  %
  %       based on the value of an option, you should do so via the            %
  %       PostApplyCallback.                                                   %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

 
  rtwgensettings.Version        = '1';
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % NOTE: Setting rtwgensettings.Version to '1' declares callback             %
  %       compatibility so the Configuration Parameters GUI will              %
  %       trigger the callbacks.  Otherwise, callback will be ignored.        %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  rtwgensettings.SelectCallback = ...
    'usertarget_selectcallback(hDlg, hSrc)';
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % NOTE: SelectCallback should be used to set up the host configuration set  %
  %       for this target.  This callback is triggered when this target is    %
  %       selected in the system target browser dialog.                       %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  rtwgensettings.ActivateCallback = ...
    'usertarget_activatecallback(model)';
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % NOTE: Variable "model" is a reserved keywords.  It is the handle of the   %
  %       host model.                                                         %
  %       Use ActivateCallback to set up options outside of the host          %
  %       configuration set of this target, e.g. other model settings,        %
  %       toolchain selection, etc.  This callback is triggered when the host %
  %       configuration set of this target becomes the active configuration   %
  %       set of its host model, e.g. when a model is loaded, when the active %
  %       configuration set of a model is changed in the model explorer, when %
  %       changes in the configuration parameters dialog are applied and      %
  %       there is a change in target selection, etc.                         %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  rtwgensettings.PostApplyCallback = ...
    'usertarget_postapplycallback(hDlg, hSrc, model)';
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % NOTE: PostApplyCallback should be used to setup options outside of the    %
  %       configuration set of this target based on changes in the host       %
  %       configuration set options.  At the time when this callback is       %
  %       triggered, UI changes are already applied to the host configuration %
  %       set and thus up-to-date.                                            %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  rtwgensettings.DerivedFrom = 'ert.tlc';
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  % NOTE: DerivedFrom declares the base target of this target. All the UI     %
  %       options and default settings are inherited.                         %
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  END_RTW_OPTIONS
 %/

