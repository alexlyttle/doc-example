# DocExample

Simple MATLAB toolbox with example documentation built with [MATLAB DocMaker](https://github.com/mathworks/docmaker).

Everything to be distributed in the toolbox is contained in the `tbx/` directory.

Build the toolbox and documentation with the `buildtool` (requires MATLAB DocMaker).

```matlab
buildtool
```

<details>
<summary>Example output</summary>

```text
** Starting check

Analysis Summary:
    Total Files: 2
         Errors: 0 (Threshold: 0)
       Warnings: 0 (Threshold: Inf)
           Info: 0 (Threshold: Inf)
** Finished check

** Starting test


Test Summary:
    Total Tests: 0
         Passed: 0
         Failed: 0
     Incomplete: 0
       Duration: 0 seconds testing time.
                 
** Finished test

** Starting doc
[+] .../doc-example/tbx/docs/resources/github-markdown.css
[+] .../doc-example/tbx/docs/resources/matlaby.css
[+] .../doc-example/tbx/docs/resources/copycode.css
[+] .../doc-example/tbx/docs/resources/github-markdown-css.rights
[+] .../doc-example/tbx/docs/resources/copycode.js
[+] .../doc-example/tbx/docs/getting-started.html
[+] .../doc-example/tbx/docs/helptoc.html
[+] .../doc-example/tbx/docs/index.html
[⚡].../doc-example/tbx/docs/getting-started.html
[⚡].../doc-example/tbx/docs/helptoc.html
[⚡].../doc-example/tbx/docs/index.html
[+] .../doc-example/tbx/docs/info.xml
[+] .../doc-example/tbx/docs/helptoc.xml
[+] .../doc-example/tbx/docs/helpsearch-v4_en
** Finished doc

** Starting package
** Finished package

Build Successful:
    4 Tasks: 0 Failed, 0 Skipped
    3.5208 sec total build time
```
</details>
