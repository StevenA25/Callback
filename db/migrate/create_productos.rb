class CreateProductos < ActiveRecord::Migration[6.1]
  def change
    create_table :productos do |t|
      t.string :nombre
      t.text :descripcion
      t.decimal10 :precio
      t.decimal2 :precio

      t.timestamps
    end
  end
end
