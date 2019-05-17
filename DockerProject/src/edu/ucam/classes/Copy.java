package edu.ucam.classes;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

public class Copy {

	
	 public static void copyDirectory(File source , File dest)
			    throws IOException {

			        if (source.isDirectory()) {
			            if (!dest.exists()) {
			                dest.mkdir();
			            }

			            String[] children = source.list();
			            for (int i=0; i<children.length; i++) {
			                copyDirectory(new File(source, children[i]),
			                        new File(dest, children[i]));
			            }
			        } else {

			            InputStream in = new FileInputStream(source);
			            OutputStream out = new FileOutputStream(dest);

			            // Copy the bits from instream to outstream
			            byte[] buf = new byte[1024];
			            int len;
			            while ((len = in.read(buf)) > 0) {
			                out.write(buf, 0, len);
			            }
			            in.close();
			            out.close();
			        }
			    }

	 
	 
}
