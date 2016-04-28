class Movie < ActiveRecord::Base

  has_many :reviews

  validates :title,
    presence: true

  validates :director,
    presence: true

  validates :runtime_in_minutes,
    numericality: { only_integer: true }

  validates :description,
    presence: true

  validates :poster_image_url,
    presence: true

  validates :release_date,
    presence: true

  validate :release_date_is_in_the_past

  mount_uploader :poster_image_url, ImageUploader

  def review_average
    if reviews.size == 0
      return 0
    end
    reviews.sum(:rating_out_of_ten)/reviews.size
  end

  protected

  def release_date_is_in_the_past
    # if release_date.present?
    #   if release_date > Date.today
    #     errors.add(:release_date, "should be in the past") 
    #   end
    # end

    if release_date.present? && release_date > Date.today
      errors.add(:release_date, "should be in the past") 
    end

  end

end
