local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {

    s("doc-article", {
        t({
            "\\documentclass[12pt]{article}",
            "",
        }),
    }),

    s("pkg-geometry", {
        t({
            "\\usepackage[margin=1in]{geometry}",
            "",
        }),
    }),

    s("pkg-setspace", {
        t({
            "\\usepackage{setspace}",
            "",
        }),
    }),

    s("pkg-font", {
        t({
            "\\usepackage{lmodern}",
            "\\usepackage[T1]{fontenc}",
            "\\usepackage[utf8]{inputenc}",
            "",
        }),
    }),

    s("pkg-math", {
        t({
            "\\usepackage{amsmath}",
            "\\usepackage{amssymb}",
            "\\usepackage{amsthm}",
            "\\usepackage{mathtools}",
            "",
        }),
    }),

    s("pkg-fig", {
        t({
            "\\usepackage{graphicx}",
            "\\usepackage{float}",
            "",
        }),
    }),

    s("pkg-table", {
        t({
            "\\usepackage{booktabs}",
            "\\usepackage{caption}",
            "\\usepackage{subcaption}",
            "",
        }),
    }),

    s("pkg-list", {
        t({
            "\\usepackage{enumitem}",
            "\\usepackage{parskip}",
            "",
        }),
    }),

    s("pkg-hyperref", {
        t({
            "\\usepackage[hidelinks]{hyperref}",
            "",
        }),
    }),

    s("pkg-biblatex", {
        t({
            "\\usepackage[backend=biber, style=ieee]{biblatex}",
            "\\addbibresource{references.bib}",
            "",
        }),
    }),

    s("pkg-code", {
        t({
            "\\usepackage{listings}",
            "\\usepackage{xcolor}",
            "",
        }),
    }),

    s("pkg-algo", {
        t({
            "\\usepackage{algorithm}",
            "\\usepackage{algpseudocode}",
            "",
        }),
    }),

    s("doc-begin", {
        t({
            "\\begin{document}",
            "\\maketitle",
            "",
            "",
        }),
        i(0),
        t({
            "",
            "",
            "\\end{document}",
        }),
    }),

    s("doc-title", {
        t({ "\\title{" }),
        i(1, "Title"),
        t({
            "}",
            "\\author{",
        }),
        i(2, "Dzikran Rayya Win Lauta - 103052330110"),
        t({
            "}",
            "\\date{",
        }),
        i(3, ""),
        t({
            "}",
            "",
            -- "\\maketitle",
            -- "",
        }),
    }),
}
