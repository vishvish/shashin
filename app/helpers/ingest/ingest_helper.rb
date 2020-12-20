module Ingest::IngestHelper
  def list_volumes
    []
  end

  def list_top_level(root_path)
    Dir.glob("#{root_path}/*").reject { |e| MIME::Types.type_for(e).first.try(:media_type) != 'image' }
  end

  def list_recursive(root_path)
    Dir.glob("#{root_path}/**/*").reject { |e| MIME::Types.type_for(e).first.try(:media_type) != 'image' }
  end
end
