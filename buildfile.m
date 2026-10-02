function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask;
plan("test") = TestTask;
plan("test").Dependencies = "check";

doc = fullfile("tbx", "docs");
plan("doc").Inputs = doc; % source folder, /tbx/docmakerdoc
plan("doc").Outputs = [fullfile(doc,"**","*.html"), ... % output HTML
    fullfile(doc,"resources"), ... % stylesheets and scripts
    fullfile(doc,"*.xml"), ... % index files
    fullfile(doc,"helpsearch-v*")]; % search database folder

plan("package").Dependencies = ["test" "doc"];

plan.DefaultTasks = "package";
end

function docTask(c)
doc = c.Task.Inputs.Path; % source folder
md = fullfile(doc,"**","*.md"); % Markdown documents
html = docconvert(md); % convert to HTML
docrun(html) % run code and insert output
docindex(doc) % index
end

function packageTask(~)
info = ver( "docexample" ); % from Contents.m

% Inherit options from project's Package Toolbox task
opts = matlab.addons.toolbox.ToolboxOptions("DocExample.prj");
opts.ToolboxVersion = string(info.Version);
matlab.addons.toolbox.packageToolbox(opts);
end
