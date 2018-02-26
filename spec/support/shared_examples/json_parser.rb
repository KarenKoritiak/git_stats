require 'spec_helper'

RSpec.shared_examples 'parsed instance' do |attrs_parser|
  attrs_parser.each do |attr|
    it "to fill #{attr}" do
      parsed_subject = subject.parse
      expect(parsed_subject.send(attr)).not_to be_nil
      expect(parsed_subject.send(attr)).to eq(json[attr])
    end
  end
end
