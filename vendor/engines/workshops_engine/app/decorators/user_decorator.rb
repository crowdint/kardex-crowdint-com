module WorkshopsEngine
  User.class_eval do
    has_many :workshops,
             class_name: 'WorkshopsEngine::Workshop'
  end
end
