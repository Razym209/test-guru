belongs_to :category

  scope :by_level, -> (level) { where(level: level) }

  scope :easy, -> { by_level(0..1) }
  scope :medium, -> { by_level(2..4) }
  scope :hard, -> { by_level(5..Float::INFINITY) }

  scope :by_category, -> (category) { joins(:category).where(categories: { title: category }).order(title: :desc) }

  validates :title, presence: true
  validates :level, presence: true,
                    numericality: { only_integer: true }
  validates :category_id, presence: true,
                    numericality: { only_integer: true }
  validates :title, uniqueness: { scope: :level }

  class << self
    def all_by_category(category)
      by_category(category).pluck(:title)
    end
  end
end