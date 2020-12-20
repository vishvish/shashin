# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inspector, type: :model do
  let(:inspector) { described_class.new('spec/example-files/') }
  let(:nikon_d1x_file) { 'DSC_1408.NEF' }
  let(:nikon_d70_file) { '_DSC0483.NEF' }
  let(:nikon_d70_dng_file) { '_DSC0373.dng' }
  let(:fuji_file) { '_DSF4467.RAF' }

  describe 'reading Files' do
    context 'with a Nikon D1X file' do
      let(:inspected) { inspector.read(nikon_d1x_file) }

      it 'reads the filename' do
        expect(inspected.filename).to eq('DSC_1408.NEF')
      end

      it 'reads the created_datetime' do
        expect(inspected.created).to eq('2004:09:18 15:09:29')
      end

      it 'reads the camera make' do
        expect(inspected.camera_manufacturer).to eq('NIKON CORPORATION')
      end

      it 'reads the camera model' do
        expect(inspected.camera_model).to eq('NIKON D1X')
      end

      it 'returns the directory structure based on the timestamp' do
        expect(inspected.directory_structure).to eq("2004/09/18")
      end

      it 'returns the full filepath' do
        expect(inspected.file_path).to eq("#{Rails.root}/spec/example-files/DSC_1408.NEF")
      end
    end

    context 'with a Nikon D70 file' do
      let(:inspected) { inspector.read(nikon_d70_file) }

      it 'reads the filename' do
        expect(inspected.filename).to eq('_DSC0483.NEF')
      end

      it 'reads the created_datetime' do
        expect(inspected.created).to eq('2005:05:29 18:25:50')
      end

      it 'reads the camera make' do
        expect(inspected.camera_manufacturer).to eq('NIKON CORPORATION')
      end

      it 'reads the camera model' do
        expect(inspected.camera_model).to eq('NIKON D70')
      end

      it 'returns the directory structure based on the timestamp' do
        expect(inspected.directory_structure).to eq("2005/05/29")
      end

      it 'returns the full filepath' do
        expect(inspected.file_path).to eq("#{Rails.root}/spec/example-files/_DSC0483.NEF")
      end
    end

    context 'with a Fuji X-E2 file' do
      let(:inspected) { inspector.read(fuji_file) }

      it 'reads the filename' do
        expect(inspected.filename).to eq('_DSF4467.RAF')
      end

      it 'reads the created_datetime' do
        expect(inspected.created).to eq('2014:08:02 20:12:44')
      end

      it 'reads the camera make' do
        expect(inspected.camera_manufacturer).to eq('FUJIFILM')
      end

      it 'reads the camera model' do
        expect(inspected.camera_model).to eq('X-E2')
      end

      it 'returns the directory structure based on the timestamp' do
        expect(inspected.directory_structure).to eq("2014/08/02")
      end

      it 'returns the full filepath' do
        expect(inspected.file_path).to eq("#{Rails.root}/spec/example-files/_DSF4467.RAF")
      end
    end

    context 'with a Nikon D70 file converted to DNG' do
      let(:inspected) { inspector.read(nikon_d70_dng_file) }

      it 'reads the filename' do
        expect(inspected.filename).to eq('_DSC0373.dng')
      end

      it 'reads the created_datetime' do
        expect(inspected.created).to eq('2005:05:06 00:30:42')
      end

      it 'reads the camera make' do
        expect(inspected.camera_manufacturer).to eq('NIKON CORPORATION')
      end

      it 'reads the camera model' do
        expect(inspected.camera_model).to eq('NIKON D70')
      end

      it 'returns the directory structure based on the timestamp' do
        expect(inspected.directory_structure).to eq("2005/05/06")
      end
    end
  end

  describe 'moving, copying and renaming files' do
    it 'creates the directory structure'

    it 'renames the file according to its timestamp'

    it 'copies the file into the correct directory'
  end

  describe 'writing metadata to files' do
    it 'writes the copyright information'

    it 'writes the original filename into a field'
  end
end
