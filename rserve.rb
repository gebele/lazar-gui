require 'rubygems'
require 'rserve'

begin
  R = Rserve::Connection.new(hostname: "rserve")
  p 0
rescue
  p 1
end
