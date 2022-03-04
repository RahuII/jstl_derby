<%@ page import="java.io.*,java.util.*,java.sql.*"%>  
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>  
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
  
<html>  
<head>  
<title>sql:query Tag</title>  
</head>  
<body>  
    <c:catch var ="catchtheException">  
   
<sql:setDataSource var="db" driver="org.apache.derby.jdbc.ClientDriver"  url="jdbc:derby://localhost:1527/mefgi"  user="student"  password="123456"/>  
  
<sql:query dataSource="${db}" var="rs">  
SELECT * from STUDENT_DATA
</sql:query>  
    </c:catch>
<c:if test = "${catchtheException != null}">  
   <p>The type of exception is : ${catchtheException} <br />  
   There is an exception: ${catchtheException.message}</p>  
</c:if>  
<table border="2" width="100%">  
<tr>  
<th>Student ID</th>  
<th>First Name</th>  
<th>STUDENT DEPT</th>  
<th>STUDENT RESULT</th>  
</tr>  
<c:forEach var="table" items="${rs.rows}">  
<tr>  
<td><c:out value="${table.sid}"/></td>  
<td><c:out value="${table.sname}"/></td>  
<td><c:out value="${table.sdept}"/></td>  
<td><c:out value="${table.sresult}"/></td>  
</tr>  
</c:forEach>  
</table>  
  
</body>  
</html>  
