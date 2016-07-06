class Draftee < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  has_many :bings, dependent: :destroy
	validates :name, presence: true

  def self.class_of_16
    draftees.each do |draftee|
      d = Draftee.new(name: draftee[:name], twitter: draftee[:twitter])
      d.save
    end
  end

  private

  def self.draftees
    [
      { name: "Brandon Ingram", twitter: "B_Ingram13" },
      { name: "Ben Simmons", twitter: "BenSimmons25" },
      { name: "Jaylen Brown", twitter: "FCHWPO" },
      { name: "Buddy Hield", twitter: "buddyhield" },
      { name: "Dragon Bender", twitter: "DBender03" },
      { name: "Kris Dunn", twitter: "KrisDunn3" },
      { name: "Jamal Murray", twitter: "BeMore27" },
      { name: "Denzel Valentine", twitter: "denzelvalentine" },
      { name: "Thon Maker", twitter: "ThonMaker14" }
    ]
  end
end
