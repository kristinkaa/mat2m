function mat2m(matfilename, mfilename)
%FUNCTION MAT2M
% Convert a given *.mat file into a *.m file. The resulting *.m file can be
% evaluated in the workspace and should have the same effect as loading the
% *.m file.

  % Load *.mat file
  load(matfilename);

  % Compile list of variables to save
  varlist = who();
  varlist(strcmp(varlist, 'matfilename')) = [];
  varlist(strcmp(varlist, 'mfilename'))   = [];

  % Set default options
  options = struct();
  options.Verbose  = false;
  options.Encoding = 'UTF-8';

  % Remove Umlaute from strings in inputs
  for vidx = 1:length(varlist)
    assign_var(varlist{vidx}, remove_umlaute(eval(varlist{vidx})));
  end

  % Try to open connection to file
  fid = open_file_connection(mfilename, options);

  % Make sure to close file connection if an error occurs
  try
    Simulink.saveVars(mfilename, varlist{:}, '-create', '-maxlevels', 100);
  catch exception
    fclose(fid);
    rethrow(exception);
  end

  % Close file connection
  fclose(fid);

end

function fid = open_file_connection(mfilename, options)
% Establish file connection, making sure it's fresh
  if exist(mfilename, 'file'), delete(mfilename); end
  fid = fopen(mfilename, 'w+t', 'n', options.Encoding);
  if fid == -1, error('Cannot open DCM file for write access'); end
end

function assign_var(varname, value)
  assignin('caller', varname, value);
end

function output = remove_umlaute(input)
  output = input;
end
