require "erb"
require "fileutils"
require "ostruct"
require "rexml/document"
require "yaml"

def output(nuspec)
  name = File.basename(nuspec, ".nuspec")
  doc = REXML::Document.new(File.open(nuspec))
  version = REXML::XPath.first(doc, "/package/metadata/version").text

  return "#{name}.#{version}.nupkg"
end

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

  desc "Publish the website"
  task :publish => [:optimize, :generate] do 
    system "git add -A"
    system "git commit -m \"Site generated at #{Time.now.utc}\""
    system "git checkout gh-pages"
    system "git pull --no-rebase"
    system "git merge -s subtree master"
    system "git push origin master gh-pages"
    system "git checkout master"
  end

  task :optimize do
    `git ls-files --others --exclude-standard -- *.png`.split("\n").each do |path|
      system "pngout \"#{path}\""
    end
  end

  task :generate => ["public/_data/icons.yaml"]

  file "public/_data/icons.yaml" => ICONS do |task|
    data = ICONS.map do |path| 
      file = File.basename(path)
      name = File.basename(path, File.extname(path))
      
      {"name" => name, "path" => "/chocolateypackages/icons/#{file}"}
    end
    
    File.write(task.name, data.to_yaml)
  end

  desc "Setup the gh-pages website"
  task :setup do |task, args|
    raise "gh-pages exists!" if File.exist?(".git/refs/heads/gh-pages")

    system "git checkout -b gh-pages"
    
    FileList["*"].exclude("public").each{ |path| FileUtils.rm_rf(path) }
    FileUtils.cp_r(File.join("public", "."), ".")
    FileUtils.rm_rf("public")
    
    system "git add -A"
    system "git commit -am \"setup gh-pages\""
    system "git push origin master gh-pages"
    system "git checkout master"
  end
end
