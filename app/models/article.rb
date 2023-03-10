class Article < ApplicationRecord
    enum category: [:Начинающий, :Осваивающийся, :Знающий, :Профи]

    has_one_attached :image
    has_rich_text :textbody
    has_many :comments, dependent: :delete_all
    belongs_to :user

    validates_presence_of :title
end
