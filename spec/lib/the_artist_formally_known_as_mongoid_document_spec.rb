require 'spec_helper'
require 'the_artist_formerly_known_as_mongoid_document'

describe TheArtistFormerlyKnownAsMongoidDocument do
  let(:matched_mongo_id) { '507f1f77bcf86cd799439011' }
  let(:unmatched_mongo_id) { '5282956f60f1e162f4742098' }
  before(:each) do
    build_model :artist do
      string :name
      string :mongo_id
    end
    Artist.extend(TheArtistFormerlyKnownAsMongoidDocument)
    @prince = Artist.create(mongo_id: matched_mongo_id, name: 'Prince')
  end

  describe '.find' do
    it 'should look up by mongo_id when a mongo id is supplied' do
      #Artist.should_receive(:where).with(mongo_id: matched_mongo_id) { [ Artist.new( name: 'Prince', mongo_id: matched_mongo_id ) ] }
      expect( Artist.find(matched_mongo_id) ).to eq(@prince)
    end

    it 'should look up by id when a numeric id is supplied' do
      expect( Artist.find(@prince.id) ).to eq(@prince)
    end

    it 'should raise and error if no record exists by the mongoid id' do
      expect{ Artist.find(unmatched_mongo_id) }.to raise_error( ActiveRecord::RecordNotFound ) 
    end

  end
end

