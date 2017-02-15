class CreateBarbers < ActiveRecord::Migration[5.0]
  def change
    create_table :barbers do |t|
      t.text :name
      t.timestamps
    
    end 
    Barber.create :name => "Jessie Pinkman"
      Barber.create :name =>"Irina Razina"
      Barber.create :name =>"Olga Yurieva"
      Barber.create :name =>"Harry Perabo"
  end
end
