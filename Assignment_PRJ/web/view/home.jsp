<%-- 
    Document   : home
    Created on : Nov 7, 2022, 3:54:21 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1 style="text-align: center;">FPT University Academic Portal</h1>
        <td colspan="2" class="auto-style1"><strong>FAP mobile app (myFAP) is ready at</strong></td>
</tr>
<tr>
<td><a href="https://apps.apple.com/app/id1527723314">
<img src="https://fap.fpt.edu.vn/images/app-store.svg" style="width: 120px; height: 40px" alt="apple store" /></a></td>
<td><a href="https://play.google.com/store/apps/details?id=com.fuct">
<img src="https://fap.fpt.edu.vn/images/play-store.svg" style="width: 120px; height: 40px" alt="google store" /></a></td>
</tr>
        <hr>
        <c:if test="${sessionScope.account ne null}">
            <span class="timetab"><a href="http://localhost:9999/Assignment_PRJ/lecture/timetable">Time Table</a></span><br>
            <div class="greet">
                <span> Hello ${sessionScope.account.displayname}, click 
                    <a id="myBtn" href="logout">here</a> to logout. </span>
            </div>
        </c:if>
       <div id="loginform" vertical-align: central">
<center>
<div class="row">
<div class="col-sm-4">
<select name="ctl00$mainContent$ddlCampus" onchange="javascript:setTimeout(&#39;__doPostBack(\&#39;ctl00$mainContent$ddlCampus\&#39;,\&#39;\&#39;)&#39;, 0)" id="ctl00_mainContent_ddlCampus" class="btn btn-default">
<option selected="selected" value="">Select Campus</option>
<option value="3">FU-H&#242;a Lạc</option>
<option value="4">FU-Hồ Ch&#237; Minh</option>
<option value="5">FU-Đ&#224; Nẵng</option>
<option value="6">FU-Cần Thơ</option>
<option value="7">FU-Quy Nhơn</option>
</select>
</div>
<div class="col-sm-4">
<div style="margin-left: -50px" class="g-signin2" data-onsuccess="onSignIn" data-theme="dark"></div>
</div>
<span id="ctl00_mainContent_lblMessage" class="information"></span>
</div
        <c:if test="${sessionScope.account eq null}">
            <div class="left-header">
                <span class="lhd"> <b>PLEASE LOGIN BY FPT ACCOUNT</b></span> <br>
                <div class="login"><button><a href="login"> Login</a></button></div>
            </div>
            <!--            click 
                        <a href="login">here</a> to login. -->
        </c:if>
        <p class="footer">© Powered by <a href="https://fpt.edu.vn/">FPT University</a> | <a href="https://cmshn.fpt.edu.vn/">CMS</a> | <a href="http://libol.fpt.edu.vn/">library</a> | <a href="https://library.books24x7.com/login.asp?ic=0">books24x7</a></p>
    </div>
    <script>
        document.getElementById("myBtn").addEventListener("click", function () {
            alert("Are you sure you want log out?");
        });
    </script>
    </body>
</html>
