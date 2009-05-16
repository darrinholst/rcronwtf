class CronWTF::Table
  attr_reader :entries
  
  def initialize(table)
    @entries = parse(table)
  end
  
  def to_s
    entries.map{|e| e.to_s}.join("\n")
  end
  
  private
  
  def parse(table)
    lines = []
    
    table.split("\n").each do |line|
      entry = CronWTF::Entry.new(line)
      lines << entry unless entry.is_comment
    end
    
    lines
  end
end