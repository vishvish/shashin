class OptionsGenerator
  def self.make_options(image_basename:, raw: true, jpeg: true, sidecar: true)
    # check booleans
    !!raw == raw
    !!jpeg == jpeg
    !!sidecar == sidecar

    hash = { "image" => image_basename, "ingest_raw" => raw, "ingest_jpeg" => jpeg, "ingest_sidecar_files" => sidecar}
    return OpenStruct.new(hash)
  end
end

