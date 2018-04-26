require "twitter"
require_relative 'src/command'
require_relative 'src/token'

if File.file?("json/private.json") then
    tkn_sub
else
    tkn
end

cmd