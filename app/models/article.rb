class Article < ApplicationRecord
    enum category: [:Beginner, :Intermediate, :Advanced, :Expert]

    has_one_attached :image
    has_rich_text :textbody
    has_many :comments, dependent: :delete_all
    belongs_to :user
end
