#!perl -T

use Test::More;
eval "use Test::Pod::Coverage 1.04";
plan skip_all => "Test::Pod::Coverage 1.04 required for testing POD coverage"
  if $@;
all_pod_coverage_ok(
    {
        private => [qr{^_}],
        trustme => [
            qr{^(?:a|abbr|acronym|address|area|b|base|bdo|big|blockquote|body|button)$},
            qr{^(?:caption|cite|code|col|colgroup|dd|del|div|dfn|dl|dt|em|fieldset|form)$},
            qr{^(?:frame|frameset|h1|h2|h3|h4|h5|h6|head|hr|html|i|iframe|img|ins|kbd|label)$},
            qr{^(?:legend|li|link|map|meta|noframes|noscript|object|ol|optgroup|option|p)$},
            qr{^(?:param|pre|q|samp|script|select|small|span|strong|style|sub|sup|table)$},
            qr{^(?:tbody|td|textarea|tfoot|th|thead|title|tr|tt|ul|var|br|input)$}
        ]
    }
);
