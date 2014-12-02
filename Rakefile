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

  desc "Publish the package icon website"
  task :publish => [:optimize, :generate, :copy] do
    FileUtils.cd("_deploy") do
      system "git add -A"
      system "git commit -m \"Site generated at #{Time.now.utc}\""
      system "git pull origin gh-pages"
      system "git push origin gh-pages"
    end
  end
  
  task :optimize do
    `git ls-files --others --modified --exclude-standard -- *.png`.split("\n").each do |path|
      system "pngout \"#{path}\""
    end
  end

  task :generate => ["public/_data/icons.yaml"]

  task :copy do 
    FileUtils.rm_rf("_deploy/*")
    FileUtils.cp_r("public/.", "_deploy")
  end

  file "public/_data/icons.yaml" => ICONS do |task|
    data = ICONS.map do |path| 
      file = File.basename(path)
      name = File.basename(path, File.extname(path))
      
      {"name" => name, "path" => "/chocolateypackages/icons/#{file}"}
    end
    
    File.write(task.name, data.to_yaml)
  end

  desc "Setup the package icon website"
  task :setup, [:url] do |task, args|
    FileUtils.cd("_deploy") do
      system "git init"
      system "echo 'Coming Soon!' > index.html"
      system "git add ."
      system "git commit -m \"Website init\""
      system "git branch -m gh-pages"
      system "git remote add origin #{args[:url]}"
      system "git push -u origin gh-pages"
    end
  end
end
