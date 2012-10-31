<%@ Language = "VBScript" %>
<%
 'Written By : Bharath'
 'Created Date: 12/11/2007'
 'Modified By : Bharath'
 'Last UpaDated: 25/02/2011'
 'Description :'
 'Purpose : Sending Payment Received Email'
%>
<%
   If Session("UserId")  = "" Then
     Response.Redirect("../login.asp")
   Else
%>
<!--#include virtual="/india/connection.asp"-->
<!--#include virtual="/includes/displayFormat.asp"-->
<%
''Declare The Variables
Dim rqEnrollUserId
Dim rqFirstName
Dim rqLastName
Dim rqType
Dim subject
Dim body
Dim rqTempNo
Dim StrQuery1,strQuery2
Dim FirstName
Dim LastName
Dim EmailId
Dim rqEnrollEmailId
Dim CourseDate,str,startDate,i,sstartDate
Dim Rs1
Dim todaysDate
Dim rqEmail,rqPhoneNumber,rqNameOfEmployeer,rqCourseDetails,dtax,coursePrice
Dim Total,Date2
Dim str1,str2,Price,rqSendEmail,City,rqCity

set Rs1 = Server.CreateObject("ADODB.Recordset")
set Rs2 = Server.CreateObject("ADODB.Recordset")
Set Rs3 = Server.CreateObject("ADODB.Recordset")

Function StrQuoteReplace(strValue)
   StrQuoteReplace = Replace(strValue, "'", "")
End Function


'Retirve The EnrolledUSerId From Courses.asp Page'

rqEnrollUserId  =  Request.Querystring("enrollUserId")

'Currency Format Display Functions'

 Currency_Format_Front = CurrencyFormat_Front(Session("Country"))

 Currency_Format_Back = CurrencyFormat_Back(Session("Country"))
					 
'Sql Query For Retive the Firstname, Lastname and Emailid'

strQuery = "SELECT id,firstname,lastname,email,nameofemployeer,phoneno,coursedate,coursedetails,pmbok,courseid,amount , VAT, VAT_Invoice from ITIL_enrolledusers WHERE id = '" & rqEnrollUserId & "'"

Rs.Open strQuery,Conn

Do Until Rs.EOF

 Session("ID") = Rs("id")
 Session("FirstName") = Rs("firstname")
 Session("Lastname")  = Rs("lastname")
 Session("EmailId")   = Trim(Rs("email"))
 Session("NameOfEmployer")   = StrQuoteReplace(Rs("nameofemployeer"))
 Session("PhoneNo")   = Rs("phoneno")
 Session("Coursedetails")   = Rs("coursedetails")
 Session("EmailId")   = Rs("email")
 Session("CourseDate") = Rs("coursedate")
 Session("PMBOK") = Rs("pmbok")
 Session("courseid") = Rs("courseid")
'Session("Total") = Rs("amount")
 Session("DisAmount") = Rs("Amount")
 Session("VATInvoice") = Rs("VAT_Invoice")
 
 
  'If (Session("country") = "United Kingdom" OR Session("country") = "India") Then
  If (Session("country") = "United Kingdom" OR Session("country") = "India") Then
							
	If Not IsNull(Rs("VAT")) Then
	
	VAT = Rs("VAT")
	
	Else
	
	VAT = 0
	
	End If
	
	Session("Total") = Int(Rs("Amount")) + Int(VAT)
	
	Session("DisAmount") = Rs("Amount")
	Session("VAT") = VAT
	
 Else 

	Session("Total") = Rs("Amount")
	
 End If

 
Rs.Movenext
Loop

Rs.Close

'SQL Query For Retrieve The Prices and Put Into Email'

 strQuery1 = "SELECT * FROM ITIL_course Where courseid = '" & Session("courseid") & "'"

 Rs1.Open strQuery1,conn

 Do until Rs1.EOF
	
	StartDate = Rs1("startdate")
	EndDate   = Rs1("enddate")
	City      = Rs1("city")
	Tax = Rs1("tax")

 Rs1.movenext
 Loop
 
 Rs1.Close

