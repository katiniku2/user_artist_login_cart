class Artist < ApplicationRecord
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence: true, length: { maximum: 255 },
		format: { with: VALID_EMAIL_REGEX },
		uniqueness: { case_sensitive: false }

	has_secure_password
	validates :password, presence: true, length: {minimum: 6}

	has_many :favorites
	has_many :users, through: :favorites

	# scope :search_by_keyword, -> (keyword) {
	# 	where("artists.name LIKE :keyword", "%#{sanitize_sql_like(keyword)}%") if keyword.present?
	# }

	def self.search(search)
		if search
		    where(['name LIKE ?', "%#{search}"])
		else
			all
		end
	end
end
