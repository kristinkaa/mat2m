function edi_spec

% Convert *.mat file
mat2m([projectpath '/spec/fixtures/TESTFILE_MAT.mat'], ...
  [projectpath '/tmp/TESTFILE_M.m']);

% Load the resulting *.m file
run([projectpath '/tmp/TESTFILE_M.m']);

expect(exist('Cruise', 'var'));
expect(exist('ECU', 'var'));
expect(exist('Settings', 'var'));

expect(isstruct(Cruise));
expect(isstruct(ECU));
expect(isstruct(Settings));
