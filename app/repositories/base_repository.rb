require "csv"

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = [] # Array of element instances
    @next_id = 1
    load_csv if File.exist?(@csv_file)
  end

  def find(id)
    @elements.find do |element|
      element.id == id
    end
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    write_csv
  end

  def all
    @elements
  end

  def write_csv
    CSV.open(@csv_file, 'wb') do |csv|
      csv << headers
      @elements.each do |element|
        csv << element.to_row
        # csv << build_element(element)
      end
    end
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << build_instance(row)
      @next_id += 1
    end
  end
end
