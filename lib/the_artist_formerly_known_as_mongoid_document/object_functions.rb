module TheArtistFormerlyKnownAsMongoidDocument
  module ObjectFunctions
    # determines if a string is a valid mongo id
    # @return true if the string is a valid mongo id; false otherwise
    # @note: this does not ensure that the string is in fact a used id in the mongo database
    def mongo_id?
      !!self.to_s.match(/^[0-9a-f]{24}$/)
    end
  end
end

Object.send :include, TheArtistFormerlyKnownAsMongoidDocument::ObjectFunctions
