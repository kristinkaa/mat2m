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
