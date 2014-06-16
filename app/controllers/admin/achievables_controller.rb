class Admin::AchievablesController < Admin::BaseController
  before_action :load_object, if: -> { params[:id] }

  respond_to :html

  def index
    instance_variable_set(collection_name, object_class.all)
    respond_with instance_variable_get(collection_name)
  end

  def new
    instance_variable_set(object_name, object_class.new)
    respond_with instance_variable_get(object_name)
  end

  def create
    instance_variable_set(object_name, object_class.new(protected_params))
    instance_variable_get(object_name).save
    respond_with instance_variable_get(object_name), location: index_path
  end

  def edit
  end

  def update
    instance_variable_get(object_name).update_attributes protected_params
    instance_variable_get(object_name).save
    respond_with instance_variable_get(object_name), location: index_path
  end

  def destroy
    instance_variable_get(object_name).destroy
    respond_with instance_variable_get(object_name), location: index_path
  end

  private
  def protected_params
    params.require(resource_name.to_sym).permit(:name, :description, :image, user_ids: [])
  end

  def load_object
    instance_variable_set(object_name, object_class.find(params[:id]))
  end

  def collection_name
    "@#{resource_name.pluralize}"
  end

  def object_name
    "@#{resource_name}"
  end

  def object_class
    resource_name.classify.constantize
  end

  def index_path
    send("admin_#{resource_name.pluralize}_path")
  end
end
