require 'rake'
require 'albacore'

here     = File.expand_path File.dirname __FILE__

specs    = FileList['**/*.nuspec']
packages = FileList['**/*.nupkg']
names    = specs.pathmap '%n'

task_names  = names.gsub '-', '_'
cpack_names = task_names.map { |name| "cpack_#{name}" }
cinst_names = task_names.map { |name| "cinst_#{name}" }
cpush_names = task_names.map { |name| "cpush_#{name}" }

task :cpack_all => cpack_names

specs.zip(names, cpack_names) do |spec, name, cpack|
  exec cpack do |cmd|
    cmd.command = 'cpack'
    cmd.parameters = [ spec ]
  end
end

task :cinst_all => cinst_names

packages.zip(names, cpack_names, cinst_names) do |pkg, name, cpack, cinst|
  exec cinst => [ cpack ] do |cmd|
    cmd.command = 'cinst'
    cmd.parameters = [ name, "-source #{here}" ]
  end
end

task :cpush_all => cpush_names

packages.zip(names, cpack_names, cpush_names) do |pkg, name, cpack, cpush|
  exec cpush => [ cpack ] do |cmd|
    cmd.command = 'cpush'
    cmd.parameters = [ pkg ]
  end
end
