class Song < ApplicationRecord
  validates :title, presence: true
  validates :release_year, presence: true, if: :released?
  validates :release_year, inclusion: {maximum: Time.now.year}
end
