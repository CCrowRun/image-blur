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
end