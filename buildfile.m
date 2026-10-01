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

plan.DefaultTasks = ["check" "test" "doc" "package"];
end

function docTask(c)
doc = c.Task.Inputs.Path; % source folder
md = fullfile(doc,"**","*.md"); % Markdown documents
html = docconvert(md); % convert to HTML
docrun(html) % run code and insert output
docindex(doc) % index
end

function packageTask(~)
name = "DocExample";
version = "1.0.0";

opts = matlab.addons.toolbox.ToolboxOptions(stagedir, "DocExample.prj");

%Set various settings for the toolbox
opts.AuthorCompany = "University of Birmingham";
opts.AuthorEmail = "a.j.lyttle@bham.ac.uk";
opts.AuthorName = "Alex Lyttle";
opts.Summary = "Example toolbox with documentation.";
opts.Description = "Example toolbox with documentation.";
opts.MaximumMatlabRelease = "";
opts.MinimumMatlabRelease = "R2026a";
opts.OutputFile = fullfile("release", name + ".mltbx");
opts.SupportedPlatforms.Win64 = true;
opts.SupportedPlatforms.Mac = true;
opts.SupportedPlatforms.Glnxa64 = true;
opts.SupportedPlatforms.MatlabOnline = true;
opts.ToolboxVersion = version;

%Build the .mltbx toolbox installation file
matlab.addons.toolbox.packageToolbox(opts);
end
