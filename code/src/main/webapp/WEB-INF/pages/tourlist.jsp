<!-- === BEGIN HEADER === -->
<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="userheader.jsp"%>
<!-- === END HEADER === -->
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container background-white">
		<div class="row margin-vert-30">
			<!-- Search Form -->
			<div class="error-404-page text-center" style="margin-left: 60%;">
				<form class="form-search search-404">
					<div class="input-append">
						<input type="text" class="span2 search-query"
							placeholder="Nhập từ khóa" name="valueSearch">
						<button type="submit" class="btn btn-primary">Tìm Kiếm</button>
					</div>
				</form>
			</div>
			<!-- End Search Form -->
			<div class="col-md-12">
				<h2 class="margin-vert-20" style="text-align: center;">Danh
					Sách Tour Du Lịch</h2>
				<div class="row margin-bottom-30">
					<div class="col-md-4 animate fadeInRight"></div>
					<div class="col-md-8 animate fadeIn"></div>
					<div class="col-md-12 animate fadeInRight"></div>
				</div>
				<!-- Filter Buttons -->
				<div class="portfolio-filter-container margin-top-20">
					<ul class="portfolio-filter">
						<li class="portfolio-filter-label label label-warning"
							style="margin-left: 3%;"><i class="fa fa-filter"> Lọc
								theo:</i></li>
						<li style="margin-left: 1%"><form role="form"
								class="form-inline"
								action="${pageContext.request.contextPath}/tourlist"
								method="GET">
								<select id="filterPrice" class="form-control" name="filterPrice"
									onchange="this.form.submit()">
									<c:if test="${filterPrice != null}">
										<c:if test="${filterPrice eq 'All'}">
											<option value="All">Tất cả</option>
										</c:if>
										<c:if test="${filterPrice eq '5'}">
											<option value="5">Dưới 500 ngàn</option>
										</c:if>
										<c:if test="${filterPrice eq '10'}">
											<option value="10">Từ 500 - 1 triệu</option>
										</c:if>
										<c:if test="${filterPrice eq '20'}">
											<option value="20">Từ 1 triệu - 2 triệu</option>
										</c:if>
										<c:if test="${filterPrice eq '30'}">
											<option value="30">Trên 2 triệu</option>
										</c:if>
										<c:forTokens items="All,5,10,20,30" delims="," var="j">
											<c:if test="${j ne filterPrice}">
												<c:if test="${j eq 'All'}">
													<option value="All">Tất cả</option>
												</c:if>
												<c:if test="${j eq '5'}">
													<option value="5">Dưới 500 ngàn</option>
												</c:if>
												<c:if test="${j eq '10'}">
													<option value="10">Từ 500 - 1 triệu</option>
												</c:if>
												<c:if test="${j eq '20'}">
													<option value="20">Từ 1 triệu - 2 triệu</option>
												</c:if>
												<c:if test="${j eq '30'}">
													<option value="30">Trên 2 triệu</option>
												</c:if>
											</c:if>
										</c:forTokens>
									</c:if>
									<c:if test="${filterPrice == null}">
										<option selected="selected" disabled="disabled">Giá
											Vé</option>
										<option value="All">Tất cả</option>
										<option value="5">Dưới 500 ngàn</option>
										<option value="10">Từ 500 - 1 triệu</option>
										<option value="20">Từ 1 triệu - 2 triệu</option>
										<option value="30">Trên 2 triệu</option>
									</c:if>
								</select>
							</form></li>
						<li style="margin-left: 1%"><form role="form"
								class="form-inline"
								action="${pageContext.request.contextPath}/tourlist"
								method="GET">
								<select id="filterSale" class="form-control" name="filterSale"
									onchange="this.form.submit()">
									<c:if test="${filterSale != null && filterSale ne 'All'}">
										<option value="${filterSale}">${filterSale}%</option>
										<option value="All">Tất cả</option>
										<c:forTokens items="10,20,30,50" delims="," var="j">
											<c:if test="${j ne filterSale}">
												<option value="${j}">${j}%</option>
											</c:if>
										</c:forTokens>
									</c:if>
									<c:if test="${filterSale != null && filterSale eq 'All'}">
										<option value="All">Tất cả</option>
										<c:forTokens items="10,20,30,50" delims="," var="j">
											<option value="${j}">${j}%</option>
										</c:forTokens>
									</c:if>
									<c:if test="${filterSale == null}">
										<option selected="selected" disabled="disabled">Giảm
											Giá</option>
										<option value="All">Tất cả</option>
										<option value="10">10%</option>
										<option value="20">20%</option>
										<option value="30">30%</option>
										<option value="40">40%</option>
										<option value="50">50%</option>
									</c:if>
								</select>
							</form></li>
					</ul>
				</div>
				<br>
				<!-- End Filter Buttons -->
				<!-- Choose Number For Display -->
				<div class="row">
					<form role="form" class="form-inline" action="tourlist"
						method="get">
						<label for="selectTour" style="text-align: left; margin-left: 83%">Số
							tour/ trang:</label> <select id="selectTour" name="numOn"
							onchange="this.form.submit()">
							<option>5</option>
							<option>10</option>
							<option>15</option>
						</select>
					</form>
				</div>
				<br />
				<!-- End Choose Number For Display -->
				<!-- Table -->
				<c:if test="${empty showTourList}">
					<h1 style="text-align: center;">Không có tour nào!</h1>
				</c:if>
				<c:if test="${!empty showTourList}">
					<table style="font-size: 13px;">
						<thead>
							<tr>
								<th>STT</th>
								<th>Tên tour</th>
								<th>Ngày đi</th>
								<th>Giờ đi</th>
								<th>Ngày về</th>
								<th>Giờ về</th>
								<th>Số chỗ còn</th>
								<th></th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${showTourList.subList(x,y)}" var="tour">
								<!-- use subList render list tour to display -->
								<tr>
									<td>${showTourList.indexOf(tour) + 1}</td>
									<td>${tour.name}</td>
									<td><fmt:formatDate value="${tour.departureDate}"
											pattern="dd/MM/yyyy" /></td>
									<td>${tour.departureTime}</td>
									<td><fmt:formatDate value="${tour.returnDate}"
											pattern="dd/MM/yyyy" /></td>
									<td>${tour.returnTime}</td>
									<td>${tour.ticketAvailability}</td>
									<td><a href="<c:url value='viewdetail/${tour.idTour}'/>">
											<button class="btn btn-xs btn-success">
												<i class="fa fa-eye">&nbsp;Xem</i>
											</button>
									</a><a href="<c:url value='booktour/${tour.idTour}'/>"><button
												class="btn btn-xs btn-danger">
												<i class="fa fa-edit">&nbsp;Đăng Ký</i>
											</button></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</c:if>
				<!-- End Table -->
				<hr class="margin-vert-50">
				<div class="text-center">
					<!-- Pagination -->
					<c:if test="${numTour > numOnPage}">
						<!-- Paging when number of element > number of tour -->
						<!-- set active pagination when numTour >= 5 -->
						<ul class="pagination">
							<c:if test="${param.page != null}">
								<c:if test="${param.page == 1}">
									<li class="disabled"></li>
								</c:if>
								<c:if test="${param.page > 1 }">
									<li><a
										href="${pageContext.request.contextPath }/tourlist?page=${param.page -1}">&laquo;</a>
									</li>
								</c:if>
							</c:if>
							<c:forEach items="${pageNum}" var="pageE">
								<c:if test="${pageE == page}">
									<li class="active"><a
										href="${pageContext.request.contextPath}/tourlist?page=${pageE}">${pageE}</a></li>
								</c:if>
								<c:if test="${pageE != page}">
									<li><a
										href="${pageContext.request.contextPath}/tourlist?page=${pageE}">${pageE}</a></li>
								</c:if>
							</c:forEach>
							<c:if test="${numTour/numOnPage - param.page == 0}">
								<li class="disabled"><a
									href="${pageContext.request.contextPath }/tourlist?page=${param.page + 1}">&raquo;</a>
								</li>
							</c:if>
							<c:if test="${numTour/numOnPage - param.page > 0}">
								<li><a
									href="${pageContext.request.contextPath }/tourlist?page=${page + 1}">&raquo;</a>
								</li>
							</c:if>
						</ul>
					</c:if>
				</div>
				<!-- End Pagination -->
			</div>
		</div>
	</div>
</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<%@ include file="userfooter.jsp"%>
<!-- === END FOOTER === -->