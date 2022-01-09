class BaseSerializer
  include JSONAPI::Serializer

  def self.serialize_to_json(resource, options = {})
    data = new(resource, options).serializable_hash
    Oj.dump(data, mode: :compat)
  end
end
