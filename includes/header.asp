<!--#include virtual="/includes/URLRedirection.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<link rel="shortcut icon" href="/images/buttons/favicon.ico">

<link rel="stylesheet" type="text/css" href="/css/chromestyle.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
    <style type="text/css">
        span.floatRight {
        float:right;
        margin: 15px 10px 10px 10px;
        display:inline-block;
        }
    </style>

<script type="text/javascript" src="/js/chrome.js"></script>
<style type="text/css"></style>
<script type="text/JavaScript">
<!--
function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}

function getCountry() {

    document.forms["myform"].submit();

}
-->
</script>
<script language="JavaScript" type="text/javascript" src="/js/jquery-1.7.2.js"></script>
  <%If not trim(session("current_user_id")) = "" then %>
 <script type="text/javascript">
			  $(function(){
			  $('#dropmenu2').append('<a href="/Mycourses.asp" onmouseover="MM_swapImage("b","","/images/back/link_02_courses_enroll_green.jpg",1)" onmouseout="MM_swapImgRestore()">My Courses</a>')
			  })
			  </script>
			  <%end if %>
<%
dim Isfblogin
Isfblogin=true 'make it false if facebook login not required in yr site
%>
<% If(Session("CountryOrigin")="United Kingdom") Then %>
<!--Script to record the mouse movement of users on website-->
<script type="text/javascript">
document.write(unescape("%3Cscript src='" + (("https:" == document.location.protocol) ? "https" : "http") + "://cdn.mouseflow.com/projects/46bfe97f-a3a7-4871-8ea4-4f2204f4f235.js' type='text/javascript'%3E%3C/script%3E"));
</script>

<% End If %>

<%
If Request.Form("countryName") <> "" Then
	Session("CountryOrigin") = Request.Form("countryName")
Else
	Session("CountryOrigin") = Session("CountryOrigin")
End If

If(Session("CountryOrigin")<>"") Then

'If(Session("CountryOrigin")="Germany") Then
'
'Response.Redirect("/indexde.asp")
'
''ElseIf(Session("CountryOrigin")="United Kingdom") Then
'
''Session("CountryOrigin")= ""
'
''Response.Redirect("http://www.projstudy.com/indexuk.asp")
'
'
'End If

'Session("CountryOrigin")= "United Kingdom"

%>
<% Else %>


<!--#include virtual="/includes/headerConnection.asp"-->
<%

					Dim sIPAddress, objHtp, strQuery11


						sIPAddress = Request.ServerVariables("HTTP_X_FORWARDED_FOR")

						If sIPAddress="" Then sIPAddress = Request.ServerVariables("REMOTE_ADDR")


						strQuery11 = "http://geoip.maxmind.com/b?l=4tAUhyTgUD6d" & _
							"&i=" & sipaddress
						set objHtp = Server.CreateObject("Msxml2.ServerXMLHTTP")
						objHtp.open "GET", strQuery11, false
						objHtp.send
						sipAddress = sipAddress + ";" + objHtp.ResponseText

					ConnObj1.Execute "INSERT INTO countrydetails (other, created_date, source_from) values('"&sIPAddress&"','"&now()&"', '"& Session("CountryOrigin") &"')"


If InStr(sipAddress,"IN") Then
	Session("CountryOrigin")="India"
	End If

If InStr(sipAddress,";US,") Then
		Session("CountryOrigin") = "US"
	End If

If InStr(sipAddress,";CA,") Then
		Session("CountryOrigin") = "Canada"
	End If

If InStr(sipAddress,";SG,") Then
		Session("CountryOrigin") = "Singapore"
	End If

If (InStr(sipAddress,";AU,")) Then
		Session("CountryOrigin") = "Australia"
	End If

If InStr(sipAddress,";AE,") Then
		Session("CountryOrigin") = "UAE"
	End If

If InStr(sipAddress,";SA,") Then
		Session("CountryOrigin") = "Saudi Arabia"
	End If


If (InStr(sipAddress,";GB,") OR InStr(sipAddress,";UK,")) Then
		Session("CountryOrigin") = "United Kingdom"
		'Response.Redirect("http://www.projstudy.com")
	End If

