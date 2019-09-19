def my_reject(arry, &even)
    arry.select(&:even?)
end

def my_one?(arry, &even)
    arry.select(&:even) == 1
end