<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html>

	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>会员登录</title>
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css" type="text/css" />
		<script src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" type="text/javascript"></script>
		<script src="${pageContext.request.contextPath}/js/bootstrap.min.js" type="text/javascript"></script>
		<!-- 引入自定义css文件 style.css -->
		<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css" type="text/css" />

		<style>
			body {
				margin-top: 20px;
				margin: 0 auto;
			}
			
			.carousel-inner .item img {
				width: 100%;
				height: 300px;
			}
		</style>
	</head>

	<body>

            <!-- 插入静态 文件-->
			<%@ include file="header.jsp" %>>

		

		<div class="container">
			<div class="row">

				<div style="margin:0 auto; margin-top:10px;width:950px;">
					<strong>我的订单</strong>
					<table class="table table-bordered">
					    <c:forEach items="${bean.list }" var="o"> 
						<tbody>
						<!-- 订单状态 0:未付款	1:已付款	2:已发货	3.已完成 -->
						
							<tr class="success">
								<th colspan="2">订单编号:${o.oid } </th>
								<th colspan="1">
								<c:if test="${o.state == 0 }">
								<a href="${pageContext.request.contextPath }/orderServlet?method=findByOId&oid=${o.oid}">去付款 </a>
								</c:if>
								<c:if test="${o.state == 1 }">
								订单状态:已付款
								</c:if>
								<c:if test="${o.state == 2 }">
								订单状态:已发货 
								</c:if>
								<c:if test="${o.state == 3 }">
								订单状态:已完成 
								</c:if>
								</th>
								<th colspan="2">下单时间:${o.ordertime} </th>
							</tr>
						
							<tr class="warning">
								<th>图片</th>
								<th>商品</th>
								<th>价格</th>
								<th>数量</th>
								<th>小计</th>
							</tr>
								<c:forEach items="${o.items }" var="io">
							<tr class="active">
								<td width="60" width="40%">
									<input type="hidden" name="id" value="22">
									<img src="${pageContext.request.contextPath}/${io.product.pimage}" width="70" height="60">
								</td>
								<td width="30%">
									<a target="_blank"> ${io.product.pname}</a>
								</td>
								<td width="20%">
									￥${io.product.shop_price}
								</td>
								<td width="10%">
									￥${io.count}
								</td>
								<td width="15%">
									<span class="subtotal">￥${io.subtotal }</span>
								</td>
							</tr>
							</c:forEach>
						</tbodya>	
						</c:forEach>
					</table>
					
				</div>
			</div>
			
			<div style="text-align: center;">
				<ul class="pagination">
				<!-- 如果当前页面为第一页，则不可按 -->
				   <c:if test="${bean.curPage == 1 }">
					<li class="disabled"><a href="JavaScript:void(0)" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
				  </c:if>
				<!-- 如果当前页面不为第一页，则可按 -->
				   <c:if test="${bean.curPage != 1 }">
					<li ><a href="${pageContext.request.contextPath}/orderServlet?method=findByPage&curPage=${bean.curPage - 1}" aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
				  </c:if>
					
					<c:forEach begin="1" end="${bean.sumPage}" var="n">
					<!-- 如果为循环为当前页，则不跳转 -->
					<c:if test="${bean.curPage == n  }">
					<li class="active"><a href="JavaScript:void(0)">${n}</a></li>
					</c:if>
					
					<!-- 如果为循环不为当前页，则跳转 -->
					<c:if test="${bean.curPage != n  }">
					<li ><a href="${pageContext.request.contextPath}/orderServlet?method=findByPage&curPage=${n}">${n }</a></li>
					</c:if>
					
					</c:forEach>
					
					
					<!-- 如果当前页面为最后一页，则不可按 -->
					<c:if test="${bean.curPage == bean.sumPage }">
					<li class="disabled"><a href="JavaScript:void(0)" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					<!-- 如果当前页面不为最后一页，则可按 -->
					<c:if test="${bean.curPage != bean.sumPage }">
					<li ><a href="${pageContext.request.contextPath}/orderServlet?method=findByPage&curPage=${bean.curPage + 1}" aria-label="Next"><span aria-hidden="true">&raquo;</span></a></li>
					</c:if>
					
				</ul>
			</div>
		</div>




		<div style="margin-top:50px;">
			<img src="${pageContext.request.contextPath}/image/footer.jpg" width="100%" height="78" alt="我们的优势" title="我们的优势" />
		</div>

		<div style="text-align: center;margin-top: 5px;">
			<ul class="list-inline">
				<li><a>关于我们</a></li>
				<li><a>联系我们</a></li>
				<li><a>招贤纳士</a></li>
				<li><a>法律声明</a></li>
				<li><a>友情链接</a></li>
				<li><a target="_blank">支付方式</a></li>
				<li><a target="_blank">配送方式</a></li>
				<li><a>服务声明</a></li>
				<li><a>广告声明</a></li>
			</ul>
		</div>
		<div style="text-align: center;margin-top: 5px;margin-bottom:20px;">
			Copyright &copy; 2005-2016 传智商城 版权所有
		</div>
	</body>

</html>