rqType = Request.QueryString("type")


 subject="Payment Receipt: " & City & " program"

  body = "<table width=""100%"" bordrer=""1"" bgcolor=""#CCCCCC"" style=""margin:0px;0px;0px;0px;""><tr><td height=""45px"">&nbsp;</td></tr><tr><td><table width=""600"" border=""0"" align=""center"" cellpadding=""2"" cellspacing=""12"" bgcolor=""#FFFFFF""><tr><td width=""600px"" bgcolor=""#FFFFFF""><span><img src=""http://www.itilstudy.com/images/banners/Email-Header.jpg"" alt=""ITILstudy"" width=""600px"" height=""103"" /></span></td></tr>"
  body = body & "<tr><td><table align=""center"" border=""0"" width=""580px""><tr><td align=""center""><font face=""Arial"" size=""3"" color=""#0359b4""><b>"
   If (Session("country") = "United Kingdom") Then
  body = body & "VAT Invoice (Payment Receipt)" 
  Else
  body = body & "Payment Receipt"   
  End If
  body = body & "</b></font></td></tr>"
  body = body & "<tr><td align=""right"" colspan=""2""><font face=""Arial"" size=""2""><b>" & FormatDateTime(Now(),1)
  'If (Session("country") = "United Kingdom" OR Session("country") = "Germany") Then
  If (Session("country") = "United Kingdom") Then
   If VAT <> "" AND VAT <> 0 Then
  body = body & "<br>Invoice#: ITIL" & Session("VATInvoice")
  End If
  End If
  body = body & "</b></font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Enroll ID : " & Session("ID") & "</font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name : " & Session("FirstName") & "&nbsp; " & Session("Lastname") & "</font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Email : " & Session("EmailId") & " </font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Phone Number : " & Session("PhoneNo") & "</font></td></tr>"
  body = body & "<tr><td align=""left""><font face=""Arial"" size=""2"">Name of Employer/Business : " & Session("NameOfEmployer") & "</font></td></tr>"
  body = body & "<tr><td align=""left""><br><font face=""Arial"" size=""2"">Thank you for enrolling in ITILstudy.com Classroom Training Program.</font></td></tr>"
  body = body & "<tr><td align=""left"" colspan=""2""><br><font face=""Arial"" size=""2"">Details of your course and Payment:</font><br><table border=""1"" cellspacing=""0"" align=""center"" width=""570px"">"
  body = body & "<tr><td width=""60%""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Details</font></b></td><td width=""15%"" align=""center""><b><font face=""Arial"" size=""3"" color=""#0359b4"">Payment</font></b></td></tr>"
  body = body & "<tr><td><font face=""Arial"" size=""2""><b>ITIL Classroom Training Program"
 ' If Session("country") = "India" Then 
