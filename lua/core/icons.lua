-- https://github.com/microsoft/vscode/blob/main/src/vs/base/common/codicons.ts
-- go to the above and then enter <c-v>u<unicode> and the symbold should appear
-- or go here and upload the font file: https://mathew-kurian.github.io/CharacterMap/
-- find more here: https://www.nerdfonts.com/cheat-sheet
vim.g.use_nerd_icons = true
if vim.fn.has "mac" == 1 or vim.g.use_nerd_icons then
    return {

        kind = {
		      Text = "󰉿",
		      LuaSnip = "✂️",
		      Method = "󰆧",
		      Function = "󰊕",
		      Constructor = "",
		      Field = "",
		      Variable = "󰀫",
		      Class = "󰠲",
		      Interface = "󱦜",
		      Module = "",
		      Property = "",
		      Unit = "",
		      Value = "󰎠",
		      Enum = "",
		      Keyword = "",
		      Snippet = "",
		      Color = "󰏘",
		      File = "",
		      Reference = "󰈇",
		      Folder = "",
		      EnumMember = "",
		      Constant = "󰏿",
		      Struct = "󱏒",
		      Event = "",
		      Operator = "",
		      TypeParameter = ""
        },
        type = {
            Array = "",
            Number = "",
            String = "",
            Boolean = "",
            Object = "󰅩",
        },
        documents = {
            File = "",
            Files = "",
            Folder = "",
            OpenFolder = "",
        },
        git = {
            Add = "",
            Mod = "",
            Remove = "",
            Ignore = "",
            Rename = "",
            Diff = "",
            Repo = "",
            Octoface = "",
        },
        ui = {
            ArrowClosed = "",
            ArrowOpen = "",
            Lock = "",
            Circle = "",
            BigCircle = "",
            BigUnfilledCircle = "",
            Close = "",
            NewFile = "",
            Search = "",
            Lightbulb = "󰌶",
            Project = "",
            Dashboard = "",
            History = "󰄉",
            Comment = "",
            Bug = "",
            Code = "",
            Telescope = "",
            Gear = "",
            Package = "",
            List = "",
            SignIn = "",
            SignOut = "",
            Check = "",
            Fire = "",
            Note = "󰎛",
            BookMark = "",
            Pencil = "",
            ChevronRight = "",
            Table = "",
            Calendar = "",
            CloudDownload = "",
        },
        diagnostics = {
            Error = "",
            Warning = "",
            Information = "",
            Question = "",
            Hint = "󰌶",
        },
        lsp = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗",
        },
        misc = {
            Robot = "󰚩",
            Squirrel = "",
            Tag = "",
            Watch = "",
            Smiley = ""
        },
        langs = {
            ai          = '󰧑',
            apache      = '',
            awk         = '',
            bash        = '',
            bat         = '',
            bazel       = '',
            bib         = '',
            bmp         = '',
            c           = '',
            cc          = '',
            clisp       = '',
            clj         = '',
            cljc        = '',
            clojure     = '',
            cmake       = '',
            cobol       = '',
            coffee      = ' ',
            config      = '',
            coq         = '',
            cp          = '',
            cpp         = '',
            crystal     = '',
            csh         = '',
            csharp      = '',
            css         = '',
            cuda        = '',
            cxx         = '',
            cython      = '',
            d           = '',
            dart        = '',
            db          = '',
            diff        = '',
            dockerfile  = '',
            dump        = '',
            edn         = '',
            ejs         = '',
            elisp       = '',
            elixir      = '',
            elm         = '',
            erl         = '',
            fish        = '',
            fs          = '',
            fsi         = '',
            fsscript    = '',
            fsx         = '',
            gif         = '',
            git         = '',
            gnu         = '',
            go          = '',
            graphviz    = '',
            h           = '',
            hbs         = '',
            hh          = '',
            hpp         = '',
            hrl         = '',
            hs          = '',
            htm         = '',
            html        = '',
            hxx         = '',
            ico         = '',
            idris       = '',
            ini         = '',
            j           = '',
            jasmine     = '',
            java        = '',
            jl          = '',
            jpeg        = '',
            jpg         = '',
            js          = '',
            json        = '',
            jsx         = '',
            julia       = '⛬',
            jupyter     = '',
            kotlin      = '',
            ksh         = '',
            labview     = '',
            less        = '',
            lhs         = '',
            lisp        = 'λ',
            llvm        = '',
            lsp         = 'λ',
            lua         = '',
            m           = '',
            markdown    = '',
            mathematica = '',
            matlab      = '',
            max         = '',
            md          = '',
            meson       = '',
            ml          = '',
            mli         = '',
            mustache    = '',
            nginx       = '',
            nim         = '',
            nix         = '',
            nvcc        = '',
            nvidia      = '',
            octave      = '',
            opencl      = '',
            org         = '',
            patch       = '',
            perl6       = '',
            php         = '',
            pl          = '',
            png         = '',
            postgresql  = '',
            pp          = '',
            prolog      = '',
            ps          = '',
            ps1         = '',
            psb         = '',
            psd         = '',
            py          = '',
            pyc         = '',
            pyd         = '',
            pyo         = '',
            python      = '',
            rb          = '',
            react       = '',
            reason      = '',
            rkt         = '',
            rlib        = '',
            rmd         = '',
            rs          = '',
            rss         = '',
            ruby        = '',
            rust        = '',
            sass        = '',
            scala       = '',
            scheme      = 'λ',
            scm         = 'λ',
            scrbl       = '',
            scss        = '',
            sh          = '',
            slim        = '',
            sln         = '',
            sql         = '',
            styl        = '',
            suo         = '',
            svg         = '',
            swift       = '',
            t           = '',
            tex         = '',
            ts          = '',
            tsx         = '',
            twig        = '',
            txt         = 'e',
            typescript  = '',
            vim         = '',
            vue         = '﵂',
            xul         = '',
            yaml        = '',
            yml         = '',
            zsh         = '',
        },
    }
