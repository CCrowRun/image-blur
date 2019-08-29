class Image
  attr_accessor :image

  def initialize(image)
    @image = image
  end

  def output_image
   image.each do |i|
      i.each do |a|
        print a
      end
      print "\n"
    end
  end

  def blur_image
    blur = Array.new(5) { Array.new(4, 0) }
    image.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        if col == 1
          blur[row_index][col_index] = 1
          blur[row_index-1][col_index] = 1 if row_index - 1 >= 0 
          blur[row_index+1][col_index] = 1 if row_index + 1 < image.length
          blur[row_index][col_index-1] = 1 if col_index - 1 >= 0
          blur[row_index][col_index+1] = 1 if col_index + 1 < row.length
        end
      end
    end
    return blur
  end
end