package com.shop.test;



public class GeneratorTest {
	public static void main(String[] args) {
    	IdGen id = IdGen.get();
    	for(int i=0;i<20;i++){
    	long a=id.nextId();
    	System.err.println(a);
    	}
	}
}