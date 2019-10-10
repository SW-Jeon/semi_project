<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 메인창으로 로그인이나 배너 클릭할 때  -->
<link rel="stylesheet" type="text/css" href="${cp }/css/m.css">
<div id="wrap">
	<hr>
	<jsp:include page="${top }" />
	<hr>
	<jsp:include page="${content }" />
	<jsp:include page="${right }" />
	<jsp:include page="${bottom }" />
	<hr>
</div>
