<!--#include virtual="/includes/connection.asp"-->
<% If Session("FirstName") = "" Then 
response.Redirect("/memberlogin.asp")
Else
%>

<% 
'Declaring varaible
Dim strKNo,strChapter,strNoofQues,objRs1,objRs,questionNo

Set objRs=Server.CreateObject("ADODB.Recordset")
Set objRs1=Server.CreateObject("ADODB.Recordset")

'Retriving Kno and assigning to session '

If Request.QueryString("KNo") <> "" Then

	strKNo = Request.QueryString("KNo")

	Session("KNo") = strKNo
	
Else

	Session("KNO") = Session("KNo")
	
	End If 


 If Session("State") = "verified1" OR Session("State") = "verified2" OR Session("State") = "verified3" OR Session("State") = "verified5" OR Session("State") = "verified6" OR Session("State") = "verified7" OR Session("State") = "verified4" OR Session("State") = "verified13"  Then 
 
	strKNo="SELECT COUNT(*) as QuestionNo FROM Question_ITILDB  WHERE KNo = '" & Session("KNO") &"'"
	
	ElseIf Session("State") = "verified9" Then
	
		strKNo="SELECT COUNT(*) as QuestionNo FROM Question_CSIDB  WHERE KNo = '" & Session("KNO") &"' "
		
		ElseIf Session("State") = "verified11" Then
	
		strKNo="SELECT COUNT(*) as QuestionNo FROM Question_OSADB  WHERE KNo = '" & Session("KNO") &"' "
		
		ElseIf Session("State") = "verified14" Then
	
		strKNo="SELECT COUNT(*) as QuestionNo FROM Question_StrategyDB  WHERE KNo = '" & Session("KNO") &"' "
		
		ElseIf Session("State") = "verified15" Then
	
		strKNo="SELECT COUNT(*) as QuestionNo FROM Question_TransitionDB  WHERE KNo = '" & Session("KNO") &"' "
		
		ElseIf Session("State") = "verified16" Then
	
		strKNo="SELECT COUNT(*) as QuestionNo FROM Question_DesignDB  WHERE KNo = '" & Session("KNO") &"' "
		
		ElseIf Session("State") = "verified17" Then
	
		strKNo="SELECT COUNT(*) as QuestionNo FROM Question_OperationDB  WHERE KNo = '" & Session("KNO") &"' "
		
		ElseIf Session("State") = "verified18" Then
	
		strKNo="SELECT COUNT(*) as QuestionNo FROM Question_PPODB  WHERE KNo = '" & Session("KNO") &"' "
		
		ElseIf Session("State") = "verified19" Then
	
		strKNo="SELECT COUNT(*) as QuestionNo FROM Question_SOADB  WHERE KNo = '" & Session("KNO") &"' "
		
		ElseIf Session("State") = "verified20" Then
	
		strKNo="SELECT COUNT(*) as QuestionNo FROM Question_RCVDB  WHERE KNo = '" & Session("KNO") &"' "
		
		End If
	'response.Write(strKNo)

objRs.open strKNo,ConnObj

If Not objRs.EOF Then
	arrAllCourses = objRs.getrows
	Session("arrAllCourses") = arrAllCourses
	numRows = Ubound(arrAllCourses,2)
	firstRow = 0
	lastRow = numRows
End If
'response.Write(strCourses)


'Creating a drop down for the values in the chapterTestsIndex.asp page'
				  
Response.Write("<tr><td class=""general-body"" width=""45%"">Select number of questions to work on:</td><td width=""70%""><select name=""NoofQues"" class=""TeXtFielddropdown"" style=""width:50px;"">")



	iCount = 0
	
	If IsArray(arrAllCourses) Then
	For rowCounter = firstRow to lastRow			
		 questionNo = arrAllCourses(0,rowCounter)
					

			
			         str = " <option"
					   If 5 <= questionNo Then
					   str = str & " selected=""selected"""
					    Else 
						str = str & " disabled=""disabled"""
                         End If 
                        str = str & "VALUE=""5"">5</option>"
						
						str = str & " <option"
					   If 10 <= questionNo Then
					   str = str & " selected=""selected"""
					    Else 
						str = str & " disabled=""disabled"""
                         End If 
					 str = str & "VALUE=""10"">10</option>"
					 
					 str = str & " <option"
					   If 15 <= questionNo Then
					   str = str & " selected=""selected"""
					    Else 
						str = str & " disabled=""disabled"""
                         End If 
					 str = str & "VALUE=""15"">15</option>"
					 
					 str = str & " <option"
					   If 20 <= questionNo Then
					   str = str & " selected=""selected"""
					    Else 
						str = str & " disabled=""disabled"""
                         End If 
					 str = str & "VALUE=""20"">20</option>"
					 
					 str = str & " <option"
					   If 25 <= questionNo Then
					   str = str & " selected=""selected"""
					    Else 
						str = str & " disabled=""disabled"""
                         End If 
					 str = str & "VALUE=""25"">25</option>"
					 
					
			Response.Write(str)
	iCount = iCount +1 
	
	Next
	End If	
	


Response.Write("</select></td></tr>")
%>
<% 	End If %>
