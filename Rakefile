require "erb"
require "fileutils"
require "ostruct"
require "rake/clean"
require "rexml/document"
require "yaml"

def output(nuspec)
  name = File.basename(nuspec, ".nuspec")
  doc = REXML::Document.new(File.open(nuspec))
  version = REXML::XPath.first(doc, "/package/metadata/version").text

  return "#{name}.#{version}.nupkg"
end

CLOBBER.include("output/*.nupkg")

task :default => ["package:all"]

namespace :package do
  NUSPECS = FileList["packages/**/*.nuspec"]
  NUPKGS = NUSPECS.map{ |nuspec| File.join("output", output(nuspec)) }

  directory "output"

  desc "Package all of the specs"
  multitask :all => NUPKGS

  desc "Start a new package"
  task :new, [:id, :version, :title] do |task, args|
    args.with_defaults(:title => args[:id])

    FileUtils.cp_r("template", "packages/#{args[:id]}")
    FileUtils.mv("packages/#{args[:id]}/template.nuspec", "packages/#{args[:id]}/#{args[:id]}.nuspec")

    Dir["packages/#{args[:id]}/**/*"].select{ |path| File.file?(path) }.each do |path|
      template = ERB.new(File.read(path))
      binder = OpenStruct.new(args)
      content = template.result(binder.instance_eval { binding })

      File.write(path, content)
    end
  end

  NUSPECS.zip NUPKGS do |nuspec, nupkg|
    file nupkg => ["output", nuspec] do
      system "nuget pack #{nuspec} -OutputDirectory output -NoPackageAnalysis -NonInteractive -Verbosity normal"
    end
  end
end

namespace :web do
  ICONS = Dir["public/icons/*.png"]

  task :optimize do
    `git ls-files --others --modified --exclude-standard -- *.png`.split("\n").each do |path|
      system "pngout \"#{path}\""
    end
  end
end
