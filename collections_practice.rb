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
  array.each_with_object([]) do |elem, obj_count|
    name_present = obj_count.detect{ |inner_obj| inner_obj[:name] == elem[:name] }
    name_present ? name_present[:count] += 1 : obj_count << { name: elem[:name], count: 1 }
  end
end

def merge_data(data_1, data_2)
  data_1.each_with_object([]) do |element, obj_arr|
    obj_arr << element.merge(data_2[0][element[:first_name]])
  end
end

def find_cool(hashes)
  hashes.each_with_object([]) { |obj, array| array << obj if obj.has_value?("cool") }
end

def organize_schools(schools)
  schools.keys.each_with_object({}) do |element, hash|
    if hash.has_key?(schools[element][:location])
      hash[schools[element][:location]] << element
    else
      hash[schools[element][:location]] = [element]
    end
  end
end
