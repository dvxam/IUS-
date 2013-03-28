# -*- encoding : utf-8 -*-
class Folder < ActiveRecord::Base
  belongs_to :user
  has_and_belongs_to_many :tags
  attr_accessible :isValidated, :label, :path, :user_id
  mount_uploader :path, FolderUploader

  def set_defaults
    self.is_validated ||= false
  end

  def upload
    uploaded_io = params[:folder][:path]
    File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'w') do |file|
      file.write(uploaded_io.read)
    end
  end

end
