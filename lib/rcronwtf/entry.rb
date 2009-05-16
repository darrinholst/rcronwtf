class CronWTF::Entry
  attr_reader :minutes, :hours, :days, :months, :week_days, :command, :is_comment
  
  def initialize(entry)
    @is_comment = (entry.nil? or entry.strip.empty? or entry.match /^#/) ? true : false
    @entry = entry.strip.gsub(/\s+/, " ")
    parse unless is_comment
  end
  
  def to_s
    return @entry if is_comment
    
    msg = []

    %w(minute hour day month week_day).each do |attribute|
      key = (attribute + "s")
      prev = msg[msg.length - 1]
      values = self.send(key)

      if(values == '*')
        if(!prev || !prev.match(/^every/))
          msg << "every #{attribute.gsub('_', ' ')}"
        end
      else
        msg << send("#{key}_message", values)
      end
    end

    "Runs `#{@command}` #{msg.join(', ')}."
  end
  
  private
  
  MONTHS = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']
  WEEK_DAYS = ['Sun', 'Mon', "Tue", 'Wed', 'Thu', 'Fri', 'Sat', 'Sun']

  def parse 
    pieces = @entry.split(/\s+/)
    @minutes   = parse_attribute(pieces[0], 60)
    @hours     = parse_attribute(pieces[1], 24)
    @days      = parse_attribute(pieces[2], 31)
    @months    = parse_attribute(pieces[3], 12)
    @week_days = parse_attribute(pieces[4], 8)
    @command   = pieces.slice(5, pieces.length).join(" ")
  end

  def parse_attribute(value, upper_bound)
    return value if value.eql? '*'

    if(value.match(/^\*\/\d+$/))
      step  = value.match(/^\*\/(\d+)$/)[1].to_i
      range = []

      for i in (0...upper_bound)
        range << i if i % step == 0
      end

      return range
    end

    if(value.match(/^\d+\-\d+$/))
      matches = value.match(/^(\d+)\-(\d+)$/)
      lower = matches[1]
      upper = matches[2]
      range = []

      for i in (lower..upper)
        range << i.to_i
      end

      return range
    end

    return value.split(",").map{|v| v.to_i}
  end

  def minutes_message(values)
    v = []

    values.each do |value|
      v << ":#{value.to_s.length == 1 ? '0' : ''}#{value}"
    end

    "at minute#{values.length > 1 ? 's' : ''} #{v.join(', ')}"
  end

  def hours_message(values)
    "on hour#{values.length > 1 ? 's' : ''} #{values.join(', ')}"
  end

  def days_message(values)
    "on day#{values.length > 1 ? 's' : ''} #{values.join(', ')}"
  end

  def months_message(values)
    v = []

    values.each do |value|
      v << MONTHS[value]
    end

    "in #{v.join(', ')}"
  end

  def week_days_message(values)
    v = []

    values.each do |value|
      v << WEEK_DAYS[value]
    end

    "on #{v.join(', ')}"
  end  
end