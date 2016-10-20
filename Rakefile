# coding: utf-8

task default: %w[test]

require 'rake/testtask'

Rake::TestTask.new do |t|
  t.libs << 'test'
  t.test_files = FileList['test/test_*.rb']
  t.verbose = true
end

task :site do
  Dir.chdir("docs") do
    sh "jekyll s"
  end
end

task :count do
  files = `git ls-files -z`.split("\x0")
  shell_cmd = "wc -l "
  files.grep(%r{^(exe|lib|test)/}).grep(%r{exe|.rb}).each do |f|
    shell_cmd << f << " \\\n"
  end
  begin
    sh shell_cmd[0..-3]
  rescue
    puts "Count Error."
  end
end