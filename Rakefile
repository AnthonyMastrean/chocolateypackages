ul = FileList["icons/*.*"].pathmap("<li><a href=\"/icons/%f\">%n</a></li>").join("\n")

task :default do 
  text = File.read("index.html")
  text.gsub!("<ul class=\"icons\" />", "<ul class=\"icons\">\n#{ul}\n</ul>")
  File.write("index.html", text)
end
