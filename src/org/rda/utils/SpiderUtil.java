package org.rda.utils;
import Spider.GetArticles;
import Spider.UtilMethod;
public class SpiderUtil {
	public void scratch(){
		GetArticles ga =new GetArticles();
		ga.setPath("D:\\Spider","D:\\Spider", "D:\\Spider");
		UtilMethod um = new UtilMethod();
		um.setPath("D:\\Spider","D:\\Spider");
		ga.Test();
	}
}
