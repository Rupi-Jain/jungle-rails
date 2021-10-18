class Boat
  def allowed_aboard?(inventory)
    p inventory
    inventory.include?('life jacket')   
  end
end