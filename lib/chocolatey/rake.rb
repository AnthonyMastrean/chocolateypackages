require 'rake'
require 'albacore'

specs    = FileList['**/*.nuspec']
packages = FileList['**/*.nupkg']
names    = specs.pathmap '%n'

task_names         = names.gsub '-', '_'
build_task_names   = task_names.map { |name| "build_#{name}" }
install_task_names = task_names.map { |name| "install_#{name}" }
publish_task_names = task_names.map { |name| "publish_#{name}" }

task :build_all => build_task_names

specs.zip(names, build_task_names) do |spec, name, build|
  exec build do |cmd|
    cmd.command = 'cpack'
    cmd.parameters = spec
  end
end

task :install_all => install_task_names

packages.zip(names, build_task_names, install_task_names) do |pkg, name, build, install|
  exec install => [ build ] do |cmd|
    cmd.command = 'cinst'
    cmd.parameters = [ name, '-source $pwd' ]
  end
end

task :publish_all => publish_task_names

packages.zip(names, build_task_names, publish_task_names) do |pkg, name, build, publish|
  task publish => [ build ] do
    FileUtils.cp pkg, 'p:\packages'
  end
end
