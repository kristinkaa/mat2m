function integration_spec

foo = 1.50;
bar = {'foo', 10, 'baz'};

% Save and convert variables
save('tmp.mat');
mat2m('tmp.mat', 'tmp2.m');

% Clear workspace and re-load file
clear foo bar
run('./tmp2.m');

% Assert that the values have not changed
expect(exist('foo', 'var'));
expect(foo == 1.5);
expect(exist('bar', 'var'));
expect(iscell(bar));
expect(strcmp(bar{1}, 'foo'));
expect(bar{2} == 10);
