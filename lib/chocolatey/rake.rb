require 'rake'
require 'albacore'

here     = File.expand_path File.dirname __FILE__

specs    = FileList['**/*.nuspec']
packages = FileList['**/*.nupkg']
names    = specs.pathmap '%n'

task_names         = names.gsub '-', '_'
build_task_names   = task_names.map { |name| "cpack_#{name}" }
install_task_names = task_names.map { |name| "cinst_#{name}" }
publish_task_names = task_names.map { |name| "cpush_#{name}" }

task :cpack_all => build_task_names

specs.zip(names, build_task_names) do |spec, name, build|
  exec build do |cmd|
    cmd.command = 'cpack'
    cmd.parameters = spec
  end
end

task :cinst_all => install_task_names

packages.zip(names, build_task_names, install_task_names) do |pkg, name, build, install|
  exec install => [ build ] do |cmd|
    cmd.command = 'cinst'
    cmd.parameters = [ name, "-source #{here}" ]
  end
end

task :cpush_all => publish_task_names

packages.zip(names, build_task_names, publish_task_names) do |pkg, name, build, publish|
  exec publish => [ build ] do |cmd|
    cmd.command = 'cpush'
    cmd.parameters = [ pkg ]
  end
end
