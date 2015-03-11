package model;

import java.io.File;
import java.util.ArrayList;


public class SummModel {

	public String getFile(File file) throws Exception {
		String rez = null;

		FileLoader loader = new FileLoader();

		loader.loadFile(file);

		rez = loader.getFileContent();

		return rez;
	}

	public ArrayList<Sentence> getSentenceList(String text) {
		ArrayList<Sentence> rez = null;

		// Apstrada tekstu
		SentenceSplitter textProcessing = new SentenceSplitter(text);
		textProcessing.splitIntoSentences();

		rez = textProcessing.getSentenceList();

		return rez;
	}

	public double[][] getSimilarityMatrix(ArrayList<Sentence> sentenceList) {
		double[][] rez = null;

		SentSimMatrix simMatrix = new SentSimMatrix(sentenceList);
		simMatrix.createMatrix();

		rez = simMatrix.getSimMatrix();

		return rez;
	}

	public ArrayList<Sentence> getRankedSentences(
			ArrayList<Sentence> sentenceList, double[][] simMatrix) {
		ArrayList<Sentence> rez = null;

		// Veic textrank algoritmu
		TextRankSent textRank = new TextRankSent(simMatrix);
		textRank.startTextRank();

		double[] sentRank = textRank.getScoreVector();

		for (int i = 0; i < sentRank.length; i++) {
			sentenceList.get(i).setRank(sentRank[i]);
		}

		rez = sentenceList;

		return rez;
	}

	public Sentence[] getSummary(int n, ArrayList<Sentence> sentenceList) {
		Sentence[] rez = null;

		Summarizer summarizer = new Summarizer(sentenceList);

		int n_max = sentenceList.size();

		int proc = n;

		int summ_amount = (int) Math.round(n_max * (proc / 100.0));

		// System.out.println("Panem: "+n);

		Sentence[] sentArray = summarizer.getNSentences(summ_amount);

		rez = sentArray;

		return rez;
	}

	public SentenceComparison getSentenceComparison(Sentence s1, Sentence s2) {
		SentenceComparison rez = null;

		rez = new SentenceComparison(s1, s2);

		return rez;
	}

	public ArrayList<Word> getWordList(ArrayList<Sentence> sentenceList) {
		ArrayList<Word> result = null;

		WordListGenerator wordListGenerator = new WordListGenerator(
				sentenceList);

		wordListGenerator.generateWordList();

		result = wordListGenerator.getWordList();

		return result;
	}

}
