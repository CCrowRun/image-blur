def find_missing_number(sequence)
  sequence.each_char do |i|
    if "0".ord > i.ord && " ".ord != i.ord || i.ord > "9".ord
      return 1
    end
  end
  @entered_array = sequence.split(" ").collect { |i| i.to_i }.sort!
  @entered_array.each do |i|
    if i > 1 && @entered_array.index(i) == 0
      return 1
    elsif i + 1 != @entered_array[@entered_array.index(i)+1].to_i &&  @entered_array.index(i)+1 <= @entered_array.length - 1
      return i + 1
    end
  end
  return 0
end