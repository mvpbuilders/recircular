require "administrate/field/base"

class ActiveStorageField < Administrate::Field::Base
  def to_s
    if data.respond_to?(:each)
      data.map(&:filename).join(", ")
    else
      data.filename.to_s
    end
  end
end
