require 'lib/main'
require 'lib/diceroller'
require 'lib/reporter'

report = Report.new("Player", "Perception")

$characters.each do |c|
  report.new_row
  report.row["Player"] = c.player
  report.row["Perception"] = roll_text(1, 20, c.skills['perception'].modifier.to_i)
end

report.numeric_sort 'Perception'

puts report.report