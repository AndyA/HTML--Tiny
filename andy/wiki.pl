#!/usr/bin/perl
#
#  wiki
#
#  Created by Andy Armstrong on 2008-06-04.
#  Copyright (c) 2008 Hexten. All rights reserved.

use strict;
use warnings;
use HTML::Tiny;

$| = 1;

my $h = HTML::Tiny->new;

print "<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 "
  . "Transitional//EN\" "
  . "\"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitio "
  . "nal.dtd\">";

print $h->html(
    {
        "xmlns"    => "http://www.w3.org/1999/xhtml",
        "lang"     => "en",
        "xml:lang" => "en",
        "dir"      => "ltr"
    },
    [
        $h->head(
            [
                $h->meta(
                    {
                        "http-equiv" => "Content-Type",
                        "content"    => "text/html; charset=UTF-8"
                    },
                    { "name" => "keywords", "content" => "TET" }
                ),
                $h->link(
                    { "rel" => "shortcut icon", "href" => "/favicon.ico" },
                    {
                        "rel"   => "search",
                        "href"  => "/wiki/opensearch_desc.php",
                        "type"  => "application/opensearchdescription+xml",
                        "title" => "Hexten (English)"
                    },
                    {
                        "rel" => "meta",
                        "href" =>
                          "/wiki/index.php?title=TET&action=creativecommons",
                        "title" => "Creative Commons",
                        "type"  => "application/rdf+xml"
                    },
                    {
                        "rel"  => "copyright",
                        "href" => "http://www.gnu.org/copyleft/fdl.html"
                    }
                ),
                $h->title( "TET - Hexten" ),
                $h->style(
                    { "media" => "screen,projection", "type" => "text/css" },
                    "/*<![CDATA[*/ \@import "
                      . "\"/wiki/skins/monobook/main.css?42b\"; /*]]>*/"
                ),
                $h->link(
                    {
                        "rel"   => "stylesheet",
                        "media" => "print",
                        "href"  => "/wiki/skins/common/commonPrint.css?42b",
                        "type"  => "text/css"
                    },
                    {
                        "rel"   => "stylesheet",
                        "media" => "handheld",
                        "href"  => "/wiki/skins/monobook/handheld.css?42b",
                        "type"  => "text/css"
                    }
                ),
                "<!--[if lt IE 5.5000]><style "
                  . "type=\"text/css\">\@import "
                  . "\"/wiki/skins/monobook/IE50Fixes.css?42b\";</style> "
                  . "<![endif]-->",
                "<!--[if IE 5.5000]><style type=\"text/css\">\@import "
                  . "\"/wiki/skins/monobook/IE55Fixes.css?42b\";</style> "
                  . "<![endif]-->",
                "<!--[if IE 6]><style type=\"text/css\">\@import "
                  . "\"/wiki/skins/monobook/IE60Fixes.css?42b\";</style> "
                  . "<![endif]-->",
                "<!--[if IE 7]><style type=\"text/css\">\@import "
                  . "\"/wiki/skins/monobook/IE70Fixes.css?42b\";</style> "
                  . "<![endif]-->",
                "<!--[if lt IE 7]><script type=\"text/javascript\" "
                  . "src=\"/wiki/skins/common/IEFixes.js?42b\"></script> "
                  . "<meta http-equiv=\"imagetoolbar\" content=\"no\" "
                  . "/><![endif]-->",
                $h->script(
                    { "type" => "text/javascript" },
                    "/*<![CDATA[*/ var skin = \"monobook\"; var "
                      . "stylepath = \"/wiki/skins\"; var wgArticlePath = "
                      . "\"/wiki/index.php/\$1\"; var wgScriptPath = \"/wiki\"; "
                      . "var wgServer = \"http://hexten.net\"; var "
                      . "wgCanonicalNamespace = \"\"; var "
                      . "wgCanonicalSpecialPageName = false; var "
                      . "wgNamespaceNumber = 0; var wgPageName = \"TET\"; "
                      . "var wgTitle = \"TET\"; var wgArticleId = \"97\"; var "
                      . "wgIsArticle = true; var wgUserName = "
                      . "\"AndyArmstrong\"; var wgUserLanguage = \"en\"; var "
                      . "wgContentLanguage = \"en\"; var wgBreakFrames = "
                      . "false; var wgCurRevisionId = \"514\"; /*]]>*/",
                    {
                        "src"  => "/wiki/skins/common/wikibits.js?42b",
                        "type" => "text/javascript"
                    },
                    "<!-- wikibits js -->",
                    {
                        "src" =>
                          "/wiki/index.php?title=-&action=raw&smaxage=0&gen=js",
                        "type" => "text/javascript"
                    },
                    "<!-- site js -->"
                ),
                $h->style(
                    { "type" => "text/css" },
                    "/*<![CDATA[*/ \@import "
                      . "\"/wiki/index.php?title=MediaWiki:Common.css&usems "
                      . "gcache=yes&action=raw&ctype=text/css&smaxage=1800 "
                      . "0\"; \@import "
                      . "\"/wiki/index.php?title=MediaWiki:Monobook.css&use "
                      . "msgcache=yes&action=raw&ctype=text/css&smaxage=18 "
                      . "000\"; \@import "
                      . "\"/wiki/index.php?title=-&action=raw&gen=css&maxag "
                      . "e=18000&smaxage=0\"; /*]]>*/"
                ),
                "<!-- Head Scripts -->"
            ]
        ),
        $h->body(
            {
                "onload" => "setupRightClickEdit()",
                "class"  => "mediawiki ns-0 ltr page-TET"
            },
            [
                $h->div(
                    { "id" => "globalWrapper" },
                    [
                        $h->div(
                            { "id" => "column-content" },
                            $h->div(
                                { "id" => "content" },
                                [
                                    $h->a( { "name" => "top", "id" => "top" } ),
                                    $h->h1(
                                        { "class" => "firstHeading" }, "TET"
                                    ),
                                    $h->div(
                                        { "id" => "bodyContent" },
                                        [
                                            $h->h3(
                                                { "id" => "siteSub" },
                                                "From Hexten"
                                            ),
                                            $h->div(
                                                { "id" => "contentSub" },
                                                { "id" => "jump-to-nav" },
                                                [
                                                    "Jump to: ",
                                                    $h->a(
                                                        {
                                                            "href" =>
                                                              "#column-one"
                                                        },
                                                        "navigation"
                                                    ),
                                                    ", ",
                                                    $h->a(
                                                        {
                                                            "href" =>
                                                              "#searchInput"
                                                        },
                                                        "search"
                                                    )
                                                ]
                                            ),
                                            "<!-- start content -->",
                                            $h->ul(
                                                [
                                                    $h->li(
                                                        [
                                                            $h->a(
                                                                {
                                                                    "rel" =>
                                                                      "nofollow",
                                                                    "href" =>
                                                                      "http://tetworks.opengroup.org/documents/3.3/uguide.pdf",
                                                                    "class" =>
                                                                      "external text",
                                                                    "title" =>
                                                                      "http://tetworks.opengroup.org/documents/3.3/uguide.pdf"
                                                                },
                                                                "User Guide"
                                                            ),
                                                            " (pdf) "
                                                        ],
                                                        [
                                                            $h->a(
                                                                {
                                                                    "rel" =>
                                                                      "nofollow",
                                                                    "href" =>
                                                                      "http://ftp.freestandards.org/pub/lsb/test_suites/released-3.0.0/source/runtime/tjreport-1.4.tar.gz",
                                                                    "class" =>
                                                                      "external text",
                                                                    "title" =>
                                                                      "http://ftp.freestandards.org/pub/lsb/test_suites/released-3.0.0/source/runtime/tjreport-1.4.tar.gz"
                                                                },
                                                                "tjreport"
                                                            ),
                                                            " (tar.gz) "
                                                        ]
                                                    )
                                                ]
                                            ),
                                            "<!-- Saved in parser cache with key "
                                              . "hexten-mw_:pcache:idhash:97-0!1!0!!en!2 and "
                                              . "timestamp 20080603143518 -->",
                                            $h->div(
                                                { "class" => "printfooter" },
                                                [
                                                    " Retrieved from \"",
                                                    $h->a(
                                                        {
                                                            "href" =>
                                                              "http://hexten.net/wiki/index.php/TET"
                                                        },
                                                        "http://hexten.net/wiki/index.php/TET"
                                                    ),
                                                    "\""
                                                ],
                                                { "id" => "catlinks" },
                                                $h->p(
                                                    { "class" => "catlinks" },
                                                    [
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Special:Categories",
                                                                "title" =>
                                                                  "Special:Categories"
                                                            },
                                                            "Category"
                                                        ),
                                                        ": ",
                                                        $h->span(
                                                            { "dir" => "ltr" },
                                                            $h->a(
                                                                {
                                                                    "href" =>
                                                                      "/wiki/index.php/Category:Random_Jottings",
                                                                    "title" =>
                                                                      "Category:Random Jottings"
                                                                },
                                                                "Random Jottings"
                                                            )
                                                        )
                                                    ]
                                                )
                                            ),
                                            "<!-- end content -->",
                                            $h->div(
                                                { "class" => "visualClear" }
                                            )
                                        ]
                                    )
                                ]
                            ),
                            { "id" => "column-one" },
                            [
                                $h->div(
                                    {
                                        "id"    => "p-cactions",
                                        "class" => "portlet"
                                    },
                                    [
                                        $h->h5( "Views" ),
                                        $h->div(
                                            { "class" => "pBody" },
                                            $h->ul(
                                                [
                                                    $h->li(
                                                        {
                                                            "id" =>
                                                              "ca-nstab-main",
                                                            "class" =>
                                                              "selected"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/TET"
                                                            },
                                                            "Article"
                                                        ),
                                                        {
                                                            "id" => "ca-talk",
                                                            "class" => "new"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php?title=Talk:TET&action=edit"
                                                            },
                                                            "Discussion"
                                                        ),
                                                        { "id" => "ca-edit" },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php?title=TET&action=edit"
                                                            },
                                                            "Edit"
                                                        ),
                                                        {
                                                            "id" => "ca-history"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php?title=TET&action=history"
                                                            },
                                                            "History"
                                                        ),
                                                        {
                                                            "id" => "ca-protect"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php?title=TET&action=protect"
                                                            },
                                                            "Protect"
                                                        ),
                                                        { "id" => "ca-delete" },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php?title=TET&action=delete"
                                                            },
                                                            "Delete"
                                                        ),
                                                        { "id" => "ca-move" },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Special:Movepage/TET"
                                                            },
                                                            "Move"
                                                        ),
                                                        {
                                                            "id" => "ca-unwatch"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php?title=TET&action=unwatch"
                                                            },
                                                            "Unwatch"
                                                        )
                                                    )
                                                ]
                                            )
                                        )
                                    ],
                                    {
                                        "class" => "portlet",
                                        "id"    => "p-personal"
                                    },
                                    [
                                        $h->h5( "Personal tools" ),
                                        $h->div(
                                            { "class" => "pBody" },
                                            $h->ul(
                                                [
                                                    $h->li(
                                                        {
                                                            "id" =>
                                                              "pt-userpage"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/User:AndyArmstrong"
                                                            },
                                                            "AndyArmstrong"
                                                        ),
                                                        { "id" => "pt-mytalk" },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/User_talk:AndyArmstrong"
                                                            },
                                                            "My talk"
                                                        ),
                                                        {
                                                            "id" =>
                                                              "pt-preferences"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Special:Preferences"
                                                            },
                                                            "My preferences"
                                                        ),
                                                        {
                                                            "id" =>
                                                              "pt-watchlist"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Special:Watchlist"
                                                            },
                                                            "My watchlist"
                                                        ),
                                                        {
                                                            "id" =>
                                                              "pt-mycontris"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Special:Contributions/AndyArmstrong"
                                                            },
                                                            "My contributions"
                                                        ),
                                                        { "id" => "pt-logout" },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php?title=Special:Userlogout&returnto=TET"
                                                            },
                                                            "Log out"
                                                        )
                                                    )
                                                ]
                                            )
                                        )
                                    ],
                                    { "class" => "portlet", "id" => "p-logo" },
                                    $h->a(
                                        {
                                            "href" =>
                                              "/wiki/index.php/Main_Page",
                                            "style" =>
                                              "background-image: url(/wiki/images/2/26/HextenLogo.png);",
                                            "title" => "Main Page"
                                        }
                                    )
                                ),
                                $h->script(
                                    { "type" => "text/javascript" },
                                    " if (window.isMSIE55) fixalpha(); "
                                ),
                                $h->div(
                                    {
                                        "class" => "portlet",
                                        "id"    => "p-navigation"
                                    },
                                    [
                                        $h->h5( "Navigation" ),
                                        $h->div(
                                            { "class" => "pBody" },
                                            $h->ul(
                                                [
                                                    $h->li(
                                                        {
                                                            "id" => "n-mainpage"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Main_Page"
                                                            },
                                                            "Main Page"
                                                        ),
                                                        {
                                                            "id" =>
                                                              "n-Hexten-Home"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "http://hexten.net/"
                                                            },
                                                            "Hexten Home"
                                                        ),
                                                        {
                                                            "id" =>
                                                              "n-Wiki-Widgets"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Wiki_Widgets"
                                                            },
                                                            "Wiki Widgets"
                                                        ),
                                                        {
                                                            "id" => "n-Calendar"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Calendar"
                                                            },
                                                            "Calendar"
                                                        ),
                                                        {
                                                            "id" =>
                                                              "n-Link-Dump"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Link_Dump"
                                                            },
                                                            "Link Dump"
                                                        ),
                                                        {
                                                            "id" =>
                                                              "n-recentchanges"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Special:Recentchanges"
                                                            },
                                                            "Recent changes"
                                                        ),
                                                        {
                                                            "id" =>
                                                              "n-randompage"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Special:Random"
                                                            },
                                                            "Random page"
                                                        ),
                                                        { "id" => "n-Sandbox" },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Sandbox"
                                                            },
                                                            "Sandbox"
                                                        ),
                                                        {
                                                            "id" =>
                                                              "n-sitesupport"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Hexten:Site_support"
                                                            },
                                                            "Donations"
                                                        )
                                                    )
                                                ]
                                            )
                                        )
                                    ],
                                    {
                                        "id"    => "p-search",
                                        "class" => "portlet"
                                    },
                                    [
                                        $h->h5(
                                            $h->label(
                                                { "for" => "searchInput" },
                                                "Search"
                                            )
                                        ),
                                        $h->div(
                                            {
                                                "id"    => "searchBody",
                                                "class" => "pBody"
                                            },
                                            $h->form(
                                                {
                                                    "action" =>
                                                      "/wiki/index.php/Special:Search",
                                                    "id" => "searchform"
                                                },
                                                $h->div(
                                                    [
                                                        $h->input(
                                                            {
                                                                "accesskey" =>
                                                                  "f",
                                                                "value" => "",
                                                                "name" =>
                                                                  "search",
                                                                "id" =>
                                                                  "searchInput",
                                                                "type" => "text"
                                                            },
                                                            {
                                                                "value" => "Go",
                                                                "name"  => "go",
                                                                "type" =>
                                                                  "submit",
                                                                "class" =>
                                                                  "searchButton",
                                                                "id" =>
                                                                  "searchGoButton"
                                                            }
                                                        ),
                                                        "&nbsp; ",
                                                        $h->input(
                                                            {
                                                                "value" =>
                                                                  "Search",
                                                                "name" =>
                                                                  "fulltext",
                                                                "type" =>
                                                                  "submit",
                                                                "class" =>
                                                                  "searchButton",
                                                                "id" =>
                                                                  "mw-searchButton"
                                                            }
                                                        )
                                                    ]
                                                )
                                            )
                                        )
                                    ],
                                    { "class" => "portlet", "id" => "p-tb" },
                                    [
                                        $h->h5( "Toolbox" ),
                                        $h->div(
                                            { "class" => "pBody" },
                                            $h->ul(
                                                [
                                                    $h->li(
                                                        {
                                                            "id" =>
                                                              "t-whatlinkshere"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Special:Whatlinkshere/TET"
                                                            },
                                                            "What links here"
                                                        ),
                                                        {
                                                            "id" =>
                                                              "t-recentchangeslinked"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Special:Recentchangeslinked/TET"
                                                            },
                                                            "Related changes"
                                                        ),
                                                        { "id" => "t-upload" },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Special:Upload"
                                                            },
                                                            "Upload file"
                                                        ),
                                                        {
                                                            "id" =>
                                                              "t-specialpages"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php/Special:Specialpages"
                                                            },
                                                            "Special pages"
                                                        ),
                                                        { "id" => "t-print" },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php?title=TET&printable=yes"
                                                            },
                                                            "Printable version"
                                                        ),
                                                        {
                                                            "id" =>
                                                              "t-permalink"
                                                        },
                                                        $h->a(
                                                            {
                                                                "href" =>
                                                                  "/wiki/index.php?title=TET&oldid=514"
                                                            },
                                                            "Permanent link"
                                                        )
                                                    )
                                                ]
                                            )
                                        )
                                    ]
                                )
                            ]
                        ),
                        "<!-- end of the left (by default at least) column "
                          . "-->",
                        $h->div(
                            { "class" => "visualClear" },
                            { "id"    => "footer" },
                            [
                                $h->div(
                                    { "id" => "f-poweredbyico" },
                                    $h->a(
                                        {
                                            "href" =>
                                              "http://www.mediawiki.org/"
                                        },
                                        $h->img(
                                            {
                                                "alt" => "Powered by MediaWiki",
                                                "src" =>
                                                  "/wiki/skins/common/images/poweredby_mediawiki_88x31.png"
                                            }
                                        )
                                    ),
                                    { "id" => "f-copyrightico" },
                                    $h->a(
                                        {
                                            "href" =>
                                              "http://www.gnu.org/copyleft/fdl.html"
                                        },
                                        $h->img(
                                            {
                                                "alt" =>
                                                  "GNU Free Documentation License 1.2",
                                                "src" =>
                                                  "/wiki/skins/common/images/gnu-fdl.png"
                                            }
                                        )
                                    )
                                ),
                                $h->ul(
                                    { "id" => "f-list" },
                                    [
                                        $h->li(
                                            { "id" => "lastmod" },
                                            " This page was last modified 15:34, 3 June 2008.",
                                            { "id" => "viewcount" },
                                            "This page has been accessed one time.",
                                            { "id" => "copyright" },
                                            [
                                                "Content is available under ",
                                                $h->a(
                                                    {
                                                        "rel" => "nofollow",
                                                        "href" =>
                                                          "http://www.gnu.org/copyleft/fdl.html",
                                                        "class" => "external ",
                                                        "title" =>
                                                          "http://www.gnu.org/copyleft/fdl.html"
                                                    },
                                                    "GNU Free Documentation License 1.2"
                                                ),
                                                "."
                                            ],
                                            { "id" => "privacy" },
                                            $h->a(
                                                {
                                                    "href" =>
                                                      "/wiki/index.php/Hexten:Privacy_policy",
                                                    "title" =>
                                                      "Hexten:Privacy policy"
                                                },
                                                "Privacy policy"
                                            ),
                                            { "id" => "about" },
                                            $h->a(
                                                {
                                                    "href" =>
                                                      "/wiki/index.php/Hexten:About",
                                                    "title" => "Hexten:About"
                                                },
                                                "About Hexten"
                                            ),
                                            { "id" => "disclaimer" },
                                            $h->a(
                                                {
                                                    "href" =>
                                                      "/wiki/index.php/Hexten:General_disclaimer",
                                                    "title" =>
                                                      "Hexten:General disclaimer"
                                                },
                                                "Disclaimers"
                                            )
                                        )
                                    ]
                                )
                            ]
                        ),
                        $h->script(
                            { "type" => "text/javascript" },
                            "if (window.runOnloadHook) runOnloadHook();"
                        )
                    ]
                ),
                "<!-- Served by stingray.hexten.net in 0.147 secs. " . "-->"
            ]
        )
    ]
);
