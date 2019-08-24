def unique(integers)
  @unique = Array.new
  @compare = integers

  @compare.each do |i|
    if @unique.include?(i)
    else
      @unique.push(i)
    end
  end
  return @unique
end