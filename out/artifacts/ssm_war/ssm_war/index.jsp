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


<%--    <style>--%>
<%--        body{--%>
<%--            /*background:url(http://www.deskcar.com/desktop/fengjing/2012111402136/11.jpg) no-repeat center ;*/--%>
<%--            /*background-size: cover;*/--%>
<%--            /*background-attachment:fixed;*/--%>

<%--            background-color: #c4d7d6--%>


<%--        }--%>
<%--    </style>--%>

</head>
<body background="./hai.jpg">
<%--<div>--%>
<%--    <a href="##" onclick="b()">夜间模式</a>--%>
<%--</div>--%>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h1 style="display: inline">SSM_CRUD</h1>

        </div>
    </div>
    <div class="row">
        <div class="col-md-4 col-md-offset-9">
            <button class="btn btn-primary" id="emp_add_modal_btn">新增</button>
            &nbsp;&nbsp;&nbsp;
            <button class="btn btn-danger" id="emp_delete_all_btn">删除</button>
        </div>

    </div>

    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" id="check_all">
                        </th>
                        <th>row</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>deptName</th>
                        <th>操作</th>
                    </tr>
                </thead>
                <tbody >

                </tbody>



            </table>
        </div>
    </div>

    <div class="row">
        <div class="col-md-6" id="page_info_area">

        </div>
        <div class="col-md-6" id="page_nav_area">

        </div>
    </div>

</div>

<%--员工修改模态框--%>
<div class="modal fade" id="empsUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" name="empName" id="empName_update_static" ></p>
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_update_input" placeholder="email@abc.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                        &emsp;
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gendor1_update_input" value="M" checked> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gendor2_update_input" value="F"> 女
                        </label>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-md-5">
                            <select class="form-control" name="dId">

                            </select>
                        </div>


                    </div>

                    <br>
                    <%--                    <img style="height: 30%;width: 30%" src="http://www.dnzhuti.com/uploads/allimg/180725/95-1PH5161F5.jpg">--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emps_update_btn">更新</button>
            </div>
        </div>
    </div>
</div>

<%--新增模态框--%>
<div class="modal fade" id="empsAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">员工添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">empName</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="empName_add_input" placeholder="empName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="email_add_input" placeholder="email@abc.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">gender</label>
                            &emsp;
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gendor1_add_input" value="M" checked> 男
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gendor2_add_input" value="F"> 女
                        </label>
                    </div>
                    <div class="form-group">
                        <label  class="col-sm-2 control-label">deptName</label>
                        <div class="col-md-5">
                            <select class="form-control" name="dId">

                            </select>
                        </div>


                    </div>

                    <br>
<%--                    <img style="height: 30%;width: 30%" src="http://www.dnzhuti.com/uploads/allimg/180725/95-1PH5161F5.jpg">--%>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="emps_save_btn">保存</button>
            </div>
        </div>
    </div>
</div>


<%--&lt;%&ndash;视频背景&ndash;%&gt;--%>
<%--<style>--%>
<%--    video#bgvid {--%>
<%--        position: fixed;--%>
<%--        top: 50%;--%>
<%--        left: 50%;--%>
<%--        min-width: 100%;--%>
<%--        min-height: 100%;--%>
<%--        width: auto;--%>
<%--        height: auto;--%>
<%--        z-index: -100;--%>
<%--        -ms-transform: translateX(-50%) translateY(-50%);--%>
<%--        -moz-transform: translateX(-50%) translateY(-50%);--%>
<%--        -webkit-transform: translateX(-50%) translateY(-50%);--%>
<%--        transform: translateX(-50%) translateY(-50%);--%>
<%--        background: url("/hai.jpg") no-repeat;--%>
<%--        background-size: cover;--%>
<%--    }--%>

<%--</style>--%>

<%--<video playsinline autoplay muted loop poster="hai.jpg" id="bgvid">--%>

<%--    <source src="${APP_TH}\dahai.webm" type="video/webm">--%>

<%--    <source src="${APP_TH}/dahai.mp4" type="video/mp4">--%>

<%--</video>--%>


<%--<input type="hidden" name="color" value="black" id="input1">--%>
<script type="text/javascript">
    var totalRecord,currentPage;

    $("#emps_save_btn").click(function () {
        if (!validate_add_form()){
            return false;
        }
        // 判断之前的ajax用户校验是否成功
        if($(this).attr("ajax-va")=="error"){
            return false;
        }
        $.ajax({
            url: "${APP_TH}/emps",
            type: "post",
            data: $("#empsAddModal form").serialize(),
            success: function(result) {
                if(result.code==100){
                    $("#empsAddModal").modal('hide');
                    to_page(totalRecord);

                }else {
                    // console.log(result);
                    // alert(result.extend.errorFields.email);
                    // alert(result.extend.errorFields.empName);
                    if(result.extend.errorFields.email != undefined){
                        show_validate_msg("#email_add_input","error",result.extend.errorFields.email);
                    }
                    if(result.extend.errorFields.empName != undefined){
                        show_validate_msg("#empName_add_input","error",result.extend.errorFields.empName);


                    }
                }



            }
        })

    })


