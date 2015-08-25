function edi_spec

load([projectpath '/spec/fixtures/TESTFILE_MAT.mat']);

Cruise.Getriebeuebersetzungen.Comment = [];
Cruise.ThetaRaeder.Comment = [];
Cruise.KL_GANGMXSTEIG_SPA.Comment = [];
Cruise.KL_GANGMXSTEIG_SPA.vComment = [];

save([projectpath '/spec/fixtures/cruise.mat'], 'Cruise');

% Convert *.mat file
mat2m([projectpath '/spec/fixtures/cruise.mat'], ...
  [projectpath '/tmp/cruise.m']);
