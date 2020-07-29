<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.board.mboard.*" %>
<%@ page import="javax.servlet.*,java.text.*" %>
<% 
	String id = null;
	String name = null;
	String rank = null;
	
	id = (String)session.getAttribute("id");
	name = (String)session.getAttribute("name");
	rank = (String)session.getAttribute("rank");
	
	List<MemberBoardVO> mboardlist = (List<MemberBoardVO>)request.getAttribute("mboard_list");
	List<ReportArticleVO> ralist = (List<ReportArticleVO>)request.getAttribute("ra_list");
	List<ReportReplyVO> rrlist = (List<ReportReplyVO>)request.getAttribute("rr_list");
%>
<%
	SimpleDateFormat format1;
	format1 = new SimpleDateFormat("yyyy-MM-dd");
	
	System.out.println(rank);
%>
<!DOCTYPE html>
<html>
<style>
#reasonReply,#idReply,#reasonArticle,#idArticle,#reasonReply2,#reasonArticle2 {
text-overflow:ellipsis;
white-space:nowrap;
word-wrap:normal;
overflow:hidden;
}
</style>
<html lang="en">
    <head>
        <meta charset="utf-8" />	
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>대시보드 - Petsitter</title>
        <link href="./admin/dist/css/styles.css" rel="stylesheet" />
        <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet" crossorigin="anonymous" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/js/all.min.js" crossorigin="anonymous"></script>
    </head>
	
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <a class="navbar-brand" href="admin.me">관리자 페이지</a>
            <button class="btn btn-link btn-sm order-1 order-lg-0" id="sidebarToggle" href="#"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ml-auto mr-0 mr-md-3 my-2 my-md-0">
                <!-- <div class="input-group">
                    <input class="form-control" type="text" placeholder="Search for..." aria-label="Search" aria-describedby="basic-addon2" />
                    <div class="input-group-append">
                        <button class="btn btn-primary" type="button"><i class="fas fa-search"></i></button>
                    </div> 
                </div> -->
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ml-auto ml-md-0">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="userDropdown" href="#" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="userDropdown">
                        <a class="dropdown-item" href="#">기능1</a>
                        <a class="dropdown-item" href="#">기능2</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="logout.me">로그아웃</a>
                    </div>
                </li>
            </ul>
        </nav>
        
        
        <div id="layoutSidenav">
        		<!-- 사이드바 시작 -->
        <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Core</div>
                            <a class="nav-link" href="index.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-tachometer-alt"></i></div>
                                대시보드
                            </a>
                            <div class="sb-sidenav-menu-heading">Interface</div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fas fa-columns"></i></div>
                                회원 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesReport" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        신고 관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesReport" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="admin_reportArticle.me">글 신고</a>
                                            <a class="nav-link" href="admin_reportReply.me">리플 신고</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesMember" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                    회원 정보 관리
                                    <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                     <div class="collapse" id="pagesMember" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="admin_memberManage.me">회원 관리</a>
                                            <a class="nav-link" href="admin_petsitterManage.me">펫시터 관리</a>
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapsePages" aria-expanded="false" aria-controls="collapsePages">
                                <div class="sb-nav-link-icon"><i class="fas fa-book-open"></i></div>
                                계약 관리
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapsePages" aria-labelledby="headingTwo" data-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav accordion" id="sidenavAccordionPages">
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseAuth" aria-expanded="false" aria-controls="pagesCollapseAuth">
                                        거래 관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseAuth" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
                                            <a class="nav-link" href="login.html">예약된 거래</a>
                                            <a class="nav-link" href="register.html">진행중인 거래</a>
                                            <a class="nav-link" href="password.html">완료된 거래</a>
                                        </nav>
                                    </div>
                                    <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#pagesCollapseError" aria-expanded="false" aria-controls="pagesCollapseError">
                                        펫시터 관리
                                        <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                                    </a>
                                    <div class="collapse" id="pagesCollapseError" aria-labelledby="headingOne" data-parent="#sidenavAccordionPages">
                                        <nav class="sb-sidenav-menu-nested nav">
<<<<<<< HEAD
                                            <a class="nav-link" href="401.html">펫시터 목록</a>
                                            <a class="nav-link" href="404.html">펫시터 신청 관리</a>
=======
                                            <a class="nav-link" href="admin_petsitterApply.me">펫시터 신청 관리</a>
