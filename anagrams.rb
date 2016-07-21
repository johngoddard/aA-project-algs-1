def first_anagram?(word1, word2)
  anagrams = word1.split("").permutation.to_a.map do |perm|
    perm.join
  end

  anagrams.include?(word2)
end

def second_anagram?(word1, word2)
  word1_chars = word1.chars
  word2_chars = word2.chars

  word1_chars.dup.each do |word1_ch|
    word2_chars.dup.each do |word2_ch|
      if word2_ch == word1_ch
        word2_chars.delete_at(word2_chars.find_index(word1_ch))
        word1_chars.delete_at(word1_chars.find_index(word1_ch))
        break
      end
    end
  end

  word1_chars.size == 0 && word2_chars.size == 0
end

def third_anagram?(word1, word2)
  word1.chars.sort! == word2.chars.sort!
end

def fourth_anagram?(word1, word2)
  count = Hash.new(0)
  word1.chars.each do |char|
    count[char] += 1
  end
  word2.chars.each do |char|
    count[char] -= 1
  end
  count.values.all? { |value| value == 0 }
end
