def deflate(words, dictionary):
    return sum([(([dictionary.index(word)] if word in dictionary else dictionary.append(word) or [dictionary.index(char) for char in word]) + [dictionary.index(" ")]) for word in words], [])[0:-1], dictionary

