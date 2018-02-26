class BaseBuilder
  attr_reader :json

  def initialize(json)
    @json = json
  end

  def parse
    raise NotImplementedError, 'You must implement parse.'
  end

  private

  def send_attributes!(instance)
    instance.attrs.each do |attr|
      instance.send "#{attr}=", json[attr]
    end
  end
end
