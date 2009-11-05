def roll(num_dice, die_size, modifier=0)
  r = modifier
  num_dice.times {r += 1 + rand(die_size)}
  r
end

def roll_text(num_dice, die_size, modifier)
  dice = roll(num_dice, die_size)
  "#{dice+modifier} (#{modifier}+#{dice})"
end