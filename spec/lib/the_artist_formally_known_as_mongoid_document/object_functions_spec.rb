require 'spec_helper'
require 'the_artist_formerly_known_as_mongoid_document'

describe TheArtistFormerlyKnownAsMongoidDocument::ObjectFunctions do
  let(:a_mongo_id) { '522e14579033054745000708' }
  let(:a_numeric_string) { '1337' }
  let(:a_number) { 1337 }
  let(:non_numeric_text) { 'foo bar' }
  let(:an_object_representing_a_mongo_id) do
    obj = double
    allow(obj).to receive(:to_s) { a_mongo_id }
    obj
  end

  describe '.mongo_id?' do
    it 'should return true if the object is a string of a well-formed mongo id' do
      expect( a_mongo_id.mongo_id? ).to be_true
    end
    it 'should return true if the object represents a well-formed mongo id' do
      expect( an_object_representing_a_mongo_id.mongo_id? ).to be_true
    end
    it 'should return false for numeric ids' do
      expect( a_numeric_string.mongo_id? ).to be_false
    end
    it 'should return false for strings of text' do
      expect( non_numeric_text.mongo_id? ).to be_false
    end
    it 'should return false for numbers' do
      expect( a_number.mongo_id? ).to be_false
    end
  end
end

