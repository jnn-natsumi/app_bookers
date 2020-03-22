class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
# モデルを生成するとdbでマイグレーションが生成される。
# テーブル名は複数形になる
      t.string :title
      t.string :body
      t.timestamps
    end
  end
end
