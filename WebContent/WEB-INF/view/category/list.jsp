<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="../home/top.jsp"/>
<link rel="stylesheet" 
	href="${css}/customer/list.css" />
<link rel="stylesheet" href="${css}/customer/navi_bar.css" />
<div class="grid-item" id="navi_bar">
	<jsp:include page="../home/post-navi-bar.jsp"/>
	</div>
	
 <div class="grid" id="side-menu">
  <div class="col-xs-1">
  	
  <div class="grid-item" id="side-menu">
  			 <div class="list-group" style="width: 200px" id="cate_side_menu22">
  			<h2>카테고리 메뉴</h2>
				<ul id="cate_side_menu">
					<li class="list-group-item" id="cate_list" style="background-color: #757575">카테고리 목록</li>
					<li class="list-group-item" id="cate_register" >카테고리 등록</li>
					<li class="list-group-item" id="cate_search" >카테고리 조회</li>
					<li class="list-group-item" id="cate_update" >카테고리 수정</li>
					<li class="list-group-item" id="cate_delete" >카테고리 삭제</li>
				</ul>
 			 </div>
		</div>
  
  </div>
     
		
<div class="grid" id="side-menu" >
<div class="grid-item" id="content" >
<div class="col-xs-6">
		<h1><font style="font-size: 30px">카테고리 리스트 </font></h1>

	<table id="cate_tab" style="width: 500px" >
	  <tr >
	    <th>No.</th>
	    <th>카테고리 제목</th>
	    <th>카테고리 설명</th>
	  </tr>
	  <c:forEach items="${list}" var="category">
	  <tr>
	    <td>${category.categoryID}</td>
	    <td>${category.categoryName}</td>
	    <td><a href="#">${category.description}</a></td>
	  </tr>
	    </c:forEach>
	
	</table>
	</div>
   
   </div>
  </div>	
  </div>

<%-- 	<div class="center">
		  <div class="pagination">
		  <c:if test="${pagination.existPrev}">
		    <a href='${ctx}/customer.do?cmd=cust_list&page=list&page_size=5&page_num=${pagination.prevBlock}'>&laquo;</a>
		  </c:if>
		
		  <c:forEach begin="${pagination.startPage}" end="${pagination.endPage}" varStatus="status">
		  	<c:choose>
		  		<c:when test="${pagination.pageNum eq status.index}">
		  			<a href="#" class="count active" >${status.index}</a>
		  		</c:when>
		  		<c:otherwise>
		  			<a href="#" class="count" >${status.index}</a>
		  		</c:otherwise>
		  	</c:choose>
		  
		  </c:forEach>
		  
		  <c:if test="${pagination.existNext}">
		  <a href='${ctx}/customer.do?cmd=cust_list&page=list&page_size=5&page_num=${pagination.nextBlock}'>&raquo;</a>
		  </c:if>
	</div>
	  
	</div> --%>
		


<jsp:include page="../home/bottom.jsp"/>
<script>

$('.count').attr('style','cursor:pointer').click(()=>{
	location.assign('${ctx}/customer.do?cmd=cust_list&page=list&page_size=5&page_num='+$(this).text());
}); 

$('#product').attr('style','cursor:pointer').click(()=>{
	location.assign('${ctx}/product.do?cmd=pro_list&page=main');
}); 

$('#cate_register').click(()=>{
	$('#cate_side_menu > li').attr('style','background-color: white');
	$('#cate_register').attr('style','background-color: #757575');
	$('#content').html(
			+' <form id="form" class="form">'
			+'  <div class="form-group" >'
			+'    <label for="text">카테고리 이름:</label> '
			+'    <input type="text" class="form-control" name="cate_name" id="cate_name" style="width: 350px"> '
			+'  </div>'
			+'  <div class="form-group"> '
			+'    <label for="text">상세 설명:</label> '
			+'    <input type="text" class="form-control" name="description" id="description" style="width: 350px"> '
			+'  </div>'
			+'  <button type="submit" class="btn btn-default" id=cate_register_btn>Submit</button> '
			+'		 <input type="hidden" name="cmd" value="cate_register" />'
			+'       <input type="hidden" name="dir" value="category" />'
			+'       <input type="hidden" name="page" value="list" />'
			+'</form> '
		   		
			
			);

		
});
 $('.btn btn-default').click(function(){
	 alert('등록클릭');
	var cetegoryneme = $('#cate_name').val();
	var description = $('#description').val();
	 $('#form').attr('action','${ctx}/category.do').submit(); 
});


