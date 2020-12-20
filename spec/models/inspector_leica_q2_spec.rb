# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inspector, type: :model do
  let(:inspector) { described_class.new('spec/example-files/') }
  let(:leica_q2_file) { 'L1000799.DNG' }
  let(:leica_q2_file_from_fotos) { 'DO01000442.DNG' }

  describe 'reading Files' do
    context 'with a Leica Q2 file direct from camera' do
      let(:inspected) { inspector.read(leica_q2_file) }

      it 'reads the filename' do
        expect(inspected.filename).to eq('L1000799.DNG')
      end

      it 'reads the created_datetime' do
        expect(inspected.created).to eq('2019:12:03 14:28:25')
      end

      it 'reads the camera make' do
        expect(inspected.camera_manufacturer).to eq('LEICA CAMERA AG')
      end

      it 'reads the camera model' do
        expect(inspected.camera_model).to eq('LEICA Q2')
      end

      it 'returns the directory structure based on the timestamp' do
        expect(inspected.directory_structure).to eq("2019/12/03")
      end

      it 'returns the full filepath' do
        expect(inspected.file_path).to eq("#{Rails.root}/spec/example-files/L1000799.DNG")
      end
    end

    context 'with a Leica Q2 file via Leica Fotos' do
      let(:inspected) { inspector.read(leica_q2_file_from_fotos) }

      it 'reads the filename' do
        expect(inspected.filename).to eq('DO01000442.DNG')
      end

      it 'reads the created_datetime' do
        expect(inspected.created).to eq('2019:11:14 15:31:45')
      end

      it 'reads the camera make' do
        expect(inspected.camera_manufacturer).to eq('LEICA CAMERA AG')
      end

      it 'reads the camera model' do
        expect(inspected.camera_model).to eq('LEICA Q2')
      end

      it 'returns the directory structure based on the timestamp' do
        expect(inspected.directory_structure).to eq("2019/11/14")
      end

      it 'returns the full filepath' do
        expect(inspected.file_path).to eq("#{Rails.root}/spec/example-files/DO01000442.DNG")
      end
    end

  end
end
