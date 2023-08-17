module GroupsHelper
  def total(arr)
    sum = 0

    arr.each do |dealing|
      sum += dealing.amount
    end

    sum
  end
end
