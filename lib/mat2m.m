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

  % Remove non-ascii chars from strings in inputs
  for vidx = 1:length(varlist)
    assign_var(varlist{vidx}, remove_nonascii(eval(varlist{vidx})));
  end

  Simulink.saveVars(mfilename, varlist{:}, ...
    '-create', ...
    '-maxlevels', 100, ...
    '-maxnumel', 10000);

end

function assign_var(varname, value)
  assignin('caller', varname, value);
end

function output = remove_nonascii(input)
  output = input;
  if isstruct(output)
    fnames = fieldnames(output);
    for fidx = 1:length(fnames)
      output.(fnames{fidx}) = remove_nonascii(output.(fnames{fidx}));
    end
  elseif iscell(output)
    for cidx = 1:length(output)
      output{cidx} = remove_nonascii(output{cidx});
    end
  elseif isstr(output)
    output = strrep(output, 'ä', 'ae');
    output = strrep(output, 'ö', 'oe');
    output = strrep(output, 'ü', 'ue');
    output = strrep(output, 'Ä', 'Ae');
    output = strrep(output, 'Ö', 'Oe');
    output = strrep(output, 'Ü', 'Ue');
    output = strrep(output, 'ß', 'ss');
    output = strrep(output, '²', '^2');
    output = strrep(output, '³', '^3');
    output = regexprep(output,'[^a-zA-Z /\-_0-9&^\\$]','');
  end
end
