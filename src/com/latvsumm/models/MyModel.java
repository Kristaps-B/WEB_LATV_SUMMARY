package com.latvsumm.models;

import java.util.ArrayList;

import model.Sentence;
import model.SentenceComparison;
import model.SummModel;

public class MyModel {
	private String text;
	
	private int percents;
	
	private double [][] simMatrix;
	
	private SentenceComparison sentenceComparison;
	
	
	public int getPercents() {
		return percents;
	}

	public void setPercents(int percents) {
		if (percents >100) percents = 100;
		if (percents<0) percents = 0;
		this.percents = percents;
	}

	private ArrayList <Sentence> sentenceList = new ArrayList<>();
	private SummModel summModel = new SummModel();
	

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}
	
	
	public void summarize () {
		
		System.out.println("---------------------------------------");
		System.out.println("       Sâk veidot kopsavilkumu!        ");
		System.out.println("---------------------------------------");
		
		sentenceList = summModel.getSentenceList(text);
		
		summModel.getWordList(sentenceList);
		
		simMatrix = summModel.getSimilarityMatrix(sentenceList);
		
		sentenceList = summModel.getRankedSentences(sentenceList, simMatrix);
		
		
		
		//for (Sentence s: sentenceList) {
		//	System.out.println("Teikums: "+s.getID()+") "+s.getOriginalSentence()+" ["+s.getRank()+"]");
		//}
		
	}
	
	public ArrayList <Sentence> getSummaryList() {
		ArrayList <Sentence> result = new ArrayList<>();
		//percents = 60;
		
		if (percents >100) percents = 100;
		if (percents<0) percents = 0;
		
		//System.out.println("Izveletais kopsavilkuma apjoms ir: "+ percents+ " %");
		
		Sentence [] sentArray = summModel.getSummary(percents, sentenceList);
		
		for (Sentence s: sentArray) {
			result.add(s);
		}
		
		return result;
	}
	
	public double [][] getSimMatrix() {
		return simMatrix;
	}
	
	public void setSentenceComparison(int row, int col) {
		// Salidzina teikumus!
		sentenceComparison = new SentenceComparison(
				sentenceList.get(row), sentenceList.get(col));

	}
	
	public SentenceComparison getSentenceComparison() {
		//sentenceComparison.getFirstSentenceID();
		//sentenceComparison.getFirstSentence();
		
		//sentenceComparison.getW
		
		
		return sentenceComparison;
	}
}