<%--    页面加载完成发送ajax请求，得到分页数据--%>
    $(function () {
        //去首页
        to_page(1);


    })

    function to_page(pn) {
        $.ajax({
            url: "${APP_TH}/emps",
            data: "pn="+pn,
            type: "get",
            success: function (result) {
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);

            }
        })
        $("#check_all").prop("checked",false);

    }

    function build_emps_table(result){
        $("#emps_table tbody").empty();
        var emps=result.extend.pageInfo.list;
        $.each(emps,function (index,item) {
            var checkBoxTd=$("<td><input type='checkbox' class='check_item'></td>");
            var empIdTd=$("<td></td>").append(item.empId);
            var empNameTd=$("<td></td>").append(item.empName);
            var genderTd=$("<td></td>").append(item.gender=="M"?"男":"女");
            var emailTd=$("<td></td>").append(item.email);
            var deptNameTd=$("<td></td>").append(item.department.deptName);
            var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm edit_btn").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("修改");
            editBtn.attr("edit-id",item.empId);
            var deleteBtn=$("<button></button>").addClass("btn btn-danger btn-sm delete_btn").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            deleteBtn.attr("delete-id",item.empId);
            $("<tr></tr>").append(checkBoxTd)
                .append(empIdTd)
                .append(empNameTd)
                .append(genderTd)
                .append(emailTd)
                .append(deptNameTd)
                .append(editBtn)
                .append(deleteBtn)
                .appendTo("#emps_table tbody");

        })

    }

    function build_page_info(result){
        $("#page_info_area").empty();
        $("#page_info_area").append("当前"+result.extend.pageInfo.pageNum+"页，总共"+result.extend.pageInfo.pages+
        "页，总共"+result.extend.pageInfo.total+"条记录");
        totalRecord=result.extend.pageInfo.total;
        currentPage=result.extend.pageInfo.pageNum;
    }

    function build_page_nav(result){
        $("#page_nav_area").empty();
        var ul=$("<ul></ul>").addClass("pagination");
        var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
        var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
        var lastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
        var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
        if(result.extend.pageInfo.hasPreviousPage==false){
            prePageLi.addClass("disabled");
            firstPageLi.addClass("disabled");
        }else {
            firstPageLi.click(function () {
                to_page(1);

            });

            prePageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum-1);

            });
        }
        if(result.extend.pageInfo.hasNextPage==false){
            nextPageLi.addClass("disabled");
            lastPageLi.addClass("disabled");
        }else {
            nextPageLi.click(function () {
                to_page(result.extend.pageInfo.pageNum+1);

            });
            lastPageLi.click(function () {
                to_page(result.extend.pageInfo.pages);
            });

        }


        ul.append(firstPageLi).append(prePageLi);
        //添加页码提示
        $.each(result.extend.pageInfo.navigatepageNums,function (index,item) {
            var numLi=$("<li></li>").append($("<a></a>").append(item));
            if(result.extend.pageInfo.pageNum==item){
                numLi.addClass("active");
            }
            numLi.click(function () {
                to_page(item);

            });
            ul.append(numLi);
        });
        ul.append(nextPageLi).append(lastPageLi);
        var navEle=$("<nav></nav>").append(ul);
        navEle.appendTo("#page_nav_area");



    }

    //清空表单样式及内容
    function reset_form(ele){
        $(ele)[0].reset();
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }


    e="black";
    //点击新增按钮弹出模态框
    $("#emp_add_modal_btn").click(function () {
        //清除表单数据(表单完整重置,(表单的数据表单的样式）
        reset_form("#empsAddModal form");
        // $("#empsAddModal form")[0].reset();
        // $("#empsAddModal form")[0].reset();
        getDepts("#empsAddModal select");
        $('#empsAddModal').modal({
            backdrop: "static"
        });
    });
    
    function getDepts(ele) {
        $(ele).empty();
        $.ajax({
            url:"${APP_TH}/depts",
            type: "get",
            success: function (result) {
                console.log(result);
                // {"code":100,"message":"处理成功","extend":{"depts":[{"deptId":1,"deptName":"开发部"},{"deptId":2,"deptName":"设计部"},{"deptId":3,"deptName":"开发部"},{"deptId":4,"deptName":"设计部"}]}}
                $.each(result.extend.depts,function () {
                    var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
                    optionEle.appendTo(ele);

                });
            }
        });

    }
    
    //校验表单数据
    function validate_add_form() {
        var empName=$("#empName_add_input").val();
        var regName=/(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        // alert(regName.test(empName));
        if (!regName.test(empName)){
            // alert("用户名可以是2-5位的中文或者6-16位的英文和数字组合");
            show_validate_msg("#empName_add_input","error","用户名可以是2-5位的中文或者6-16位的英文和数字组合")
            return false;
        }else {

            show_validate_msg("#empName_add_input","success","");
        }

        var email=$("#email_add_input").val();
        var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            // alert("邮箱输入不正确");
            // $("#email_add_input").parent().addClass("has-error");
            // $("#email_add_input").next("span").text("邮箱输入不正确");
            show_validate_msg("#email_add_input","error","邮箱输入不正确");
            return false;
        }else {
            // $("#email_add_input").parent().addClass("has-success");
            // $("#email_add_input").next("span").text("");
            show_validate_msg("#email_add_input","success","");
        }
        return true;
    }
    
    function show_validate_msg(ele,status,msg) {
        $(ele).parent().removeClass("has-success has-error");
        $(ele).next("span").text("");

        if(status=="success"){
            $(ele).parent().addClass("has-success");
            $(ele).next("span").text("");

        }else if(status=="error"){
            $(ele).parent().addClass("has-error");
            $(ele).next("span").text(msg);


        }

    }

    //校验用户名是否可用
    $("#empName_add_input").change(function () {
        var empName=this.value;
        $.ajax({
            url: "${APP_TH}/checkuser",
            data: "empName="+empName,
            type: "post",
            success: function(result) {
                if(result.code==100){
                    show_validate_msg("#empName_add_input","success","用户名可用");
                    $("#emps_save_btn").attr("ajax-va","success");
                }else {
                    show_validate_msg("#empName_add_input","error",result.extend.va_msg);
                    $("#emps_save_btn").attr("ajax-va","error");
                }
            }
        });
    })

    $(document).on("click",".edit_btn",function () {
        // alert("edit");
        getDepts("#empsUpdateModal select");
        getEmp($(this).attr("edit-id"));
        //把员工的id传给模态框的更新按钮
        $("#emps_update_btn").attr("edit-id",$(this).attr("edit-id"));
        $("#empsUpdateModal").modal({
            backdrop: "static"
        });
    });
    
    function getEmp(id) {
        $.ajax({
            url: "${APP_TH}/emps/"+id,
            type: "get", 
            success: function(result) {
                // console.log(result);

                var empData=result.extend.emp;
                $("#empName_update_static").text(empData.empName);
                $("#email_update_input").val(empData.email);
                $("#empsUpdateModal input[name=gender]").val([empData.gender]);
                $("#empsUpdateModal select").val([empData.dId]);

        }

        })

    }

    //点击更新，更新员工信息
    $("#emps_update_btn").click(function () {
    //    验证邮箱是否合法
        var email=$("#email_update_input").val();
        var regEmail=/^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if(!regEmail.test(email)){
            show_validate_msg("#email_update_input","error","邮箱输入不正确");
            return false;
        }else {
            show_validate_msg("#email_update_input","success","");
        }
    //    发送ajax请求更新员工
        $.ajax({
            url: "${APP_TH}/emps/"+$(this).attr("edit-id"),
            type: 'put',
            data: $("#empsUpdateModal form").serialize(),
            success: function(result) {
                // alert(result.message);

        //        关闭对话框
                $("#empsUpdateModal").modal("hide");
        //        回到本页面
                to_page(currentPage);
        }
        })

    })

    //单个删除
    $(document).on("click",".delete_btn",function(){
    //    弹出是否确认删除对话框
        var empName=$(this).parents("tr").find("td:eq(2)").text();
        var empId=$(this).attr("delete-id");
        if(confirm("确认删除【"+empName+"】吗？")){
            $.ajax({
                url: "${APP_TH}/emps/"+empId,
                type: "delete",
                success: function (result) {
                    alert(result.message);
                    //回到本页
                    to_page(currentPage);

                }
            })
        }
    })

    //全选或者全不选
    $("#check_all").click(function () {
    //    prop获取原生dom的属性,attr获取自定义属性
        $(".check_item").prop("checked",$(this).prop("checked"));

    })

    //check_item
    $(document).on("click",".check_item",function () {
    //    判断当前选中的元素是否超过5个
        var flag=$(".check_item:checked").length==$(".check_item").length;
        $("#check_all").prop("checked",flag);

    })

    $("#emp_delete_all_btn").click(function () {
        var empNames="";
        var del_idstr="";
        $.each($(".check_item:checked"),function () {
            empNames += $(this).parents("tr").find("td:eq(2)").text()+",";
            del_idstr += $(this).parents("tr").find("td:eq(1)").text()+"-";

        });
    //    去除empNames最后的,
        empNames=empNames.substring(0,empNames.length-1);
        //去除多余的-
        del_idstr=del_idstr.substring(0,del_idstr.length-1);
        if(confirm("确认删除【"+empNames+"】吗？")){
            $.ajax({
                url: "${APP_TH}/emps/"+del_idstr,
                type: "delete",
                success:function (result) {
                    alert(result.message);
                    to_page(currentPage);

                }

            })

        }

    })



    // function b() {
    //     //  var c=document.getElementById("input1").value;
    //     // document.getElementsByTagName("body")[0].style.backgroundColor=c ;
    //     // if(c=="black")
    //     //     document.getElementById("input1").value="white";
    //     // if(c=="white")
    //     //     document.getElementById("input1").value="black";
    //
    //     document.getElementsByTagName("body")[0].style.backgroundColor=e;
    //     if(e=="white"){
    //         e="black";
    //         console.log("e为黑色");
    //         return;
    //
    //     }
    //     if(e=="black"){
    //
    //         e="white";
    //         console.log("e为白色");
    //         return;
    //     }
    // }
</script>
</body>
</html>
