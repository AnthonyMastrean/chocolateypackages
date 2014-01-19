require "yaml"

task :default do 
  icons = Dir["icons/*.*"]
  hash = icons.map { |path| { name: File.basename(path, File.extname(path)), path: path } }
  yaml = hash.to_yaml
  
  File.write("_data/icons.yaml", yaml)
end