>>>>>>> origin/PGKIM
                                        </nav>
                                    </div>
                                </nav>
                            </div>
                            <div class="sb-sidenav-menu-heading">Addons</div>
                            <a class="nav-link" href="charts.jsp">
                                <div class="sb-nav-link-icon"><i class="fas fa-chart-area"></i></div>
                                Charts
                            </a>
                            <a class="nav-link" href="tables.html">
                                <div class="sb-nav-link-icon"><i class="fas fa-table"></i></div>
                                Tables
                            </a>
                        </div>
                    </div>
                    <div class="sb-sidenav-footer">
                        <div class="small">Logged in as:</div>
                        ${id}
                    </div>
                </nav>
            </div>
						<!--사이드바 끝 -->
			
			
			
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid">
                        <h1 class="mt-4">대시보드</h1>
                        <ol class="breadcrumb mb-4">
                            <li class="breadcrumb-item active">대시보드</li>
                        </ol>
                          <div class="row">
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">
                                        <i class="fas fa-chart-area mr-1"></i>
                                        Q&A 게시판
                                    </div>
                                    <div class="card-body">
                                    	<table class="table table-sm table-hover table-striped" height="40">
                                    		<thead>
                                    		<th>작성자</th>
                                    		<th>제목</th>
                                    		<th>작성일</th>
                                    		</thead>
																				<tbody>
																					<%for(int i = 0 ; i < mboardlist.size(); i++) {
																					MemberBoardVO bl=(MemberBoardVO)mboardlist.get(i);
																					%>
																					<tr>
																						<td><%=bl.getMEMBER_NICKNAME() %> </td>
																						<td><a href="./mboarddetail.me?num=<%=bl.getMEMBER_NUM()%>"><%=bl.getMEMBER_SUBJECT() %></a></td>
																						<td><%=format1.format(bl.getMEMBER_DATE()) %></td>
																					</tr>
																					<%} %>
																					<tr>
																						<td colspan="3" style="text-align:center;"><a href="./mboardlist.me">더보기</a></td>
																					</tr> 
																				</tbody>
																			</table>
                                    </div>
                                </div>
                            </div>
                            <div class="col-xl-6">
                                <div class="card mb-4">
                                    <div class="card-header">

																			  <h2>신고 목록</h2>
																			  <ul class="nav nav-tabs">
																			    <li><a type="button" class="btn btn-primary btn-sm" data-toggle="tab" href="#reportArticle">글 신고</a></li>
																			    <li><a type="button" class="btn btn-secondary btn-sm" data-toggle="tab" href="#reportReply">리플 신고</a></li>
																			  </ul>

                                    </div>
                                    <div class="card-body"><div class="tab-content">
																     <div id="reportArticle" class="tab-pane fade">
																      	<table class="table table-sm table-hover table-striped"  style="table-layout: fixed" height="40">
                                    		<thead>
                                    		<th width="15%">글번호</th>
                                    		<th width="55%">신고이유</th>
                                    		<th width="15%">신고자</th>
                                    		<th width="15%">게시판</th>
                                    		</thead>
																				<tbody>
																				<%for(int i = 0 ; i < ralist.size(); i++) {
																					ReportArticleVO ra=(ReportArticleVO)ralist.get(i);
																					%>
																					<tr>
																						<td><%=ra.getMEMBER_NUM() %> </td>
																						<td id="reasonArticle"><%=ra.getREPORT_REASON() %></td>
																						<td id="idArticle"><%=ra.getMEMBER_ID() %></td>
																						<td><%=ra.getBTYPE() %>
																					</tr>
																					<%} %>
																				</tbody>
																				</table>
																    </div>
																    <div id="reportReply" class="tab-pane fade">
																   	  <table class="table table-sm table-hover table-striped" style="table-layout: fixed" height="40">
                                    		<thead>
                                    		<th width="12%">글번호</th>
                                    		<th width="15%">리플번호</th>
                                    		<th width="43%">신고이유</th>
                                    		<th width="15%">신고자</th>
                                    		<th width="15%">게시판</th>
                                    		</thead>
																				<tbody>
																				<%for(int i = 0 ; i < rrlist.size(); i++) {
																					ReportReplyVO rr=(ReportReplyVO)rrlist.get(i);
																					%>
																					<tr>
																						<td><%=rr.getBNO() %></td>
																						<td><%=rr.getRNO() %></td>
																						<td id="reasonReply"><%=rr.getREPORT_REASON() %></td>
																						<td id="idReply"><%=rr.getMEMBER_ID() %></td>
																						<td><%=rr.getBTYPE() %></td>
																					</tr>
																					<%} %>
																				</tbody>
																			</table> 
																    </div>
																    
																  </div></div>
                                </div>
                            </div>
                        </div>
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-table mr-1"></i>
                                거래중인 내역
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-bordered"  style="table-layout: fixed" id="dataTable" width="100%">
                                    	<thead>
                                    		<th width="15%">글번호</th>
                                    		<th width="15%">리플번호</th>
                                    		<th width="40%">신고이유</th>
                                    		<th width="15%">신고자</th>
                                    		<th width="15%">게시판</th>
                                    	</thead>
																			<tbody>
																			<%for(int i = 0 ; i < rrlist.size(); i++) {
																					ReportReplyVO rr=(ReportReplyVO)rrlist.get(i);
																					%>
																					<tr>
																						<td><%=rr.getBNO() %></td>
																						<td><%=rr.getRNO() %></td>
																						<td id="reasonReply2"><%=rr.getREPORT_REASON() %></td>
																						<td id="idReply2"><%=rr.getMEMBER_ID() %></td>
																						<td><%=rr.getBTYPE() %></td>
																					</tr>
																					<%} %>
																				</tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2020</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://code.jquery.com/jquery-3.5.1.min.js" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="./admin/dist/js/scripts.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
        <script src="./admin/dist/assets/demo/chart-area-demo.js"></script>
        <script src="./admin/dist/assets/demo/chart-bar-demo.js"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" crossorigin="anonymous"></script>
        <script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js" crossorigin="anonymous"></script>
        <script src="./admin/dist/assets/demo/datatables-demo.js"></script>
    </body>
</html>
