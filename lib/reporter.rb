class Report
  attr_reader :headings, :data
  
  def initialize(*columns)
    @headings = columns
    @data = []
  end
  
  def row
    @row || mew_row
  end
  
  def new_row
    @row = {}
    @data.push @row
    @row
  end
  
  def numeric_sort(str)
    @data.sort! {|a,b| b[str].to_i <=> a[str].to_i}
  end
  
  def column_width(column)
    res = column.length
    @data.each do |row|
      res = [res, row[column].length].max
    end
    res + column_spacing
  end
  
  def report
    rep = ''
    @headings.each do |col|
      rep += col.ljust column_width(col)
    end
    rep += "\n"
    @data.each do |row|
      @headings.each do |col|
        rep += row[col].ljust column_width(col)
      end
      rep += "\n"
    end
    rep
  end

private
  def column_spacing
    3
  end
end
