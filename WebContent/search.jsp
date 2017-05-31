<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
#mydiv{
position:absolute;
left:50%;
top:50%;
right:50%;
bottom:50%;
}
</style>

<script type = "text/javascript">

function getMoreContents(){
	var xmlHttp;
	//get the content user etering
	var content = document.getElementById("keyword");
	if(content.value == ""){
		clearContent();
		return;
	}
	//send content to server
	//XmlHttp
	xmlHttp = createXmlHttp();
	var url = "search?keyword=" + escape(content.value);
	//true means JS will execute after send(), instead waiting for respnse from server
	xmlHttp.open("GET",url,true);
	//xmlHttp状态0-4,4(complete)
	xmlHttp.onreadystatechange = callback;
	xmlHttp.send(null);
}

function createXmlHttp(){
	//appliable to most of the browsers
	var xmlHttp;
	if(window.XMLHttpRequest){
		xmlHttp = new XMLHttpRequest();
	}
	if(window.ActiveXObject){
		xmlHttp = new ActiveXObject("Microsoft.XMLHttp");
		if(!xmlHttp){
			xmlHttp = new ActiveXObject("Msxml2.XMLHttp");
		}
	}
	return xmlHttp;
}

function callback(){
	if(xmlHttp.readyState==4){
		//200代表服务器响应成功
		//400资源未找到，500服务器内部错误
		if(xmlHttp.status==200){
			var result = xmlHttp.responseText;
			var json = eval("("+result+")");
			//alert(json);
		}
	}
}

//设置关联数据
function setContent(contents){
	clearContent();
	var size = contents.length;
	for(var i = 0; i < size; i++){
		var nextnode = contents[i];
		var tr = document.createElement("tr");
		var tr = document.createElement("td");
		td.setAttribute("border","0");
		td.setAttribute("bgcolor","#FFFAFA");
		td.onmouseover = function(){
			this.className = 'mouseover';
		};
		td.onmouseout = function(){
			this.className = 'mouseout';
		};
		td.onclick = function(){};
			//select the content when clicking on it.
					
		var text = document.createTextNode(nextNode);
        td.appendChild(text);
        tr.appendChild(td);
		document.getElementById("content_table_body").appendChild(tr);
		
	}
}

function clearContent(){
	var contentTableBody = document.getElementById("content_table_body");
	var size = contentTableBody.childNodes.length;
	for(var i = size-1; i>=0; i--){
		contentTableBody.removeChild(contentTableBody.childNodes[i]);
	}
}

//输入框失去焦点时内容消失
function keywordBlur(){
	clearContent();
}

</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
  <body>
   <div id="mydiv">
     <!--输入框-->
     <input type="text" size="50" id="keyword" onkeyup="getMoreContents()"
     onblur="keywordBlur()" onfocus="getMoreContents()"/>
     <input type="button" value="百度一下" width="50px">
     <%--内容展示区域--%>
     <div id="popdiv">
       <table id="content_table" bgcolor="#FFFAFA" border="0" cellspacing="0" cellpadding="0">
         <tbody id="content_table_body">
         <%--动态查询出来的数据,显示在此--%>

         </tbody>
       </table>

     </div>

   </div>

  </body>
</html>