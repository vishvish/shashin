class Inspector < ApplicationRecord
  def initialize(path)
    @path = path
  end

  def read(filename)
    @exiftool = Exiftool.new(File.join(@path, filename))
    self
  end

  def filename
    @exiftool.to_hash[:file_name]
  end

  def created
    @exiftool.to_hash[:date_time_original]
  end

  def camera_manufacturer
    @exiftool.to_hash[:make]
  end

  def camera_model
    @exiftool.to_hash[:model]
  end

  def directory_structure
    d = DateTime.strptime(created, "%Y:%m:%d %H:%M:%S")
    sprintf('%i/%02i/%02i', d.year, d.month, d.day)
  end

  def file_path
    directory = @exiftool.to_hash[:directory]
    File.join(directory, filename)
  end
end
