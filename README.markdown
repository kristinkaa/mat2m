# Matlab \*.mat to \*.m Conversion

`mat2m` is a Matlab data format conversion tool to generate `*.m` files from
`*.mat` files.

## Installation

Simply copy the `mat2m.m` under `./lib` to somewhere in your `path`.

## Usage

A given `*.mat` file can be converted to a corresponding `*.m` file using the
following syntax:

    >> foo.x = 10;
    >> save('tmp.mat', 'foo');
    >> mat2m('tmp.mat', 'tmp.m');
    >> type('tmp.m');

## Contributing

1. Fork it ( https://github.com/[my-github-username]/mat2dcm/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
