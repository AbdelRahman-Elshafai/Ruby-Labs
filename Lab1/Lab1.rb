
class ComplexNumber
  attr_accessor :real , :imag
  @@params = {"add" => 0 , "multiply" => 0}
  def initialize(real , imag)
    @real = real
    @imag = imag
  end
  def add(cn1)
    self.real += cn1.real
    self.imag += cn1.imag
    @@params["add"] += 1
    return "#{self.real} + #{self.imag}i"
  end

  def multiply(cn1)
    real_last = self.real
    self.real = (real_last * cn1.real) - (self.imag * cn1.imag)
    self.imag = (real_last * cn1.imag) + (self.imag * cn1.real)
    @@params["multiply"] +=1
    return "#{self.real} + #{self.imag}i"
  end

  def self.bulk_add(cns)
    cmp1 = ComplexNumber.new(0 , 0)
    cns.each do |complex|
      cmp1.add(complex)
    end
    return "#{cmp1.real} + #{cmp1.imag}i"
  end

  def self.bulk_multiply(cns)
    cmp1 = ComplexNumber.new(1 , 1)
    cns.each do |complex|
      cmp1.multiply(complex)
    end
    return "#{cmp1.real} + #{cmp1.imag}i"
  end

  def self.get_stat
    return "u added #{@@params["add"]} times and multiplied #{@@params["multiply"]}"
  end

end


cmp1 = ComplexNumber.new(3 , 2)

cmp2 = ComplexNumber.new(1 , 7)

cmp3 = ComplexNumber.new(4 , 5)


puts cmp1.add(cmp2)

puts cmp1.multiply(cmp2)

puts ComplexNumber.bulk_add([cmp1 , cmp2 , cmp3])


puts ComplexNumber.bulk_multiply([cmp1 , cmp2])

puts ComplexNumber.get_stat







