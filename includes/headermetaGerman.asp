<%
'If InStr(Request.ServerVariables("SERVER_NAME"),"www") = 0 Then

	'Response.Status="301 Moved Permanently"
	
	'If Request.ServerVariables("URL") = "/indexde.asp" Then
	'Response.AddHeader "Location","http://www." & Request.ServerVariables("HTTP_HOST")
	'Else
	'Response.AddHeader "Location","http://www." & Request.ServerVariables("HTTP_HOST") & Request.ServerVariables("URL")
    'End If
	'Response.End
'End if
%>


<link rel="shortcut icon" href="/images/buttons/favicon.ico">
<link rel="stylesheet" type="text/css" href="/css/chromestyle.css">
<link rel="stylesheet" type="text/css" href="/css/style.css">
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

<script language="javascript">
function GetHidden1()
{
	document.getElementById("form1").submit();
}
</script>

<% 
'Changing the country session'


If Request.Form("country") <> ""  Then
	Session("CountryOrigin") = Request.Form("country")
	If Session("CountryOrigin") <> "Germany" Then 
	Response.Redirect("/index.asp")
	End If
	
Else
	Session("CountryOrigin") = Session("CountryOrigin")
End If 	

'If Session("CountryOrigin") =  "" Then 
Session("CountryOrigin") = "Germany" 

'End If

If(Session("CountryOrigin")<>"") Then

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
<body bgcolor="#CCCCCC" vlink="#0099CC" leftmargin="0" topmargin="0" onLoad="MM_preloadImages('/images/back/link_01_why_us_green.jpg','/images/back/link_02_courses_enroll_green.jpg','/6sigmastudyimages/back/link_03_free_resources_green.jpg','/images/back/link_04_methodology_green.jpg','/images/back/link_05_about_us_green.jpg','/images/back/link_06_login_green.jpg')">
<div align="center" class="MainTableBack" style="width:100%;">

<!-- Header Start -->
<div align="center" style="margin-top:-12px;" >
<div style="width:930px;" align="center">
  <table width="930" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td><div align="right">
        <table width="930" border="0" cellspacing="0" cellpadding="0">
          <tr><br>
            <td width="460">&nbsp;</td>
            
<td>

<span class="lang"><br>
                <a href="/indexger.asp">English</a> |</span>
                                
                </td>
                
			   <form name="myform" method="post">
              <td> <% If Session("CountryOrigin") <> "Other" Then %>
                      <img src="/images/countries/<% = Trim(Session("CountryOrigin")) %>.gif" height="11px" />
           <% End If %>
                <select name="country" id="country" onChange="getCountry();">
                  <option value="">-Select Country-</option>
				  <option <% If Session("CountryOrigin") = "Australia" Then %> selected="selected" <% End If %> value="Australia">Australia</option>
                   <option <% If Session("CountryOrigin") = "Germany" Then %> selected="selected" <% End If %> value="Germany">Germany</option>
                  <option <% If Session("CountryOrigin") = "India" Then %> selected="selected" <% End If %> value="India">India</option>
                  <option <% If Session("CountryOrigin") = "Netherlands" Then %> selected="selected" <% End If %> value="Netherlands">Netherlands</option>
				   <option <% If Session("CountryOrigin") = "Singapore" Then %> selected="selected" <% End If %> value="Singapore">Singapore</option>
				    <option <% If Session("CountryOrigin") = "UAE" Then %> selected="selected" <% End If %> value="UAE">UAE</option>
                  <option <% If Session("CountryOrigin") = "United Kingdom" Then %> selected="selected" <% End If %> value="United Kingdom">UK</option>
				   <option <% If Session("CountryOrigin") = "US" OR Session("CountryOrigin") = "Canada" Then %> selected="selected" <% End If %> value="US">US/Canada</option>
                    <option <% If Session("CountryOrigin") = "Other" Then %> selected="selected" <% End If %> value="Other">Other</option>
                </select>
                 </form>
              </td>
      
          <td width="215">
              <span class="style1"><a href="/indexde.asp">Home</a> |  <a href="/german/Kontakt.asp">Kontakt</a>  | <a href="/german/sitemap.asp">Sitemap</a> 
             <%If(Session("FirstName")<>"") Then%>
              | <a href="/overview.asp">My Account</a>
              <%Else%>
              | <a href="/memberlogin.asp">Sign In</a>
              <%End If%>
              </span></td>
          </tr>
        </table>
        <div>
      </td>
    </tr>
    
    <tr>
	
 <td id="imageHover"><div style="position:relative" id="imageHover"><img src="/images/buttons/logo_top.jpg" alt="ITILstudy" border="0"  usemap="#Map" id="imageHover"/><div class="contactInTopLogo"><span id="emailUs"><a href="/german/einenRückrufanfordern.asp"><img src="/images/buttons/callback.jpg" style="height:40px;"/> <span style="vertical-align:top">Einen Rückruf anfordern</span></a></span><span id="info"><a href="/German/erfolgsquote.asp"> 99.2% Erfolgsquote mit Geld-zurück-Garantie </a></span></div>
  <map name="Map" id="Map">
  <area shape="rect" coords="5,13,230,96" href="/indexde.asp" />
  <area shape="rect" coords="563,10,724,95" href="http://www.csme.us/CSMEATOList/tabid/83/Default.aspx" target="_blank" />
  <area shape="rect" coords="742,11,900,94"href="http://www.apmg-international.com/AccreditedOrganisations/EdusysServices-UK.asp" target="_blank" />