If InStr(sipAddress,";DE,") Then
		Session("CountryOrigin") = "Germany"
		'Response.Redirect("/indexde.asp")
	End If

If InStr(sipAddress,";NL,") Then
		Session("CountryOrigin") = "Netherlands"
	End If

If Session("CountryOrigin")="" Then
		Session("CountryOrigin")="Other"
	End If

Set objHtp = Nothing
Set ConnObj1 = Nothing

End If
%>
<!--Google Analytic code -->
<script type="text/javascript">

  var _gaq = _gaq || [];
  _gaq.push(['_setAccount', 'UA-11335447-11']);
  _gaq.push(['_trackPageview']);

  (function() {
    var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
    ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
    var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
  })();

</script>

</head>
<body bgcolor="#CCCCCC" vlink="#0099CC" leftmargin="0" topmargin="0" onload="MM_preloadImages('/images/back/link_01_why_us_green.jpg','/images/back/link_02_courses_enroll_green.jpg','/6sigmastudyimages/back/link_03_free_resources_green.jpg','/images/back/link_04_methodology_green.jpg','/images/back/link_05_about_us_green.jpg','/images/back/link_06_login_green.jpg')">
<div align="center" class="MainTableBack" style="width:100%;">

<!-- Header Start -->
<div align="center" style="margin-top:-12px;" >
<div style="width:930px;" align="center">
  <table width="930" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><div align="right">
        <table width="930" border="0" cellspacing="0" cellpadding="0">
          <tr><td><% If Session("CountryOrigin") = "Germany" Then %>
           <!--<td width="220">&nbsp;</td>-->
            <% Else %>
           <!--<td width="320">&nbsp;</td>-->
             <% End If %>

              <!--When aligned to right , need to put last coming content to first-->

              <span class="floatRight">
              <span class="style1"><a href="/index.asp">Home</a> | <a href="/contactus.asp">Contact</a>  | <a href="/sitemap.asp">Sitemap</a>
              <%If(Session("FirstName")<>"") Then%>
              | <a href="/Mycourses.asp">My Account</a>
              <%Else%>
             | <a href="/memberlogin.asp">Sign In</a>
              <%End If%>
              </span>
                   <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then %>
<% If Session("FirstName") <> "" Then %>
                |
                  <a href="/logoff.asp">Sign Out</a>
                  <%End If
                      End If %>
                </span>

				 <!--Code for search option -->
            <span class="floatRight">
			<form action="/searchresults1.asp" id="cse-search-box" target="_blank">
        <div style=" margin-top:0px">

    <input type="hidden" name="cx" value="016011900712214369325:uxcy_lv2cqa" />

     <input type="hidden" name="cof" value="FORID:9" />
    <input type="hidden" name="ie" value="UTF-8" />
<input type="text" name="q" id="mainSearch_AllPages" id="mainSearch_AllPages" style="color: rgb(161, 161, 161);width:200px;" size="80"  class="TeXtField" value="Search ITILstudy" onfocus='myObj = document.getElementById("mainSearch_AllPages");if(this.value=="Search ITILstudy") myObj.value="";myObj.style.color = "#A1A1A1";' onblur='myObj = document.getElementById("mainSearch_AllPages");if(myObj.value == "") myObj.value="Search ITILstudy";myObj.style.color = "#a1a1a1";if(myObj.value!="Search ITILstudy") myObj.style.color="#A1A1A1";' size="50" />
<input type="image" name="sa2" value="Go" id="submitbox" src="/images/buttons/search-ITIL.png"/>

  </div>
