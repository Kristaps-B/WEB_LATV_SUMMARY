package com.latvsumm.models;


import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;

import opennlp.tools.dictionary.Dictionary;
import opennlp.tools.sentdetect.SentenceDetectorME;
import opennlp.tools.sentdetect.SentenceModel;
import opennlp.tools.util.InvalidFormatException;

import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;






import model.OneWord;
import model.Sentence;
import model.SentenceComparison;
import model.SummModel;
import model.Word;
import model.WordComparison;

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
	
	private SentenceDetectorME createOpenNLP() {
		System.out.println("Izveido OPEN-NLP");
		
		SentenceModel mod = null;
		SentenceDetectorME sentenceDetector = null;
		
		Resource resource = new ClassPathResource("lv-sent.bin"); 
		InputStream modelIn = null;
		try {
			
			modelIn = new FileInputStream(resource.getFile());
			mod = new SentenceModel(modelIn);
			
			System.out.println("Ielade!");
			
			   
			sentenceDetector = new SentenceDetectorME(mod);
			Dictionary d = mod.getAbbreviations();
			System.out.println(d.size());
			
			/*
			String [] s = sentenceDetector.sentDetect("Adsfd. asfds asdfsdf.");
			
			for (String t:s) {
				System.out.println(t);
			}*/
		
			
		} catch (FileNotFoundException e) {
			System.out.println("Fails netika atrasts: "+e.toString());
		} 
		
		catch (InvalidFormatException e) {
			System.out.println("Invalid format: "+e.getMessage());
		}
		catch (IOException e) {
			System.out.println("IOException: "+e.getMessage());
		} 
		
		return sentenceDetector;
	}
	
	public void summarize () {
		
		System.out.println("---------------------------------------");
		System.out.println("       Sâk veidot kopsavilkumu!        ");
		System.out.println("---------------------------------------");
		
		SentenceDetectorME sd = createOpenNLP();
		
		sentenceList = summModel.getSentenceList(text, sd);
		
		
		
	
		
		simMatrix = summModel.getSimilarityMatrix(sentenceList);
		
		sentenceList = summModel.getRankedSentences(sentenceList, simMatrix);
		
		
		
	
		
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
	
	public ArrayList <Sentence> getSentences() {
		
		
		//sentenceList.get(0).;
		//sentenceList.get(0).getNewSentence()
		//sentenceList.get(0).ge
		
		return sentenceList;
	}
	
	public ArrayList <ArrayList<Double>> getIterList() {
		
		return summModel.getIterList();
	}
}
