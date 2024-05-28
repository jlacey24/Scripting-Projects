#!/usr/bin/env python3

def wordOccur(wordlist):
    
	# create an empty dictionary
	frequency = {}
 
	# for loop to count the words and find the frequency
	for word in wordlist:
		frequency[word] = wordlist.count(word)
  
	# for loop to print the value (word) and the key (occurance)
	for word, occur in frequency.items():
	    print("%s %s" % (occur, word))

def main():
	# create a word list from user input
	wordlist = [item for item in (input("Enter string: ")).lower().split()]
	wordOccur(wordlist)

if(__name__ == '__main__'):
	main()