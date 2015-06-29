class Task < ActiveRecord::Base
  include Tokenable
  belongs_to :user
  belongs_to :task_state, foreign_key: "state"
  has_many   :comments
  has_many   :pictures,    :as => :imageable
  has_many   :attachments, :as => :entity
  belongs_to :task_state, foreign_key: "state"
  accepts_nested_attributes_for :pictures
  accepts_nested_attributes_for :attachments
  accepts_nested_attributes_for :comments
  validates :title,   presence: true, length: { minimum: 12, maximum: 60  }
  validates :content, presence: true, length: { minimum: 50, maximum: 500 }
  before_save :delete_images, :delete_files

  def pictures_to_delete
  	@pics ||= nil
  end

  def pictures_to_delete=(value)
    @pics = value
  end

  def attachments_to_delete
  	@attachments ||= nil
  end

  def attachments_to_delete=(value)
    @attachments = value
  end

  private
    def delete_images
      if @pics
	      @pics.each do |pic|
	        Picture.destroy(pic)
	      end
	  end
    end

    def delete_files
      if @attachments
	      @attachments.each do |attachment|
	        Attachment.destroy(attachment)
	      end
	  end
    end

end
