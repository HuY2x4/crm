<!--#include file="../Data/Conn.asp"--><!--#include file="../data/EasyCrm.asp"-->
<%Set EasyCrm  = New EasyCRM_CRM%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" oncontextmenu=self.event.returnValue=false><head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<link href="<%=SiteUrl&skinurl%>Style/common.css" rel="stylesheet" type="text/css">
<script language="javascript" src="<%=SiteUrl&skinurl%>Js/Common.js"></script>
<script language="javascript" src="<%=SiteUrl&skinurl%>Js/jquery.min.js"></script>
<script language="javascript" src="<%=SiteUrl&skinurl%>Js/tips.js"></script>
<script src="<%=SiteUrl&skinurl%>aridialog/jquery.artDialog.js?skin=default"></script>
<script src="<%=SiteUrl&skinurl%>aridialog/iframeTools.js"></script>
</head>
<body>
<style>body{padding-bottom:55px;}</style>
<%
action = Trim(Request("action"))
sType = Trim(Request("sType"))
cID = Trim(Request("cID"))
ID = Trim(Request("ID"))
tipinfo = Trim(Request("tipinfo"))
YNRange = Trim(Request("YNRange"))

'禁止直接打开子窗口
From_url = Cstr(Request.ServerVariables("HTTP_Referer"))
Serv_url = Cstr(Request.ServerVariables("Server_Name"))
If mid(From_url,8,len(Serv_url)) <> Serv_url Then
	Response.Write("<script>window.opener=null;window.close();</script>")
	Response.end
End If

Select Case action
Case "Client"
    Call Client()
End Select


Sub Client() '客户档案
	cid = Trim(Request("cid"))
	if tipinfo<>"" then
		Response.Write("<script>art.dialog({title: 'Error',time: 1,icon: 'warning',content: '"&tipinfo&"'});</script>")
	end if
