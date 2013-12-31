#!/usr/bin/env ruby
# coding: utf-8
# © 2013 Chris Riddoch.  See COPYING for terms

require 'tempfile'
require 'tmpdir'

if ARGV.length < 1
  puts %q{Usage: get-youtube "http://www.youtube.com/watch?v=somevideoid"}
  exit
end

url = ARGV[0]

title = IO.popen(["youtube-dl", "--get-title", url, {STDERR => STDOUT}], "r+") do |pipe|
  pipe.readline.chomp
end

system("kdialog", "--yesno", title)
if $?.exitstatus != 0
  exit
end

tmplfile = Tempfile.new(Dir.tmpdir).path
puts "Tempfile: #{tmplfile}"
output = IO.popen(["youtube-dl", "-x", "--audio-quality", "0", "-o", tmplfile + ".%(ext)s", url]) do |pipe|
  pipe.readlines
end

# The extension isn't known or I'd just avoid this
fname = Dir.glob(tmplfile + ".*").first
extension = File.extname(fname)
  
system("mplayer", fname)

system("kdialog", "--yesno", "Keep file?")
if $?.exitstatus != 0
  File.delete(fname)
  exit
end

tofile = IO.popen(["kdialog", "--getsaveurl", ENV['HOME'] + "/Music", extension], "r+") do |pipe|
  pipe.readline.chomp
end

if tofile =~ %r{file://(.+)}
  File.rename(fname, $1)
else
  system("kdialog", "--sorry", "KDE says what? Your file is at #{fname}")
end

