require "rake/clean"
require "rexml/document"

def nupkg(nuspec)
  name = File.basename(nuspec, ".nuspec")
  doc = REXML::Document.new(File.open(nuspec))
  version = REXML::XPath.first(doc, "/package/metadata/version").text

  "#{name}.#{version}.nupkg"
end

CLOBBER.include("**/*.nupkg")

SPECS = FileList["packages/**/*.nuspec"]
PACKAGES = SPECS.map{ |file| File.join(File.dirname(file), nupkg(file)) }

task :default => [:pack]

desc "Build all packages"
task :pack => PACKAGES

desc "Optimize icons"
task :optimize do
  `git ls-files --others --modified --exclude-standard -- *.png`.split("\n").each do |file|
    system("pngout \"#{file}\"")
  end
end

SPECS.zip PACKAGES do |nuspec, nupkg|
  file nupkg => [nuspec] do
    Dir.chdir(File.dirname(nuspec)) do
      system("choco pack \"#{File.basename(nuspec)}\"")
    end
  end
end
