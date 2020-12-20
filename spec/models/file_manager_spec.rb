require 'rails_helper'
require 'fileutils'

RSpec.describe FileManager, type: :model do
  let(:file_manager) { described_class.new('spec/example-filesystem/') }
  let(:leica_q2_file) { 'L1000799.DNG' }
  let(:leica_q2_file_from_fotos) { 'DO01000442.DNG' }
  let(:leica_m9_file) { 'L1000309.DNG' }
  let(:nikon_d1x_file) { 'DSC_1408.NEF' }
  let(:nikon_d70_file) { '_DSC0483.NEF' }
  let(:nikon_d70_dng_file) { '_DSC0373.dng' }
  let(:fuji_file) { '_DSF4467.RAF' }
  let(:canon_5dii_file) { '_MG_0100.CR2' }
  let(:canon_1dx_file) { '_G4R6399.CR2' }

  describe "creating folder hierarchy" do
    before(:all) do
      # cleanup
      FileUtils.rm_rf("spec/example-filesystem/.", secure: true)
    end

    it 'should create the nested folders' do
      pending "Unwritten code"
      fail
    end

    after(:all) do
      File.open "spec/example-filesystem/finished.txt", "w"
    end


  end

end
