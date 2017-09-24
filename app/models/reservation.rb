class Reservation < ApplicationRecord

  text_empty  = "darf nicht leer sein"
  default_scope { order(created_at: :desc) }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i


  validates :email, presence: { message: text_empty }, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX, message: "Bitte gültige E-Mail Adresse eingeben"  }

  validates :name,  presence: { message: text_empty }, length: { maximum: 20,  message: "nicht mehr als 20 Zeichen erlaubt"  }

  validates :start_time, :end_time, presence: { message: text_empty }

  validate :end_after_start

  private
  def end_after_start
    return if end_time.blank? || start_time.blank?

    if end_time < start_time
      errors.add(:end_time, "darf nicht vor Startdatum sein")
    end
   end

end
