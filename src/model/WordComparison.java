package model;

public class WordComparison {

	private String[] wordBegining = { "aiz", "ap", "at", "bez", "caur", "ie",
			"iz", "ne", "no", "pa", "p�r", "p�c", "pie", "pret", "sa", "uz",
			// Ne
			"neaiz", "neap", "neat", "nebez", "necaur", "neie", "neiz", "neno",
			"nepa", "nep�r", "nep�c", "nepie", "nepret", "nesa", "neuz" };

	private String[] wordEnding = {
			// Pamata galotnes
			"s", "�", "is", "us", "a",
			"e",
			// Locijumu galotnes
			// Nom
			"i", "as", "es", "�s", "ies",
			// �en
			"u", "os",
			// Dat
			"am", "iem", "im", "um", "ai", "�m", "ei", "�m", "ij", "�m", "�m",
			// Akuz
			"l", "iu",
			// Lok
			"�", "�", "�",
			"�s",
			"�s",
			// Vok
			// .....
			// Darb�bas v�rdi
			"t", "o", "in�", "a��", "al�", "el�", "u�o",
			// �pa��bas v�rdi
			"ajam", "ais", "ai", "ajai", "aj�", "iem", "ajiem", "ajos", "os",
			"aj�m", "aj�", "aj�s" };

	private String getCommonLongestSubstring(String word1, String word2) {
		String commonSubstring = null;

		word1 = word1.toLowerCase();
		word2 = word2.toLowerCase();

		commonSubstring = longestCommonSubstring(word1, word2);

		return commonSubstring;
	}

	private String longestCommonSubstring(String S1, String S2) {
		int Start = 0;
		int Max = 0;
		for (int i = 0; i < S1.length(); i++) {
			for (int j = 0; j < S2.length(); j++) {
				int x = 0;
				while (S1.charAt(i + x) == S2.charAt(j + x)) {
					x++;
					if (((i + x) >= S1.length()) || ((j + x) >= S2.length()))
						break;
				}
				if (x > Max) {
					Max = x;
					Start = i;
				}
			}
		}
		return S1.substring(Start, (Start + Max));
	}

	public boolean isSameWords(String word1, String word2) {
		// Ja vien�di v�rdi
		if (word1.equals(word2))
			return true;

		String commonSubstring = getCommonLongestSubstring(word1, word2);

		if (commonSubstring.length() < 2)
			return false;

		/*
		 * if (commonSubstring.length()>=word1.length()*0.75 ||
		 * commonSubstring.length()>=word2.length()*0.75) { return true; }
		 */

		// Ja nav vien�di p�rbauda t�l�k

		// Sadala p�c kopej�s virknes
		String w1_begining = mySplit(word1, commonSubstring)[0];
		String w1_ending = mySplit(word1, commonSubstring)[1];

		String w2_begining = mySplit(word2, commonSubstring)[0];
		String w2_ending = mySplit(word2, commonSubstring)[1];


		if (isValidWordBegining(w1_begining)
				&& isValidWordBegining(w2_begining)
				&& isValidWordEnding(w1_ending) && isValidWordEnding(w2_ending))
			return true;

		return false;
	}

	public String[] mySplit(String originalWord, String splitter) {
		String[] result = new String[2];

		int startPos = originalWord.indexOf(splitter);
		int endPos = startPos + splitter.length();

		result[0] = originalWord.substring(0, startPos);
		result[1] = originalWord.substring(endPos, originalWord.length());

		return result;
	}

	public boolean isValidWordBegining(String word) {
		if (word.length() == 0)
			return true;

		for (String w : wordBegining) {
			if (w.equals(word))
				return true;
		}

		return false;
	}

	public boolean isValidWordEnding(String word) {
		if (word.length() == 0)
			return true;

		for (String w : wordEnding) {
			if (w.equals(word))
				return true;
		}

		return false;
	}
}
