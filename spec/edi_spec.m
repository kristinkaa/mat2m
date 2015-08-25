function edi_spec

% Convert *.mat file
mat2m([projectpath '/spec/fixtures/TESTFILE_MAT.mat'], ...
  [projectpath '/tmp/TESTFILE_M.m']);
