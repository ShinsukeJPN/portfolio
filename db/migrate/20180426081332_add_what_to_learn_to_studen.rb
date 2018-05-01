class AddWhatToLearnToStuden < ActiveRecord::Migration[5.1]
  def change
    add_column :students, :what_to_learn, :string
  end
end
