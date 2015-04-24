class Picture < ActiveRecord::Base
  belongs_to :imageable, :polymorphic => true
  has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }, 
  						    :default_url => "/images/:style/missing.png",
  						    :path => ":rails_root/public/system/:attachment/:id/:style.:extension",
                    		:url  => "/:attachment/:id/:style.:extension"
  validates_attachment_content_type :image, :content_type => [ "image/png", "image/jpeg" ]
  validates_attachment_size :image, :in => 0..5.megabytes
end