</form>
                </span>


			   <form name="myform" method="post">
              <span class="floatRight"> <% If Session("CountryOrigin") <> "Other" Then %>
                      <img src="/images/countries/<% = Trim(Session("CountryOrigin")) %>.gif" height="11px" />
           <% End If %>
                <select name="countryname" id="country" onChange="getCountry();">
                  <option value="">-Select Country-</option>
				  <option <% If Session("CountryOrigin") = "Australia" Then %> selected="selected" <% End If %> value="Australia">Australia</option>
                   <option <% If Session("CountryOrigin") = "Germany" Then %> selected="selected" <% End If %> value="Germany">Germany</option>
                  <option <% If Session("CountryOrigin") = "India" Then %> selected="selected" <% End If %> value="India">India</option>
                   <option <% If Session("CountryOrigin") = "Netherlands" Then %> selected="selected" <% End If %> value="Netherlands">Netherlands</option>
                  <option <% If Session("CountryOrigin") = "Saudi Arabia" Then %> selected="selected" <% End If %> value="Saudi Arabia">Saudi Arabia</option>
				   <option <% If Session("CountryOrigin") = "Singapore" Then %> selected="selected" <% End If %> value="Singapore">Singapore</option>
				    <option <% If Session("CountryOrigin") = "UAE" Then %> selected="selected" <% End If %> value="UAE">UAE</option>
                  <option <% If Session("CountryOrigin") = "United Kingdom" Then %> selected="selected" <% End If %> value="United Kingdom">UK</option>
				   <option <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then %> selected="selected" <% End If %> value="US">US/Canada</option>
                    <option <% If Session("CountryOrigin") = "Other" Then %> selected="selected" <% End If %> value="Other">Other</option>
                </select>
              </span>
            </form>

               <% If Session("CountryOrigin") = "Germany" Then %>

            <span class="floatRight">
				<span class="lang-Eng">
                <a href="/indexde.asp">Deutsche</a> |</span>

            </span>
             <% End If %>

               <!--End When aligned to right , need to put last coming content to first-->
              </td>
          </tr>
        </table>
        <div>
      </td>
    </tr>
    <tr>

	 <% If Session("CountryOrigin") = "India" Then %>
      <td id="imageHover"><div style="position:relative" id="imageHover"><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#Map" id="imageHover"/>
	   <div class="contactInTopLogo"> <span id="callUsAt">Call: <span style="color:#0673b9">080 41557547 / 9008748005 </span> <span id="emailUs">Email: <a href="mailto:marketing@ITILstudy.com" style="color:#0673b9">marketing@ITILstudy.com</a></span></span> <!--<span id="info">ITILstudy is a brand of Edusys Services Private Limited</span> --> </div>
       <map name="Map" id="Map">
  <area shape="rect" coords="5,13,230,96" href="/index.asp" />
  <area shape="rect" coords="563,10,724,95" href="http://www.csme.us/training-organizations.php" target="_blank" />
  <area shape="rect" coords="742,11,900,94"href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
</map>
          </div>
        </td>

	<% ElseIf Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then  %>

 <td id="imageHover"><div style="position:relative" id="imageHover"><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#Map" id="imageHover"/>
   <map name="Map" id="Map">
  <area shape="rect" coords="5,13,230,96" href="/index.asp" />
  <area shape="rect" coords="563,10,724,95" href="http://www.csme.us/training-organizations.php" target="_blank" />
  <area shape="rect" coords="742,11,900,94"href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
</map>
        </div></td>

        <% ElseIf Session("CountryOrigin") = "UAE" Then%>
 <td id="imageHover"><div style="position:relative" id="imageHover"><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#Map" id="imageHover"/>
	   <div class="contactInTopLogo"> <span id="emailUs">Email: <a href="mailto:marketing@ITILstudy.com" style="color:#0673b9">marketing@ITILstudy.com</a></span></span><span id="info" ><a href="/ITIL-Training/Success-Rate.asp">99.2% Pass Rate with 100% Moneyback Guarantee</a></span> </div>
   <map name="Map" id="Map">
  <area shape="rect" coords="5,13,230,96" href="/index.asp" />
  <area shape="rect" coords="563,10,724,95" href="http://www.csme.us/training-organizations.php" target="_blank" />
  <area shape="rect" coords="742,11,900,94"href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
