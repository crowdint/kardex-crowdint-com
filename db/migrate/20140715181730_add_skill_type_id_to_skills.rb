class AddSkillTypeIdToSkills < ActiveRecord::Migration
  def change
    add_reference :skills, :skill_type, index: true
  end
end
