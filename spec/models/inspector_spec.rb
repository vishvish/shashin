# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inspector, type: :model do
  let(:inspector) { described_class.new('spec/example-files/') }
  let(:leica_q2_file) { 'L1000799.DNG' }
  let(:leica_q2_file_from_fotos) { 'DO01000442.DNG' }
  let(:leica_m9_file) { 'L1000309.DNG' }
  let(:nikon_d1x_file) { 'DSC_1408.NEF' }
  let(:nikon_d70_file) { '_DSC0483.NEF' }
  let(:nikon_d70_dng_file) { '_DSC0373.dng' }
  let(:fuji_file) { '_DSF4467.RAF' }
  let(:canon_5dii_file) { '_MG_0100.CR2' }
  let(:canon_1dx_file) { '_G4R6399.CR2' }

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
        expect(inspected.file_path).to eq("/Users/vish/git/projects/shashin/spec/example-files/L1000799.DNG")
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
        expect(inspected.file_path).to eq("/Users/vish/git/projects/shashin/spec/example-files/DO01000442.DNG")
      end
    end

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
        expect(inspected.file_path).to eq("/Users/vish/git/projects/shashin/spec/example-files/L1000309.DNG")
      end
    end

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
        expect(inspected.file_path).to eq("/Users/vish/git/projects/shashin/spec/example-files/DSC_1408.NEF")
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
        expect(inspected.file_path).to eq("/Users/vish/git/projects/shashin/spec/example-files/_DSC0483.NEF")
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
        expect(inspected.file_path).to eq("/Users/vish/git/projects/shashin/spec/example-files/_DSF4467.RAF")
      end
    end

    context 'with a Canon 5D file' do
      # let(:inspected) { inspector.read(canon_5d_file) }
    end

    context 'with a Canon 5DII file' do
      let(:inspected) { inspector.read(canon_5dii_file) }

      it 'reads the filename' do
        expect(inspected.filename).to eq('_MG_0100.CR2')
      end

      it 'reads the created_datetime' do
        expect(inspected.created).to eq('2009:10:08 22:54:19')
      end

      it 'reads the camera make' do
        expect(inspected.camera_manufacturer).to eq('Canon')
      end

      it 'reads the camera model' do
        expect(inspected.camera_model).to eq('Canon EOS 5D Mark II')
      end

      it 'returns the directory structure based on the timestamp' do
        expect(inspected.directory_structure).to eq("2009/10/08")
      end

      it 'returns the full filepath' do
        expect(inspected.file_path).to eq("/Users/vish/git/projects/shashin/spec/example-files/_MG_0100.CR2")
      end
    end

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
