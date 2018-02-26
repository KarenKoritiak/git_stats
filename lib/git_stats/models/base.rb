class Base
  def attrs_parser
    raise NotImplementedError, 'You must implement attrs_parser.'
  end

  def attrs
    @attrs ||= attrs_parser.map(&:to_s)
  end
end
