use t::TestJSYNC tests => 3;

no_diff;

spec_file 't/jsync-yaml.tml';

filters {
    jsync => ['load_jsync', 'dump_yaml'],
};

run_is jsync => 'yaml';
