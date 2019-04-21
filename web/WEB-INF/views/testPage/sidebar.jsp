<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 5.0 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">


<html>

<head>
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, viewport-fit=cover">
    <meta name="apple-mobile-web-app-capable" content="yes"/>
    <title>navbar & sidebar</title>


    <link rel='stylesheet'
          href='https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0-alpha.6/css/bootstrap.min.css'>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>

    <link rel="stylesheet" href="/resources/templet/css/sidebarStyle.css">
    <link rel="stylesheet" as="font"
          href="https://fonts.googleapis.com/css?family=Roboto:100,300,400,500,600,700|Material+Icons"/>

    <script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <script>
        let check;
        let side;
        let mochi_menu;

        //상단 모찌 버튼
        $(function () {
            check = true;
            side = document.getElementById("first_menu");
            mochi_menu = document.getElementById("mochi_menu");
        });


        function side_call() {
            if (check) {
                mochi_menu.src = "/resources/images/homeUI/mochi_on.png";
                side.style.width = "190px";
                check = !check;
            } else {
                mochi_menu.src = "/resources/images/homeUI/mochi_off.png";
                side.style.width = "0px";
                check = !check;
            }
        }


        //친구 데이터 읽어옴
        function init() {

            $.ajax({
                url: "friendList"
                , type: "get"
                , data: {}
                , success: function (fList) {
                    output(fList);
                }
            });
        }

        // 출력
        function output(resp) {
            var data = '<table>';

            data += '<tr>';
            data += '	<td>ID</td>';
            data += '	<td>NAME</td>';
            data += '	<td>NICKNAME</td>';
            data += '</tr>';
            data += '</table>';
            data += '<hr/>';

            data += '<table>';
            $.each(resp, function (index, item) {
                data += '<tr class="friend_seq" data-sno="' + item.FRIEND_SEQ + '" >';
                data += '	<td class="friend_id">' + item.FRIEND_ID + '</td>';
                data += '	<td class="friend_name">' + item.FRIEND_NAME + '</td>';
                data += '	<td class="friend_nickname">' + item.FRIEND_NICKNAME + '</td>';
                data += '	<td><input type="button"  class="boardbtn" data-stu_id="' + item.FRIEND_ID + '"value="방명록작성하러가기" /></td>';
                data += '	<td><input type="button"  class="delbtn" data-sno="' + item.FRIEND_SEQ + '"value="끊기" /></td>';
                data += '</tr>';
            });

            data += '</table>';

            $("#friendDiv").append(data);
            $(".boardbtn").on("click", function (event) {
                boardbtn($(event.target));
            });
            $(".delbtn").on("click", function (event) {
                del($(event.target));
            });
        }

        function boardbtn(target) {
            var student_id = $(target).attr('data-stu_id');
            window.open("boardDetail?host_id=" + student_id, "newwin", "top=200, left=300, height=400, width=700");
        }

        // 팔로우 삭제
        function del(target) {
            var delno = $(target).attr('data-sno');
            if (delno != null) {
                alert(delno);
                $.ajax({
                    url: "deleteFriend"
                    , type: "post"
                    , data: {seq: delno}
                    , success: function (result) {
                        $("#friendDiv").empty();
                        init();
                    }
                });
            } else {
                alert("??");
            }
        }

        function searchid() {
            window.open("searchFriendForm", "newwin", "top=200, left=300, height=400, width=700")
        }
    </script>

    <script>
        $(function () {
            classNameNCode();
            applyClassStudentList();
            classList();
            applyingClass();
            classListByStudent();
        });

        function applyingClass() {
            $.ajax({
                url: "applyingClass"
                , type: "get"
                , data: {}
                , success: function (applyingClassList) {
                    if (applyingClassList.length != 0) {
                        applyingClassOutput(applyingClassList);
                    }
                }
            })
        }

        function applyingClassOutput(applyingClassList) {
            var data = '신청중인 반 현황';

            data += '<table>';
            data += '<tr>';
            data += '	<td>반명</td>';
            data += '	<td>선생님</td>';
            data += '</tr>';

            $.each(applyingClassList, function (index, item) {
                data += '<tr>';
                data += '	<td class="myclass_name">' + item.myclass_name + '</td>';
                data += '	<td class="myclass_teacher_name">' + item.myclass_teacher_name + '</td>';
                data += '	<td><input type="button"  class="canselbtn" value="신청 취소" /></td>';
                data += '</tr>';
            });
            data += '</table>';
            $("#applyingClass").append(data);

            $(".canselbtn").on("click", function (event) {
                var result = confirm("정말로 해당 반 신청을 취소하시겠습니까?");
                if (result) {
                    canseldel($(event.target));
                }
            });
        }

        function canseldel() {
            $.ajax({
                url: "canselApplyClass"
                , type: "get"
                , data: {}
                , success: function () {
                    $("#applyingClass").empty();
                    applyingClass();
                }
            });
        }

        //반 코드, 이름 출력
        function classNameNCode() {
            $.ajax({
                url: "classNameNCodeList"
                , type: "get"
                , data: {}
                , success: function (cnncList) {
                    cnncoutput(cnncList);
                }
            })
        }

        function cnncoutput(resp) {
            var data = '우리반 목록';

            data += '<table>';
            data += '<tr>';
            data += '	<td>반명</td>';
            data += '	<td>코드</td>';
            data += '</tr>';

            $.each(resp, function (index, item) {
                data += '<tr class="myclass_code" data-sno="' + item.MYCLASS_CODE + '" >';
                data += '	<td class="myclass_name">' + item.MYCLASS_NAME + '</td>';
                data += '	<td class="myclass_code">' + item.MYCLASS_CODE + '</td>';
                data += '	<td><input type="button"  class="cdelbtn" data-code="' + item.MYCLASS_CODE + '" value="반 정보 삭제" /></td>';
                data += '</tr>';
            });
            data += '</table>';
            $("#cnncListDiv").append(data);

            $(".cdelbtn").on("click", function (event) {
                var result = confirm("정말로 반 정보를 삭제하시겠습니까? 해당 반에 있는 학생정보도 같이 삭제됩니다.");
                if (result) {
                    cdel($(event.target));
                }
            });
        }

        // 반 삭제
        function cdel(target) {
            var code = $(target).attr('data-code');
            if (code != null) {
                $.ajax({
                    url: "deleteClass"
                    , type: "post"
                    , data: {code: code}
                    , success: function (result) {
                        $("#cnncListDiv").empty();
                        classNameNCode();
                    }
                });
            }
        }

        function applyClassStudentList() {
            $.ajax({
                url: "applyClassStudentList"
                , type: "get"
                , data: {}
                , success: function (aList) {
                    if (aList.length != 0)
                        applyListoutput(aList);
                }
            })
        }

        function applyListoutput(aList) {
            var data = '반 신청 학생';
            data += '<table>';
            data += '<tr>';
            data += '	<td>신청 반</td>';
            data += '	<td>신청 반 코드</td>';
            data += '	<td>학생아이디</td>';
            data += '	<td>학생이름</td>';
            data += '	<td>학생닉네임</td>';
            data += '</tr>';

            $.each(aList, function (index, item) {
                data += '<tr>';
                data += '	<td class="myclass_name">' + item.MYCLASS_NAME + '</td>';
                data += '	<td class="myclass_code">' + item.MYCLASS_CODE + '</td>';
                data += '	<td class="student_id">' + item.STUDENT_ID + '</td>';
                data += '	<td class="student_name">' + item.STUDENT_NAME + '</td>';
                data += '	<td class="student_nickname">' + item.STUDENT_NICKNAME + '</td>';
                data += '	<td><input type="button"  class="applybtn" data-studentid="' + item.STUDENT_ID + '" value="수락" /></td>';
                data += '	<td><input type="button"  class="rejectbtn" data-studentid="' + item.STUDENT_ID + '" value="거절" /></td>';
                data += '</tr>';
            });
            data += '</table>';

            $("#applyClassStudentList").html("");
            $("#applyClassStudentList").append(data);
            $(".applybtn").on("click", function (event) {
                var result = confirm("정말로 해당학생의 신청을 수락하시겠습니까?");
                if (result) {
                    applybtn($(event.target));
                }
            });
            $(".rejectbtn").on("click", function (event) {
                var result = confirm("정말로 해당학생의 신청을 거절하시겠습니까?");
                if (result) {
                    rejectbtn($(event.target));
                }
            });
        }

        // 신청 학생 수락
        function applybtn(target) {
            var student_id = $(target).attr('data-studentid');
            if (student_id != null) {
                $.ajax({
                    url: "applyInClass"
                    , type: "get"
                    , data: {student_id: student_id}
                    , success: function (result) {
                        $("#applyListoutput").empty();
                        applyClassStudentList();
                    }
                });
            } else {
                alert("??");
            }
        }

        // 신청 학생 거절
        function rejectbtn(target) {
            var student_id = $(target).attr('data-studentid');
            if (student_id != null) {
                $.ajax({
                    url: "rejectInClass"
                    , type: "get"
                    , data: {student_id: student_id}
                    , success: function (result) {
                        $("#applyListoutput").empty();
                        applyClassStudentList();
                    }
                });
            } else {
                alert("??");
            }
        }

        // 반 목록 출력
        function classList() {
            $.ajax({
                url: "classNameList"
                , type: "get"
                , data: {}
                , success: function (cList) {
                    nameoutput(cList);
                }
            });
        }

        // 반이름 출력
        function nameoutput(resp) {
            var data = '<select id="selectclass" onchange="chageLangSelect()">';
            data += '<option class="classNameList" value="-선택-">-선택-</option>';
            $.each(resp, function (index, item) {
                data += '<option class="classNameList" value="' + item.myclass_code + '">' + item.myclass_name + '</option>';
            });
            data += '</select>';
            $("#myclassListDiv").append(data);
        }

        function chageLangSelect() {
            var target = document.getElementById("selectclass");

            var temp = target.options[target.selectedIndex].value;
            $.ajax({
                url: "classList"
                , type: "get"
                , data: {myclass_code: temp}
                , success: function (cList) {
                    studentoutput(cList);
                }
            });
        }

        // 선생님 용 출력
        function studentoutput(resp) {
            var data = '<table>';

            data += '<tr>';
            data += '	<td>학생아이디</td>';
            data += '	<td>학생이름</td>';
            data += '	<td>학생닉네임</td>';
            data += '</tr>';

            $.each(resp, function (index, item) {
                data += '<tr class="myclass_code" data-sno="' + item.MYCLASS_CODE + '" >';
                data += '	<td class="student_id">' + item.STUDENT_ID + '</td>';
                data += '	<td class="student_name">' + item.STUDENT_NAME + '</td>';
                data += '	<td class="student_nickname">' + item.STUDENT_NICKNAME + '</td>';
                data += '	<td><input type="button"  class="delbtn" data-code="' + item.MYCLASS_CODE + '" data-studentid="' + item.STUDENT_ID + '" value="제외" /></td>';
                data += '</tr>';
            });
            data += '</table>';

            $("#myclassDivInner").html("");
            $("#myclassDivInner").append(data);
            $(".delbtn").on("click", function (event) {
                var result = confirm("정말로 해당학생을 반에서 제외하시겠습니까?");
                if (result) {
                    delStu($(event.target));
                }
            });
        }

        // 반에서 학생 제외
        function delStu(target) {
            var code = $(target).attr('data-code');
            if (code != null) {
                $.ajax({
                    url: "deleteClass"
                    , type: "post"
                    , data: {code: code}
                    , success: function (result) {
                        $("#cnncListDiv").empty();
                        init();
                    }
                });
            } else {
                alert("??");
            }
        }

        // 학생용 반 출력
        function classListByStudent() {
            $.ajax({
                url: "classListByStudent"
                , type: "get"
                , data: {}
                , success: function (cList) {
                    listbystudentoutput(cList);
                }
            });
        }

        function listbystudentoutput(resp) {
            var data = '<table>';

            data += '<tr>';
            data += '	<td>아이디</td>';
            data += '	<td>이름</td>';
            data += '	<td>닉네임</td>';
            data += '</tr>';

            $.each(resp, function (index, item) {
                data += '<tr>';
                data += '	<td class="student_id">' + item.student_id + '</td>';
                data += '	<td class="student_name">' + item.student_name + '</td>';
                data += '	<td class="student_nickname">' + item.student_nickname + '</td>';
                data += '</tr>';
            });
            data += '</table>';

            $("#classStudent").html("");
            $("#classStudent").append(data);
        }

        function createClassCode() {
            window.open("createClass", "newwin", "top=200, left=300, height=400, width=700")
        }

        function searchStudentIdByParents() {
            window.open("searchStudentIdByParents", "newwin", "top=200, left=300, height=400, width=700")
        }

        function searchclassCode() {
            $.ajax({
                url: "classarundesuka"
                , type: "get"
                , data: {}
                , success: function (resp) {
                    if (resp.length != 0) {
                        alert("이미 반에 속해있거나, 신청한 반이 있습니다. 먼저 해당반을 취소하여주십시요.");
                    } else {
                        window.open("searchclasscodeform", "newwin", "top=200, left=300, height=400, width=700")
                    }
                }
            })
        }
    </script>


    <script>
        $(function () {
            applyFamilyList();
            FamilyList();
        });

        function applyFamilyList() {
            $.ajax({
                url: "applyFamilyList"
                , type: "get"
                , data: {}
                , success: function (pList) {
                    if (pList.length != 0)
                        applyFamilyListoutput(pList);
                }
            })
        }

        function applyFamilyListoutput(pList) {
            var data = '가족 신청 유저';
            data += '<table>';
            data += '<tr>';
            data += '	<td>아이디</td>';
            data += '	<td>이름</td>';
            data += '	<td>닉네임</td>';
            data += '</tr>';

            $.each(pList, function (index, item) {
                data += '<tr>';
                data += '	<td class="parents_id">' + item.parents_id + '</td>';
                data += '	<td class="parents_name">' + item.parents_name + '</td>';
                data += '	<td class="parents_nickname">' + item.parents_nickname + '</td>';
                data += '	<td><input type="button"  class="applybtn" value="수락" /></td>';
                data += '	<td><input type="button"  class="rejectbtn" value="거절" /></td>';
                data += '</tr>';
            });
            data += '</table>';

            $("#familyApplying").html("");
            $("#familyApplying").append(data);

            $(".applybtn").on("click", function (event) {
                var result = confirm("정말로 해당유저의 가족신청을 수락하시겠습니까?");
                if (result) {
                    applyFamilybtn($(event.target));
                }
            });
            $(".rejectbtn").on("click", function (event) {
                var result = confirm("정말로 해당유저의 가족신청을 거절하시겠습니까?");
                if (result) {
                    rejectFamilybtn($(event.target));
                }
            });
        }

        // 신청 가족 수락
        function applyFamilybtn(target) {
            $.ajax({
                url: "applyInFamily"
                , type: "get"
                , data: {}
                , success: function (result) {
                    $("#familyApplying").empty();
                    applyFamilyList();
                }
            });
        }

        // 신청 가족 거절
        function rejectFamilybtn(target) {
            $.ajax({
                url: "rejectInFamily"
                , type: "get"
                , data: {}
                , success: function (result) {
                    $("#familyApplying").empty();
                    applyFamilyList();
                }
            });
        }

        // 가족 유저 출력 학생페이지
        function FamilyList() {
            $.ajax({
                url: "FamilyList"
                , type: "get"
                , data: {}
                , success: function (resp) {
                    console.log(resp);
                    if (resp != null)
                        FamilyListOutput(resp);
                }
            })
        }

        function FamilyListOutput(resp) {
            var data = '가족 유저';
            data += '<table>';

            data += '<tr>';
            data += '	<td>아이디</td>';
            data += '	<td>이름</td>';
            data += '	<td>닉네임</td>';
            data += '</tr>';

            $.each(resp, function (index, item) {
                data += '<tr>';
                data += '	<td class="student_id">' + item.student_id + '</td>';
                data += '	<td class="student_name">' + item.student_name + '</td>';
                data += '	<td class="student_nickname">' + item.student_nickname + '</td>';
                data += '</tr>';
            });
            data += '</table>';

            $("#familyList").html("");
            $("#familyList").append(data);
        }
    </script>
