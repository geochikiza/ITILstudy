<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Access SOA Questions</title>
</head>
<body>
<%


UserID=Request.Form("UserID")
Password=Request.Form("Password")

If UserID = "Admin_SOAQues" And Password = "SOAadmin132#" Then

	Session("Access") = "Granted-1134"

	Response.Redirect("/writequesSOA.asp")

Else

%>

  <b>Please enter your UserID and Password to access questions</b><br>
  <br>
  <form name="one" action="/access_SOAques.asp" method="post">
    User Name:
    <input type="text" size="20" name="UserID">
    <br>
    <br>
    Password:
    <input type="password" size="20" name="Password">
    <br>
    <br>
    <input type="submit" value="Submit">
  </form>
<% End If %>
</body>
</html>
