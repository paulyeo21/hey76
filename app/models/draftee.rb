class Draftee < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  has_many :bings, dependent: :destroy
	validates :name, presence: true

  def self.class_of_16
    draftees.each do |draftee|
      Draftee.create(name: draftee[:name], twitter: draftee[:twitter])
    end
  end

  private

  def self.draftees
    [
      { name: "Brandon Ingram", twitter: "B_Ingram13" },
      { name: "Ben Simmons", twitter: "BenSimmons25" },
      { name: "Jaylen Brown", twitter: "FCHWPO" },
      { name: "Buddy Hield", twitter: "buddyhield" }
    ]
  end
end