'  body = body & "2 "
'  Else 
'  body = body & "4 "
'  End If  
  body = body & " <br>" & Session("Coursedetails") & "</b>"
   body = body &"</td><td align=""center""><font face=""Arial"" size=""2""><b>"
  body = body & Currency_Format_Front & " " & FormatNumber(Session("DisAmount")) & " " & Currency_Format_Back
  body = body &"</b></td></tr>"
  'If (Session("country") = "United Kingdom" OR Session("country") = "India") Then
  If (Session("country") = "United Kingdom"  OR Session("country") = "India") Then
  If VAT <> "" AND VAT <> 0 Then
  If (Session("country") = "United Kingdom") Then
  body = body &"<tr><td><font face=""Arial"" size=""2""><b>VAT @ " & Tax & "%</b></font></td><td  align=""center""><font face=""Arial"" size=""2""><b>" & Currency_Format_Front & " "& FormatNumber(Session("VAT")) &"</b></font></td></tr>"
  ElseIf (Session("country") = "India") Then
  body = body &"<tr><td><font face=""Arial"" size=""2""><b>" & Tax & "% tax</b></font></td><td  align=""center""><font face=""Arial"" size=""2""><b>" & Currency_Format_Front & " "& FormatNumber(Session("VAT")) &"</b></font></td></tr>"  
  End If
  End If
  End If
  body = body & "<tr><td colspan=""2"">&nbsp;</td></tr>"
  body = body & "<tr><td><font face=""Arial"" size=""2""><b>Total</b></font></td><td align=""center""><font face=""Arial"" size=""2""><b>"
  body = body & Currency_Format_Front & " " & FormatNumber(Session("Total")) & " " & Currency_Format_Back
  body = body & "</b></font></td></tr></table><br></td></tr>"
  'If (Session("country") = "United Kingdom" OR Session("country") = "India") Then
  If (Session("country") = "United Kingdom") Then
  If VAT <> "" AND VAT <> 0 Then
  body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br><font face=""Arial"" size=""2"">VAT registration number - "
  If (Session("country") = "United Kingdom") Then
  body = body & "GB 117 6616 13"
  End If	
  body = body & "</font></td></tr>"
  End If
  End If
    
  body = body & "<tr><td align=""left"" colspan=""2"" align=""center""><br><font face=""Arial"" color = ""green"" size=""3""><b>We look forward to having you as a delegate with ITILstudy.com!!!</b></font></td></tr>"
  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>We acknowledge with thanks receipt of your cheque number -------------- dated ----------- towards the course fee for ITILstudy Classroom Training Program  to be held on <b>"& FormatDateTime(StartDate,1) &"</b></font></td></tr>"
  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>For ITILstudy Classroom Training Program terms and conditions, please visit the link - <a href=""http://www.itilstudy.com/termsAndConditions.asp"" target=""_blank"">http://www.itilstudy.com/termsAndConditions.asp</a>.</font></td></tr>"
  
  body = body & "<tr><td align=""left"" colspan=""2""><font face=""Arial"" size=""2""><br>We look forward to your participation in our ITILstudy Classroom Training Program.</font></td></tr>"  
 
  body = body & "<tr><td colspan=""3""><br><font face=""Arial"" size=2><b>Best Regards,</b></td></tr>"
  
  body = body & "<tr><td colspan=""3""><br><font face=""Arial"" size=2>Customer Support</td></tr>"
  
  body = body & "<tr><td colspan=""3""><font face=""Arial"" size=2>ITILstudy.com</td></tr></table></td></tr><tr height=""30px""><td align=""center""><font face=""Arial"" size=2 style=""color:#808080"">"
   If (Session("country") = "United Kingdom" ) Then
  body = body & "Edusys Services Pvt. Ltd.<br> 1-3 Floor, 124 Baker Street, London - W1U 6TY, England"
  Else 
  body = body & "&nbsp;"
  End If
  body = body & "</font></td></tr></table></td></tr><tr height=""45px""><td>&nbsp;</td></tr></table>"

	   
If rqType = "preview" then
	
'Retrive The EnrollUserId,subject and body from this Page'

   rqEnrollUserId = Request.Form("enrollUserId")
   rqCity = Request.Form("city")
   rqSubject = Request.form("subject")
   body    = Request.form("QueryReply")

End If

'Send Email'

if rqType = "sendmail" Then

   Dim objCDOMail
   Dim rqBody
   Dim rqSubject

