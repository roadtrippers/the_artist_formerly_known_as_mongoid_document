require "the_artist_formerly_known_as_mongoid_document/version"

module TheArtistFormerlyKnownAsMongoidDocument
  # find by either the id proper or mongo_id
  # @param *args either a single id or multiple ids
  # @note currently searching by multiple mongo ids is unsupported
  # @note this calls super (and therefore hits the database twice) if not found by the mongo id
  # @return [TheArtistFormallyKnownAsMongoidDoument::Base] object representing the model found by either id or mongo_id
  def find(*args)
    id = args.first
    if args.count == 1 && !id.is_a?(Numeric) && id.to_s.match( /^[0-9a-fA-F]{24}$/ )
      found_by_mongo_id = where mongo_id: id
      return super if found_by_mongo_id.count == 0
      return found_by_mongo_id.first
    else
      return super
    end
  end
end
