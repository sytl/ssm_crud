<%--
  Created by IntelliJ IDEA.
  User: felix
  Date: 2021/1/10
  Time: 下午 04:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <%
        pageContext.setAttribute("APP_TH",request.getContextPath());
    %>
    <title>员工列表</title>
    <script type="text/javascript" src="${APP_TH}/static/js/jquery-3.5.1.min.js"></script>
    <link href="${APP_TH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="${APP_TH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>


    <style>
        body{
            /*background:url(http://www.deskcar.com/desktop/fengjing/2012111402136/11.jpg) no-repeat center ;*/
            /*background-size: cover;*/
            /*background-attachment:fixed;*/

            background-color: #c4d7d6


        }
    </style>
</head>
<body>

    <a href="##" onclick="b()">夜间模式</a>
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h1 style="display: inline">SSM_CRUD</h1>

            </div>
        </div>
        <div class="row">
            <div class="col-md-4 col-md-offset-9">
                <button class="btn btn-primary" onclick="a()">新增</button>
                &nbsp;&nbsp;&nbsp;
                <button class="btn btn-danger">删除</button>
            </div>

        </div>

        <div class="row">
            <div class="col-md-12">
                <table class="table table-hover">
                    <tr>
                        <th>row</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                    <c:forEach items="${pageInfo.list}" var="emp" >
                        <tr>
                            <th>${emp.empId}</th>
                            <th>${emp.empName}</th>
                            <th>${emp.gender="M"?"男":"女"}</th>
                            <th>${emp.email}</th>
                            <th>${emp.department.deptName}</th>
                            <th>
                                <button class="btn btn-primary btn-sm"><span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                                    编辑
                                </button>
                                <button class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash" aria-hidden="true"></span>

                                    删除
                                </button>
                            </th>

                        </tr>
                    </c:forEach>

                </table>
            </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                当前页码：${pageInfo.pageNum}
                总页数：${pageInfo.pages}
                总记录数：${pageInfo.total}
            </div>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li>
                            <a href="${APP_TH}/emps?pn=1">
                                首页
                            </a>
                        </li>
                        <c:if test="${pageInfo.hasPreviousPage}">
                            <li>
                                <a href="${APP_TH}/emps?pn=${pageInfo.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <c:forEach items="${pageInfo.navigatepageNums}" var="page_Num">
                            <c:if test="${page_Num==pageInfo.pageNum}">
                                <li class="active"><a href="#">${page_Num}</a></li>

                            </c:if>
                            <c:if test="${page_Num!=pageInfo.pageNum}">
                                <li ><a href="${APP_TH}/emps?pn=${page_Num}">${page_Num}</a></li>


                            </c:if>
                        </c:forEach>

                        <c:if test="${pageInfo.hasNextPage}">
                            <li>
                                <a href="${APP_TH}/emps?pn=${pageInfo.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>

                        <li>
                            <a href="${APP_TH}/emps?pn=${pageInfo.pages}">
                                末页
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
        </div>

    </div>


<%--<input type="hidden" name="color" value="black" id="input1">--%>
<script>
    e="black";
    function a() {
        window.open("http://www.baidu.com");
        console.log("你好生活");

    }
    function b() {
        //  var c=document.getElementById("input1").value;
        // document.getElementsByTagName("body")[0].style.backgroundColor=c ;
        // if(c=="black")
        //     document.getElementById("input1").value="white";
        // if(c=="white")
        //     document.getElementById("input1").value="black";

        document.getElementsByTagName("body")[0].style.backgroundColor=e;
        if(e=="white"){
            e="black";
            console.log("e为黑色");
            return;

        }
        if(e=="black"){

            e="white";
            console.log("e为白色");
            return;

        }





    }
</script>
</body>
</html>
