class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :slug, null: false, default: ""
      t.string :header_title, null: false, default: ""
      t.text :header_desc
      t.string :header_about
      t.string :scroll_text
      t.string :featured_img
      t.string :meta_title, null: false, default: ""
      t.text :meta_desc
      t.string :meta_img
      t.jsonb :footer, null: false, default: {}
      t.jsonb :components, null: false, default: {}

      t.timestamps
    end

    add_index :pages, :slug, unique: true
  end
end
