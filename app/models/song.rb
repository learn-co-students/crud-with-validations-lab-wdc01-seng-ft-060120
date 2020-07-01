class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: {
        scope: %i[release_year artist_name],
        message: "can't release the same title twice in one year, bruh"
      }
    validates :released, inclusion: { in: [true, false],}
    validates :artist_name, presence: true
    
    with_options if: :released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
            less_than_or_equal_to: Date.current.year
        }
      end


    def released?
        self.released
    end

end


