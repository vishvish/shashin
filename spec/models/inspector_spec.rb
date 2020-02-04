require 'rails_helper'

RSpec.describe Inspector, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "reading Files" do
    it "accepts DNG files"

    it "accepts Fuji RAW files"

    it "accepts Canon CR2 files"

    it "accepts Nikon NEF files"
  end

  describe "reading metadata from files" do
    it "reads the filename"

    it "reads the original timestamp"

    it "reads the camera model"
  end

  describe "moving and renaming files" do
    it "creates the directory structure based on the timestamp"

    it "moves the file into the correct directory"

    it "renames the file according to its timestamp"
  end

  describe "writing metadata to files" do
    it "writes the copyright information"

    it "writes the original filename into a field"
  end
end
