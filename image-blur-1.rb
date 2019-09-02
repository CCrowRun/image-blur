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

  def blur(distance = 1)
    blur = Array.new(image.length) { Array.new(image[0].length, 0) }
    image.each_with_index do |row, row_index|
      row.each_with_index do |col, col_index|
        if col == 1
          row_min = row_index - distance < 0 ? 0 : row_index - distance 
          row_max = row_index + distance > image.length - 1 ? image.length - 1 : row_index + distance 
          row_current = row_index
          counter = 0
          while row_current >= row_min
            col_min = col_index - distance + counter < 0 ? 0 : col_index - distance + counter
            col_max = col_index + distance - counter > row.length - 1 ? row.length - 1 : col_index + distance - counter
            col_current = col_min
            while col_current <= col_max
              blur[row_current][col_current] = 1
              col_current += 1
            end
            row_current -= 1
            counter += 1
          end
          row_current = row_index
          counter = 0
          while row_current <= row_max
            col_min = col_index - distance + counter < 0 ? 0 : col_index - distance + counter
            col_max = col_index + distance - counter > row.length - 1 ? row.length - 1 : col_index + distance - counter
            col_current = col_min
            while col_current <= col_max
              blur[row_current][col_current] = 1
              col_current += 1
            end
            row_current += 1
            counter += 1
          end 
        end
      end
    end
    return blur
  end
end