$('#cate_list').click(()=>{
	location.assign('${ctx}/category.do?cmd=cate_list&page=list');
});


$('#cate_search').click(()=>{
	$('#cate_side_menu > li').attr('style','background-color: white');
	$('#cate_search').attr('style','background-color: #757575');
	$('#content').html('<form id="form" > '
			+'  <div class="form-group" >'
			+'    <label for="text">카테고리 검색:</label> '
			+'    <select>'
			+'		<option name="cate_id" value="1000">스마트폰</option>'
			+'		<option name="cate_id" value="1001">데스크탑</option>'
			+'		<option name="cate_id" value="1002">노트북</option>'
			+'    </select>'
			+'  <button type="submit" class="btn btn-default" id=cate_register>Submit</button> '
			+'</form> ');
});
$('#cate_update').click(()=>{

	$('#cate_side_menu > li').attr('style','background-color: white');
	$('#cate_update').attr('style','background-color: #757575');
	$('#content').html('<div>'
			+'    <label for="text">카테고리 검색:</label><br> '
			+'  <input type="radio" name="gender" value="1000"> 스마트폰<br>'	
			+'  <input type="radio" name="gender" value="1001"> 데스크탑<br>'
			+'  <input type="radio" name="gender" value="1002"> 노트북<br>'
			+'  </div>'
	 		+'  <button type="button" class="btn btn-info btn-lg" data-toggle="modal" data-target="#myModal">선택</button>' 
			+'		<div class="container">	'
			+'      <div class="modal fade" id="myModal" role="dialog">'
		    +'		<div class="modal-dialog">'
			+'		<div class="container">'
			+'      <div class="modal-content" style="width: 400px">'
			+'        <div class="modal-header">'
			+'          <button type="button" class="close" data-dismiss="modal">&times;</button>'
			+'          <h4 class="modal-title">카테고리 수정</h4>'
			+'        </div>'
			+'        <div class="modal-body" style="width: 400px">'
			+'          <p> '
			+  					'<form id="form" > '
			+'					  <div class="form-group" >'
			+' 					   <label for="text">카테고리 이름:</label> '
			+'  			  <input type="text" class="form-control" name="cate_name" > '
			+' 				 </div>'
			+' 				 <div class="form-group"> '
			+'  				  <label for="text">상세 설명:</label> '
			+'  			  <input type="text" class="form-control" name="description" > '
			+' 				 </div>'
			+' 				 <button type="submit" class="btn btn-default" id=cate_register_btn >Submit</button> '
			+'				</form> '
			+'			</p>'
			+'        </div>'
			+'        <div class="modal-footer">'
			+'          <button type="button" class="btn btn-default" data-dismiss="modal" >Close</button>'
			+'        </div>'
			+'      </div>'
			+'    </div>'
			+'  </div>'
			+'</div>');

});


$('#cate_delete').click(()=>{
	$('#cate_side_menu > li').attr('style','background-color: white');
	$('#cate_delete').attr('style','background-color: #757575');
	$('#content').html('<form id="form" > '
			+'  <div class="form-group" >'
			+'    <label for="text">카테고리 삭제:</label> <br>' 
			+'		<input type="checkbox" name="vehicle1" value="1000"> 스마트폰<br>'
			+'		<input type="checkbox" name="vehicle2" value="1001"> 데스크탑<br>'
			+'		<input type="checkbox" name="vehicle3" value="1003"> 노트북<br>'
			+'  <button type="submit" class="btn btn-default" id=cate_register>Submit</button> '
			+'</form> ');
});



</script>