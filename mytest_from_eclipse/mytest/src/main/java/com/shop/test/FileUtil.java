package com.shop.test;

import java.io.File;

public class FileUtil {

	public void renameDirectory(String fromDir, String toDir) {

		File from = new File(fromDir);

		if (!from.exists() || !from.isDirectory()) {
			System.out.println("Directory does not exist: " + fromDir);
			return;
		}

		File to = new File(toDir);

		// Rename
		if (from.renameTo(to))
			System.out.println("Success!");
		else
			System.out.println("Error");

	}
}