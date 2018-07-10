require_relative '../models/employee'
require_relative 'base_repository'
require "csv"

class EmployeeRepository < BaseRepository
  undef :add

  def find_by_username(username)
    @elements.find do |employee|
      employee.username == username
    end
  end

  def headers
    return ["id", "username", "password", "role"]
  end

  def build_instance(row)
    row[:id] = row[:id].to_i # Convert column to Fixnum
    return Employee.new(row)
  end

  # def build_row(element)
  #   return [element.id, element.name, element.address]
  # end
end
