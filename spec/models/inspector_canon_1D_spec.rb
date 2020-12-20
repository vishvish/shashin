# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inspector, type: :model do
  let(:inspector) { described_class.new('spec/example-files/') }
  let(:canon_1dx_file) { '_G4R6399.CR2' }

  describe 'reading Files' do
    context 'with a Canon 1DIII file' do
      # let(:inspected) { inspector.read(canon_5dii_file) }
    end

    context 'with a Canon 1DX file' do
      let(:inspected) { inspector.read(canon_1dx_file) }

      it 'reads the filename' do
        expect(inspected.filename).to eq('_G4R6399.CR2')
      end

      it 'reads the created_datetime' do
        expect(inspected.created).to eq('2017:06:25 11:45:10')
      end

      it 'reads the camera make' do
        expect(inspected.camera_manufacturer).to eq('Canon')
      end

      it 'reads the camera model' do
        expect(inspected.camera_model).to eq('Canon EOS-1D X')
      end

      it 'returns the directory structure based on the timestamp' do
        expect(inspected.directory_structure).to eq("2017/06/25")
      end
    end
  end
end
