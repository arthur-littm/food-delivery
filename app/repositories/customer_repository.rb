require_relative '../models/customer'
require_relative 'base_repository'
require "csv"

class CustomerRepository < BaseRepository
  def headers
    return ["id", "name", "address"]
  end

  def build_instance(row)
    row[:id] = row[:id].to_i # Convert column to Fixnum
    return Customer.new(row)
  end

  # def build_row(element)
  #   return [element.id, element.name, element.address]
  # end
end
