<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ page import="com.spring.petsitter.*" %>
<%@ page import="com.spring.petsitter.board.*" %>

<%@ page import="javax.servlet.*,java.text.*" %>
<!DOCTYPE html>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<!-- 합쳐지고 최소화된 최신 자바스크립트 -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<meta charset="UTF-8">
</head>
<body>
<div class="row">
	<div class="container">
			  <div class="col-xs-12">
        <form action="/insertProc" method="post">
            <dl class="dl-horizontal">
              <dt>제목</dt>
              <dd>제목</dd>
              
              <dt>작성자</dt>
              <dd>작성자</dd>
              
              <dt>작성날짜</dt>
              <dd>
                  <fmt:formatDate value="${detail.reg_date}" pattern="yyyy.MM.dd HH:mm:ss"/>
              </dd>
              
              <dt>첨부파일</dt>
              <dd><a href="/fileDown/${files.bno}">${files.fileOriName}</a></dd>
              
              <dt>내용</dt>
              <dd>코멘트 멘트 멘트 멘트 멘트 멘트 멘트 멘트 멘트 멘트 멘트 </dd>
            </dl>
        </form>
        <div class="btn-group btn-group-sm" role="group" style="float:right;">
          <button type="button" class="btn btn-default" onclick="location.href='/delete/${detail.bno}'">삭제</button>
          <button type="button" class="btn btn-default" onclick="location.href='/update/${detail.bno}'">수정</button>
          <button type="button" class="btn btn-default" onclick="location.href='/list'"> 목록 </button>
        </div>
    </div>
 
	</div>
</div>
</body>
</html>