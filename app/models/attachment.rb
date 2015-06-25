class Attachment < ActiveRecord::Base
  belongs_to :entity, polymorphic: true
  has_attached_file :document,
                  :path => ":rails_root/public/system/:attachment/:id/:style.:extension",
                        :url  => "/:attachment/:id/:style.:extension"
  validates_attachment_content_type :document, :content_type => [ "text/plain"]
  validates_attachment_size :document, :in => 0..5.megabytes
end