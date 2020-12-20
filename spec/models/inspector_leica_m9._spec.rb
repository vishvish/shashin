# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inspector, type: :model do
  let(:inspector) { described_class.new('spec/example-files/') }
  let(:leica_m9_file) { 'L1000309.DNG' }

  describe 'reading Files' do
    context 'with a Leica M9 file' do
      let(:inspected) { inspector.read(leica_m9_file) }

      it 'reads the filename' do
        expect(inspected.filename).to eq('L1000309.DNG')
      end

      it 'reads the created_datetime' do
        expect(inspected.created).to eq('2009:09:20 10:38:27')
      end

      it 'reads the camera make' do
        expect(inspected.camera_manufacturer).to eq('Leica Camera AG')
      end

      it 'reads the camera model' do
        expect(inspected.camera_model).to eq('M9 Digital Camera')
      end

      it 'returns the directory structure based on the timestamp' do
        expect(inspected.directory_structure).to eq("2009/09/20")
      end

      it 'returns the full filepath' do
        expect(inspected.file_path).to eq("#{Rails.root}/spec/example-files/L1000309.DNG")
      end
    end
  end
end