else
    return {
        kind = {
            Text = " ",
            Method = " ",
            Function = " ",
            Constructor = " ",
            Field = " ",
            Variable = " ",
            Class = " ",
            Interface = " ",
            Module = " ",
            Property = " ",
            Unit = " ",
            Value = " ",
            Enum = " ",
            Keyword = " ",
            Snippet = " ",
            Color = " ",
            File = " ",
            Reference = " ",
            Folder = " ",
            EnumMember = " ",
            Constant = " ",
            Struct = " ",
            Event = " ",
            Operator = " ",
            TypeParameter = " ",
            Misc = " ",
        },
        type = {
            Array = " ",
            Number = " ",
            String = " ",
            Boolean = " ",
            Object = " ",
        },
        documents = {
            File = " ",
            Files = " ",
            Folder = " ",
            OpenFolder = " ",
        },
        git = {
            Add = " ",
            Mod = " ",
            Remove = " ",
            Ignore = " ",
            Rename = " ",
            Diff = " ",
            Repo = " ",
            Octoface = " "
        },
        ui = {
            ArrowClosed = "",
            ArrowOpen = "",
            Lock = " ",
            Circle = " ",
            BigCircle = " ",
            BigUnfilledCircle = " ",
            Close = " ",
            NewFile = " ",
            Search = " ",
            Lightbulb = " ",
            Project = " ",
            Dashboard = " ",
            History = " ",
            Comment = " ",
            Bug = " ",
            Code = " ",
            Telescope = " ",
            Gear = " ",
            Package = " ",
            List = " ",
            SignIn = " ",
            SignOut = " ",
            NoteBook = " ",
            Check = " ",
            Fire = " ",
            Note = " ",
            BookMark = " ",
            Pencil = " ",
            ChevronRight = "",
            Table = " ",
            Calendar = " ",
            CloudDownload = " ",

        },
        diagnostics = {
            Error = " ",
            Warning = " ",
            Information = " ",
            Question = " ",
            Hint = " ",
        },
        misc = {
            Robot = " ",
            Squirrel = " ",
            Tag = " ",
            Watch = " ",
            Smiley = " "
        },
        langs = {
            ai          = '',
            apache      = '',
            awk         = '',
            bash        = '',
            bat         = '',
            bazel       = '',
            bib         = '',
            bmp         = '',
            c           = '',
            cc          = '',
            clisp       = '',
            clj         = '',
            cljc        = '',
            clojure     = '',
            cmake       = '',
            cobol       = '',
            coffee      = '',
            config      = '',
            coq         = '',
            cp          = '',
            cpp         = '',
            crystal     = '',
            csh         = '',
            csharp      = '󰌛',
            css         = '',
            cuda        = '',
            cxx         = '',
            cython      = '',
            d           = '',
            dart        = '',
            db          = '',
            diff        = '',
            dockerfile  = '',
            dump        = '',
            edn         = '',
            ejs         = '',
            elisp       = '',
            elixir      = '',
            elm         = '',
            erl         = '',
            fish        = '󰈺',
            fs          = '',
            fsi         = '',
            fsscript    = '',
            fsx         = '',
            gif         = '',
            git         = '',
            gnu         = '',
            go          = '',
            graphviz    = '',
            h           = '',
            hbs         = '',
            hh          = '',
            hpp         = '',
            hrl         = '',
            hs          = '',
            htm         = '',
            html        = '',
            hxx         = '',
            ico         = '',
            idris       = '',
            ini         = '',
            j           = '',
            jasmine     = '',
            java        = '',
            jl          = '',
            jpeg        = '',
            jpg         = '',
            js          = '',
            json        = '',
            jsx         = '',
            julia       = '⛬',
            jupyter     = '',
            kotlin      = '',
            ksh         = '',
            labview     = '',
            less        = '',
            lhs         = '',
            lisp        = 'λ',
            llvm        = '',
            lsp         = 'λ',
            lua         = '',
            m           = '',
            markdown    = '',
            mathematica = '',
            matlab      = '',
            max         = '',
            md          = '',
            meson       = '',
            ml          = '',
            mli         = '',
            mustache    = '',
            nginx       = '',
            nim         = '',
            nix         = '',
            nvcc        = '',
            nvidia      = '',
            octave      = '',
            opencl      = '',
            org         = '',
            patch       = '',
            perl6       = '',
            php         = '',
            pl          = '',
            png         = '',
            postgresql  = '',
            pp          = '',
            prolog      = '',
            ps          = '',
            ps1         = '',
            psb         = '',
            psd         = '',
            py          = '',
            pyc         = '',
            pyd         = '',
            pyo         = '',
            python      = '',
            rb          = '',
            react       = '',
            reason      = '',
            rkt         = '',
            rlib        = '',
            rmd         = '',
            rs          = '',
            rss         = '',
            ruby        = '',
            rust        = '',
            sass        = '',
            scala       = '',
            scheme      = 'λ',
            scm         = 'λ',
            scrbl       = '',
            scss        = '',
            sh          = '',
            slim        = '',
            sln         = '',
            sql         = '',
            styl        = '',
            suo         = '',
            svg         = '',
            swift       = '',
            t           = '',
            tex         = '',
            ts          = '',
            tsx         = '',
            twig        = '',
            txt         = 'e',
            typescript  = '',
            vim         = '',
            vue         = '﵂',
            xul         = '',
            yaml        = '',
            yml         = '',
            zsh         = '',
        },
    }
end
