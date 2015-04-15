require 'image_bank'

describe ImageDownloaderAdapter::Base do
  let(:source_dir) { @source_dir }
  let(:target_bank) { ImageBank.new(@target_dir) }

  it 'should download img tag' do
    file = File.join(source_dir, 'basic img.gif')
    expect(target_bank.contains? file).to be(true)
  end

  it 'should download lazily loaded images' do
    files = [
      'lazy image 1.png',
      'lazy image 2.png',
      'lazy image 3.png',
      'lazy image 4.png',
      'lazy image 5.png',
      'lazy image 6.png'
    ].map { |file| File.join(source_dir, file) }

    files.each { |file| expect(target_bank.contains? file).to be(true) }
  end

  it 'should download elements with background-image property in stylesheet' do
    file = File.join(source_dir, 'background-image stylesheet.jpg')
    expect(target_bank.contains? file).to be(true)
  end

  it 'should download elements with background property in stylesheet' do
    file = File.join(source_dir, 'background stylesheet.png')
    expect(target_bank.contains? file).to be(true)
  end

  it 'should download images defined with srcset' do
    ['srcset-image1.png', 'srcset-image2.png'].each do |file|
      expect(target_bank.contains? file).to be(true)
    end
  end

  it 'should download img tags with embedded images' do
    file = File.join(source_dir, 'embedded image.png')
    expect(target_bank.contains? file).to be(true)
  end

  it 'should download elements with background-image property in style attr' do
    file = File.join(source_dir, 'background-image style.jpg')
    expect(target_bank.contains? file).to be(true)
  end

  it 'should download elements with background property in style attr' do
    file = File.join(source_dir, 'background style.png')
    expect(target_bank.contains? file).to be(true)
  end
end
