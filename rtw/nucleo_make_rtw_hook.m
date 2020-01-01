function nucleo_make_rtw_hook(hookMethod,modelName,rtwroot,templateMakefile,buildOpts,buildArgs) %#ok

% nucleo_make_rtw_hook to supports build process.


% ERT_MAKE_RTW_HOOK - This is the standard ERT hook file for the RTW build
% process (make_rtw), and implements automatic configuration of the
% models configuration parameters.  When the buildArgs option is specified
% as 'optimized_fixed_point=1' or 'optimized_floating_point=1', the model
% is configured automatically for optimized code generation.
%
% This hook file (i.e., file that implements various RTW callbacks) is
% called by RTW for system target file ert.tlc.  The file leverages
% strategic points of the RTW process.  A brief synopsis of the callback
% API is as follows:
%
% ert_make_rtw_hook(hookMethod, modelName, rtwroot, templateMakefile,
%                   buildOpts, buildArgs)
%
% hookMethod:
%   Specifies the stage of the RTW build process.  Possible values are
%   entry, before_tlc, after_tlc, before_make, after_make and exit, etc.
%
% modelName:
%   Name of model.  Valid for all stages.
%
% rtwroot:
%   Reserved.
%
% templateMakefile:
%   Name of template makefile.  Valid for stages 'before_make' and 'exit'.
%
% buildOpts:
%   Valid for stages 'before_make' and 'exit', a MATLAB structure
%   containing fields
%
%   modules:
%     Char array specifying list of generated C files: model.c, model_data.c,
%     etc.
%
%   codeFormat:
%     Char array containing code format: 'RealTime', 'RealTimeMalloc',
%     'Embedded-C', and 'S-Function'
%
%   noninlinedSFcns:
%     Cell array specifying list of non-inlined S-Functions.
%
% buildArgs:
%   Char array containing the argument to make_rtw.  When pressing the build
%   button through the Configuration Parameter Dialog, buildArgs is taken
%   verbatim from whatever follows make_rtw in the make command edit field.
%   From MATLAB, it's whatever is passed into make_rtw.  For example, its
%   'optimized_fixed_point=1' for make_rtw('optimized_fixed_point=1').
%
%   This file implements these buildArgs:
%     optimized_fixed_point=1
%     optimized_floating_point=1
%
% You are encouraged to add other configuration options, and extend the
% various callbacks to fully integrate ERT into your environment.

% Copyright 1996-2018 The MathWorks, Inc.

fprintf('\n### CHARLES TEST: Real-Time Workshop build procedure for method: ''\n');
fprintf('### hookMethod      : ''%s''\n',hookMethod);
fprintf('### modelName       : ''%s''\n',modelName);
%fprintf('### rtwroot         : ''%s''\n',rtwroot);
%fprintf('### templateMakefile: ''%s''\n',templateMakefile);
%fprintf('### buildOpts       : ''%s''\n',buildOpts);
%fprintf('### buildArgs       : ''%s''\n',buildArgs);

switch hookMethod

    case 'error'
        %%
        fprintf('\n### Real-Time Workshop build procedure for model: ''%s'' aborted due to an error.\n',modelName);

    case 'entry'
        %% Called at start of code generation process (before anything happens.)
        fprintf('\n### Starting Real-Time Workshop build procedure for model: ''%s''\n',modelName);

    case 'before_tlc'
        %% Called just prior to invoking TLC Compiler (actual code generation.)
        fprintf('\n### Build procedure: BEFORE TLC.\n');
        
    case 'after_tlc'
        %% Called just after to invoking TLC Compiler (actual code generation.)
        fprintf('\n### Build procedure: AFTER TLC.\n');

    case 'before_makefilebuilder_make'
        %% Called after code generation is complete for PIL processing
        fprintf('\n### Build procedure: BEFORE MAKEFILE BUILDER.\n');
        
    case 'before_make'
        %% Called after code generation is complete, and just prior to kicking
        % off make process (assuming code generation only is not selected.)
    fprintf('\n### Build procedure: BEFORE MAKEFILE.\n');

    case 'after_make'
        %%
        fprintf('\n### Build procedure: AFTER MAKEFILE.\n');
        
    case 'exit'
        %%
        fprintf('### Successful completion of Real-Time Workshop build procedure for model: ''%s''\n',modelName);

end

end