</map>
        </div></td>

        <%elseIf Session("CountryOrigin") = "Singapore" Then  %>

 <td id="imageHover"><div style="position:relative" id="imageHover"><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#Map" id="imageHover"/>
	   <div class="contactInTopLogo"> <span id="emailUs">Email: <a href="mailto:marketing@ITILstudy.com" style="color:#0673b9">marketing@ITILstudy.com</a></span></span><span id="info" ><a href="/ITIL-Training/Success-Rate.asp">99.2% Pass Rate with 100% Moneyback Guarantee</a></span> </div>
   <map name="Map" id="Map">
  <area shape="rect" coords="5,13,230,96" href="/index.asp" />
  <area shape="rect" coords="563,10,724,95" href="http://www.csme.us/training-organizations.php" target="_blank" />
  <area shape="rect" coords="742,11,900,94"href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
</map>
        </div></td>

	        <%elseIf Session("CountryOrigin") = "Saudi Arabia"  Then  %>

	 <td id="imageHover"><div style="position:relative" id="imageHover"><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#Map" id="imageHover"/>
		   <div class="contactInTopLogo"> <span id="emailUs">Email: <a href="mailto:marketing@ITILstudy.com" style="color:#0673b9">marketing@ITILstudy.com</a></span></span><span id="info"><a href="/ITIL-Training/Success-Rate.asp">99.2% Pass Rate with 100% Moneyback Guarantee</a></span>  </div>
	   <map name="Map" id="Map">
	  <area shape="rect" coords="5,13,230,96" href="/index.asp" />
	  <area shape="rect" coords="563,10,724,95" href="http://www.csme.us/training-organizations.php" target="_blank" />
	  <area shape="rect" coords="742,11,900,94"href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
	</map>
        </div></td>
<%ElseIf Session("CountryOrigin") = "Netherlands" Then  %>
 <td id="imageHover"><div style="position:relative" id="imageHover"><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#Map" id="imageHover"/>
	   <div class="contactInTopLogo"> <span id="emailUs">Email: <a href="mailto:marketing@ITILstudy.com" style="color:#0673b9">marketing@ITILstudy.com</a></span></span><span id="info" ><a href="/ITIL-Training/Success-Rate.asp">99.2% Pass Rate with 100% Moneyback Guarantee</a></span> </div>
   <map name="Map" id="Map">
  <area shape="rect" coords="5,13,230,96" href="/index.asp" />
  <area shape="rect" coords="563,10,724,95" href="http://www.csme.us/training-organizations.php" target="_blank" />
  <area shape="rect" coords="742,11,900,94"href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
</map>
        </div></td>

       <% ElseIf Session("CountryOrigin") = "United Kingdom" Then %>
 <td id="imageHover"><div style="position:relative" id="imageHover"><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#Map" id="imageHover"/>
	   <div class="contactInTopLogo"><span id="callUsAt">Call: <span style="color:#0673b9">0800 0337 097</span></span> <span id="emailUs">Email: <a href="mailto:marketing@ITILstudy.com" style="color:#0673b9">marketing@ITILstudy.com</a></span><span id="info"><a href="/ITIL-Training/Success-Rate.asp">99.2% Pass Rate with 100% Moneyback Guarantee</a></span>   </div>
           <map name="Map" id="Map">
  <area shape="rect" coords="5,13,230,96" href="/index.asp" />
  <area shape="rect" coords="563,10,724,95" href="http://www.csme.us/training-organizations.php" target="_blank" />
  <area shape="rect" coords="742,11,900,94"href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
</map>
  </div>
      </td>
      <%ElseIf Session("CountryOrigin") = "Australia" then %>
        <td id="imageHover"><div style="position:relative" id="imageHover"><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#Map" id="imageHover"/>
	   <div class="contactInTopLogo"> <span id="callUsAt">Call: <span style="color:#0673b9">+61 2 88964376 </span> <span id="emailUs">Email: <a href="mailto:marketing@ITILstudy.com" style="color:#0673b9">marketing@ITILstudy.com</a></span></span> <span id="info"><a href="/ITIL-Training/Success-Rate.asp">99.2% Pass Rate with 100% Moneyback Guarantee</a></span> </div>
       <map name="Map" id="Map">
  <area shape="rect" coords="5,13,230,96" href="/index.asp" />
  <area shape="rect" coords="563,10,724,95" href="http://www.csme.us/training-organizations.php" target="_blank" />
  <area shape="rect" coords="742,11,900,94"href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
