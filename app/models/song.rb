class Song < ApplicationRecord
  validates :release_year, presence: true, if: :released?
  validates :release_year, inclusion: {in: 1000..Time.now.year}, if: :released?
  validates_with TitleValidator
end
