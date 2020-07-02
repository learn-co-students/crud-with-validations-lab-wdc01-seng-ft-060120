class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: {scope: %i[release_year artist_name],
     message: "cannot be repeated by the same artist in the same year."}
     
    validates :released, inclusion: { in: [true, false]}
    validates :artist_name, presence: true

    with_options if: :released do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: { less_than_or_equal_to: Date.today.year}
    end




    # validates :release_year, uniqueness: true, length: {maximum: 2020}
    # validate :no_release_year_when_released_is_true

    # def no_release_year_when_released_is_true
    #     if release_year == "" && released == true
    #         errors.add(:release_year, "must be present if release is true")
    #     end
    # end
end
