require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the Ingest::IngestHelper. For example:
#
# describe Ingest::IngestHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe Ingest::IngestHelper, type: :helper do

  let(:rootpath_top_level) { 'spec/example-volumes/single-level' }
  let(:rootpath_recursive) { 'spec/example-volumes/recursive' }

  describe "List of Volumes available to machine" do
    it "lists all the volumes available to the machine" do
      # expect(helper.list_volumes).to eq(["BOOTCAMP", "Macintosh HD", "Keybase"])
    end
  end

  describe "List of Images on Volume" do

    describe "top level" do

      it "lists all the images on the top level of a volume" do
        result = %W[#{rootpath_top_level}/L1020646.dng #{rootpath_top_level}/L1020647.dng #{rootpath_top_level}/L1020648.dng #{rootpath_top_level}/L1020649.dng #{rootpath_top_level}/L1020650.dng #{rootpath_top_level}/L1020651.dng]

        expect(helper.list_top_level(rootpath_top_level)).to match_array(result)
      end

      it "should only list images" do
      end
    end

    describe "recursively" do

      it "lists all the images recursively from the top level of a volume" do
        result = %W[#{rootpath_recursive}/C/L1020646.dng #{rootpath_recursive}/C/L1020647.dng #{rootpath_recursive}/B/L1020648.dng #{rootpath_recursive}/B/L1020649.dng #{rootpath_recursive}/A/L1020650.dng #{rootpath_recursive}/A/L1020651.dng]
        s
        expect(helper.list_recursive(rootpath_recursive)).to match_array(result)
      end

      it "should only list images" do

      end
    end
  end
end
