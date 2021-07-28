<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!------팝업을 호출하는 페이지-------------------->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript">
function popup(frm)
{
  var url    ="testpop.asp";
  var title  = "testpop";
  var status = "toolbar=no,directories=no,scrollbars=no,resizable=no,status=no,menubar=no,width=240, height=200, top=0,left=20";
  window.open("", title,status); //window.open(url,title,status); window.open 함수에 url을 앞에와 같이
                                            //인수로  넣어도 동작에는 지장이 없으나 form.action에서 적용하므로 생략
                                            //가능합니다.
  frm.target = title;                    //form.target 이 부분이 빠지면 form값 전송이 되지 않습니다.
  frm.action = url;                    //form.action 이 부분이 빠지면 action값을 찾지 못해서 제대로 된 팝업이 뜨질 않습니다.
  frm.method = "post";
  frm.submit();    
  }
</script>
</HEAD>
<BODY>
<form name="form">
테스트값1&nbsp;<input type=text name="test1" value=""><br>
테스트값2&nbsp;<input type=text name="test2" value=""><br><br>
<input type="button" name="button1" value="전 송" onclick="javascript:popup(this.form);">
</form>
</BODY>
</HTML>

<!------팝업 페이지---------------------->
<%
    test1 = request.form("test1")
    test2 = request.form("test2")
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML>
<HEAD>
<TITLE> New Document </TITLE>
<script language="javascript">

function closewin()
{
   self.close();
   }

</script>
</HEAD>

<BODY>
<h3>Popup Page</h3><br>
<h3>테스트값1:&nbsp;<%=test1%></h3><br>
<h3>테스트값2:&nbsp;<%=test2%></h3><br>
<input type="button" value="닫기" onclick="javascript:closewin()">
</BODY>
</HTML>