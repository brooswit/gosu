require 'rubygems'
require 'gosu'

class ButtonIDs < Gosu::Window
  def initialize
    super 320, 600, false
    
    @constants = []
  end
  
  def button_down(id)
    @constants << Gosu.constants.find { |c| c.upcase != c and Gosu.const_get(c) == id }
  end
  
  def draw
    @font ||= Gosu::Font.new(self, Gosu::default_font_name, 20)

    @constants.reverse.each_with_index do |constant, idx|
      @font.draw constant, 10, 10 + idx * 20, 0
    end
  end
end

ButtonIDs.new.show
