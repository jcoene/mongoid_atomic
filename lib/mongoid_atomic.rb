module Mongoid::Atomic
  extend ActiveSupport::Concern

  def atomic_update(options)
    doc = {}
    options.each do |k,v|
      next unless %w[inc set unset push pushAll addToSet pop pull pullAll].include? k.to_s
      doc["$#{k}"] = v
    end
    collection.update({'_id' => self._id}, doc)
  end

  def atomic_inc(field, by=1)
    atomic_update :inc => { field => by }
  end
  alias :atomic_increment :atomic_inc

  def atomic_set(field, value)
    atomic_update :set => { field => value }
  end

  def atomic_unset(field)
    atomic_update :unset => { field => 1 }
  end
  
  def atomic_push(field, value)
    atomic_update :push => { field => value }
  end
  
  def atomic_push_all(field, array)
    atomic_update :pushAll => { field => array.to_a }
  end
  
  def atomic_add_to_set(field, value)
    atomic_update :addToSet => { field => value }
  end
  
  def atomic_pop(field, index=1)
    atomic_update :pop => { field => index.to_i }
  end
  
  def atomic_pull(field, value)
    atomic_update :pull => { field => value }
  end
  
  def atomic_pull_all(field, array)
    atomic_update :pullAll => { field => array.to_a }
  end

end