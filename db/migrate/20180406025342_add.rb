class Add < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :name, :string
    add_column :users, :intro, :text
    add_column :users, :avatar, :string
  end
end


# 需修改 rake dev:fake_user
# restaurant#show 評論者名稱
# Devise 註冊表單的設計需手動修改