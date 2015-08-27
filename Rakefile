require "rake/clean"
require "rexml/document"

CLOBBER.include("bin/*.nupkg")

def nupkg(nuspec)
  name = File.basename(nuspec, ".nuspec")
  doc = REXML::Document.new(File.open(nuspec))
  version = REXML::XPath.first(doc, "/package/metadata/version").text

  "#{name}.#{version}.nupkg"
end

NUSPECS = FileList["packages/**/*.nuspec"]
NUPKGS = NUSPECS.map{ |file| File.join("bin", nupkg(file)) }

directory "bin"

task :default => [:pack]

desc "Build all packages"
multitask :pack => NUPKGS

desc "Create new package"
task :new, [:name, :version, :title] do |task, args|
  args.with_defaults(:title => args[:name])

  Dir.chdir("packages") do
    system("choco new #{args[:name]}")
  end
end

desc "Optimize icons"
task :optimize do
  `git ls-files --others --modified --exclude-standard -- *.png`.split("\n").each do |file|
    system("pngout \"#{file}\"")
  end
end

NUSPECS.zip NUPKGS do |nuspec, nupkg|
  file nupkg => ["bin", nuspec] do
    system("nuget pack \"#{nuspec}\" -OutputDirectory bin -NoPackageAnalysis -NonInteractive -Verbosity normal")
  end
end
