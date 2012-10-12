class PosuploadsController < ApplicationController
  require 'aws/s3'

  def index
    bucketname = 'interview.playonsports.com'
    @posfiles = AWS::S3::Bucket.find(bucketname).objects
    bucket = AWS::S3::Bucket.find(bucketname)
  end

    def upload
      begin
        bucketname = 'interview.playonsports.com'
        @posfiles = AWS::S3::Bucket.find(bucketname).objects
        bucket = AWS::S3::Bucket.find(bucketname)
        object = bucket.new_object

        #AWS::S3::S3Object.store(params[:posfile].original_filename, File.open(params[:posfile].tempfile), bucketname)
        object.value = File.open(params[:posfile].tempfile, 'r')
        object.key   =   params[:posfile].original_filename
         #   upfile = File.open(params[:posfile].tempfile, 'r')
        object.store(:content_length => params[:posfile].size) do |buffer, bytes|
          buffer.write(file.read(bytes))
             end
        end




              redirect_to root_path
      #rescue
        #render :text => "Couldn't complete the upload"

      end


    private
    def sanitize_filename(file_name)
      just_filename = File.basename(file_name)
      just_filename.sub(/[^\w\.\-]/,'_')
    end
      end