</map>
          </div>
        </td>

              <%ElseIf Session("CountryOrigin") = "Germany" then %>
		        <td id="imageHover"><div style="position:relative" id="imageHover"><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#Map" id="imageHover"/>
			   <div class="contactInTopLogo"> <span id="callUsAt">Call: <span style="color:#0673b9">+49 069 344643</span> <span id="emailUs">Email: <a href="mailto:marketing@ITILstudy.com" style="color:#0673b9">marketing@ITILstudy.com</a></span></span><span id="info"><a href="/ITIL-Training/Success-Rate.asp">99.2% Pass Rate with 100% Moneyback Guarantee</a></span>  </div>
		       <map name="Map" id="Map">
		  <area shape="rect" coords="5,13,230,96" href="/index.asp" />
		  <area shape="rect" coords="563,10,724,95" href="http://www.csme.us/training-organizations.php" target="_blank" />
		  <area shape="rect" coords="742,11,900,94"href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
		</map>
		          </div>
		        </td>

      <% Else %>
       <td id="imageHover"><div style="position:relative" id="imageHover"><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0" usemap="#Map" id="imageHover"/>
	     <map name="Map" id="Map">
  <area shape="rect" coords="5,13,230,96" href="/index.asp" />
  <area shape="rect" coords="563,10,724,95" href="http://www.csme.us/training-organizations.php" target="_blank" />
  <area shape="rect" coords="742,11,900,94"href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
