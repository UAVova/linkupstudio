module Tokenable
  extend ActiveSupport::Concern

  included do
    before_create :generate_token
  end

  protected

  def generate_token
    self.token = loop do
      random_token = ('A'..'Z').to_a.shuffle[0,3].join + "-" + (1..9).to_a.shuffle[0,3].join + "-" + ('A'..'Z').to_a.shuffle[0,3].join
      break random_token unless self.class.exists?(token: random_token)
    end
  end
end