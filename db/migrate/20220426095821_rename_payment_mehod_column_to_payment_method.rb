class RenamePaymentMehodColumnToPaymentMethod < ActiveRecord::Migration[6.1]
  def change
    rename_column :orders, :payment_mehod, :payment_method
  end
end
