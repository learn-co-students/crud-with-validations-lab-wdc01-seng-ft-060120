class TitleValidator < ActiveModel::Validator
  def validate(record)
    if record.title == nil
      record.errors.add(:title, "Cannot be empty")
    elsif record.released?
      
      same_year = record.class.where("release_year = ?", record.release_year)

      same_year.each do |song|
        if song.title == record.title
          record.errors.add(:title, "cannot be released twice in the same year")
        end

      end      
    end
  end
end  