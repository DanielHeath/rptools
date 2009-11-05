SKILLS_ATTRIBUTE_CONVERSION = {
  "Ab" => :ability, 
  "" => :name, 
  "CC" => :cross_class, 
  "Mod" => :modifier, 
  "AbMod" => :ability_modifier,
  "Rank" => :ranks,
  "MiscMod" => :misc_mod,
  "CheckPen" => :check_penalty}

class Skill
  
  attr_reader :number, :name
  attr_accessor :ability, :modifier, :ability_modifier, :ranks, :misc_mod, :check_penalty, :cross_class
  
  def initialize(owner, number)
    @number = number.to_i
    @owner = owner
    @owner[@number] = self
    self.name = name
  end
  
  def name=(value)
    @owner[@name] = nil
    @name = value.to_s.downcase
    @owner[@name] = self if value
  end
  
end

class SkillsHash < Hash
  
  def [](index)
    if index.is_a? Regexp
      all_matching(index)
    else
      (super) || (super index.to_s.downcase) || (index.is_a?(Numeric) ? Skill.new(self, index) : nil)
    end
  end

  def all_matching(pattern)
    res = []
      self.each do |k, v|
        res.push v if k =~ pattern
      end
    res
  end
  
end