'Retrive The enrolluserid from this page'  
 
   rqEnrollUserId = Request.Form("enrolluserid")
   rqCity = Request.Form("city")
   rqBody    =  Request.Form("body")
   rqSubject =  "Payment Receipt: " & rqCity & " program"
   rqSendEmail = Request.Form("emailid")

	If Session("country") = "US" OR Session("country") = "Canada" Then
	
		'Retriving the state from ps_city based on city'
		strState = "SELECT state FROM ITIL_city WHERE city = '"& rqCity &"'"
		
		Response.Write(strState)
		Rs1.Open strState,Conn
		
		Do Until Rs1.EOF
		
			facstate = Rs1("state")
							
		Rs1.Movenext
		Loop
		Rs1.Close
	
	
	
	End If   

	Set objCDOMail = Server.CreateObject("CDONTS.NewMail")

	objCDOMail.From = "marketing@itilstudy.com"

	objCDOMail.To =  rqSendEmail
	
	'If Session("country") = "India" Then
	objCDOMail.Cc = "marketing@itilstudy.com , marketing@PMstudy.com"
	'Else
	'objCDOMail.Cc = "marketing@itilstudy.com"
	'End If
	
	objCDOMail.Bcc = "satpathyt@gmail.com"
	
	'Importance of the e-mail (0=Low, 1=Normal, 2=High)
	
	objCDOMail.Importance = 2
	
	objCDOMail.Subject = rqSubject

	objCDOMail.BodyFormat = 0

	objCDOMail.MailFormat = 0

	objCDOMail.Body = rqBody

	objCDOMail.Send

	Set objCDOMail = Nothing
	
'Sql Query For If You Send Email I am entering into database 1 for in courses.asp Page we want display a message "Check received email sent"'

    strQuery2 = "Update ITIL_enrolledusers Set checkrecmailsent = '1' where  id = '" & rqEnrollUserId & "'"
	
    Rs2.Open strQuery2,Conn
	
    Response.write("Successfully send mail")
    
	
Else


%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Payment Received Mail</title>
<link href="../../css/pagestyle.css" rel="stylesheet" type="text/css" />
</head>
<body>
<div id="htMap">
  <table width="700" height="580" border="1" align="center" cellpadding="0" cellspacing="0" bordercolor="#00B0EC" class="dbborder" >
    <tr>
      <td width="547" valign="top"><table width="100%" cellspacing="0" cellpadding="2">
          <form id="form1" name="form1" method="post" action="paymentreceivedemail.asp?type=preview">
            <input type="hidden" name="enrollUserId" value="<%= rqEnrollUserId %>" />
            <input type="hidden" name="city" value="<%= City %>" />
            <tr>
              <td colspan="2" bgcolor="#00B0EC">Send Payment Received Mail </td>
            </tr>
            <tr class="rowEven">
              <td width="28%">To : </td>
              <td width="72%"><% = Session("FirstName") %>
                &nbsp;
                <% = Session("LastName") %>
                <
                <% = Session("EmailId") %>
                ></td>
            </tr>
            <tr class="rowOdd">
              <td>Subject : </td>
              <td><% = subject %></td>
            </tr>
            <tr class="rowEven">
              <td colspan="2"><textarea name="QueryReply" cols="90" rows="25"><%= body %></textarea>
              </td>
            </tr>
            <tr class="rowEven">
              <td>&nbsp;</td>
              <td></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input name="Submit" type="submit" class="buttonm" value="Preview" /></td>
            </tr>
          </form>
          <form  method="post" action="paymentreceivedemail.asp?type=sendmail">
            <input type="hidden" name="body" value='<%= body %>' />
            <input type="hidden" name="enrolluserid" value="<%= rqEnrollUserId %>" />
            <input type="hidden" name="emailid" value="<%= Session("EmailId") %>" />
            <input type="hidden" name="city" value="<%= rqCity %>" />
            <tr class="rowEven">
              <td colspan="2">&nbsp;</td>
            </tr>
            <tr class="rowEven">
              <td colspan="2" bgcolor="#00B0EC">Send Mail </td>
            </tr>
            <tr class="rowEven">
              <td>&nbsp;</td>
              <td></td>
            </tr>
            <tr class="rowOdd">
              <td colspan="2" align="center"><input type="submit" class="buttonm" name="sendmail" value="Send Mail" />
              </td>
            </tr>
          </form>
          <tr class="rowEven">
            <td colspan="2">&nbsp;</td>
          </tr>
        </table></td>
    </tr>
    <% if rqType = "preview" Then %>
    <tr>
      <td colspan="3"><%Response.write(subject & "<br/><br/>")
				Response.write(body)%></td>
    </tr>
    <% End If %>
  </table>
</div>
</body>
</html>
<%	End If
End If
%>
