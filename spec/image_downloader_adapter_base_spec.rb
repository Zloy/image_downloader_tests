require 'image_bank'

klass = ImageDownloaderAdapter::Base

describe klass do
  let(:source_dir) { @source_dir }
  let(:target_bank) { ImageBank.new(@target_dir) }

  it 'should download img tag' do
    file = File.join(source_dir, 'basic img.gif')
    expect(target_bank.contains? file).to be(true)
  end

  xit 'should download img tags with srcset in scheme http' do
  end

  xit 'should download img tags with embedded images' do
  end

  xit 'should download elements with background property in style attr' do
  end

  xit 'should download elements with background-image property in style attr' do
  end

  xit 'should download elements with background property in stylesheet' do
  end

  xit 'should download elements with background-image property in stylesheet' do
  end

  xit 'should download lazily loaded elements' do
  end
end
