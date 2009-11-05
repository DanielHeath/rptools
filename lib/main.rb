#!/usr/bin/ruby
require 'nokogiri'
require 'lib/character'

$characters = Dir['data/*.xml'].map do |f|
  if File.exists?(f) 
    File.open f, 'r' do |xml|
      Character.new(Nokogiri::XML(xml))
    end
  else
    nil
  end
end.compact


