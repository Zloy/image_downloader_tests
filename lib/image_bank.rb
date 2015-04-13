require 'digest/md5'

class ImageBank
  def initialize(dir)
    @dir, @digests = dir, {}

    Dir["#{@dir}/**/*"].each do |file_path|
      next if File.directory? file_path
      digest = file_digest(file_path)
      @digests[digest] = file_path
    end
  end

  def contains?(file_path)
    @digests.key? file_digest(file_path)
  end

  protected

  def file_digest(file_path)
    Digest::MD5.hexdigest(File.read(file_path))
  end
end
