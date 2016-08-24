def begins_with_r(array)
  array.all?{ |x| x.start_with? ("r") }
end

def contain_a(array)
  array.select{ |x| x.include?("a") }
end

def first_wa(array)

  array.detect do |x|
    x = x.to_s if x.is_a?(String) == false
    x.start_with? ("wa")
  end

end

def remove_non_strings(array)
  array.delete_if { |x| x.is_a?(String) == false }
end

def count_elements(array)
  hold_arr = []
  array.each do |x|
    x.each do |key, value|
      elem_count = { key => value, :count => array.count(x) }
      hold_arr << elem_count
    end
  end
  hold_arr.uniq!

end

def merge_data(data_1, data_2)
  hold_arr_1 = []
  hold_arr_2 = []
  hash_1 = Hash.new
  hash_2 = Hash.new
  merged_arr= []
  hold_arr_1 << filter_hashes(data_1, []).slice(0, (filter_hashes(data_1, []).length / 2))
  hold_arr_1 << filter_hashes(data_2, []).slice(0, (filter_hashes(data_2, []).length / 2))
  hold_arr_1.each do |array|
    array.each { |key, value| hash_1[key] = value }
  end
  hold_arr_2 << filter_hashes(data_1, []).slice((filter_hashes(data_1, []).length / 2), (filter_hashes(data_1, []).length ))
  hold_arr_2 << filter_hashes(data_2, []).slice((filter_hashes(data_2, []).length / 2), (filter_hashes(data_2, []).length ))
  hold_arr_2.each do |array|
    array.each { |key, value| hash_2[key] = value }
  end
  merged_arr << hash_1
  merged_arr << hash_2
  merged_arr
end

def filter_hashes(list, array)
  list.each do |hash|
    hash.each do |key, value|
      if( value.class == Hash )
        value.each { |key_1, value_1| array << [key_1, value_1] }
      else
        array << [key, value]
      end
    end
  end
  array
end

def find_cool(hashes)
  ret_arr = []
  hashes.each do |hash|
    hash.each do |key, value|
      if(value == "cool")
        ret_arr << hash
      end
    end
  end
  ret_arr
end

def organize_schools(hashes)
  ret_arr = Hash.new
  fin_ash = Hash.new
  sym_arr = []
  hashes.each do |key, value|
    value.each do |k, v|
      ret_arr[key] = v
      sym_arr << "#{v}"
    end
  end
  ret_arr = ret_arr.group_by{ |ke, va| va }
  ret_arr.each do |key, value|
    value.each do |sub_val|
      sub_val.delete_if do |val|
        sym_arr.any? { |x| x == val }
      end
    end
  end
  sym_arr.each do |key|
    fin_ash[key] = ret_arr.values_at(key).flatten
  end
  fin_ash
end
