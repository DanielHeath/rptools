require 'lib/skills'

class Character
  
  attr_accessor :skills
  
  def initialize(xmldoc)
    @skills = SkillsHash.new
    @attributes = {}
    xmldoc.search("character/data/node").each do |e|
      attr = e.attributes["name"].to_s
      if attr =~ /^Skill(\d+)([^\d]*)/ then
        @skills[$1.to_i].send(SKILLS_ATTRIBUTE_CONVERSION[$2].to_s + '=', e.text)
      else
        @attributes[attr.downcase] = e.text
      end
    end
  end
  
  def method_missing(*args)
    @attributes[args.first.to_s] || @skills[args.first.to_s] || super
  end
  
end