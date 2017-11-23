require 'spec_helper_acceptance'

describe 'roles::rabbitmq::standalone' do
  let(:manifest) {
    <<-EOS
include ::roles::rabbitmq::standalone
EOS
  }

  it 'should apply without errors' do
    apply_manifest(manifest, :catch_failures => true)
  end

  it 'should apply a second time without changes' do
    @result = apply_manifest(manifest)
    expect(@result.exit_code).to be_zero
  end
end
