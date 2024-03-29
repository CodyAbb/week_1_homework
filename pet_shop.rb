def pet_shop_name(shop_name)
  return shop_name[:name]
end


def total_cash(shop_name)
  return shop_name[:admin][:total_cash]
end


def add_or_remove_cash(shop_name, money_amount)
  shop_name[:admin][:total_cash] += money_amount
end


def pets_sold(shop_name)
  return shop_name[:admin][:pets_sold]
end


def increase_pets_sold(shop_name, number_sold)
  shop_name[:admin][:pets_sold] += number_sold
end


def stock_count(shop_name)
  pet_count = 0
  for pet in shop_name[:pets]
    pet_count += 1
  end
  return pet_count
end


def pets_by_breed(shop_name, breed_to_be_searched)
  array_of_breeds = []
  final_array = []

  for pet in shop_name[:pets]
    array_of_breeds << pet[:breed]
  end

  for breed in array_of_breeds
    if breed == breed_to_be_searched
      final_array << breed
    end
  end

  return final_array
end


def find_pet_by_name(shop_name, pet_to_be_searched)
  for pet in shop_name[:pets]
    if pet[:name] == pet_to_be_searched
      return pet
    end
  end
  return nil
end


def remove_pet_by_name(shop_name, pet_to_be_deleted)
  for pet in shop_name[:pets]
    if pet[:name] == pet_to_be_deleted
      shop_name[:pets].delete(pet)
    end
  end
end

#These two are related functions
def stock_count(shop_name)
  shop_name[:pets].length
end

def add_pet_to_stock(shop_name, pet_to_be_added)
  shop_name[:pets] << pet_to_be_added
end


# These two functions are related
def customer_cash(customer)
  return customer[:cash]
end

def remove_customer_cash(customer, cash_to_be_removed)
  customer[:cash] -= cash_to_be_removed
end


#These two functions are related
def customer_pet_count(customer)
  return customer[:pets].length
end

def add_pet_to_customer(customer, pet_for_customer)
  customer[:pets] << pet_for_customer
end


######### OPTIONAL QUESTIONS ###################

def customer_can_afford_pet(customer, pet_cost)
  if customer[:cash] >= pet_cost[:price]
    return true
  else
    return false
  end
end


def sell_pet_to_customer(shop_name, pet, customer)
  if pet != nil
    if customer_can_afford_pet(customer, pet) == true
      remove_customer_cash(customer, pet[:price])
      add_pet_to_customer(customer, pet)
      remove_pet_by_name(shop_name, pet)
      add_or_remove_cash(shop_name, pet[:price])
      increase_pets_sold(shop_name, 1)
    end
  end
end
