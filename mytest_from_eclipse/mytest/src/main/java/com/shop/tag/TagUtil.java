package com.shop.tag;

public class TagUtil {
    public static String escapeXml(String s)
    {
        if(s == null)
            return null;
        int i = 0;
        int j = s.length();
        char ac[] = s.toCharArray();
        StringBuffer stringbuffer = null;
        for(int k = 0; k < j; k++)
        {
            char c = ac[k];
            if(c <= '>')
            {
                char ac1[] = specialCharactersRepresentation[c];
                if(ac1 != null)
                {
                    if(i == 0)
                        stringbuffer = new StringBuffer(j + 5);
                    if(i < k)
                        stringbuffer.append(ac, i, k - i);
                    i = k + 1;
                    stringbuffer.append(ac1);
                }
            }
        }

        if(i == 0)
            return s;
        if(i < j)
            stringbuffer.append(ac, i, j - i);
        return stringbuffer.toString();
    }
    public static char specialCharactersRepresentation[][];
    static 
    {
        specialCharactersRepresentation = new char[63][];
        specialCharactersRepresentation[38] = "&amp;".toCharArray();
        specialCharactersRepresentation[60] = "&lt;".toCharArray();
        specialCharactersRepresentation[62] = "&gt;".toCharArray();
        specialCharactersRepresentation[34] = "&#034;".toCharArray();
        specialCharactersRepresentation[39] = "&#039;".toCharArray();
    }
}
