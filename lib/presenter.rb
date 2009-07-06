class Presenter
  extend Forwardable
  
  @@delegates = Array.new
  @@logger = nil
  
  def initialize(params = {})
    self.attributes = params
  end

  def attributes=(params = {})
    params.each_pair do |attribute, value|
      self.send(:"#{attribute}=", value)
    end unless params.nil?
  end

  # Mimic active record errors
  def errors
    @errors ||= ActiveRecord::Errors.new(self)
  end

  # Mimic active record logger
  def logger
    @@logger ||= RAILS_DEFAULT_LOGGER
  end

  def self.logger=(logger)
    @@logger = logger
  end

  # AR-method that returns the friendly, human-readable name for an attribute
  # by doing some string magic. This implementation just delegates to one of
  # the referenced classes.
  def self.human_attribute_name(attribute)
    attribute.humanize
  end

  def self.delegate_attributes(model, params)
    raise(RuntimeError, "No attributes specified") unless params.is_a?(Hash) and params.has_key?(:attributes)

    model_name = model.to_s
    @@delegates << model_name
    
    params[:attributes].each do |attribute|
      class_eval(<<-EOS
        def_delegators :#{model_name}, :#{attribute}, :#{attribute}=
        EOS
      )
    end
  end

  def valid?
    self.validate
    self.errors.empty?
  end

  def save!
    raise(ActiveRecord::RecordInvalid,self) unless valid?
    
    begin
      save_delegates
    rescue ActiveRecord::RecordInvalid => e
      @@delegates.each do |d|
        self.send(:"#{d}").errors.each do |attr,msg|
          unless errors.on(:"#{attr}")
            self.errors.add(attr, msg)
          end
        end
      end
      raise
    end

  end

  protected

  # override this for saving
  def save_delegates
  end

  # override this if you want any validation
  def validate
  end

end
