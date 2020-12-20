# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Inspector, type: :model do
  let(:inspector) { described_class.new('spec/example-files/') }
  let(:canon_5dii_file) { '_MG_0100.CR2' }

  describe 'reading Files' do
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
        expect(inspected.file_path).to eq("#{Rails.root}/spec/example-files/_MG_0100.CR2")
      end
    end
  end
end