</map>
  </div>
      </td>
      <% End If %>
    </tr>
  </table>

  <table width="930px" align="center" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="930px" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2"><div style="width: 930px;" class="chromestyle" id="chromemenu">
                <ul>
                  <li><a href="#" rel="dropmenu1"><img src="/images/back/link_01_why_us_grey.jpg" alt="ITILstudy" name="a" id="a" onMouseOver="MM_swapImage('a','','/images/back/link_01_why_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()" border="0" ></a></li>
                  <% If Session("CountryOrigin") = "United Kingdom" Then %>
                  <li><a href="#" rel="dropmenu2"> <img src="/images/back/link_02_courses_enrol_grey.jpg" alt="ITILstudy" name="b" id="b" onMouseOver="MM_swapImage('b','','/images/back/link_02_courses_enrol_green.jpg',1)" onMouseOut="MM_swapImgRestore()" border="0"  /></a></li>
				  <% Else %>
				  <li><a href="#" rel="dropmenu2"> <img src="/images/back/link_02_courses_enroll_grey.jpg" alt="ITILstudy" name="b" id="b" onMouseOver="MM_swapImage('b','','/images/back/link_02_courses_enroll_green.jpg',1)" onMouseOut="MM_swapImgRestore()" border="0"  /></a></li>
				  <% End If %>

                   <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then %>
                  <li><a href="#" rel="dropmenu7"> <img src="/images/back/link_07_corporate_grey.jpg" alt="ITILstudy" name="g" id="g" onMouseOver="MM_swapImage('g','','/images/back/link_07_corporate_green.jpg',1)" onMouseOut="MM_swapImgRestore()" border="0"  /></a></li>
                  <% End If %>

				   <li id="imageHover"><a href="#" rel="dropmenu5"><img src="/images/back/link_03_free_resources_grey.jpg" name="c" id="c" onmouseover="MM_swapImage('c','','/images/back/link_03_free_resources_green.jpg',1)" onmouseout="MM_swapImgRestore()" border="0"></a></li>

                  <li><a href="#" rel="dropmenu3"><img src="/images/back/link_04_methodology_grey.jpg" alt="ITILstudy" name="d" id="d" onMouseOver="MM_swapImage('d','','/images/back/link_04_methodology_green.jpg',1)" onMouseOut="MM_swapImgRestore()"  border="0" ></a></li>

                   <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then %>
                  <li><a href="#" rel="dropmenu4"><img src="/images/back/US_about_us_grey.jpg" alt="ITILstudy" name="e" id="e" onMouseOver="MM_swapImage('e','','/images/back/US_about_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()"  border="0" ></a></li>
                  <% Else %>
                  <li><a href="#" rel="dropmenu4"><img src="/images/back/link_05_about_us_grey.jpg" alt="ITILstudy" name="e" id="e" onMouseOver="MM_swapImage('e','','/images/back/link_05_about_us_green.jpg',1)" onMouseOut="MM_swapImgRestore()"  border="0" ></a></li>
                  <% End If %>

                   <% If Session("CountryOrigin") <> "US" AND Session("CountryOrigin") <> "Canada" Then %>

			 <% If Session("FirstName") = "" Then %>
                <li id="Li1"><a href="/memberlogin.asp" rel="dropmenu6"><img src="/images/back/link_06_login_grey.jpg" name="f" onmouseover="MM_swapImage('f','','/images/back/link_06_login_green.jpg',1)" onmouseout="MM_swapImgRestore()" border="0" ></a></li>
            <% Else %>
            <li id="Li2"><a href="/logoff.asp" rel="dropmenu6"><img src="/images/back/link_06_logout_grey.jpg" name="f" onmouseover="MM_swapImage('f','','/images/back/link_06_logout_green.jpg',1)" onmouseout="MM_swapImgRestore()" border="0" ></a></li>
            <% End If %>

            <% End If %>

                </ul>
              </div>

            <!--1st drop down menu -->

			<% If Session("CountryOrigin") = "United Kingdom" Then %>
			<!--#include virtual="/includes/header-UK.asp"-->

                <% ElseIf Session("CountryOrigin") = "Germany" Then %>
			<!--#include virtual="/includes/header-German-english.asp"-->

			<% ElseIf Session("CountryOrigin") = "India" Then %>
			<!--#include virtual="/includes/header-India.asp"-->

			 <% ElseIf Session("CountryOrigin") = "US" Then %>
			<!--#include virtual="/includes/header-US.asp"-->

			<% ElseIf Session("CountryOrigin") = "Canada" Then %>
			<!--#include virtual="/includes/header-Canada.asp"-->

			<% ElseIf Session("CountryOrigin") = "UAE" Then %>
			<!--#include virtual="/includes/header-UAE.asp"-->

			<% ElseIf Session("CountryOrigin") = "Singapore" Then %>
			<!--#include virtual="/includes/header-Singapore.asp"-->

			<% ElseIf Session("CountryOrigin") = "Australia" Then %>
			<!--#include virtual="/includes/header-Australia.asp"-->

            <% ElseIf Session("CountryOrigin") = "Saudi Arabia" Then %>
			<!--#include virtual="/includes/header-saudiArabia.asp"-->

            <% ElseIf Session("CountryOrigin") = "Netherlands" Then %>
			<!--#include virtual="/includes/header-Netherlands.asp"-->

			<% ElseIf Session("CountryOrigin") = "Other" Then %>
			<!--#include virtual="/includes/header-Other.asp"-->

			 <% End If %>

      <script type="text/javascript">

cssdropdown.startchrome("chromemenu")

</script>
            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<div style="float: right; height: 111px; width: 30px; position: fixed; top: 30px; right: 0px;">
<img src="/images/buttons/Social-Media-Icons.png" width="30" height="156" usemap="#SMMap" border="0" />
<map name="SMMap" id="Map1">
    <area shape="rect" coords="6,7,26,27" href="http://www.facebook.com/itilstudy" alt="Facebook" title="Facebook" target="_blank"/>
    <area shape="rect" coords="6,37,26,57" href="http://www.twitter.com/ITILstudy_" alt="Twitter" title="Twitter" target="_blank"/>
    <area shape="rect" coords="6,68,26,88" href="http://www.linkedin.com/pub/itilstudy-a-leading-itil-certification-provider/55/974/547" alt="LinkedIn" title="LinkedIn" target="_blank" />
    <area shape="rect" coords="6,98,26,118" href="http://www.youtube.com/itilstudychannel" alt="Youtube Channel" title="Youtube Channel" target="_blank"/>
    <area shape="rect" coords="6,127,26,148" href="http://www.ITILstudy.com/blog/" alt="ITIlstudy Blog" title="ITIlstudy Blog" target="_blank" />
</map>
</div>
<!-- Header End -->
