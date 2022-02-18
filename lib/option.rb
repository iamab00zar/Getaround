class Option
  attr_accessor :id, :rental_id, :type

  def initialize(args)
    @id = args['id']
    @rental_id = args['rental_id']
    @type = args['type']
  end

  def self.all
    ObjectSpace.each_object(self).sort_by(&:id)
  end
end