</head>

<body class="slides horizontal simplifiedMobile animated">


<div data-component="navbar">

    <nav class="navbar p-0 fixed-top">
        <%--<button class="navbar-toggler navbar-toggler-left rounded-0 border-0" type="button" data-toggle="collapse"--%>
        <%--data-target="#megamenu-dropdown" aria-controls="megamenu-dropdown" aria-expanded="false"--%>
        <%--aria-label="Toggle navigation">--%>
        <%--<i class="fa fa-bars"></i><span class="ml-3">Advanced</span>--%>
        <%--</button>--%>

        <div>
            <a class="navbar-brand px-1" href="#" onclick="side_call()">
                <img src="/resources/images/homeUI/mochi_off.png" height="70px"
                     class="d-inline-block mt-1" id="mochi_menu">
            </a>

            <div class="right-links float-right mr-4">


                <div class="d-inline dropdown">
                    <a class="dropdown-toggle" id="messages" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false" href="#">
                        <img src="http://1.gravatar.com/avatar/47db31bd2e0b161008607d84c74305b5?s=96&d=mm&r=g">
                    </a>
                    <div class="dropdown-menu dropdown-menu-right rounded-0" aria-labelledby="messages">
                        <a class="dropdown-item" href="modify">Edit my profile</a>
                        <a class="dropdown-item" href="logout">Log Out</a>
                    </div> <!-- /.dropdown-menu -->
                </div> <!-- /.dropdown -->

            </div> <!-- /.right-links -->

        </div>


        <div class="megamenu">
            <div class="collapse navbar-collapse" id="megamenu-dropdown">
                <div class="megamenu-links">
                    <div class="row">
                        <div class="col-md-3 px-0">
                            <a class="btn rounded-0 border-0 d-flex w-100 justify-content-between p-3 pl-5"
                               data-toggle="collapse" href="#menuOne" aria-expanded="false"
                               aria-controls="collapseExample" id="more">Slider Revolution
                                <i class="fa fa-minus float-right" aria-hidden="true"></i>
                                <i class="fa fa-plus float-right" aria-hidden="true"></i>
                            </a> <!-- button close -->
                            <div class="collapse" id="menuOne">
                                <div class="list-group border-0">
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Slider
                                        Revolution</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Navigation
                                        Editor</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Add-Ons</a>
                                </div> <!-- /.list-group -->
                            </div><!-- /.collapse -->
                        </div> <!-- /.col-md-3 -->

                        <div class="col-md-3 px-0">
                            <a class="btn rounded-0 border-0 d-flex w-100 justify-content-between p-3"
                               data-toggle="collapse" href="#menuTwo" aria-expanded="false"
                               aria-controls="collapseExample" id="more">Flyouts
                                <i class="fa fa-minus float-right" aria-hidden="true"></i>
                                <i class="fa fa-plus float-right" aria-hidden="true"></i>
                            </a> <!-- button close -->
                            <div class="collapse" id="menuTwo">
                                <div class="list-group border-0">
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">All
                                        Flyouts</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Add
                                        new Flyout</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Re-Order</a>
                                </div> <!-- /.list-group -->
                            </div><!-- /.collapse -->
                        </div> <!-- /.col-md-3 -->
                        <div class="col-md-3 px-0">
                            <a class="btn rounded-0 border-0 d-flex w-100 justify-content-between p-3"
                               data-toggle="collapse" href="#menuThree" aria-expanded="false"
                               aria-controls="collapseExample" id="more">Cornerstone
                                <i class="fa fa-minus float-right" aria-hidden="true"></i>
                                <i class="fa fa-plus float-right" aria-hidden="true"></i>
                            </a> <!-- button close -->
                            <div class="collapse" id="menuThree">
                                <div class="list-group border-0">
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Cornerstone</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Cornerstone</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Cornerstone</a>
                                </div> <!-- /.list-group -->
                            </div><!-- /.collapse -->
                        </div> <!-- /.col-md-3 -->
                    </div> <!-- /.row -->
                    <div class="row">
                        <div class="col-md-3 px-0">
                            <a class="btn rounded-0 border-0 d-flex w-100 justify-content-between p-3 pl-5"
                               data-toggle="collapse" href="#menuFour" aria-expanded="false"
                               aria-controls="collapseExample" id="more">Ess. Grid
                                <i class="fa fa-minus float-right" aria-hidden="true"></i>
                                <i class="fa fa-plus float-right" aria-hidden="true"></i>
                            </a> <!-- button close -->
                            <div class="collapse" id="menuFour">
                                <div class="list-group border-0">
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Essential
                                        Grid</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Item
                                        Skin Editor</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Meta
                                        Data Handling</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Search
                                        Settings</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Global
                                        Settings</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Import/Export</a>
                                </div> <!-- /.list-group -->
                            </div><!-- /.collapse -->
                        </div> <!-- /.col-md-3 -->
                        <div class="col-md-3 px-0">
                            <a class="btn rounded-0 border-0 d-flex w-100 justify-content-between p-3"
                               data-toggle="collapse" href="#menuFive" aria-expanded="false"
                               aria-controls="collapseExample" id="more">AgentFire CTA Plus
                                <i class="fa fa-minus float-right" aria-hidden="true"></i>
                                <i class="fa fa-plus float-right" aria-hidden="true"></i>
                            </a> <!-- button close -->
                            <div class="collapse" id="menuFive">
                                <div class="list-group border-0">
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Essential
                                        Grid</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Item
                                        Skin Editor</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Meta
                                        Data Handling</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Search
                                        Settings</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Global
                                        Settings</a>
                                    <a href="#" class="list-group-item list-group-item-action border-0 pl-4 py-3">Import/Export</a>
                                </div> <!-- /.list-group -->
                            </div><!-- /.collapse -->
                        </div> <!-- /.col-md-3 -->
                    </div>
                </div> <!-- /.megamenu-links -->
            </div>
        </div>
    </nav>