%>
	<script language="JavaScript">
	<!-- 客户档案必填项提示
	function CheckInput()
	{
		if (<%=Must_Client_cCompany%>=="1"){if(document.all.Company.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cCompany & alert04%>'});document.all.Company.focus();return false;}}
		if (<%=Must_Client_cArea%>=="1"){if(document.all.Area.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cArea & alert04%>'});document.all.Area.focus();return false;}}
		if (<%=Must_Client_cSquare%>=="1"){if(document.all.Square.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cSquare & alert04%>'});document.all.Square.focus();return false;}}
		if (<%=Must_Client_cAddress%>=="1"){if(document.all.Address.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cAddress & alert04%>'});document.all.Address.focus();return false;}}
		if (<%=Must_Client_cZip%>=="1"){if(document.all.Zip.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cZip & alert04%>'});document.all.Zip.focus();return false;}}
		if (<%=Must_Client_cLinkman%>=="1"){if(document.all.Linkman.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cLinkman & alert04%>'});document.all.Linkman.focus();return false;}}
		if (<%=Must_Client_cZhiwei%>=="1"){if(document.all.Zhiwei.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cZhiwei & alert04%>'});document.all.Zhiwei.focus();return false;}}
		if (<%=Must_Client_cMobile%>=="1"){if(document.all.Mobile.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cMobile & alert04%>'});document.all.Mobile.focus();return false;}}
		if (<%=Must_Client_cTel%>=="1"){if(document.all.Tel.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cTel & alert04%>'});document.all.Tel.focus();return false;}}
		if (<%=Must_Client_cFax%>=="1"){if(document.all.Fax.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cFax & alert04%>'});document.all.Fax.focus();return false;}}
		if (<%=Must_Client_cHomepage%>=="1"){if(document.all.Homepage.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cHomepage & alert04%>'});document.all.Homepage.focus();return false;}}
		if (<%=Must_Client_cEmail%>=="1"){if(document.all.Email.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cEmail & alert04%>'});document.all.Email.focus();return false;}}
		if (<%=Must_Client_cTrade%>=="1"){if(document.all.Trade.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cTrade & alert04%>'});document.all.Trade.focus();return false;}}
		if (<%=Must_Client_cStrade%>=="1"){if(document.all.Strade.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cStrade & alert04%>'});document.all.Strade.focus();return false;}}
		//if (<%=Must_Client_cType%>=="1"){if(document.all.Type.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cType & alert04%>'});document.all.Type.focus();return false;}} by Bob
		if (<%=Must_Client_cStart%>=="1"){if(document.all.Start.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cStart & alert04%>'});document.all.Start.focus();return false;}}
		if (<%=Must_Client_cSource%>=="1"){if(document.all.Source.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cSource & alert04%>'});document.all.Source.focus();return false;}}
		//if (<%=Must_Client_cInfo%>=="1"){if(document.all.Info.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cInfo & alert04%>'});document.all.Info.focus();return false;}}
		if (<%= Must_Client_cBeizhu %>=="1") { if (document.all.Beizhu.value == "") { art.dialog({ title: 'Error', time: 1, icon: 'warning', content: '<%=L_Client_cBeizhu & alert04%>' }); document.all.Beizhu.focus(); return false; } }

		if (<%=Must_Client_cWechat%>=="1"){if(document.all.Wechat.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cWechat & alert04%>'});document.all.Wechat.focus();return false;}}
		if (<%=Must_Client_cPosition%>=="1"){if(document.all.Position.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cPosition & alert04%>'});document.all.Position.focus();return false;}}
		if (<%=Must_Client_cIndustry%>=="1"){if(document.all.Industry.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=L_Client_cIndustry & alert04%>'});document.all.Industry.focus();return false;}}
	}
		-->
	</script>
<%
if sType="Add" then '添加
%>
<% If mid(Session("CRM_qx"), 17, 1) = 1 Then %>
<script language="javascript" src="<%=SiteUrl&skinurl%>Js/ajax.js"></script>
<script language="javascript" src="<%=SiteUrl&skinurl%>Js/Check.min.js"></script>
<style>body {padding-top:35px;padding-bottom:55px;}</style>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="top_bg">
	<tr>
		<td class="top_left td_t_n td_r_n"><%=L_Top_View_Company%>  (<font color="#FF0000">*</font>)</td>
		<td class="top_right td_t_n td_r_n">
			<input type="button" class="button_top_reload" value=" " title="刷新" onClick=window.location.href="javascript:window.location.reload();" />
			<% If mid(Session("CRM_qx"), 5, 1) = 1 Then %>
			<input type="button" class="button_top_set" value=" " title="必填项设置" onclick='Setting_Client_AddMust()' style="cursor:pointer" />
			<%end if%>
        </td>
	</tr>
</table>
<script>function Setting_Client_AddMust() {$.dialog.open('../system/GetUpdate.asp?action=Setting&sType=ClientAddMust', {title: '自定义设置', width: 800, height: 480,fixed: true}); };</script>
	
			<table width="100%" border="0" cellpadding="0" cellspacing="0"><!-- 新增档案-->
				<form name="Add" action="?action=Client&sType=SaveAdd" method="post" onSubmit="return CheckInput();">
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 
						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
						<col width="120" /><col width="300" /><col width="120" />
							<tr>
								<td class="td_l_r title"> <%if Must_Client_cCompany = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cCompany%></td>
								<td class="td_r_l" colspan=3> <input type="text" class="int" name="Company" id="Company" size="50" maxlength="50" autocomplete="off" onChange="checkcompany(this.value);" onkeyup="searchSuggest();"> <span id="check1"> <span class="info_warn help01"><%=L_Tip_Info_01%></span></span><div id="search_suggest" style="display:none"></div></td>
							</tr>
							<tr> 
								<td class="td_l_r title"> <%if Must_Client_cArea = 1 or Must_Client_cSquare = 1 or Must_Client_cAddress = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cAddress%></td>
								<td class="td_r_l" colspan=3>
									<select name="Area" onchange="getArea(this.options[this.selectedIndex].id);">
									<option value=""><%=L_Please_choose_01%></option>
									<% 
										Set rsb = Conn.Execute("select * from [AreaData] where aFId = '0' ")
										If Not rsb.Eof then
										Do While Not rsb.Eof
										aId= rsb("aId")
										aName= rsb("aName")
									%>
										<option value="<%=aName%>" id="<%=aId%>"><%=aName%></option>
									<%
										rsb.Movenext
										Loop
										End If
										rsb.Close
										Set rss = Nothing 
									%>
									</select> 
									<span id="Squarediv"  style="margin-left:10px;padding:0;">
										<select name="Squares">
											<option value=""><%=L_Please_choose_02%></option>
										</select>
										
									</span>　
								<input name="Square" type="hidden" id="Square" class="int">
								<input name="Address" type="text" class="int" id="Address" size="30">　
								 <%if Must_Client_cZip = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cZip%>： <input name="Zip" type="text" class="int" id="Zip" size="10" maxlength="6" onkeyup='this.value=this.value.replace(/\D/gi,"")'> <span class="info_help help01" onmouseover="tip.start(this)" tips="<%=L_Tip_Info_06%>">&nbsp;</span>
								</td>
							</tr>
							<tr> 
								<td class="td_l_r title"><%if Must_Client_cLinkman = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cLinkman%></td>
							  <td class="td_r_l"> <input name="Linkman" type="text" class="int" id="Linkman" size="10">　 <%if Must_Client_cZhiwei = 1 then %><font color="#FF0000">*</font> <%end if%><%=L_Client_cZhiwei%>：<% = EasyCrm.getSelect("SelectData","Select_Zhiwei","Zhiwei","") %>&nbsp;<% If mid(Session("CRM_qx"), 6, 1) = 1 Then %><input name="Back" type="button" id="Back" class="button227" value="新增" onclick='Select_Zhiwei_InfoAdd()' style="cursor:pointer"><script>function Select_Zhiwei_InfoAdd() {$.dialog.open('../System/GetUpdate.asp?action=SelectData&sType=Add&oType=Select_Zhiwei', {title: '新窗口', width: 400, height: 140,fixed: true}); };</script><%end if%></td>
								<td class="td_l_r title"><%if Must_Client_cMobile = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cMobile%></td>
								<td class="td_r_l" colspan="3"> <input name="Mobile" type="text" class="int" id="Mobile" size="30" onkeyup='this.value=this.value.replace(/\D/gi,"")'> <span class="info_help help01" onmouseover="tip.start(this)" tips="<%=L_Tip_Info_06%>">&nbsp;</span></td>
							</tr>
							<tr>
								<td class="td_l_r title"><%if Must_Client_cWechat = 1 then %><font color="#FF0000">*</font> <%end if%><%=L_Client_cWechat %></td>
								<td class="td_r_l"><input name="Wechat" type="text" class="int" id="Wechat" size="30"/></td>
								<td class="td_l_r title"><%if Must_Client_cPosition = 1 then %><font color="#FF0000">*</font> <%end if%><%=L_Client_cPosition %></td>
								<td class="td_r_l"><input name="Position" type="text" class="int" id="Position" size="30"/></td>
							</tr>
							<tr> 
								<td class="td_l_r title" <%if Hidden_Client_cTel=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cTel = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cTel%></td>
								<td class="td_r_l" <%if Hidden_Client_cTel=1 then%>style="display:none;"<%end if%> > <input name="Tel" type="text" class="int" id="Tel" size="30"></td>
								<td class="td_l_r title" <%if Hidden_Client_cFax=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cFax = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cFax%></td>
								<td class="td_r_l" <%if Hidden_Client_cFax=1 then%>style="display:none;"<%end if%> ><input name="Fax" type="text" class="int" id="Fax" size="30"></td>
							</tr>
							<tr> 
								<td class="td_l_r title" <%if Hidden_Client_cHomepage=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cHomepage = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cHomepage%></td>
								<td class="td_r_l" <%if Hidden_Client_cHomepage=1 then%>style="display:none;"<%end if%> > <input name="Homepage" type="text" class="int" id="Homepage" size="35" > <span class="info_help help01" onmouseover="tip.start(this)" tips="<%=L_Tip_Info_04%>">&nbsp;</span> </td>
								<td class="td_l_r title" <%if Hidden_Client_cEmail=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cEmail = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cEmail%></td>
								<td class="td_r_l" <%if Hidden_Client_cEmail=1 then%>style="display:none;"<%end if%> > <input name="Email" type="text" class="int" id="Email" size="35"></td>
							</tr>
							<tr> 
								<td class="td_l_r title"><%if Must_Client_cTrade = 1 or Must_Client_cStrade = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cTrade%></td>
								<td class="td_r_l" colspan="3">
									<select name="Trade" onchange="getTrade(this.options[this.selectedIndex].id);">
									<option value=""><%=L_Please_choose_01%></option>
									<% 
										Set rsb = Conn.Execute("select * from [ProductClass] where pClassFid = '0' ")
										If Not rsb.Eof then
										Do While Not rsb.Eof
										pClassid= rsb("pClassid")
										pClassname= rsb("pClassname")
									%>
										<option value="<%=pClassname%>" id="<%=pClassid%>"><%=pClassname%></option>
									<%
										rsb.Movenext
										Loop
										End If
										rsb.Close
										Set rsb = Nothing 
									%>
									</select> 
									<span id="Stradediv"  style="margin-left:10px;padding:0;">
										<select name="Strades">
											<option value=""><%=L_Please_choose_02%></option>
										</select>
									</span>
									<input name="Strade" type="hidden" id="Strade">
								</td>
							<!--	<td class="td_l_r title"><%if Must_Client_cType = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cType%></td>
								<td class="td_r_l"> <% = EasyCrm.getSelect("SelectData","Select_Type","Type","") %>&nbsp;<% If mid(Session("CRM_qx"), 6, 1) = 1 Then %><input name="Back" type="button" id="Back" class="button227" value="新增" onclick='Select_Type_InfoAdd()' style="cursor:pointer"><script>function Select_Type_InfoAdd() {$.dialog.open('../System/GetUpdate.asp?action=SelectData&sType=Add&oType=Select_Type', {title: '新窗口', width: 400, height: 140,fixed: true}); };</script><%end if%></td>
							-->
								</tr>
							<tr> 
								<td class="td_l_r title" <%if Hidden_Client_cStart=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cStart = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cStart%></td>
								<td class="td_r_l" <%if Hidden_Client_cStart=1 then%>style="display:none;"<%end if%> > <% = EasyCrm.getSelect("SelectData","Select_Star","Start","") %>&nbsp;<% If mid(Session("CRM_qx"), 6, 1) = 1 Then %><input name="Back" type="button" id="Back" class="button227" value="新增" onclick='Select_Star_InfoAdd()' style="cursor:pointer"><script>function Select_Star_InfoAdd() {$.dialog.open('../System/GetUpdate.asp?action=SelectData&sType=Add&oType=Select_Star', {title: '新窗口', width: 400, height: 140,fixed: true}); };</script><%end if%></td>
								<td class="td_l_r title" <%if Hidden_Client_cSource=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cSource = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cSource%></td>
								<td class="td_r_l" <%if Hidden_Client_cSource=1 then%>style="display:none;"<%end if%> > <% = EasyCrm.getSelect("SelectData","Select_Source","Source","") %>&nbsp;<% If mid(Session("CRM_qx"), 6, 1) = 1 Then %><input name="Back" type="button" id="Back" class="button227" value="新增" onclick='Select_Source_InfoAdd()' style="cursor:pointer"><script>function Select_Source_InfoAdd() {$.dialog.open('../System/GetUpdate.asp?action=SelectData&sType=Add&oType=Select_Source', {title: '新窗口', width: 400, height: 140,fixed: true}); };</script><%end if%></td>
							</tr>
								<tr>
								<td class="td_l_r title"><%if Must_Client_cIndustry = 1 then %><font color="#FF0000">*</font> <%end if%><%=L_Client_cIndustry %></td>
								<td class="td_r_l" colspan="3"><% = EasyCrm.getSelect("SelectData","Select_Industry","Industry","") %>&nbsp;<% If mid(Session("CRM_qx"), 6, 1) = 1 Then %><input name="Back" type="button" id="Back" class="button227" value="新增" onclick='Select_Industry_InfoAdd()' style="cursor:pointer"><script>function Select_Industry_InfoAdd() {$.dialog.open('../System/GetUpdate.asp?action=SelectData&sType=Add&oType=Select_Industry', {title: '新窗口', width: 400, height: 140,fixed: true}); };</script><%end if%></td>
							</tr>
								<%
								Set rss = Server.CreateObject("ADODB.Recordset")
								rss.Open "Select * From [CustomField] where cTable='Client' order by Id asc ",conn,3,1
								If rss.RecordCount > 0 Then
								i=1
								Do While Not rss.BOF And Not rss.EOF
								if i mod 2 = 1 then Response.Write "<tr>"
								%>
									<td class="td_l_r title"><%=rss("cTitle")%></td>
									<td class="td_r_l"> 
										<%if rss("cType") = "text" then%>
										<input name="<%=rss("cName")%>" type="text" id="<%=rss("cName")%>" class="int" style="width:<%=rss("cWidth")%>px" value="">
										<%elseif rss("cType") = "time" then%>
										<input name="<%=rss("cName")%>" type="text" id="<%=rss("cName")%>" class="Wdate" style="width:<%=rss("cWidth")%>px" onFocus="WdatePicker()" value="" />
										<%elseif rss("cType") = "select" then%>
											<select name="<%=rss("cName")%>" class="int" style="width:<%=rss("cWidth")%>px">
											<option value=""><%=L_Select%></option>
											<%
											selectstr = split(""&rss("cContent")&"",",")
											for selectarr = 0 to ubound(selectstr)
											response.Write "<option value="""&selectstr(selectarr)&""">"&selectstr(selectarr)&"</option>"
											next
											%>
											</select>
										<%elseif rss("cType") = "checkbox" then%>
											<%
											checkboxstr = split(""&rss("cContent")&"",",")
											for checkboxarr = 0 to ubound(checkboxstr)
											response.Write "<input name="""&rss("cName")&""" type=""checkbox"" value="""&checkboxstr(checkboxarr)&"""> "&checkboxstr(checkboxarr)&"　"
											next
											%>
										<%elseif rss("cType") = "radio" then%>
											<%
											radiostr = split(""&rss("cContent")&"",",")
											for radioarr = 0 to ubound(radiostr)
											response.Write "<input name="""&rss("cName")&""" type=""radio"" value="""&radiostr(radioarr)&"""> "&radiostr(radioarr)&"　"
											next
											%>
										<%end if%>
									</td>
								<%
								i = i + 1
								if i mod 2 = 1 then Response.Write "</tr>"
								rss.MoveNext
								Loop
								end if
								rss.Close
								Set rss = Nothing
								%>
						<!--	<tr> 
								<td class="td_l_r title" <%if Hidden_Client_cInfo=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cInfo = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cInfo%></td>
								<td class="td_r_l" colspan=3 <%if Hidden_Client_cInfo=1 then%>style="display:none;"<%end if%>  style="padding:5px 10px;"> <textarea name="Info" rows="4" id="Info" class="int" style="height:50px;width:98%;"></textarea></td>
							</tr>-->
							<tr> 
								<td class="td_l_r title"><%if Must_Client_cBeizhu = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cBeizhu%></td>
								<td class="td_r_l" colspan=3 style="padding:5px 10px;"> <textarea name="Beizhu" id="Beizhu" class="int" style="height:50px;width:98%;"></textarea></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<input name="User" type="hidden" value="<%=Session("CRM_name")%>">
			<input name="Group" type="hidden" value="<%=Session("CRM_group")%>">
			<input type="submit" name="Submit" class="button45" value="保存">　
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
		</td>
	</tr>
</table>
</div>
				</form>
<%end if%>
<%
elseif sType="SaveAdd" then
	
	
	cCompany = Trim(Request("Company"))
	cArea = Trim(Request("Area"))
	cSquare = Trim(Request("Square"))
	cAddress = Trim(Request("Address"))
	cZip = Trim(Request("Zip"))
	cLinkman = Trim(Request("Linkman"))
	cWechat=Trim(Request("Wechat"))'by Bob
	cPosition=Trim(Request("Position"))'by Bob
	cIndustry=Trim(Request("Industry"))'by Bob
	cZhiwei = Trim(Request("Zhiwei"))
	cMobile = Trim(Request("Mobile"))
	cTel = Trim(Request("Tel"))
	cFax = Trim(Request("Fax"))
	cHomepage = Trim(Request("Homepage"))
	cEmail = Trim(Request("Email"))  
	cTrade = Trim(Request("Trade"))
	cStrade = Trim(Request("Strade"))
	cType = Trim(Request("Type"))
	cStart = Trim(Request("Start"))
	cSource = Trim(Request("Source"))    
	cInfo = Trim(Request("Info"))
	cBeizhu = Trim(Request("Beizhu"))
	cUser = Trim(Request("User"))
	cGroup = Trim(Request("Group"))

	OnlyItem=""
	if ClientOnly = "100" then
		OnlyItem = OnlyItem & " and cCompany = '" & cCompany & "' "
	elseif ClientOnly = "110" then
		OnlyItem = OnlyItem & " and ( cCompany = '" & cCompany & "' or cLinkman = '" & cLinkman & "' ) "
	elseif ClientOnly = "111" then
		OnlyItem = OnlyItem & " and ( cCompany = '" & cCompany & "' or cLinkman = '" & cLinkman & "' or cMobile = '" & cMobile & "' )  "
	elseif ClientOnly = "101" then
		OnlyItem = OnlyItem & " and ( cCompany = '" & cCompany & "' or cMobile = '" & cMobile & "' )"
	elseif ClientOnly = "011" then
		OnlyItem = OnlyItem & " and ( cLinkman = '" & cLinkman & "' or cMobile = '" & cMobile & "' ) "
	elseif ClientOnly = "001" then
		OnlyItem = OnlyItem & " and cMobile = '" & cMobile & "' "
	end if
	'if mid(ClientOnly, 1, 1) = 1 then OnlyItem = OnlyItem & " and cCompany = '" & cCompany & "' "
	'if mid(ClientOnly, 2, 1) = 1 then OnlyItem = OnlyItem & " and cLinkman = '" & cLinkman & "' "
	'if mid(ClientOnly, 3, 1) = 1 then OnlyItem = OnlyItem & " and cMobile = '" & cMobile & "' "
	Dim rs,cId
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open "Select * From client Where 1=1 " & OnlyItem & " ",conn,1,1
	If rs.RecordCount > 0 Then
        Response.Write("<script>location.href='../Main/GetUpdate.asp?action=Client&sType=Add&tipinfo="&alert02&"';</script>")
	Response.End()
	End If
	rs.Close
			
	rs.Open "Select Top 1 * From client",conn,3,2
	rs.AddNew

	rs("cCompany") = cCompany
	rs("cArea") = cArea
	rs("cSquare") = cSquare
	rs("cAddress") = cAddress
	rs("cZip") = cZip
	rs("cLinkman") = cLinkman
	rs("cWechat")=cWechat 'by Bob
	rs("cPosition")=cPosition 'by Bob
	rs("cIndustry")=cIndustry 'by Bob
	rs("cZhiwei") = cZhiwei
	rs("cMobile") = cMobile
	rs("cTel") = cTel
	rs("cFax") = cFax
	rs("cHomepage") = cHomepage
	rs("cEmail") = cEmail
	rs("cTrade") = cTrade
	rs("cStrade") = cStrade
	rs("cType") = cType
	rs("cStart") = cStart
	rs("cSource") = cSource
	rs("cInfo") = cInfo
	rs("cBeizhu") = cBeizhu
	rs("cUser") = cUser
	rs("cGroup") = cGroup
	rs("cLastUpdated") = now()
	
	'写入默认值
	rs("cDate") = Date()
	rs("cYn") = 1
	rs("cShare") = 0

	rs.Update
	rs.Close
	Set rs = Nothing

	Dim rsid
	Set rsid = Server.CreateObject("ADODB.Recordset")
	if Accsql = 0 then
	rsid.Open "Select top 1 cid From client order by cid desc",conn,1,1
	elseif Accsql = 1 then
	rsid.Open "Select @@IDENTITY as cid From client",conn,1,1
	end if
	cid=rsid("cid")
	rsid.close
	
	'插入联系人表
	conn.execute ("insert into Linkmans(cid,lName,lZhiwei,lMobile,lUser,lTime) values('"&cid&"','"&cLinkman&"','"&cZhiwei&"','"&cMobile&"','"&cUser&"','"&now()&"')")	
	
	'插入自定义内容
	
	cContent = ""
	Set rsc = Server.CreateObject("ADODB.Recordset")
	rsc.Open "Select * From [CustomField] where cTable='Client' order by Id asc ",conn,1,1
	If rsc.RecordCount > 0 Then
	Do While Not rsc.BOF And Not rsc.EOF
	
	cContent = cContent & rsc("cName") &":"& Trim(Request(rsc("cName"))) &"|"
	
	rsc.MoveNext
	Loop
	end if
	rsc.Close
	Set rsc = Nothing
	
	conn.execute ("insert into CustomFieldContent(cID,cContent) values('"&cid&"','"&cContent&"')")	
	
	'插入操作记录
	conn.execute ("insert into Logfile(lCid,lClass,lAction,lUser,lTime) values('"&cid&"','"&L_Client&"','"&L_insert_action_01&"','"&cUser&"','"&now()&"')")	

	Response.Write("<script>art.dialog.close();art.dialog.open.origin.location.reload();</script>")
	
elseif sType="InfoEdit" then
%>
<% If mid(Session("CRM_qx"), 18, 1) = 1 Then %>
<script language="javascript" src="<%=SiteUrl&skinurl%>Js/ajax.js"></script>
<script language="javascript" src="<%=SiteUrl&skinurl%>Js/Check.min.js"></script>
<style>body {padding-top:35px;}</style>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="top_bg">
	<tr>
		<td class="top_left td_t_n td_r_n"><%=L_Top_View_Company%>  (<font color="#FF0000">*</font>)</td>
		<td class="top_right td_t_n td_r_n">
			<input type="button" class="button_top_reload" value=" " title="刷新" onClick=window.location.href="javascript:window.location.reload();" />
			<% If mid(Session("CRM_qx"), 5, 1) = 1 Then %>
			<input type="button" class="button_top_set" value=" " title="必填项设置" onclick='Setting_Client_AddMust()' style="cursor:pointer" />
			<%end if%>
        </td>
	</tr>
</table>
<script>function Setting_Client_AddMust() {$.dialog.open('../system/GetUpdate.asp?action=Setting&sType=ClientAddMust', {title: '自定义设置', width: 800, height: 480,fixed: true}); };</script>
	
			<table width="100%" border="0" cellpadding="0" cellspacing="0"> <!--修改档案-->
				<form name="Add" action="?action=Client&sType=SaveEdit" method="post"onSubmit="return CheckInput();">
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 
						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
						<col width="120" /><col width="300" /><col width="120" />
							<tr>
								<td class="td_l_r title"> <%if Must_Client_cCompany = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cCompany%></td>
								<td class="td_r_l" colspan=3> <input type="text" class="int" name="Company" id="Company" size="50" maxlength="50" value="<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cCompany")%>" <%if Session("CRM_level")<9 then%><%if EasyCrm.getNewItem("Client","cID",""&cID&"","cDate") <> date() then%>readonly="true"<%end if%><%end if%>> <span class="info_warn help01"><%=L_Tip_Info_01%></span></td>
							</tr>
							<tr> 
								<td class="td_l_r title"> <%if Must_Client_cArea = 1 or Must_Client_cSquare = 1 or Must_Client_cAddress = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cAddress%></td>
								<td class="td_r_l" colspan=3>
									<select name="Area" onchange="getArea(this.options[this.selectedIndex].id);">
									<option value=""><%=L_Please_choose_01%></option>
									<% 
										Set rsb = Conn.Execute("select * from [AreaData] where aFId = '0' ")
										If Not rsb.Eof then
										Do While Not rsb.Eof
										aId= rsb("aId")
										aName= rsb("aName")
									%>
										<option value="<%=aName%>" id="<%=aId%>" <%if aName = EasyCrm.getNewItem("Client","cID",""&cID&"","cArea") then %>selected<%end if%> ><%=aName%></option>
									<%
										rsb.Movenext
										Loop
										End If
										rsb.Close
										Set rsb = Nothing 
									%>
									</select> 
									<span id="Squarediv"  style="margin-left:10px;padding:0;">
										<select name="Squares" onchange="getSquare(options[selectedIndex])">
											<option value=""><%=L_Please_choose_02%></option>
											<% 
											IF EasyCrm.getNewItem("Client","cID",""&cID&"","cArea") <>"" then
											Set rss = Conn.Execute("select * from [AreaData] where aFId= '"&EasyCrm.getNewItem("AreaData","aName","'"&EasyCrm.getNewItem("Client","cID",""&cID&"","cArea")&"'","aId")&"' ")
											If Not rss.Eof then
											Do While Not rss.Eof
											aName= rss("aName")
											%>
											<option value="<%=aName%>" <%if aName = EasyCrm.getNewItem("Client","cID",""&cID&"","cSquare") then %>selected<%end if%> ><%=aName%></option>
											<%rss.Movenext
											Loop
											End If
											rss.Close
											Set rss = Nothing 
											End If
											%>
										</select>
									</span>　
								<input name="Square" type="hidden" id="Square" value="<% = EasyCrm.getNewItem("Client","cID",""&cID&"","cSquare") %>">
								<input name="Address" type="text" class="int" id="Address" size="30" value="<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cAddress")%>" >　
								 <%if Must_Client_cZip = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cZip%>： <input name="Zip" type="text" class="int" id="Zip" size="10" maxlength="6" onkeyup='this.value=this.value.replace(/\D/gi,"")' value="<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cZip")%>" > <span class="info_help help01" onmouseover="tip.start(this)" tips="<%=L_Tip_Info_06%>">&nbsp;</span>
								</td>
							</tr>
							<tr> 
								<td class="td_l_r title"><%if Must_Client_cLinkman = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cLinkman%></td>
							  <td class="td_r_l"> <input name="Linkman" type="text" class="int" id="Linkman" size="10" value="<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cLinkman")%>" >　 <%if Must_Client_cZhiwei = 1 then %><font color="#FF0000">*</font> <%end if%><%=L_Client_cZhiwei%>：<% = EasyCrm.getSelect("SelectData","Select_Zhiwei","Zhiwei",""&EasyCrm.getNewItem("Client","cID",""&cID&"","cZhiwei")&"") %> <% If mid(Session("CRM_qx"), 6, 1) = 1 Then %><input name="Back" type="button" id="Back" class="button227" value="新增" onclick='Select_Zhiwei_InfoAdd()' style="cursor:pointer"><script>function Select_Zhiwei_InfoAdd() {$.dialog.open('../System/GetUpdate.asp?action=SelectData&sType=Add&oType=Select_Zhiwei', {title: '新窗口', width: 400, height: 140,fixed: true}); };</script><%end if%></td>
								<td class="td_l_r title"><%if Must_Client_cMobile = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cMobile%></td>
								<td class="td_r_l" colspan="3"> <input name="Mobile" type="text" class="int" id="Mobile" size="30" value="<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cMobile")%>"  onkeyup='this.value=this.value.replace(/\D/gi,"")'> <span class="info_help help01" onmouseover="tip.start(this)" tips="<%=L_Tip_Info_06%>">&nbsp;</span></td>
							</tr>
						    <tr>
								<td class="td_l_r title"><%if Must_Client_cWechat = 1 then %><font color="#FF0000">*</font> <%end if%><%=L_Client_cWechat %></td>
								<td class="td_r_l"><input name="Wechat" type="text" class="int" id="Wechat" size="30" value="<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cWechat")%>"/></td>
								<td class="td_l_r title"><%if Must_Client_cPosition = 1 then %><font color="#FF0000">*</font> <%end if%><%=L_Client_cPosition %></td>
								<td class="td_r_l"><input name="Position" type="text" class="int" id="Position" size="30" value="<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cPosition")%>"/></td>
							</tr>
							<tr> 
								<td class="td_l_r title" <%if Hidden_Client_cTel=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cTel = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cTel%></td>
								<td class="td_r_l" <%if Hidden_Client_cTel=1 then%>style="display:none;"<%end if%> > <input name="Tel" type="text" class="int" id="Tel" size="30" value="<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cTel")%>" ></td>
								<td class="td_l_r title" <%if Hidden_Client_cFax=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cFax = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cFax%></td>
								<td class="td_r_l" <%if Hidden_Client_cFax=1 then%>style="display:none;"<%end if%> ><input name="Fax" type="text" class="int" id="Fax" size="30" value="<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cFax")%>" ></td>
							</tr>
							<tr> 
								<td class="td_l_r title" <%if Hidden_Client_cHomepage=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cHomepage = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cHomepage%></td>
								<td class="td_r_l" <%if Hidden_Client_cHomepage=1 then%>style="display:none;"<%end if%> > <input name="Homepage" type="text" class="int" id="Homepage" size="35" value="<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cHomepage")%>"  > <span class="info_help help01" onmouseover="tip.start(this)" tips="<%=L_Tip_Info_04%>">&nbsp;</span> </td>
								<td class="td_l_r title" <%if Hidden_Client_cEmail=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cEmail = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cEmail%></td>
								<td class="td_r_l" <%if Hidden_Client_cEmail=1 then%>style="display:none;"<%end if%> > <input name="Email" type="text" class="int" id="Email" size="35" value="<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cEmail")%>" ></td>
							</tr>
							<tr> 
								<td class="td_l_r title"><%if Must_Client_cTrade = 1 or Must_Client_cStrade = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cTrade%></td>
								<td class="td_r_l" colspan="3">
									<select name="Trade" onchange="getTrade(this.options[this.selectedIndex].id);">
									<option value=""><%=L_Please_choose_01%></option>
									<% 
										Set rsb = Conn.Execute("select * from [ProductClass] where pClassFid = '0' ")
										If Not rsb.Eof then
										Do While Not rsb.Eof
										pClassid= rsb("pClassid")
										pClassname= rsb("pClassname")
									%>
										<option value="<%=pClassname%>" id="<%=pClassid%>"><%=pClassname%></option>
									<%
										rsb.Movenext
										Loop
										End If
										rsb.Close
										Set rsb = Nothing 
									%>
									</select> 
									<span id="Stradediv"  style="margin-left:10px;padding:0;">
										<select name="Strades" onchange="getStrade(options[selectedIndex])">
											<option value=""><%=L_Please_choose_02%></option>
											<% 
											IF EasyCrm.getNewItem("Client","cID",""&cID&"","cTrade")<>"" then
											Set rsb = Conn.Execute("select * from [ProductClass] where pClassFid='"&EasyCrm.getNewItem("ProductClass","pClassname","'"&EasyCrm.getNewItem("Client","cID",""&cID&"","cTrade")&"'","pClassId")&"' ")
											If Not rsb.Eof then
											Do While Not rsb.Eof
											pClassname= rsb("pClassname")
											%>
											<option value="<%=pClassname%>"><%=pClassname%></option>
											<%rsb.Movenext
											Loop
											End If
											rsb.Close
											Set rsb = Nothing 
											end if
											%>
										</select>
									</span>
									<input name="Strade" type="hidden" id="Strade" value="<% = EasyCrm.getNewItem("Client","cID",""&cID&"","cStrade") %>">
								</td>
								<!--<td class="td_l_r title"><%if Must_Client_cType = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cType%></td>
								<td class="td_r_l"> <% = EasyCrm.getSelect("SelectData","Select_Type","Type",""&EasyCrm.getNewItem("Client","cID",""&cID&"","cType")&"") %> <% If mid(Session("CRM_qx"), 6, 1) = 1 Then %><input name="Back" type="button" id="Back" class="button227" value="新增" onclick='Select_Type_InfoAdd()' style="cursor:pointer"><script>function Select_Type_InfoAdd() {$.dialog.open('../System/GetUpdate.asp?action=SelectData&sType=Add&oType=Select_Type', {title: '新窗口', width: 400, height: 140,fixed: true}); };</script><%end if%></td>
							-->
							</tr>
							<tr> 
								<td class="td_l_r title" <%if Hidden_Client_cStart=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cStart = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cStart%></td>
								<td class="td_r_l" <%if Hidden_Client_cStart=1 then%>style="display:none;"<%end if%> > <% = EasyCrm.getSelect("SelectData","Select_Star","Start",""&EasyCrm.getNewItem("Client","cID",""&cID&"","cStart")&"") %> <% If mid(Session("CRM_qx"), 6, 1) = 1 Then %><input name="Back" type="button" id="Back" class="button227" value="新增" onclick='Select_Star_InfoAdd()' style="cursor:pointer"><script>function Select_Star_InfoAdd() {$.dialog.open('../System/GetUpdate.asp?action=SelectData&sType=Add&oType=Select_Star', {title: '新窗口', width: 400, height: 140,fixed: true}); };</script><%end if%></td>
								<td class="td_l_r title" <%if Hidden_Client_cSource=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cSource = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cSource%></td>
								<td class="td_r_l" <%if Hidden_Client_cSource=1 then%>style="display:none;"<%end if%> > <% = EasyCrm.getSelect("SelectData","Select_Source","Source",""&EasyCrm.getNewItem("Client","cID",""&cID&"","cSource")&"") %> <% If mid(Session("CRM_qx"), 6, 1) = 1 Then %><input name="Back" type="button" id="Back" class="button227" value="新增" onclick='Select_Source_InfoAdd()' style="cursor:pointer"><script>function Select_Source_InfoAdd() {$.dialog.open('../System/GetUpdate.asp?action=SelectData&sType=Add&oType=Select_Source', {title: '新窗口', width: 400, height: 140,fixed: true}); };</script><%end if%></td>
							</tr>
							<tr>
								<td class="td_l_r title"><%if Must_Client_cIndustry = 1 then %><font color="#FF0000">*</font> <%end if%><%=L_Client_cIndustry %></td>
								<td class="td_r_l" colspan="3"> <% = EasyCrm.getSelect("SelectData","Select_Industry","Industry",""&EasyCrm.getNewItem("Client","cID",""&cID&"","cIndustry")&"") %> <% If mid(Session("CRM_qx"), 6, 1) = 1 Then %><input name="Back" type="button" id="Back" class="button227" value="新增" onclick='Select_Industry_InfoAdd()' style="cursor:pointer"><script>function Select_Industry_InfoAdd() {$.dialog.open('../System/GetUpdate.asp?action=SelectData&sType=Add&oType=Select_Industry', {title: '新窗口', width: 400, height: 140,fixed: true}); };</script><%end if%></td>
							</tr>
							<%
								cContentStr = EasyCrm.getNewItem("CustomFieldContent","cID",""&cID&" and rID is null and oID is null and sID is null and hID is null and eID is null ","cContent")
								cContentArr = split(cContentStr,"|")								
								Set rss = Server.CreateObject("ADODB.Recordset")
								rss.Open "Select * From [CustomField] where cTable='Client' order by Id asc ",conn,3,1
								If rss.RecordCount > 0 Then
								i=1:k=0
								Do While Not rss.BOF And Not rss.EOF
								if i mod 2 = 1 then Response.Write "<tr>"
								if Ubound(cContentArr) > k then
								cContent = split(cContentArr(k),":")
								%>
									<td class="td_l_r title"><%=rss("cTitle")%></td>
									<td class="td_r_l"> 
									<%if inStr(cContentArr(k),cContent(0))>0 then%>
										<%if rss("cType") = "text" then%>
										<input name="<%=rss("cName")%>" type="text" id="<%=rss("cName")%>" class="int" style="width:<%=rss("cWidth")%>px" value="<%=cContent(1)%>">
										<%elseif rss("cType") = "time" then%>
										<input name="<%=rss("cName")%>" type="text" id="<%=rss("cName")%>" class="Wdate" style="width:<%=rss("cWidth")%>px" onFocus="WdatePicker()" value="<%=cContent(1)%>" />
										<%elseif rss("cType") = "select" then%>
											<select name="<%=rss("cName")%>" class="int" style="width:<%=rss("cWidth")%>px">
											<option value=""><%=L_Select%></option>
											<%
											selectstr = split(""&rss("cContent")&"",",")
											for selectarr = 0 to ubound(selectstr)
											if selectstr(selectarr) = cContent(1) then
											response.Write "<option value="""&selectstr(selectarr)&""" selected>"&selectstr(selectarr)&"</option>"
											else
											response.Write "<option value="""&selectstr(selectarr)&""">"&selectstr(selectarr)&"</option>"
											end if
											next
											%>
											</select>
										<%elseif rss("cType") = "checkbox" then%>
											<%
											checkboxstr = split(""&rss("cContent")&"",",")
											for checkboxarr = 0 to ubound(checkboxstr)
											if checkboxstr(checkboxarr) = cContent(1) then
											response.Write "<input name="""&rss("cName")&""" type=""checkbox"" value="""&checkboxstr(checkboxarr)&""" checked> "&checkboxstr(checkboxarr)&"　"
											else
											response.Write "<input name="""&rss("cName")&""" type=""checkbox"" value="""&checkboxstr(checkboxarr)&"""> "&checkboxstr(checkboxarr)&"　"
											end if
											next
											%>
										<%elseif rss("cType") = "radio" then%>
											<%
											radiostr = split(""&rss("cContent")&"",",")
											for radioarr = 0 to ubound(radiostr)
											if radiostr(radioarr) = cContent(1) then
											response.Write "<input name="""&rss("cName")&""" type=""radio"" value="""&radiostr(radioarr)&""" checked> "&radiostr(radioarr)&"　"
											else
											response.Write "<input name="""&rss("cName")&""" type=""radio"" value="""&radiostr(radioarr)&"""> "&radiostr(radioarr)&"　"
											end if
											next
											%>
										<%end if%>
									<%end if%>
									</td>
								<%
								else
								%>
									<td class="td_l_r title"><%=rss("cTitle")%></td>
									<td class="td_r_l"> 
										<%if rss("cType") = "text" then%>
										<input name="<%=rss("cName")%>" type="text" id="<%=rss("cName")%>" class="int" style="width:<%=rss("cWidth")%>px" value="">
										<%elseif rss("cType") = "time" then%>
										<input name="<%=rss("cName")%>" type="text" id="<%=rss("cName")%>" class="Wdate" style="width:<%=rss("cWidth")%>px" onFocus="WdatePicker()" value="" />
										<%elseif rss("cType") = "select" then%>
											<select name="<%=rss("cName")%>" class="int" style="width:<%=rss("cWidth")%>px">
											<option value=""><%=L_Select%></option>
											<%
											selectstr = split(""&rss("cContent")&"",",")
											for selectarr = 0 to ubound(selectstr)
											response.Write "<option value="""&selectstr(selectarr)&""">"&selectstr(selectarr)&"</option>"
											next
											%>
											</select>
										<%elseif rss("cType") = "checkbox" then%>
											<%
											checkboxstr = split(""&rss("cContent")&"",",")
											for checkboxarr = 0 to ubound(checkboxstr)
											response.Write "<input name="""&rss("cName")&""" type=""checkbox"" value="""&checkboxstr(checkboxarr)&"""> "&checkboxstr(checkboxarr)&"　"
											next
											%>
										<%elseif rss("cType") = "radio" then%>
											<%
											radiostr = split(""&rss("cContent")&"",",")
											for radioarr = 0 to ubound(radiostr)
											response.Write "<input name="""&rss("cName")&""" type=""radio"" value="""&radiostr(radioarr)&"""> "&radiostr(radioarr)&"　"
											next
											%>
										<%end if%>
									</td>
								<%
								end if
								i = i + 1:k=k+1
								if i mod 2 = 1 then Response.Write "</tr>"
								rss.MoveNext
								Loop
								end if
								rss.Close
								Set rss = Nothing
							%>
						<!--	<tr> 
								<td class="td_l_r title" <%if Hidden_Client_cInfo=1 then%>style="display:none;"<%end if%> ><%if Must_Client_cInfo = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cInfo%></td>
								<td class="td_r_l" colspan=3 style="padding:5px 10px;" <%if Hidden_Client_cInfo=1 then%>style="display:none;"<%end if%> > <textarea name="Info" rows="4" id="Info" class="int" style="height:50px;width:98%;"><%=EasyCrm.getNewItem("Client","cID",""&cID&"","cInfo")%></textarea></td>
							</tr>-->
							<tr> 
								<td class="td_l_r title"><%if Must_Client_cBeizhu = 1 then %><font color="#FF0000">*</font> <%end if%> <%=L_Client_cBeizhu%></td>
								<td class="td_r_l" colspan=3 style="padding:5px 10px;"> <textarea name="Beizhu" id="Beizhu" class="int" style="height:50px;width:98%;"><%=EasyCrm.getNewItem("Client","cID",""&cID&"","cBeizhu")%></textarea></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<input name="cId" type="hidden" id="cId" value="<% = cId %>">
			<input type="submit" name="Submit" class="button45" value="保存" >　
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
		</td>
	</tr>
</table>
</div>
				</form>

<script language="JavaScript">
<!--
for(var i=0;i<document.all.Area.options.length;i++){
    if(document.all.Area.options[i].value == "<% = EasyCrm.getNewItem("Client","cID",""&cID&"","cArea") %>"){
    document.all.Area.options[i].selected = true;}}

for(var i=0;i<document.all.Squares.options.length;i++){
    if(document.all.Squares.options[i].value == "<% = EasyCrm.getNewItem("Client","cID",""&cID&"","cSquare") %>"){
    document.all.Squares.options[i].selected = true;}}

for(var i=0;i<document.all.Trade.options.length;i++){
    if(document.all.Trade.options[i].value == "<% = EasyCrm.getNewItem("Client","cID",""&cID&"","cTrade") %>"){
    document.all.Trade.options[i].selected = true;}}

for(var i=0;i<document.all.Strades.options.length;i++){
    if(document.all.Strades.options[i].value == "<% = EasyCrm.getNewItem("Client","cID",""&cID&"","cStrade") %>"){
    document.all.Strades.options[i].selected = true;}}
-->
</script>
<%end if%>
<%

elseif sType="SaveEdit" then
	cId = CLng(ABS(Request("cId")))
	cCompany = Trim(Request("Company"))
	cArea = Trim(Request("Area"))
	
	if Trim(Request("Squares"))<>"" then 
		cSquare = Trim(Request("Squares"))
	else
		if Trim(Request("Square")) <> "" then 
		cSquare = Trim(Request("Square"))
		else
		cSquare = ""
		end if
	end if
	
	cAddress = Trim(Request("Address"))
	cZip = Trim(Request("Zip"))
	cLinkman = Trim(Request("Linkman"))
	cWechat=Trim(Request("Wechat"))'by Bob
	cPosition=Trim(Request("Position"))'by Bob
	cIndustry=Trim(Request("Industry"))'by Bob
	cZhiwei = Trim(Request("Zhiwei"))
	cMobile = Trim(Request("Mobile"))
	cTel = Trim(Request("Tel"))
	cFax = Trim(Request("Fax"))
	cHomepage = Trim(Request("Homepage"))
	cEmail = Trim(Request("Email"))  
	cTrade = Trim(Request("Trade"))
	if Trim(Request("Strades"))<>"" then 
		cStrade = Trim(Request("Strades"))
	else
		if Trim(Request("Strade")) <> "" then 
		cstrade = Trim(Request("Strade"))
		else
		cstrade = ""
		end if
	end if
	cType = Trim(Request("Type"))
	cStart = Trim(Request("Start"))
	cSource = Trim(Request("Source"))    
	cInfo = Trim(Request("Info"))
	cBeizhu = Trim(Request("Beizhu"))

	OnlyItem=""
	if ClientOnly = "100" then
		OnlyItem = OnlyItem & " and cCompany = '" & cCompany & "' "
	elseif ClientOnly = "110" then
		OnlyItem = OnlyItem & " and ( cCompany = '" & cCompany & "' or cLinkman = '" & cLinkman & "' ) "
	elseif ClientOnly = "111" then
		OnlyItem = OnlyItem & " and ( cCompany = '" & cCompany & "' or cLinkman = '" & cLinkman & "' or cMobile = '" & cMobile & "' )  "
	elseif ClientOnly = "101" then
		OnlyItem = OnlyItem & " and ( cCompany = '" & cCompany & "' or cMobile = '" & cMobile & "' )"
	elseif ClientOnly = "011" then
		OnlyItem = OnlyItem & " and ( cLinkman = '" & cLinkman & "' or cMobile = '" & cMobile & "' ) "
	elseif ClientOnly = "001" then
		OnlyItem = OnlyItem & " and cMobile = '" & cMobile & "' "
	end if
	'if mid(ClientOnly, 1, 1) = 1 then OnlyItem = OnlyItem & " and cCompany = '" & cCompany & "' "
	'if mid(ClientOnly, 2, 1) = 1 then OnlyItem = OnlyItem & " and cLinkman = '" & cLinkman & "' "
	'if mid(ClientOnly, 3, 1) = 1 then OnlyItem = OnlyItem & " and cMobile = '" & cMobile & "' "
	
	Set rs = Server.CreateObject("ADODB.Recordset")
	rs.Open "Select * From client Where 1=1 " & OnlyItem & " And cId <> " & cId ,conn,1,1
	If rs.RecordCount > 0 Then
        Response.Write("<script>location.href='../Main/GetUpdate.asp?action=Client&sType=InfoEdit&cId="&cId&"&tipinfo="&alert02&"';</script>")
	Response.End()
	End If
	rs.Close
			
	rs.Open "Select Top 1 * From client Where cId = " & cId ,conn,3,2

	rs("cCompany") = cCompany
	rs("cArea") = cArea
	rs("cSquare") = cSquare
	rs("cAddress") = cAddress
	rs("cZip") = cZip
	rs("cLinkman") = cLinkman
	rs("cWechat")=cWechat 'by Bob
	rs("cPosition")=cPosition 'by Bob
	rs("cIndustry")=cIndustry 'by Bob
	rs("cZhiwei") = cZhiwei
	rs("cMobile") = cMobile
	rs("cTel") = cTel
	rs("cFax") = cFax
	rs("cHomepage") = cHomepage
	rs("cEmail") = cEmail
	rs("cTrade") = cTrade
	rs("cStrade") = cStrade
	rs("cType") = cType
	rs("cStart") = cStart
	rs("cSource") = cSource
	rs("cInfo") = cInfo
	rs("cBeizhu") = cBeizhu
	rs("cLastUpdated") = now()

	rs.Update
	rs.Close
	Set rs = Nothing
	
	'同步更新联系人表第一条记录
	conn.execute ("UPDATE [Linkmans] SET lName='"&cLinkman&"',lZhiwei='"&cZhiwei&"',lMobile='"&cMobile&"' Where cId ="&cId&" and lid in ( select top 1 lid from [Linkmans] where cid="&cId&" ) ")
	
	'更新自定义内容
	
	cContent = ""
	Set rsc = Server.CreateObject("ADODB.Recordset")
	rsc.Open "Select * From [CustomField] where cTable='Client' order by Id asc ",conn,3,1
	If rsc.RecordCount > 0 Then
	Do While Not rsc.BOF And Not rsc.EOF
	'获取所有自定义字段
	cContent = cContent & rsc("cName") &":"& Trim(Request(rsc("cName"))) &"|" 
	rsc.MoveNext
	Loop
	end if
	rsc.Close
	Set rsc = Nothing
	if EasyCrm.getNewItem("CustomFieldContent","cID",""&cID&"","cContent")="0" then
	conn.execute ("insert into CustomFieldContent(cID,cContent) values('"&cid&"','"&cContent&"')")	
	else
	conn.execute ("UPDATE [CustomFieldContent] SET cContent='"&cContent&"' Where cId ="&cId&" ")
	end if
	
	'插入操作记录
	conn.execute ("insert into Logfile(lCid,lClass,lAction,lUser,lTime) values('"&cid&"','"&L_Client&"','"&L_insert_action_02&"','"&Session("CRM_name")&"','"&now()&"')")	

	Response.Write("<script>art.dialog.close();art.dialog.open.origin.location.reload();</script>")
		
elseif sType="InfoView" then
	otype	=	Request.QueryString("otype")
%>
<style>body {padding-top:35px;padding-bottom:55px;}</style>
<table width="100%" border="0" cellpadding="0" cellspacing="0" class="top_bg">
	<tr>
		<td class="top_left td_t_n td_r_n"><%=L_Client_cCompany%> : <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cCompany")%> </td>
		<td class="top_right td_t_n td_r_n">
			<input type="button" class="button_top_reload" value=" " title="刷新" onClick=window.location.href="javascript:window.location.reload();" />
			<% If mid(Session("CRM_qx"), 5, 1) = 1 Then %>
			<%if otype="Linkmans" then%>
			<input type="button" class="button_top_set" value=" " title="设置" onclick='Setting_Linkmans()' style="cursor:pointer" />
			<%elseif otype="Records" then%>
			<input type="button" class="button_top_set" value=" " title="设置" onclick='Setting_Records()' style="cursor:pointer" />
			<%elseif otype="Order" then%>
			<input type="button" class="button_top_set" value=" " title="设置" onclick='Setting_Order()' style="cursor:pointer" />
			<%elseif otype="Hetong" then%>
			<input type="button" class="button_top_set" value=" " title="设置" onclick='Setting_Hetong()' style="cursor:pointer" />
			<%elseif otype="Service" then%>
			<input type="button" class="button_top_set" value=" " title="设置" onclick='Setting_Service()' style="cursor:pointer" />
			<%elseif otype="Expense" then%>
			<input type="button" class="button_top_set" value=" " title="设置" onclick='Setting_Expense()' style="cursor:pointer" />
			<%end if%>
			<%end if%>
        </td>
	</tr>
</table>
<script>function Setting_Linkmans() {$.dialog.open('../system/GetUpdate.asp?action=Setting&sType=Linkmans', {title: '自定义设置', width: 900, height: 480,fixed: true}); };</script>
<script>function Setting_Records() {$.dialog.open('../system/GetUpdate.asp?action=Setting&sType=Records', {title: '自定义设置', width: 900, height: 480,fixed: true}); };</script>
<script>function Setting_Order() {$.dialog.open('../system/GetUpdate.asp?action=Setting&sType=Order', {title: '自定义设置', width: 900, height: 480,fixed: true}); };</script>
<script>function Setting_Hetong() {$.dialog.open('../system/GetUpdate.asp?action=Setting&sType=Hetong', {title: '自定义设置', width: 900, height: 480,fixed: true}); };</script>
<script>function Setting_Service() {$.dialog.open('../system/GetUpdate.asp?action=Setting&sType=Service', {title: '自定义设置', width: 900, height: 480,fixed: true}); };</script>
<script>function Setting_Expense() {$.dialog.open('../system/GetUpdate.asp?action=Setting&sType=Expense', {title: '自定义设置', width: 900, height: 480,fixed: true}); };</script>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n   pdt10">   
            <div class="MenuboxS">
              <ul>
                <li <%if otype="Client" or otype="" then%>class="hover"<%end if%>><span><a href="?action=Client&sType=InfoView&otype=Client&cID=<%=cID%>&YNRange=<%=YNRange%>"><%=L_Client%></a></span></li>
			<% If mid(Session("CRM_qx"), 21, 1) = 1 Then %>
                <li <%if otype="Linkmans" then%>class="hover"<%end if%>><span><a href="?action=Client&sType=InfoView&otype=Linkmans&cID=<%=cID%>&YNRange=<%=YNRange%>"><%=L_Linkmans%></a></span></li>
			<%end if%>
			<% If mid(Session("CRM_qx"), 26, 1) = 1 Then %>
                <li <%if otype="Records" then%>class="hover"<%end if%>><span><a href="?action=Client&sType=InfoView&otype=Records&cID=<%=cID%>&YNRange=<%=YNRange%>"><%=L_Records%></a></span></li>
			<%end if%>
			<% If mid(Session("CRM_qx"), 26, 1) = 1 Then %>
                <li <%if otype="RecordProgress" then%>class="hover"<%end if%>><span><a href="?action=Client&sType=InfoView&otype=RecordProgress&cID=<%=cID%>&YNRange=<%=YNRange%>"><%=L_Records_Progress%></a></span></li>
			<%end if%>
				<%if YNRange = "" then%>
				<% If mid(Session("CRM_qx"), 31, 1) = 1 Then %>
                <li <%if otype="Order" then%>class="hover"<%end if%>><span><a href="?action=Client&sType=InfoView&otype=Order&cID=<%=cID%>"><%=L_Order%></a></span></li>
				<%end if%>
				<% If mid(Session("CRM_qx"), 36, 1) = 1 Then %>
                <li <%if otype="Hetong" then%>class="hover"<%end if%>><span><a href="?action=Client&sType=InfoView&otype=Hetong&cID=<%=cID%>"><%=L_Hetong%></a></span></li>
				<%end if%>
				<% If mid(Session("CRM_qx"), 41, 1) = 1 Then %>
                <li <%if otype="Service" then%>class="hover"<%end if%>><span><a href="?action=Client&sType=InfoView&otype=Service&cID=<%=cID%>"><%=L_Service%></a></span></li>
				<%end if%>
				<% If mid(Session("CRM_qx"), 46, 1) = 1 Then %>
                <li <%if otype="Expense" then%>class="hover"<%end if%>><span><a href="?action=Client&sType=InfoView&otype=Expense&cID=<%=cID%>"><%=L_Expense%></a></span></li>
				<%end if%>
				<% If mid(Session("CRM_qx"), 51, 1) = 1 Then %>
                <li <%if otype="File" then%>class="hover"<%end if%>><span><a href="?action=Client&sType=InfoView&otype=File&cID=<%=cID%>"><%=L_File%></a></span></li>
				<%end if%>
				<% If mid(Session("CRM_qx"), 10, 1) = 1 Then %>
                <li <%if otype="Share" then%>class="hover"<%end if%>><span><a href="?action=Client&sType=InfoView&otype=Share&cID=<%=cID%>"><%=L_Share%></a></span></li>
				<%end if%>
                <li <%if otype="History" then%>class="hover"<%end if%>><span><a href="?action=Client&sType=InfoView&otype=History&cID=<%=cID%>"><%=L_Logfile%></a></span></li>
				<%else%>
				<% If mid(Session("CRM_qx"), 31, 1) = 1 Then %>
                <li <%if otype="Order" then%>class="hover"<%end if%>><span><a href="#" style="text-decoration:line-through;color:#999"><%=L_Order%></a></span></li>
				<%end if%>
				<% If mid(Session("CRM_qx"), 36, 1) = 1 Then %>
                <li <%if otype="Hetong" then%>class="hover"<%end if%>><span><a href="#" style="text-decoration:line-through;color:#999"><%=L_Hetong%></a></span></li>
				<%end if%>
				<% If mid(Session("CRM_qx"), 41, 1) = 1 Then %>
                <li <%if otype="Service" then%>class="hover"<%end if%>><span><a href="#" style="text-decoration:line-through;color:#999"><%=L_Service%></a></span></li>
				<%end if%>
				<% If mid(Session("CRM_qx"), 46, 1) = 1 Then %>
                <li <%if otype="Expense" then%>class="hover"<%end if%>><span><a href="#" style="text-decoration:line-through;color:#999"><%=L_Expense%></a></span></li>
				<%end if%>
				<% If mid(Session("CRM_qx"), 51, 1) = 1 Then %>
                <li <%if otype="File" then%>class="hover"<%end if%>><span><a href="#" style="text-decoration:line-through;color:#999"><%=L_File%></a></span></li>
				<%end if%>
				<% If mid(Session("CRM_qx"), 10, 1) = 1 Then %>
                <li <%if otype="Share" then%>class="hover"<%end if%>><span><a href="#" style="text-decoration:line-through;color:#999"><%=L_Share%></a></span></li>
				<%end if%>
                <li <%if otype="History" then%>class="hover"<%end if%>><span><a href="#" style="text-decoration:line-through;color:#999"><%=L_Logfile%></a></span></li>
				<%end if%>
              </ul> 
            </div>
		</td>
	</tr>
</table>
	<%if otype="Client" or otype="" then%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 
						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
						<col width="120" /><col width="300" /><col width="120" />
							<tr class="tr_t"> 
								<td class="td_l_l" COLSPAN="2" style="border-right:0;"><B>基本资料</B></td>
								<td class="td_l_r" COLSPAN="2"><%=L_Client_cLastUpdated%>：<%=EasyCrm.FormatDate(EasyCrm.getNewItem("Client","cID",""&cID&"","cLastUpdated"),1)%></td>
							</tr>
							<tr> 
								<td class="td_l_r title"><%=L_Client_cAddress%></td>
								<td class="td_r_l" colspan=3> <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cArea")%>&nbsp;&nbsp;<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cSquare")%>&nbsp;&nbsp;<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cAddress")%>&nbsp;&nbsp;<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cZip")%></td>
							</tr>
							<tr> 
								<td class="td_l_r title"><%=L_Client_cLinkman%></td>
							  <td class="td_r_l"> <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cLinkman")%>&nbsp;&nbsp;<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cZhiwei")%></td>
								<td class="td_l_r title"><%=L_Client_cMobile%></td>
								<td class="td_r_l"> <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cMobile")%></td>
							</tr>
							<tr>
								<td class="td_l_r title"><%=L_Client_cWechat %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("Client","cID",""&cID&"","cWechat")%></td>
								<td class="td_l_r title"><%=L_Client_cPosition %></td>
								<td class="td_r_l"><%= EasyCrm.getNewItem("Client","cID",""&cID&"","cPosition")%></td>
							</tr>
							<tr> 
								<td class="td_l_r title" <%if Hidden_Client_cTel=1 then%>style="display:none;"<%end if%> ><%=L_Client_cTel%></td>
								<td class="td_r_l" <%if Hidden_Client_cTel=1 then%>style="display:none;"<%end if%> > <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cTel")%> </td>
								<td class="td_l_r title" <%if Hidden_Client_cFax=1 then%>style="display:none;"<%end if%> ><%=L_Client_cFax%></td>
								<td class="td_r_l" <%if Hidden_Client_cFax=1 then%>style="display:none;"<%end if%> > <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cFax")%> </td>
							</tr>
							<tr> 
								<td class="td_l_r title" <%if Hidden_Client_cHomepage=1 then%>style="display:none;"<%end if%> ><%=L_Client_cHomepage%></td>
								<td class="td_r_l" <%if Hidden_Client_cHomepage=1 then%>style="display:none;"<%end if%> > <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cHomepage")%> </td>
								<td class="td_l_r title" <%if Hidden_Client_cEmail=1 then%>style="display:none;"<%end if%> ><%=L_Client_cEmail%></td>
								<td class="td_r_l" <%if Hidden_Client_cEmail=1 then%>style="display:none;"<%end if%> > <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cEmail")%> </td>
							</tr>
							<tr> 
								<td class="td_l_r title"><%=L_Client_cTrade%></td>
								<td class="td_r_l" colspan="3"> <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cTrade")%>&nbsp;&nbsp;<%=EasyCrm.getNewItem("Client","cID",""&cID&"","cStrade")%></td>
								<!--<td class="td_l_r title"><%=L_Client_cType%></td>
								<td class="td_r_l"> <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cType")%> </td>-->
							</tr>
							<tr> 
								<td class="td_l_r title" <%if Hidden_Client_cStart=1 then%>style="display:none;"<%end if%> ><%=L_Client_cStart%></td>
								<td class="td_r_l" <%if Hidden_Client_cStart=1 then%>style="display:none;"<%end if%> > <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cStart")%> </td>
								<td class="td_l_r title" <%if Hidden_Client_cSource=1 then%>style="display:none;"<%end if%> ><%=L_Client_cSource%></td>
								<td class="td_r_l" <%if Hidden_Client_cSource=1 then%>style="display:none;"<%end if%> > <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cSource")%> </td>
							</tr>
							<tr>
								<td class="td_l_r title"><%=L_Client_cIndustry %></td>
								<td class="td_r_l" colspan="3"><%=EasyCrm.getNewItem("Client","cID",""&cID&"","cIndustry")%></td>
							</tr>
							<%
								cContentStr = EasyCrm.getNewItem("CustomFieldContent","cID",""&cID&" and rID is null and oID is null and sID is null and hID is null and eID is null ","cContent")
								cContentArr = split(cContentStr,"|")								
								Set rss = Server.CreateObject("ADODB.Recordset")
								rss.Open "Select * From [CustomField] where cTable='Client' order by Id asc ",conn,3,1
								If rss.RecordCount > 0 Then
								i=1:k=0
								Do While Not rss.BOF And Not rss.EOF
								if i mod 2 = 1 then Response.Write "<tr>"
								if Ubound(cContentArr) > k then
								cContent = split(cContentArr(k),":")
								%>
									<td class="td_l_r title"><%=rss("cTitle")%></td>
									<td class="td_r_l"> 
									<%if inStr(cContentArr(k),cContent(0))>0 then%>
										<%=cContent(1)%>
									<%end if%>
									</td>
								<%
								else
								%>
									<td class="td_l_r title"><%=rss("cTitle")%></td>
									<td class="td_r_l"> 
									</td>
								<%
								end if
								i = i + 1:k=k+1
								if i mod 2 = 1 then Response.Write "</tr>"
								rss.MoveNext
								Loop
								end if
								rss.Close
								Set rss = Nothing
							%>
						<!--	<tr> 
								<td class="td_l_r title" <%if Hidden_Client_cInfo=1 then%>style="display:none;"<%end if%> ><%=L_Client_cInfo%></td>
								<td class="td_r_l" colspan=3 style="height:43px;" <%if Hidden_Client_cInfo=1 then%>style="display:none;"<%end if%> > <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cInfo")%> </td>
							</tr>-->
							<tr> 
								<td class="td_l_r title"><%=L_Client_cBeizhu%></td>
								<td class="td_r_l" colspan=3 style="height:43px;"> <%=EasyCrm.getNewItem("Client","cID",""&cID&"","cBeizhu")%> </td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<% If mid(Session("CRM_qx"), 18, 1) = 1 Then %>
			<%if YNRange = "" then%>
			<input type="button" class="button45" value="编辑" onclick='Client_InfoEdit();' style="cursor:pointer" />　
			<%end if%>
			<%end if%>
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
		</td>
	</tr>
</table>
</div>
<script>function Client_InfoEdit() {$.dialog.open('../Main/GetUpdate.asp?action=Client&sType=InfoEdit&cId=<%=cID%>', {title: '编辑', width: 900,height: 480, fixed: true}); };</script>

	<%
	elseif otype="Linkmans" then '联系人 ?action=Client&sType=InfoView&otype=Linkmans&cID=cID
	%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 

						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
							<tr class="tr_t">
								<%if Linkmans_lName = 1 then %>
								<td class="td_l_c"><%=L_Linkmans_lName%></td>
								<%end if%>
								<%if Linkmans_lSex = 1 then %>
								<td class="td_l_c"><%=L_Linkmans_lSex%></td>
								<%end if%>
								<%if Linkmans_lZhiwei = 1 then %>
								<td class="td_l_c"><%=L_Linkmans_lZhiwei%></td>
								<%end if%>
								<%if Linkmans_lMobile = 1 then %>
								<td class="td_l_c"><%=L_Linkmans_lMobile%></td>
								<%end if%>
								<%if Linkmans_lTel = 1 then %>
								<td class="td_l_c"><%=L_Linkmans_lTel%></td>
								<%end if%>
								<%if Linkmans_lEmail = 1 then %>
								<td class="td_l_c"><%=L_Linkmans_lEmail%></td>
								<%end if%>
								<%if Linkmans_lQQ = 1 then %>
								<td class="td_l_c"><%=L_Linkmans_lQQ%></td>
								<%end if%>
								<%if Linkmans_lMSN = 1 then %>
								<td class="td_l_c"><%=L_Linkmans_lMSN%></td>
								<%end if%>
								<%if Linkmans_lALWW = 1 then %>
								<td class="td_l_c"><%=L_Linkmans_lALWW%></td>
								<%end if%>
								<%if Linkmans_lBirthday = 1 then %>
								<td class="td_l_c"><%=L_Linkmans_lBirthday%></td>
								<%end if%>
								<%if Linkmans_lContent = 1 then %>
								<td class="td_l_c"><%=L_Linkmans_lContent%></td>
								<%end if%>
								<%if Linkmans_lTime = 1 then %>
								<td class="td_l_c"><%=L_Linkmans_lTime%></td>
								<%end if%>
								<%if YNRange = "" then%>
								<td width="90" class="td_l_c">管理</td>
								<%end if%>
							</tr>
						<%
						Set rs = Server.CreateObject("ADODB.Recordset")
						rs.Open "Select * From [linkmans] where cId = "&cId&" Order By lId asc ",conn,1,1
						If rs.RecordCount > 0 Then
						i=0 
						Do While Not rs.BOF And Not rs.EOF
						i=i+1
						%>
							<tr class="tr" <%if i=1 then%>style="color:red"<%end if%>>
								<%if Linkmans_lName = 1 then %>
								<td class="td_l_c" ><%=rs("lName")%></td>
								<%end if%>
								<%if Linkmans_lSex = 1 then %>
								<td class="td_l_c"><%=rs("lSex")%></td>
								<%end if%>
								<%if Linkmans_lZhiwei = 1 then %>
								<td class="td_l_c"><%=rs("lZhiwei")%></td>
								<%end if%>
								<%if Linkmans_lMobile = 1 then %>
								<td class="td_l_c"><%=rs("lMobile")%></td>
								<%end if%>
								<%if Linkmans_lTel = 1 then %>
								<td class="td_l_c"><%=rs("lTel")%></td>
								<%end if%>
								<%if Linkmans_lEmail = 1 then %>
								<td class="td_l_c"><%=rs("lEmail")%></td>
								<%end if%>
								<%if Linkmans_lQQ = 1 then %>
								<td class="td_l_c"><%=rs("lQQ")%></td>
								<%end if%>
								<%if Linkmans_lMSN = 1 then %>
								<td class="td_l_c"><%=rs("lMSN")%></td>
								<%end if%>
								<%if Linkmans_lALWW = 1 then %>
								<td class="td_l_c"><%=rs("lALWW")%></td>
								<%end if%>
								<%if Linkmans_lBirthday = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("lBirthday"),2)%></td>
								<%end if%>
								<%if Linkmans_lContent = 1 then %>
								<td class="td_l_c"><%if rs("lContent")<>"" then%><input type="button" class="button226" value="查看" onclick='Linkmans_InfoView<%=rs("lId")%>()' style="cursor:pointer" /><%end if%></td>
								<%end if%>
								<%if Linkmans_lTime = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("lTime"),2)%></td>
								<%end if%>
								<%if YNRange = "" then%>
								<td class="td_l_c"><% If mid(Session("CRM_qx"), 23, 1) = 1 Then %><input type="button" class="button_info_edit" value=" " title="<%=L_Edit%>"  onclick='Linkmans_InfoEdit<%=rs("lId")%>()' style="cursor:pointer" /><%end if%> <% If mid(Session("CRM_qx"), 24, 1) = 1 Then %><%if i>1 then%><input type="button" class="button_info_del" value=" " title="<%=L_Del%>" onclick='Linkmans_InfoDel<%=rs("lId")%>()' style="cursor:pointer" /><%end if%><%end if%></td>
								<%end if%>
							</tr>
							<script>function Linkmans_InfoEdit<%=rs("lId")%>() {$.dialog.open('../Main/GetUpdateRW.asp?action=Linkmans&sType=Edit&Id=<%=rs("lId")%><%if i=1 then%>&YNUpdate=1<%end if%>', {title: '编辑', width: 700,height: 340, fixed: true}); };</script>
							<script>function Linkmans_InfoDel<%=rs("lId")%>() {$.dialog( { content: '<%=Alert_del_YN%>',icon: 'error',ok: function () { art.dialog.open('../Main/GetUpdateRW.asp?action=Linkmans&sType=Delete&Id=<%=rs("lid")%>');return false;},cancel: true }); };</script>
							<script>function Linkmans_InfoView<%=rs("lId")%>() {art.dialog({ title: '详情备注',content: '<%=rs("lContent")%>',drag: false,resize: false}); };</script>
						<%
						rs.MoveNext
						Loop
							end if
						rs.Close
						Set rs = Nothing
						%>
							
						</table>
					</td> 
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<span class="Bottom_pd r fontnobold">红色：第一联系人（仅允许修改，同步更新基本档案）</span>
			<% If mid(Session("CRM_qx"), 22, 1) = 1 Then %>
			<%if YNRange = "" then%>
			<input name="Back" type="button" id="Back" class="button45" value="新增" onclick='Linkmans_InfoAdd()' style="cursor:pointer">　
			<%end if%>
			<%end if%>
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
		</td>
	</tr>
</table>
</div>

<script>function Linkmans_InfoAdd() {$.dialog.open('../Main/GetUpdateRW.asp?action=Linkmans&sType=Add&cID=<%=cID%>', {title: '新窗口', width: 700, height: 340,fixed: true}); };</script>
	<%
	elseif otype="Records" then '跟单记录 ?action=Client&sType=InfoView&otype=Records&cID=cID
	%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 

						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
							<tr class="tr_t">
								<%if Records_rType = 1 then %>
								<td class="td_l_c"><%=L_Records_rType%></td>
								<%end if%>
								<%if Records_rState = 1 then %>
								<td class="td_l_c"><%=L_Records_rState%></td>
								<%end if%>
								<%if Records_rLinkman = 1 then %>
								<td class="td_l_c"><%=L_Records_rLinkman%></td>
								<%end if%>
                                <%if Records_rVisitTime = 1 then %>
								<td class="td_l_c"><%=L_Records_rVisitTime%></td>
								<%end if%>
								<%if Records_rNextTime = 1 then %>
								<td class="td_l_c"><%=L_Records_rNextTime%></td>
								<%end if%>
								<%if Records_rContent = 1 then %>
								<td class="td_l_c"><%=L_Records_rContent%></td>
								<%end if%>
								<%if Records_rUser = 1 then %>
								<td class="td_l_c"><%=L_Records_rUser%></td>
								<%end if%>
								<%if Records_rTime = 1 then %>
								<td class="td_l_c"><%=L_Records_rTime%></td>
								<%end if%>
								<%if YNRange = "" then%>
								<td width="90" class="td_l_c">管理</td>
								<%end if%>
							</tr>
						<%
						Set rs = Server.CreateObject("ADODB.Recordset")
						rs.Open "Select * From [Records] where cId = "&cId&" Order By rId desc ",conn,1,1
						If rs.RecordCount > 0 Then
						Do While Not rs.BOF And Not rs.EOF
						%>
							<tr class="tr">
								<%if Records_rType = 1 then %>
								<td class="td_l_c"><%=rs("rType")%></td>
								<%end if%>
								<%if Records_rState = 1 then %>
								<td class="td_l_c"><%=rs("rState")%></td>
								<%end if%>
								<%if Records_rLinkman = 1 then %>
								<td class="td_l_c"><%=rs("rLinkman")%></td>
								<%end if%>
                                <%if Records_rVisitTime = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("rVisitTime"),2)%></td>
								<%end if%>
								<%if Records_rNextTime = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("rNextTime"),2)%></td>
								<%end if%>
								<%if Records_rContent = 1 then %>
								<td class="td_l_l" style="line-height:25px;"><%if rs("rContent")<>"" then%><%=rs("rContent")%><%end if%></td>
								<%end if%>
								<%if Records_rUser = 1 then %>
								<td class="td_l_c"><%=rs("rUser")%></td>
								<%end if%>
								<%if Records_rTime = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("rTime"),2)%></td>
								<%end if%>
								<%if YNRange = "" then%>
								<td class="td_l_c"><% If mid(Session("CRM_qx"), 28, 1) = 1 Then %><input type="button" class="button_info_edit" value=" " title="<%=L_Edit%>"  onclick='Records_InfoEdit<%=rs("rId")%>()' style="cursor:pointer" /><%end if%> <% If mid(Session("CRM_qx"), 29, 1) = 1 Then %><input type="button" class="button_info_del" value=" " title="<%=L_Del%>" onclick='Records_InfoDel<%=rs("rId")%>()' style="cursor:pointer" /><%end if%></td>
								<%end if%>
							</tr>
							<script>function Records_InfoEdit<%=rs("rId")%>() {$.dialog.open('../Main/GetUpdateRW.asp?action=Records&sType=Edit&Id=<%=rs("rId")%>', {title: '编辑', width: 800,height: 340, fixed: true}); };</script>
							<script>function Records_InfoDel<%=rs("rId")%>() {$.dialog( { content: '<%=Alert_del_YN%>',icon: 'error',ok: function () { art.dialog.open('../Main/GetUpdateRW.asp?action=Records&sType=Delete&Id=<%=rs("rId")%>');return false;},cancel: true }); };</script>
						<%
						rs.MoveNext
						Loop
							end if
						rs.Close
						Set rs = Nothing
						%>
							
						</table>
					</td> 
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<% If mid(Session("CRM_qx"), 27, 1) = 1 Then %>
			<%if YNRange = "" then%>
			<input name="Back" type="button" id="Back" class="button45" value="新增" onclick='Records_InfoAdd()' style="cursor:pointer">　
			<%end if%>
			<%end if%>
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
			
		</td>
	</tr>
</table>
</div>
<script>function Records_InfoAdd() {$.dialog.open('../Main/GetUpdateRW.asp?action=Records&sType=Add&cID=<%=cID%>', {title: '新窗口', width: 800, height: 340,fixed: true}); };</script>

<!--	RecordProgress 跟单进度-->	
	<%elseif otype="RecordProgress" then '?action=Client&sType=InfoView&otype=RecordProgress&cID=cID%>
		<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 
						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
						<col width="180" /><col width="280" /><col width="180" />
							<tr class="tr_t"> 
								<td class="td_l_l" COLSPAN="4" style="border-right:0;"></td><!--<B>基本资料</B>-->
								<!--<td class="td_l_r" COLSPAN="2"><%=L_Client_cLastUpdated%>：<%=EasyCrm.FormatDate(EasyCrm.getNewItem("Client","cID",""&cID&"","cLastUpdated"),1)%></td>-->
							</tr>
						<tr> 
								<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpCompetitor %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpCompetitor")%></td>
								<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpCustomer_Exchange %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpCustomer_Exchange")%></td>
							</tr>
							<tr> 
								<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpProducts_Plans %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpProducts_Plans")%></td>
								<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpHave_Projects %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpHave_Projects")%></td>
							</tr>
							<tr>
								<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpProjects_Products %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpProjects_Products")%></td>
								<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpProject_Status %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpProject_Status")%></td>
							</tr>
							<tr> 
								<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpNext_Work %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpNext_Work")%></td>
								<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpBudget %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpBudget")%></td>
							</tr>
							<tr> 
								<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpOffer %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpOffer")%></td>
								<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpGrasp_Degree %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpGrasp_Degree")%></td>
							</tr>
							<tr> 
								<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpDecision_Chain %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpDecision_Chain")%></td>
								<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpCustomer_Status %></td>
								<td class="td_r_l"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpCustomer_Status")%></td>
							</tr>
							<tr>
									<td class="td_l_r title"><font color="#FF0000">*</font><%=L_rpChannels_Cooperation %></td>
								<td class="td_r_l" colspan="3"><%=EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpChannels_Cooperation")%></td>
							</tr>
						</table>
					</td>
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<% 
				rpId = EasyCrm.getNewItem("RecordProgress","cID",""&cID&"","rpId")
				If mid(Session("CRM_qx"), 18, 1) = 1 Then %>
			<%if YNRange = "" then%>
			<%if rpId=0 or rpId=""  then%>
			<input type="button" class="button45" value="新增" onclick='RecordProgress_InfoAdd();' style="cursor:pointer" />　
			<%end if%>
			<%if rpId>0 then%>
			<input type="button" class="button45" value="修改" onclick='RecordProgress_InfoEdit();' style="cursor:pointer" />　
			<%end if%>
			<%end if%>
			<%end if%>
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
		</td>
	</tr>
</table>
</div>
<script>function RecordProgress_InfoAdd() {$.dialog.open('../Main/GetUpdateRW.asp?action=RecordProgress&sType=Add&cID=<%=cID%>', {title: '新窗口', width: 700, height: 340,fixed: true}); };</script>
<script>function RecordProgress_InfoEdit() {$.dialog.open('../Main/GetUpdateRW.asp?action=RecordProgress&sType=Edit&cID=<%=cID%>', {title: '新窗口', width: 700, height: 340,fixed: true}); };</script>
	<%
	elseif otype="Order" then '订单记录 ?action=Client&sType=InfoView&otype=Order&cID=cID
	%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 

						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
							<tr class="tr_t">
								<td class="td_l_c"><%=L_Order_oCode%></td>
								<%if Order_oLinkman = 1 then %>
								<td class="td_l_c"><%=L_Order_oLinkman%></td>
								<%end if%>
								<%if Order_oSDate = 1 then %>
								<td class="td_l_c"><%=L_Order_oSDate%></td>
								<%end if%>
								<%if Order_oEDate = 1 then %>
								<td class="td_l_c"><%=L_Order_oEDate%></td>
								<%end if%>
								<%if Order_oDeposit = 1 then %>
								<td class="td_l_c"><%=L_Order_oDeposit%></td>
								<%end if%>
								<td class="td_l_c"><%=L_Order_oMoney%></td>
								<%if Order_oState = 1 then %>
								<td class="td_l_c"><%=L_Order_oState%></td>
								<%end if%>
								<%if Order_oContent = 1 then %>
								<td class="td_l_c"><%=L_Order_oContent%></td>
								<%end if%>
								<%if Order_oUser = 1 then %>
								<td class="td_l_c"><%=L_Order_oUser%></td>
								<%end if%>
								<%if Order_oTime = 1 then %>
								<td class="td_l_c"><%=L_Order_oTime%></td>
								<%end if%>
								<td width="130" class="td_l_c">管理</td>
							</tr>
						<%
						Set rs = Server.CreateObject("ADODB.Recordset")
						rs.Open "Select * From [Order] where cId = "&cId&" Order By oId desc ",conn,1,1
						If rs.RecordCount > 0 Then
						Do While Not rs.BOF And Not rs.EOF
						%>
							<tr class="tr">
								<td class="td_l_c"><a title="订单产品明细"  onclick='Order_Products_List<%=rs("oId")%>()' style="cursor:pointer" ><%=rs("oCode")%></a></td>
								<%if Order_oLinkman = 1 then %>
								<td class="td_l_c"><%=rs("oLinkman")%></td>
								<%end if%>
								<%if Order_oSDate = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("oSDate"),2)%></td>
								<%end if%>
								<%if Order_oEDate = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("oEDate"),2)%></td>
								<%end if%>
								<%if Order_oDeposit = 1 then %>
								<td class="td_l_c"><%=rs("oDeposit")%></td>
								<%end if%>
								<td class="td_l_c"><%if rs("oMoney")<1 and rs("oMoney")>0 then%>0<%end if%><%=rs("oMoney")%></td>
								<%if Order_oState = 1 then %>
								<td class="td_l_c"><%if rs("oState") = 0 then%>未处理<%elseif rs("oState") = 1 then%>处理中<%elseif rs("oState") = 2 then%>已完成<%elseif rs("oState") = 3 then%>已取消<%end if%></td>
								<%end if%>
								<%if Order_oContent = 1 then %>
								<td class="td_l_c"><%if rs("oContent")<>"" then%><input type="button" class="button226" value="查看" onclick='Order_InfoView<%=rs("oId")%>()' style="cursor:pointer" /><%end if%></td>
								<%end if%>
								<%if Order_oUser = 1 then %>
								<td class="td_l_c"><%=rs("oUser")%></td>
								<%end if%>
								<%if Order_oTime = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("oTime"),2)%></td>
								<%end if%>
								<td class="td_l_c"><input type="button" class="button_info_add" value=" " title="快速添加产品"  onclick='Order_Products_Add<%=rs("oId")%>()' style="cursor:pointer" /> <% If mid(Session("CRM_qx"), 33, 1) = 1 Then %><input type="button" class="button_info_edit" value=" " title="<%=L_Edit%>"  onclick='Order_InfoEdit<%=rs("oId")%>()' style="cursor:pointer" /><%end if%> <% If mid(Session("CRM_qx"), 34, 1) = 1 Then %><input type="button" class="button_info_del" value=" " title="<%=L_Del%>" onclick='Order_InfoDel<%=rs("oId")%>()' style="cursor:pointer" /><%end if%></td>
							</tr>
							<script>function Order_Products_Add<%=rs("oId")%>() {$.dialog.open('../Main/GetUpdateRW.asp?action=OrderProducts&sType=Add&Id=<%=rs("oId")%>', {title: '添加', width: 700,height: 400, fixed: true}); };</script>
							<script>function Order_Products_List<%=rs("oId")%>() {$.dialog.open('../Main/GetUpdateRW.asp?action=OrderProducts&sType=List&Id=<%=rs("oId")%>', {title: '查看', width: 860,height: 440, fixed: true}); };</script>
							<script>function Order_InfoEdit<%=rs("oId")%>() {$.dialog.open('../Main/GetUpdateRW.asp?action=Order&sType=Edit&Id=<%=rs("oId")%>', {title: '编辑', width: 700,height: 340, fixed: true}); };</script>
							<script>function Order_InfoDel<%=rs("oId")%>() {$.dialog( { content: '<%=Alert_del_YN%>',icon: 'error',ok: function () { art.dialog.open('../Main/GetUpdateRW.asp?action=Order&sType=Delete&Id=<%=rs("oId")%>');return false;},cancel: true }); };</script>
							
							<script>function Order_InfoView<%=rs("oId")%>() {
								art.dialog(
									{ 
										title: '详情备注', 
										content: '<%=EasyCrm.clearWord(""&rs("oContent")&"")%>',
										drag: false,
										resize: false
									}
								); 
							};</script>
						<%
						rs.MoveNext
						Loop
							end if
						rs.Close
						Set rs = Nothing
						%>
							
						</table>
					</td> 
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<% If mid(Session("CRM_qx"), 32, 1) = 1 Then %>
			<input name="Back" type="button" id="Back" class="button45" value="新增" onclick='Order_InfoAdd()' style="cursor:pointer">　
			<%end if%>
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
		</td>
	</tr>
</table>
</div>
<script>function Order_InfoAdd() {$.dialog.open('../Main/GetUpdateRW.asp?action=Order&sType=Add&cID=<%=cID%>', {title: '新窗口', width: 700, height: 340,fixed: true}); };</script>
	<%
	elseif otype="Hetong" then '合同记录 ?action=Client&sType=InfoView&otype=Hetong&cID=cID
	%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 

						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
							<tr class="tr_t">
								<%if Hetong_hNum = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hNum%></td>
								<%end if%>
								<%if Hetong_oId = 1 then %>
								<td class="td_l_c"><%=L_Hetong_oId%></td>
								<%end if%>
								<%if Hetong_hSdate = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hSdate%></td>
								<%end if%>
								<%if Hetong_hEdate = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hEdate%></td>
								<%end if%>
								<%if Hetong_hType = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hType%></td>
								<%end if%>
								<%if Hetong_hMoney = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hMoney%></td>
								<%end if%>
								<%if Hetong_hRevenue = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hRevenue%></td>
								<%end if%>
								<%if Hetong_hOwed = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hOwed%></td>
								<%end if%>
								<%if Hetong_hInvoice = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hInvoice%></td>
								<%end if%>
								<%if Hetong_hTax = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hTax%></td>
								<%end if%>
								<td class="td_l_c"><%=L_Hetong_hState%></td>
								<%if Hetong_hContent = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hContent%></td>
								<%end if%>
								<%if Hetong_hAudit = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hAudit%></td>
								<%end if%>
								<%if Hetong_hAuditTime = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hAuditTime%></td>
								<%end if%>
								<%if Hetong_hAuditReasons = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hAuditReasons%></td>
								<%end if%>
								<%if Hetong_hUser = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hUser%></td>
								<%end if%>
								<%if Hetong_hTime = 1 then %>
								<td class="td_l_c"><%=L_Hetong_hTime%></td>
								<%end if%>
								<td width="130" class="td_l_c">管理</td>
							</tr>
						<%
						Set rs = Server.CreateObject("ADODB.Recordset")
						rs.Open "Select * From [Hetong] where cId = "&cId&" Order By hId desc ",conn,1,1
						If rs.RecordCount > 0 Then
						Do While Not rs.BOF And Not rs.EOF
						%>
							<tr class="tr">
								<%if Hetong_hNum = 1 then %>
								<td class="td_l_c"><a title="续费记录"  onclick='Hetong_Renew_List<%=rs("hId")%>()' style="cursor:pointer" ><%=rs("hNum")%></td>
								<%end if%>
								<%if Hetong_oId = 1 then %>
								<td class="td_l_c"><%if rs("oId")<>"" then%><a title="订单产品明细"  onclick='Order_Products_List<%=rs("oId")%>()' style="cursor:pointer" ><%=EasyCrm.getNewItem("Order","oid",rs("oId"),"oCode")%></a><%end if%></td>
								<%end if%>
								<%if Hetong_hSdate = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("hSdate"),2)%></td>
								<%end if%>
								<%if Hetong_hEdate = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("hEdate"),2)%></td>
								<%end if%>
								<%if Hetong_hType = 1 then %>
								<td class="td_l_c"><%=rs("hType")%></td>
								<%end if%>
								<%if Hetong_hMoney = 1 then %>
								<td class="td_l_c"><%=rs("hMoney")%></td>
								<%end if%>
								<%if Hetong_hRevenue = 1 then %>
								<td class="td_l_c"><%=rs("hRevenue")%></td>
								<%end if%>
								<%if Hetong_hOwed = 1 then %>
								<td class="td_l_c"><%=rs("hOwed")%></td>
								<%end if%>
								<%if Hetong_hInvoice = 1 then %>
								<td class="td_l_c"><%=rs("hInvoice")%></td>
								<%end if%>
								<%if Hetong_hTax = 1 then %>
								<td class="td_l_c"><%=rs("hTax")%></td>
								<%end if%>
								<td class="td_l_c"><%=rs("hState")%></td>
								<%if Hetong_hContent = 1 then %>
								<td class="td_l_c"><%if rs("hContent")<>"" then%><input type="button" class="button226" value="查看" onclick='Hetong_InfoView<%=rs("hId")%>()' style="cursor:pointer" /><%end if%></td>
								<%end if%>
								<%if Hetong_hAudit = 1 then %>
								<td class="td_l_c"><%=rs("hAudit")%></td>
								<%end if%>
								<%if Hetong_hAuditTime = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("hAuditTime"),2)%></td>
								<%end if%>
								<%if Hetong_hAuditReasons = 1 then %>
								<td class="td_l_c"><%if rs("hAuditReasons")<>"" then%><input type="button" class="button226" value="查看" onclick='Hetong_AuditReasons<%=rs("hId")%>()' style="cursor:pointer" /><%end if%></td>
								<%end if%>
								<%if Hetong_hUser = 1 then %>
								<td class="td_l_c"><%=rs("hUser")%></td>
								<%end if%>
								<%if Hetong_hTime = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("hTime"),2)%></td>
								<%end if%>
								
								<td class="td_l_c"><input type="button" class="button_info_add" value=" " title="快速续费"  onclick='Hetong_Renew_InfoAdd<%=rs("hId")%>()' style="cursor:pointer" /> <% If mid(Session("CRM_qx"), 38, 1) = 1 Then %><input type="button" class="button_info_edit" value=" " title="<%=L_Edit%>"  onclick='Hetong_InfoEdit<%=rs("hId")%>()' style="cursor:pointer" /><%end if%> <% If mid(Session("CRM_qx"), 39, 1) = 1 Then %><input type="button" class="button_info_del" value=" " title="<%=L_Del%>" onclick='Hetong_InfoDel<%=rs("hId")%>()' style="cursor:pointer" /><%end if%></td>
							</tr>
							<script>function Hetong_Renew_List<%=rs("hId")%>() {$.dialog.open('../Main/GetUpdateRW.asp?action=Hetong&sType=RenewList&Id=<%=rs("hId")%>', {title: '查看', width: 860,height: 440, fixed: true}); };</script>
							<script>function Order_Products_List<%=rs("oId")%>() {$.dialog.open('../Main/GetUpdateRW.asp?action=OrderProducts&sType=List&Id=<%=rs("oId")%>', {title: '查看', width: 860,height: 440, fixed: true}); };</script>
							<script>function Hetong_Renew_InfoAdd<%=rs("hId")%>() {$.dialog.open('../Main/GetUpdateRW.asp?action=Hetong&sType=AddRenew&Id=<%=rs("hId")%>', {title: '续费', width: 600,height: 340, fixed: true}); };</script>
							<script>function Hetong_InfoEdit<%=rs("hId")%>() {$.dialog.open('../Main/GetUpdateRW.asp?action=Hetong&sType=Edit&Id=<%=rs("hId")%>', {title: '编辑', width: 700,height: 380, fixed: true}); };</script>
							<script>function Hetong_InfoDel<%=rs("hId")%>() {$.dialog( { content: '<%=Alert_del_YN%>',icon: 'error',ok: function () { art.dialog.open('../Main/GetUpdateRW.asp?action=Hetong&sType=Delete&Id=<%=rs("hId")%>');return false;},cancel: true }); };</script>
							<script>function Hetong_InfoView<%=rs("hId")%>() {art.dialog({ title: '详情备注', content: '<%=EasyCrm.clearWord(""&rs("hContent")&"")%>',drag: false,resize: false}); };</script>
							<script>function Hetong_AuditReasons<%=rs("hId")%>() {art.dialog({ title: '审核原因',content: '<%=EasyCrm.clearWord(""&rs("hAuditReasons")&"")%>',drag: false,resize: false}); };</script>
						<%
						rs.MoveNext
						Loop
							end if
						rs.Close
						Set rs = Nothing
						%>
							
						</table>
					</td> 
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<% If mid(Session("CRM_qx"), 37, 1) = 1 Then %>
			<input name="Back" type="button" id="Back" class="button45" value="新增" onclick='Hetong_InfoAdd()' style="cursor:pointer">　
			<%end if%>
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
		</td>
	</tr>
</table>
</div>
<script>function Hetong_InfoAdd() {$.dialog.open('../Main/GetUpdateRW.asp?action=Hetong&sType=Add&cID=<%=cID%>', {title: '新窗口', width: 700, height: 380,fixed: true}); };</script>
	<%
	elseif otype="Service" then '服务记录 ?action=Client&sType=InfoView&otype=Service&cID=cID
	%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 

						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
							<tr class="tr_t">
								<%if Service_sSolve = 1 then %>
								<td width="60" class="td_l_c"><%=L_Service_sSolve%></td>
								<%end if%>
								<%if Service_sTitle = 1 then %>
								<td class="td_l_c"><%=L_Service_sTitle%></td>
								<%end if%>
								<%if Service_sLinkman = 1 then %>
								<td class="td_l_c"><%=L_Service_sLinkman%></td>
								<%end if%>
								<%if Service_sType = 1 then %>
								<td class="td_l_c"><%=L_Service_sType%></td>
								<%end if%>
								<%if Service_sSDate = 1 then %>
								<td class="td_l_c"><%=L_Service_sSDate%></td>
								<%end if%>
								<%if Service_sContent = 1 then %>
								<td class="td_l_c"><%=L_Service_sContent%></td>
								<%end if%>
								<%if Service_sInfo = 1 then %>
								<td class="td_l_c"><%=L_Service_sInfo%></td>
								<%end if%>
								<%if Service_sUser = 1 then %>
								<td class="td_l_c"><%=L_Service_sUser%></td>
								<%end if%>
								<%if Service_sTime = 1 then %>
								<td class="td_l_c"><%=L_Service_sTime%></td>
								<%end if%>
								<td width="90" class="td_l_c">管理</td>
							</tr>
						<%
						Set rs = Server.CreateObject("ADODB.Recordset")
						rs.Open "Select * From [Service] where cId = "&cId&" Order By sId desc ",conn,1,1
						If rs.RecordCount > 0 Then
						Do While Not rs.BOF And Not rs.EOF
						%>
							<tr class="tr">
								<%if Service_sSolve = 1 then %>
								<td class="td_l_c"><img src="<%=SiteUrl&skinurl%>images/ico/<%if rs("sSolve") = 0 then%>no<%else%>yes<%end if%>.gif" border=0></td>
								<%end if%>
								<%if Service_sTitle = 1 then %>
								<td class="td_l_c"><%=rs("sTitle")%></td>
								<%end if%>
								<%if Service_sLinkman = 1 then %>
								<td class="td_l_c"><%=rs("sLinkman")%></td>
								<%end if%>
								<%if Service_sType = 1 then %>
								<td class="td_l_c"><%=rs("sType")%></td>
								<%end if%>
								<%if Service_sSDate = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("sSDate"),2)%></td>
								<%end if%>
								<%if Service_sContent = 1 then %>
								<td class="td_l_c"><%if rs("sContent")<>"" then%><input type="button" class="button226" value="查看" onclick='Service_ContentView<%=rs("sId")%>()' style="cursor:pointer" /><%end if%></td>
								<%end if%>
								<%if Service_sInfo = 1 then %>
								<td class="td_l_c"><%if rs("sInfo")<>"" then%><input type="button" class="button226" value="查看" onclick='Service_InfoView<%=rs("sId")%>()' style="cursor:pointer" /><%end if%></td>
								<%end if%>
								<%if Service_sUser = 1 then %>
								<td class="td_l_c"><%=rs("sUser")%></td>
								<%end if%>
								<%if Service_sTime = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("sTime"),2)%></td>
								<%end if%>
								<td class="td_l_c"><% If mid(Session("CRM_qx"), 43, 1) = 1 Then %><input type="button" class="button_info_edit" value=" " title="<%=L_Edit%>"  onclick='Service_InfoEdit<%=rs("sId")%>()' style="cursor:pointer" /><%end if%> <% If mid(Session("CRM_qx"), 44, 1) = 1 Then %><input type="button" class="button_info_del" value=" " title="<%=L_Del%>" onclick='Service_InfoDel<%=rs("sId")%>()' style="cursor:pointer" /><%end if%></td>
							</tr>
							<script>function Service_InfoEdit<%=rs("sId")%>() {$.dialog.open('../Main/GetUpdateRW.asp?action=Service&sType=Edit&Id=<%=rs("sId")%>', {title: '编辑', width: 800,height: 370, fixed: true}); };</script>
							<script>function Service_InfoDel<%=rs("sId")%>() {$.dialog( { content: '<%=Alert_del_YN%>',icon: 'error',ok: function () { art.dialog.open('../Main/GetUpdateRW.asp?action=Service&sType=Delete&Id=<%=rs("sId")%>');return false;},cancel: true }); };</script>
							<script>function Service_ContentView<%=rs("sId")%>() {art.dialog({ title: '详情备注', content: '<%=EasyCrm.clearWord(""&rs("sContent")&"")%>',drag: false,resize: false}); };</script>
							<script>function Service_InfoView<%=rs("sId")%>() {art.dialog({ title: '处理结果',content: '<%=EasyCrm.clearWord(""&rs("sInfo")&"")%>',drag: false,resize: false}); };</script>
						<%
						rs.MoveNext
						Loop
							end if
						rs.Close
						Set rs = Nothing
						%>
							
						</table>
					</td> 
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<% If mid(Session("CRM_qx"), 42, 1) = 1 Then %>
			<input name="Back" type="button" id="Back" class="button45" value="新增" onclick='Service_InfoAdd()' style="cursor:pointer">　
			<%end if%>
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
		</td>
	</tr>
</table>
</div>
<script>function Service_InfoAdd() {$.dialog.open('../Main/GetUpdateRW.asp?action=Service&sType=Add&cID=<%=cID%>', {title: '新窗口', width: 800, height: 370,fixed: true}); };</script>
	<%
	elseif otype="Expense" then '费用记录 ?action=Client&sType=InfoView&otype=Expense&cID=cID
	%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 

						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
							<tr class="tr_t">
								<%if Expense_eDate = 1 then %>
								<td class="td_l_c"><%=L_Expense_eDate%></td>
								<%end if%>
								<%if Expense_eOutIn = 1 then %>
								<td class="td_l_c"><%=L_Expense_eOutIn%></td>
								<%end if%>
								<%if Expense_eType = 1 then %>
								<td class="td_l_c"><%=L_Expense_eType%></td>
								<%end if%>
								<%if Expense_eMoney = 1 then %>
								<td class="td_l_c"><%=L_Expense_eMoney%></td>
								<%end if%>
								<%if Expense_eContent = 1 then %>
								<td class="td_l_c"><%=L_Expense_eContent%></td>
								<%end if%>
								<%if Expense_eUser = 1 then %>
								<td class="td_l_c"><%=L_Expense_eUser%></td>
								<%end if%>
								<%if Expense_eTime = 1 then %>
								<td class="td_l_c"><%=L_Expense_eTime%></td>
								<%end if%>
								<td width="90" class="td_l_c">管理</td>
							</tr>
						<%
						Set rs = Server.CreateObject("ADODB.Recordset")
						rs.Open "Select * From [Expense] where cId = "&cId&" Order By eId desc ",conn,1,1
						If rs.RecordCount > 0 Then
						Do While Not rs.BOF And Not rs.EOF
						%>
							<tr class="tr">
								<%if Expense_eDate = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("eDate"),2)%></td>
								<%end if%>
								<%if Expense_eOutIn = 1 then %>
								<td class="td_l_c"><%if rs("eOutIn") = 1 then %>收入<%else%>支出<%end if%></td>
								<%end if%>
								<%if Expense_eType = 1 then %>
								<td class="td_l_c"><%=rs("eType")%></td>
								<%end if%>
								<%if Expense_eMoney = 1 then %>
								<td class="td_l_c"><%=rs("eMoney")%></td>
								<%end if%>
								<%if Expense_eContent = 1 then %>
								<td class="td_l_c"><%if rs("eContent")<>"" then%><input type="button" class="button226" value="查看" onclick='Expense_ContentView<%=rs("eId")%>()' style="cursor:pointer" /><%end if%></td>
								<%end if%>
								<%if Expense_eUser = 1 then %>
								<td class="td_l_c"><%=rs("eUser")%></td>
								<%end if%>
								<%if Expense_eTime = 1 then %>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("eTime"),2)%></td>
								<%end if%>
								<td class="td_l_c"><% If mid(Session("CRM_qx"), 48, 1) = 1 Then %><input type="button" class="button_info_edit" value=" " title="<%=L_Edit%>"  onclick='Expense_InfoEdit<%=rs("eId")%>()' style="cursor:pointer" /><%end if%> <% If mid(Session("CRM_qx"), 49, 1) = 1 Then %><input type="button" class="button_info_del" value=" " title="<%=L_Del%>" onclick='Expense_InfoDel<%=rs("eId")%>()' style="cursor:pointer" /><%end if%></td>
							</tr>
							<script>function Expense_InfoEdit<%=rs("eId")%>() {$.dialog.open('../Main/GetUpdateRW.asp?action=Expense&sType=Edit&eOutIn=<%=rs("eOutIn")%>&Id=<%=rs("eId")%>', {title: '编辑', width: 500,height: 270, fixed: true}); };</script>
							<script>function Expense_InfoDel<%=rs("eId")%>() {$.dialog( { content: '<%=Alert_del_YN%>',icon: 'error',ok: function () { art.dialog.open('../Main/GetUpdateRW.asp?action=Expense&sType=Delete&Id=<%=rs("eId")%>');return false;},cancel: true }); };</script>
							<script>function Expense_ContentView<%=rs("eId")%>() {art.dialog({ title: '详情备注', content: '<%=EasyCrm.clearWord(""&rs("eContent")&"")%>',drag: false,resize: false}); };</script>
						<%
						rs.MoveNext
						Loop
							end if
						rs.Close
						Set rs = Nothing
						%>
							
						</table>
					</td> 
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<span class="Bottom_pd r">总收入：<%=EasyCrm.getSUMItem("Expense","eMoney","eMoneystr"," and cID = "&cID&" and eOutIn = 1 ")%> 元　 总支出：<%=EasyCrm.getSUMItem("Expense","eMoney","eMoneystr"," and cID = "&cID&" and eOutIn = 0 ")%> 元</span>
			<% If mid(Session("CRM_qx"), 47, 1) = 1 Then %>
			<input name="Back" type="button" id="Back" class="button45" value="新增收入" onclick='Expense_InfoAdd_IN()' style="cursor:pointer">　
			<input name="Back" type="button" id="Back" class="button46" value="新增支出" onclick='Expense_InfoAdd_OUT()' style="cursor:pointer">　
			<%end if%>
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
			
		</td>
	</tr>
</table>
</div>
<script>function Expense_InfoAdd_IN() {$.dialog.open('../Main/GetUpdateRW.asp?action=Expense&sType=Add&eOutIn=1&cID=<%=cID%>', {title: '新窗口', width: 500, height: 270,fixed: true}); };</script>
<script>function Expense_InfoAdd_OUT() {$.dialog.open('../Main/GetUpdateRW.asp?action=Expense&sType=Add&eOutIn=0&cID=<%=cID%>', {title: '新窗口', width: 500, height: 270,fixed: true}); };</script>
	<%
	elseif otype="File" then '附件记录 ?action=Client&sType=InfoView&otype=File&cID=cID
	%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 

						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
							<tr class="tr_t">
								<td class="td_l_c" width="80"><%=L_File_fId%></td>
								<td class="td_l_l"><%=L_File_fTitle%></td>
								<td class="td_l_c" width="80">文件大小</td>
								<td class="td_l_c" width="80"><%=L_File_fFile%></td>
								<td class="td_l_c" width="80"><%=L_File_fContent%></td>
								<td class="td_l_c" width="80"><%=L_File_fUser%></td>
								<td class="td_l_c" width="80"><%=L_File_fTime%></td>
								<td width="50" class="td_l_c">管理</td>
							</tr>
						<%
						Set rs = Server.CreateObject("ADODB.Recordset")
						rs.Open "Select * From [File] where cId = "&cId&" Order By fId desc ",conn,1,1
						If rs.RecordCount > 0 Then
						Do While Not rs.BOF And Not rs.EOF
						%>
							<tr class="tr">
								<td class="td_l_c"><%=rs("fId")%></td>
								<td class="td_l_l"><%=rs("fTitle")%></td>
								<td class="td_l_c"><%if rs("fFile")<>"" then%><%=EasyCrm.showsize(rs("fFile"))%><%end if%></td>
								<td class="td_l_c"><%if rs("fFile")<>"" then%><input type="button" class="button222" <%if inStr("'gif','jpg','png','bmp'", right(rs("fFile"),3) ) > 0 then %>value="查看"  onclick="javascript:window.open('<%=rs("fFile")%>')" <%else%>value="下载" onClick=window.location.href="<%=rs("fFile")%>"<%end if%> style="cursor:pointer" /><%else%>无<%end if%></td>
								<td class="td_l_c"><%if rs("fContent")<>"" then%><input type="button" class="button226" value="查看" onclick='File_ContentView<%=rs("fId")%>()' style="cursor:pointer" /><%else%>无<%end if%></td>
								<td class="td_l_c"><%=rs("fUser")%></td>
								<td class="td_l_c"><%=EasyCrm.FormatDate(rs("fTime"),2)%></td>
								<td class="td_l_c"><% If mid(Session("CRM_qx"), 54, 1) = 1 Then %><input type="button" class="button_info_del" value=" " title="<%=L_Del%>" onclick='File_InfoDel<%=rs("fId")%>()' style="cursor:pointer" /><%end if%></td>
							</tr>
							<script>function File_InfoDel<%=rs("fId")%>() {$.dialog( { content: '<%=Alert_del_YN%>',icon: 'error',ok: function () { art.dialog.open('../Main/GetUpdateRW.asp?action=File&sType=Delete&Id=<%=rs("fId")%>');return false;},cancel: true }); };</script>
							<script>function File_ContentView<%=rs("fId")%>() {art.dialog({ title: '详情备注', content: '<%=EasyCrm.clearWord(""&rs("fContent")&"")%>',drag: false,resize: false}); };</script>
							<script>function File_InfoView<%=rs("fId")%>() {art.dialog({ title: '查看图片', content: '<img src="<%=rs("fFile")%>" />',lock: true}); };</script>
						<%
						rs.MoveNext
						Loop
							end if
						rs.Close
						Set rs = Nothing
						%>
							
						</table>
					</td> 
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<% If mid(Session("CRM_qx"), 52, 1) = 1 Then %>
			<input name="Back" type="button" id="Back" class="button45" value="新增" onclick='File_InfoAdd()' style="cursor:pointer">　
			<%end if%>
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
			
		</td>
	</tr>
</table>
</div>
<script>function File_InfoAdd() {$.dialog.open('../Main/GetUpdateRW.asp?action=File&sType=Add&cID=<%=cID%>', {title: '新窗口', width: 500, height: 210,fixed: true}); };</script>
	<%
	elseif otype="Share" then '共享记录
	%>
	<script>
	function Setdisabled(evt)
	{
		var evt=evt || window.event;   
		var e =evt.srcElement || evt.target;
		
		 if(e.value=="1")
		 {
			var a = document.all.cShareRange; 
			for (var i=0; i<a.length; i++)   
			{ 
				a[i].disabled=false; 
				a[i].readOnly=false; 
			} 
		 }
		 else
		 {
			var a = document.all.cShareRange; 
			for (var i=0; i<a.length; i++)   
			{ 
				a[i].disabled=true; 
				a[i].readOnly=true; 
			} 
		 }
	}
	</script>
		<form name="Save" action="?action=Client&sType=InfoView&otype=ShareSave&cID=<%=cId%>" method="post">
			<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 
						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
							<col width="100" />
							<tr class="tr_t"> 
								<td class="td_l_l" COLSPAN="2">选择共享对象</td>
							</tr>
							<tr class="tr_f"> 
								<td class="td_l_c red">是否共享 </td>
								<td class="td_l_l red"><input type="radio" id="cShare" name="cShare" value= '0' <%if EasyCrm.getNewItem("Client","cID",""&cID&"","cShare")=0 then %>checked <%end if%> onclick="Setdisabled()"> 否　<input type="radio" id="cShare" name="cShare" value= '1' <%if EasyCrm.getNewItem("Client","cID",""&cID&"","cShare")=1 then %>checked <%end if%> onclick="Setdisabled()"> 是</td>
							</tr>
							<%
								Set rsg = Server.CreateObject("ADODB.Recordset")
								rsg.Open "Select * From [system_group]",conn,1,1
								Do While Not rsg.BOF And Not rsg.EOF
							%>
							<tr> 
								<td class="td_l_c title"><%=rsg("gName")%></td>
								<td  class="td_l_l">
								<%
									Set rsm = Server.CreateObject("ADODB.Recordset")
									rsm.Open "Select * From [user] where uGroup="&rsg("gId")&" ",conn,1,1
									Do While Not rsm.BOF And Not rsm.EOF
								%>
									<input type="checkbox" id="cShareRange" name="cShareRange" value= '<%=rsm("uName")%>' <%if EasyCrm.getNewItem("Client","cID",""&cID&"","cShare")=0 then %>disabled readOnly <%end if%> <%if inStr(EasyCrm.getNewItem("Client","cID",""&cID&"","cShareRange"),rsm("uName"))>0 then%>checked<%end if%>> <%=rsm("uName")%>　
								<%
									rsm.MoveNext
									Loop
									rsm.Close
									Set rsm = Nothing
								%>
								</td>
							</tr> 
							<%
								rsg.MoveNext
								Loop
								rsg.Close
								Set rsg = Nothing
							%>
						</table>
					</td> 
				</tr>
			</table>
			<div class="fixed_bg_B">
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td valign="top" class="td_n Bottom_pd "> 
						<input name="Back" type="Submit" id="Back" class="button45" value="保存" onclick='Share_InfoSave()' style="cursor:pointer">　
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
						
					</td>
				</tr>
			</table>
			</div>
		</form>

	<%
	elseif otype="ShareSave" then '保存共享
		cShare = Request.Form("cShare")
		cShareRange = Request.Form("cShareRange")
		conn.execute("update [Client] set cShare='"&cShare&"',cShareRange='"&cShareRange&"' where cId = "&cID&" ")
		Response.Write("<script>location.href='?action=Client&sType=InfoView&otype=Share&cID="&cId&"&tipinfo=操作成功！';</script>")
		Response.End()
	%>
	
	<%
	elseif otype="History" then '历史记录 ?action=Client&sType=InfoView&otype=File&cID=cID
	%>
			<table width="100%" border="0" cellpadding="0" cellspacing="0"> 
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 

						<table width="100%" border="0" cellspacing="0" cellpadding="0" CLASS="table_1">
							<tr class="tr_t">
								<td class="td_l_c" width="80">编号</td>
								<td class="td_l_c" width="80">数据表</td>
								<td class="td_l_c" width="80">行为</td>
								<td class="td_l_l">原因</td>
								<td class="td_l_c" width="80">操作人</td>
								<td class="td_l_c" width="130">时间</td>
							</tr>
						<%
						Set rs = Server.CreateObject("ADODB.Recordset")
						rs.Open "Select * From [Logfile] where lCid = "&cId&" Order By lId desc ",conn,1,1
						If rs.RecordCount > 0 Then
						Do While Not rs.BOF And Not rs.EOF
						%>
							<tr class="tr">
								<td class="td_l_c"><%=rs("lId")%></td>
								<td class="td_l_c"><%=rs("lClass")%></td>
								<td class="td_l_c"><%=rs("lAction")%></td>
								<td class="td_l_l"><%=rs("lReason")%></td>
								<td class="td_l_c"><%=rs("lUser")%></td>
								<td class="td_l_c"><%=rs("lTime")%></td>
							</tr>
						<%
						rs.MoveNext
						Loop
							end if
						rs.Close
						Set rs = Nothing
						%>
							
						</table>
					</td> 
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
			
		</td>
	</tr>
</table>
</div>
	<%
	end if
	%>
<%
elseif sType="DelReason" then '删除客户填写操作原因
%>	<script language="JavaScript">
	<!-- 跟单记录必填项提示
	function CheckInput()
	{
		if(document.all.lReason.value == ""){art.dialog({title: 'Error',time: 1,icon: 'warning',content: '<%=alert04%>'});document.all.lReason.focus();return false;}
	}
	-->
	</script>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				
				<form name="Save" action="?action=Client&sType=DelTrue" method="post" onSubmit="return CheckInput();">
				<tr>
					<td valign="top" class="td_n pdl10 pdr10 pdt10"> 
						<textarea name="lReason" rows="4" id="lReason" class="int" style="height:80px;width:98%;"></textarea>
					</td>
				</tr>
			</table>
<div class="fixed_bg_B">
<table width="100%" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td valign="top" class="td_n Bottom_pd "> 
			<input name="cId" type="hidden" id="cId" value="<% = cId %>">
			<input type="submit" name="Submit" class="button45" value="保存" >　
			<input name="Back" type="button" id="Back" class="button43" value="关闭" onClick="art.dialog.close();">
		</td>
	</tr>
</table>
</div>
				</form>
<%
elseif sType="DelTrue" then '执行删除客户操作
	cId = CLng(ABS(Request("cId")))
	lReason = Trim(Request("lReason"))
	conn.execute("update Client set cYn = 0 where cId = "&cId&" ")
	conn.execute ("insert into Logfile(lCid,lClass,lAction,lReason,lUser,lTime) values('"&cid&"','"&L_Client&"','"&L_insert_action_03&"','"&lReason&"','"&Session("CRM_name")&"','"&now()&"')")

		Response.Write("<script>art.dialog.close();art.dialog.open.origin.location.reload();</script>")
%>

<%
end if
%>

<%
End Sub
%>
<div id="mjs:tip" class="tip" style="position:absolute;left:0;top:0;display:none;margin-left:10px;"></div>
<script src="../data/calendar/WdatePicker.js"></script>
</body>
<% Set EasyCrm = nothing %>