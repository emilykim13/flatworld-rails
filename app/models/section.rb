class Section < ApplicationRecord
    belongs_to :chapter

    validates :section_ordinal, presence: true
end
