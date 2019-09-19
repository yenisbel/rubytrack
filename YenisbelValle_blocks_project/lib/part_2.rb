def all_words_capitalized?(arry)
    arry.all?{|word| word == word.capitalize}
end


def no_valid_url?(urls)
    invalid_url = ['.com','.net','.io','.org']
    urls.none? do |url|
        invalid_url.any? { |ends| url.end_with?(ends) }
    end
end


def any_passing_students?(students)
    students.any?{|student| (student[:grades].sum / student[:grades].length) >= 75}
end