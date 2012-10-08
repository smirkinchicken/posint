class PosuploadsController < ApplicationController
  require 'aws/s3'

  def index
    bucket = 'interview.playonsports.com'
    @posfiles = AWS::S3::Bucket.find(bucket).objects
  end

    def upload
      begin
        bucket = 'interview.playonsports.com'
        AWS::S3::S3Object.store(sanitize_filename(params[:posfile].original_filename), params[:posfile].read, bucket, :access => :public_read)
        redirect_to root_path
      #rescue
        #render :text => "Couldn't complete the upload"

      end
    end

    private
    def sanitize_filename(file_name)
      just_filename = File.basename(file_name)
      just_filename.sub(/[^\w\.\-]/,'_')
    end
  end