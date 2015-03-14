package model;

import java.util.ArrayList;

public class SentenceSplitter {

	private String text = null;

	private ArrayList<Sentence> sentenceList = new ArrayList<>();

	public SentenceSplitter(String text) {
		this.text = text;

	}

	public void splitIntoSentences() {
		String sentence = "";

		int id = 1;
		int charNumbInSent = 0;

		for (int i = 0; i < text.length(); i++) {
			char character = text.charAt(i);

			// Sadala teikumos ar naivu pieeju, neizmantojot regexus!
			if (character != '\n' && character != '\r' ) 
			{

				sentence += character;
				
				//System.out.println((int)character);
				
				charNumbInSent++;
				if (isSentenceEnd(text, i) && charNumbInSent >3  && sentence.length() > 0) {
					sentence = sentence.trim();
					//System.out.println(charNumbInSent+") "+sentence);
					sentenceList.add(new Sentence(id, sentence));

					id++;

					sentence = "";
					charNumbInSent = 0;
				}

			}

		}
		
		
	}

	private boolean isSentenceEnd(String text, int i) {
		char character = text.charAt(i);
		
		if (i == text.length() -1) {
			return true;
		}
		else if (text.charAt(i + 1) == '\n' || text.charAt(i + 1) == '\r') {
			return true;
		}
		else if (character =='!') {
			return true;
		}
		else if (character == '?') {
			return true;
		}
		if (character == '.') {
			// Vai beigas
			if (i == text.length() - 1) {
				return true;
			} //else if (Character.isUpperCase(text.charAt(i - 1))
			//		&& text.charAt(i - 2) == ' ') {
			//	return false;
			//}
			else if (!Character.isDigit(text.charAt(i - 1))
					&& Character.isUpperCase(text.charAt(i + 2))
					&& text.charAt(i + 1) == ' ') {
				return true;
			} 
			else if (!Character.isDigit(text.charAt(i - 1))
					&& Character.isUpperCase(text.charAt(i + 1))
					&& text.charAt(i + 1) != ' ') {
				return true;
			}
			else if (text.charAt(i+1) == '"') {
				return true;
			}
			else if (text.charAt(i+1) == ' ' 
					&& isQuatation(text.charAt(i+2))
					&& Character.isUpperCase(text.charAt(i+3))) {
				return true;
			}
			
			

		}

		return false;
	}
	
	private boolean isQuatation(char c) {
		if (c == '"' || c == '»' || c=='«') {
			return true;
		} else
		return false;
	}

	public ArrayList<Sentence> getSentenceList() {
		return sentenceList;
	}
}
