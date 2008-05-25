require File.join(File.dirname(__FILE__), 'spec_helper')
require 'barby/barcode/code_25'
include Barby

describe Code25 do

  before :each do
    @data = "1234567"
    @code = Code25.new(@data)
  end

  it "should return the same data it was given" do
    @code.data.should == @data
  end

  it "should have the expected characters" do
    @code.characters.should == %w(1 2 3 4 5 6 7)
  end

  it "should have the expected digits" do
    @code.digits.should == [1,2,3,4,5,6,7]
  end

  it "should have the expected even_and_odd_digits" do
    @code.even_and_odd_digits.should == [[7,5,3,1], [6,4,2]]
  end

  it "should have the expected start_encoding" do
    @code.start_encoding.should == '1110111010'
  end

  it "should have the expected stop_encoding" do
    @code.stop_encoding.should == '111010111'
  end

  it "should have a default narrow_width of 1" do
    @code.narrow_width.should == 1
  end

  it "should have a default wide_width equal to narrow_width * 3" do
    @code.wide_width.should == @code.narrow_width * 3
    @code.narrow_width = 2
    @code.wide_width.should == 6
  end

  it "should have a default space_width equal to narrow_width" do
    @code.space_width.should == @code.narrow_width
    @code.narrow_width = 23
    @code.space_width.should == 23
  end

  it "should have the expected digit_encodings" do
    @code.character_encodings.should == %w(11101010101110 10111010101110 11101110101010 10101110101110 11101011101010 10111011101010 10101011101110)
  end

  it "should have the expected data_encoding" do
    @code.data_encoding.should == "11101010101110101110101011101110111010101010101110101110111010111010101011101110101010101011101110"
  end

  it "should have the expected checksum" do
    @code.checksum.should == 0
  end

  it "should have the expected checksum_encoding" do
    @code.checksum_encoding.should == '10101110111010'
  end

  it "should have the expected encoding" do
    @code.encoding.should == "111011101011101010101110101110101011101110111010101010101110101110111010111010101011101110101010101011101110111010111"
  end

end
