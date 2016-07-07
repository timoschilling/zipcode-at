require "zipcode-fr"

module ZipCode
  class AT < ZipCode::FR
    VERSION = "1.0.0"

    def reader_options
      {
        col_sep: ';',
        encoding: 'ISO-8859-1'
      }
    end
    private :reader_options

    def row_to_h(row)
      row = row[0, 2]
      row << row[1].upcase
      [:zip, :alt_name, :name].zip(row).to_h
    end
    private :row_to_h

    def row_clean(row)
      row.map { |e| e.to_s.strip.encode('UTF-8') }
    end
    private :row_clean

    def data_source
      path = 'vendor/data/data.csv'
      File.expand_path(File.join(File.dirname(__FILE__), '..', path))
    end
    private :data_source
  end
end

ZipCode::DB.register(:at, ZipCode::AT.new)
