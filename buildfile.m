function plan = buildfile
import matlab.buildtool.tasks.*

plan = buildplan(localfunctions);

plan("clean") = CleanTask;
plan("check") = CodeIssuesTask;
plan("test") = TestTask;

doc = "docs";
plan("doc").Inputs = doc; % source folder, /tbx/docmakerdoc
plan("doc").Outputs = [fullfile(doc,"**","*.html"), ... % output HTML
    fullfile(doc,"resources"), ... % stylesheets and scripts
    fullfile(doc,"*.xml"), ... % index files
    fullfile(doc,"helpsearch-v*")]; % search database folder 

plan.DefaultTasks = ["check" "test" "doc"];
end

function docTask(c)
doc = c.Task.Inputs.Path; % source folder
md = fullfile(doc,"**","*.md"); % Markdown documents
html = docconvert(md); % convert to HTML
docrun(html) % run code and insert output
docindex(doc) % index
end