</div> <!-- END TOP NAVBAR -->


<div class="#">
    <div data-component="sidebar">
        <div class="sidebar">

            <%--리스트 그룹 시작(친구 패널)--%>
            <ul class="list-group flex-column d-inline-block first-menu" id="first_menu">
                <%--우리반--%>
                <li class="list-group-item" style="padding-left: 0px;">
                        <c:if test="${sessionScope.type == 'teacher' || sessionScope.type == 'student'}">
                            <img width="180px" src="/resources/images/homeUI/menu1_1.png">
                        </c:if>

                        <c:if test="${sessionScope.type == 'parents'}">
                            <img width="180px" src="/resources/images/homeUI/menu4_1.png">
                        </c:if>

                    <ul class="list-group flex-column d-inline-block submenu">
                        <li class="list-group-item pl-4">
                            <c:if test="${sessionScope.type == 'teacher'}">
                                <input type="button" value="반 코드 생성하러 하기" onclick="createClassCode();">
                                <hr/>

                                <div id="cnncListDiv">

                                </div>
                                <br/><br/>

                                <div id="applyClassStudentList">

                                </div>
                                <br/><br/>

                                <hr/>
                                <div id="myclassListDiv">
                                    반 선택<br/>
                                </div>

                                <br/><br/>

                                <div id="myclassDiv">
                                    반 학생들<br/>
                                    <div id="myclassDivInner">

                                    </div>
                                </div>
                            </c:if>
                            <c:if test="${sessionScope.type == 'student'}">
                                <input type="button" value="반 검색" onclick="searchclassCode();">
                                <hr/>

                                <div id="applyingClass">

                                </div>

                                <div id="classStudent">

                                </div>
                            </c:if>
                            <c:if test="${sessionScope.type == 'parents'}">
                                <input type="button" value="자녀 검색" onclick="searchStudentIdByParents();">

                                <div id="familyList">

                                </div>
                            </c:if>
                        </li>

                    </ul> <!-- /.submenu -->
                </li> <!-- /우리반 마지막 -->

                <c:if test="${sessionScope.type == 'student'}">

                <li class="list-group-item" style="padding-left: 0px;">
                    <a href="#">
                        <img width="180px" src="/resources/images/homeUI/menu2_1.png">
                    </a>
                    <ul class="list-group flex-column d-inline-block submenu">
                        <li class="list-group-item pl-4">
                            <input type="button" value="유저 검색" onclick="searchid();">
                            <hr/>

                            <div id="friendDiv">
                                내 친구 목록<br/>
                                <hr/>
                            </div>
                        </li> <!-- end Posts -->
                    </ul> <!-- /.first-menu -->
                </li>

                <li class="list-group-item" style="padding-left: 0px;">
                    <a href="#">
                        <img width="180px" src="/resources/images/homeUI/menu4_1.png">
                    </a>
                    <ul class="list-group flex-column d-inline-block submenu">
                        <li class="list-group-item pl-4">
                            <div id="familyApplying">

                            </div>

                        </li>
                    </ul>
                </li>
                </c:if>
        </div> <!-- /.sidebar -->
    </div>
</div>

<div class="wp-content">


    <embed frameborder=0
           framespacing=0
           marginheight=0
           marginwidth=0
           scrolling=no vspace=0
           class="page_content"
           type="text/html"
           src="/main_test">

    <%--<iframe frameborder=0--%>
    <%--framespacing=0--%>
    <%--marginheight=0--%>
    <%--marginwidth=0--%>
    <%--scrolling=no vspace=0--%>
    <%--class="page_content"--%>
    <%--type="text/html"--%>
    <%--src="/main_test">--%>


</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src='https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js'></script>


</body>

</html>