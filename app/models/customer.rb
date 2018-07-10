class Customer
  attr_accessor :id
  attr_reader :name, :address

  def initialize(attributes = {})
    # id, name, address
    @id = attributes[:id]
    @name = attributes[:name]
    @address = attributes[:address]
  end

  def to_row
    return [@id, @name, @address]
  end
end