</map>
        </div></td>
		
		
       
    </tr>
  </table>
	
  <table width="930px" align="center" border="0" cellpadding="0" cellspacing="0">
    <tr>
      <td><table width="930px" border="0" cellpadding="0" cellspacing="0">
          <tr>
            <td colspan="2"><div style="width: 930px;" class="chromestyle" id="chromemenu">
                <ul>
                  <li><a href="#" rel="dropmenu1"><img src="/images/German/Why_us_Grey.png" alt="ITILstudy" name="a" id="a" onMouseOver="MM_swapImage('a','','/images/German/Why_us_Green.png',1)" onMouseOut="MM_swapImgRestore()" border="0" ></a></li>
                  
				  <li><a href="#" rel="dropmenu2"> <img src="/images/German/Course_Enroll_Grey.png" alt="ITILstudy" name="b" id="b" onMouseOver="MM_swapImage('b','','/images/German/Course_Enroll_Green.png',1)" onMouseOut="MM_swapImgRestore()" border="0"  /></a></li>
				  
				   <li id="imageHover"><a href="#" rel="dropmenu5"><img src="/images/German/Free_resources_Grey.png" name="c" id="c" onMouseOver="MM_swapImage('c','','/images/German/Free_resources_Green.png',1)" onMouseOut="MM_swapImgRestore()" border="0"></a></li>
                  
                  <li><a href="#" rel="dropmenu3"><img src="/images/German/Methodology_Grey.png" alt="ITILstudy" name="d" id="d" onMouseOver="MM_swapImage('d','','/images/German/Methodology_Green.png',1)" onMouseOut="MM_swapImgRestore()"  border="0" ></a></li>
                  
                  <li><a href="#" rel="dropmenu4"><img src="/images/German/About_us_Grey.png" alt="ITILstudy" name="e" id="e" onMouseOver="MM_swapImage('e','','/images/German/About_us_Green.png',1)" onMouseOut="MM_swapImgRestore()"  border="0" ></a></li>
                  
                 <!-- <li><a href="#" rel="dropmenu4"><img src="/images/back/affiliates_grey.png" alt="ITILstudy" name="d" id="d" onMouseOver="MM_swapImage('d','','/images/back/affiliates_green.png',1)" onMouseOut="MM_swapImgRestore()"  border="0" ></a></li>-->
                  
                   <% If Session("FirstName") = "" Then %>
            <li id="imageHover"><a href="/memberlogin.asp" rel="dropmenu6"><img src="/images/German/Login_grey.png" name="f" onMouseOver="MM_swapImage('f','','/images/German/Login_green.png',1)" onMouseOut="MM_swapImgRestore()" border="0" ></a></li>
            <% Else %>
            <li id="imageHover"><a href="/logoff.asp" rel="dropmenu6"><img src="/images/back/link_06_logout_grey.jpg" name="f" onMouseOver="MM_swapImage('f','','/images/back/link_06_logout_green.jpg',1)" onMouseOut="MM_swapImgRestore()" border="0" ></a></li>
            <% End If %>
                 
                </ul>
              </div>
         
      
        <!--1st drop down menu -->
			
			
			<!--#include virtual="/includes/header-German.asp"-->
			
			
			
			 
      <script type="text/javascript">

cssdropdown.startchrome("chromemenu")

</script>

            </td>
          </tr>
        </table></td>
    </tr>
  </table>
</div>
<!-- Header End -->
