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
			<div class="error-404-page text-center" style="margin-left: 650px;">
				<form class="form-search search-404">
					<div class="input-append">
						<input type="text" class="span2 search-query"
							placeholder="Nhập điện thoại/ email" name="valueSearch">
						<button type="submit" class="btn btn-primary">Tìm Kiếm</button>
					</div>
				</form>
			</div>
			<!-- End Search Form -->
			<c:if test="${not empty registrationList}">
				<table>
					<thead>
						<tr>
							<th>Tên tour</th>
							<th>Họ tên</th>
							<th>Giới tính</th>
							<th>Số điện thoại</th>
							<th>Email</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${registrationList}" var="bookTour">
							<!-- use subList render list tour to display -->
							<tr>
								<td>${bookTour.tour.name}</td>
								<td>${bookTour.cusName}</td>
								<td>${bookTour.cusSex}</td>
								<td>${bookTour.cusPhone}</td>
								<td>${bookTour.cusEmail}</td>
								<td><a
									href="<c:url value='/booktourdetail/${bookTour.idBT}/${tour.idTour}'/>"><button
											class="btn btn-sm btn-violet">
											<i class="fa fa-eye">&nbsp;Xem</i>
										</button></a> <a
									href="<c:url value='/editbooktour/${bookTour.idBT}/${tour.idTour }'/>"><button
											class="btn btn-sm btn-success">
											<i class="fa fa-pencil">&nbsp;Sửa</i>
										</button></a> <c:if test="${tour.cancelOrNot}">
										<a href="<c:url value='/cancelbooktour/${bookTour.idBT}'/>"><button
												class="btn btn-sm btn-danger">
												<i class="fa fa-times">Hủy Đăng Ký</i>
											</button></a>
									</c:if></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</c:if>
			<c:if test="${empty registrationList}">
				<!-- Book Tour Box -->
				<div class="signup-header">
					<h2 style="text-align: center;">Thông Tin Đặt Vé</h2>
					<br>
				</div>
				<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
					<img alt="Web Counter" border="0"
						src="http://pumpernickelpixie.com/wp-content/uploads/2015/06/31.gif"
						width="500px" height="250px"
						style="display: block; margin-right: auto; margin-left: auto; text-align: center" /><br>
					<form role="form" class="signup-page"
						action="${pageContext.request.contextPath}/booktour/${idTour}"
						method="get">
						<div class="row">
							<div class="col-sm-8">
								<label for="selectTour" style="text-align: left;">Số
									lượng vé:</label>
							</div>
							<div class="col-sm-4">
								<select class="form-control margin-bottom-20" name="numTicket"
									id="main-select" onchange="this.form.submit()">
									<option value="${numOfTicket}">${numOfTicket}</option>
									<c:forEach var="j" begin="1" end="${tour.ticketAvailability}">
										<c:if test="${not (j == numOfTicket)}">
											<option value="${j}">${j}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
						</div>
					</form>
				</div>
				<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
					<s:form class="signup-page" commandName="cusData"
						action="${pageContext.request.contextPath}/booktour/${idTour}"
						method="POST">
						<c:forEach var="info" items="${cusData.info}" varStatus="status">
							<label>Thông tin người thứ <c:out
									value="${status.index + 1}: " /></label>
							<div class="row">
								<div class="col-sm-8">
									<label>Họ tên</label>
									<!-- Show error -->
									<c:if test="${info.validCusName == 1}">
										<p style="color: red;">Họ tên không được chứa chữ số!</p>
									</c:if>
									<c:if test="${info.validCusName == 2}">
										<p style="color: red;">Bạn phải nhập họ tên!</p>
									</c:if>
									<c:if test="${info.validCusName == 3}">
										<p style="color: red;">Họ tên phải ít nhất 4 ký tự và
											không vượt quá 40 ký tự!</p>
									</c:if>
									<div class="input-group margin-bottom-20">
										<span class="input-group-addon"> <i class="fa fa-font"></i>
										</span>
										<s:input name="name" id="singleStakesBox"
											placeholder="Nhập họ tên" class="form-control" type="text"
											path="info[${status.index}].cusName" />
									</div>
								</div>
								<div class="col-sm-4">
									<label>Giới tính</label>
									<div class="input-group margin-bottom-20">
										<span class="input-group-addon"> <i class="fa fa-male"></i>
										</span>
										<s:select class="form-control margin-bottom-20"
											path="info[${status.index}].cusSex">
											<option>Nam</option>
											<option>Nữ</option>
										</s:select>
									</div>
								</div>
							</div>
							<div class="row">
								<c:if test="${tour.fieldYearOfBirth}">
									<div class="col-sm-6">
										<label>Ngày sinh</label>
										<!-- Show error -->
										<c:if test="${info.validCusYearOfBirth == 1}">
											<p style="color: red;">Ngày sinh không được chứa ký tự!</p>
										</c:if>
										<c:if test="${info.validCusYearOfBirth == 2}">
											<p style="color: red;">Bạn phải nhập ngày sinh!</p>
										</c:if>
										<c:if test="${info.validCusYearOfBirth == 3}">
											<p style="color: red;">Ngày sinh phải có 10 ký tự!</p>
										</c:if>
										<div class="input-group margin-bottom-20">
											<span class="input-group-addon"> <i
												class="fa fa-calendar"></i>
											</span>
											<s:input placeholder="dd/mm/yyyy"
												class="form-control datefield" type="text"
												path="info[${status.index}].cusYearOfBirth" />
										</div>
									</div>
								</c:if>
								<c:if test="${status.index == 0}">
									<div class="col-sm-6">
										<label>Số điện thoại</label>
										<!-- Show error -->
										<c:if test="${info.validCusPhone == 1}">
											<p style="color: red;">Số điện thoại không được chứa ký
												tự!</p>
										</c:if>
										<c:if test="${info.validCusPhone == 2}">
											<p style="color: red;">Bạn phải nhập số điện thoại!</p>
										</c:if>
										<c:if test="${info.validCusPhone == 3}">
											<p style="color: red;">Số điện thoại phải ít nhất 10 ký
												tự và không vượt quá 15 ký tự!</p>
										</c:if>
										<div class="input-group margin-bottom-20">
											<span class="input-group-addon"> <i
												class="fa fa-mobile"></i>
											</span>
											<s:input placeholder="Nhập số điện thoại"
												class="form-control" type="text"
												path="info[${status.index}].cusPhone" />
										</div>
									</div>
							</div>
			</c:if>
			<s:input class="stakebox" id="stakebox" data-stake="stakebox"
				path="info[${status.index}].whoIsRegistered" hidden="true" />
			<c:if test="${status.index != 0}">
				<div class="col-sm-6">
					<label>Mối quan hệ</label>
					<!-- Show error -->
					<br> <small><s:errors
							path="info[${status.index}].relation" cssStyle="color:red;" /></small>
					<div class="input-group margin-bottom-20">
						<span class="input-group-addon"> <i class="fa fa-mobile"></i>
						</span>
						<s:select class="form-control margin-bottom-20"
							path="info[${status.index}].relation">
							<c:forEach items="${relationshipList}" var="relationship">
								<option>${relationship.name}</option>
							</c:forEach>
						</s:select>
					</div>
				</div>
		</div>
		<c:if test="${tour.fieldPhone}">
			<label>Số điện thoại</label>
			<!-- Show error -->
			<c:if test="${info.validCusPhone == 1}">
				<p style="color: red;">Số điện thoại không được chứa ký tự!</p>
			</c:if>
			<c:if test="${info.validCusPhone == 2}">
				<p style="color: red;">Bạn phải nhập số điện thoại!</p>
			</c:if>
			<c:if test="${info.validCusPhone == 3}">
				<p style="color: red;">Số điện thoại phải ít nhất 10 ký tự và
					không vượt quá 15 ký tự!</p>
			</c:if>
			<div class="input-group margin-bottom-20">
				<span class="input-group-addon"> <i class="fa fa-mobile"></i>
				</span>
				<s:input placeholder="Nhập số điện thoại" class="form-control"
					type="text" path="info[${status.index}].cusPhone" />
			</div>
		</c:if>
		</c:if>
		<c:if test="${tour.fieldIdCard}">
			<label>Số chứng minh nhân dân</label>
			<!-- Show error -->
			<br>
			<c:if test="${info.validCusIdCard == 1}">
				<p style="color: red;">Số chứng minh nhân dân không được chứa ký
					tự!</p>
			</c:if>
			<c:if test="${info.validCusIdCard == 2}">
				<p style="color: red;">Bạn phải nhập số chứng minh nhân dân!</p>
			</c:if>
			<c:if test="${info.validCusIdCard == 3}">
				<p style="color: red;">Số chứng minh nhân dân phải ít nhất 9 ký
					tự và không vượt quá 12 ký tự!</p>
			</c:if>
			<div class="input-group margin-bottom-20">
				<span class="input-group-addon"> <i class="fa fa-credit-card"></i>
				</span>
				<s:input placeholder="Nhập số chứng minh nhân dân"
					class="form-control" type="text"
					path="info[${status.index}].cusIdCard" />
			</div>
		</c:if>
		<c:if test="${status.index == 0}">
			<c:if test="${tour.fieldEmail}">
				<label>Email</label>
				<!-- Show error -->
				<br>
				<c:if test="${info.validCusEmail == 1}">
					<p style="color: red;">Bạn phải nhập email!</p>
				</c:if>
				<c:if test="${info.validCusEmail == 2}">
					<p style="color: red;">Email phải ít nhất 10 ký tự và không
						vượt quá 40 ký tự!</p>
				</c:if>
				<div class="input-group margin-bottom-20">
					<span class="input-group-addon"> <i class="fa fa-envelope"></i>
					</span>
					<s:input placeholder="Nhập email" class="form-control" type="text"
						path="info[${status.index}].cusEmail" />
				</div>
			</c:if>
			<c:if test="${tour.fieldAddress}">
				<label>Địa chỉ</label>
				<!-- Show error -->
				<c:if test="${info.validCusAddress == 2}">
					<p style="color: red;">Bạn phải nhập địa chỉ!</p>
				</c:if>
				<c:if test="${info.validCusAddress == 3}">
					<p style="color: red;">Địa chỉ phải ít nhất 6 ký tự và không
						vượt quá 100 ký tự!</p>
				</c:if>
				<div class="input-group margin-bottom-20">
					<span class="input-group-addon"> <i class="fa fa-home"></i>
					</span>
					<s:input placeholder="Nhập địa chỉ" class="form-control"
						type="text" path="info[${status.index}].cusAddress" />
				</div>
			</c:if>
		</c:if>
		<hr>
		</c:forEach>
		<!-- reCAPTCHA -->
		<p style="color: red;">${errorString}</p>
		<div style="margin-left: 37px;" class="g-recaptcha"
			data-sitekey="6Le28hQUAAAAAFKa2w76sfgp5ULrd4iIYJLwtxOd"></div>
		<br>
		<!-- End reCAPTCHA -->
		<div class="row">
			<div class="col-lg-6 text-center">
				<button class="btn btn-primary" type="submit">Đăng Ký</button>
			</div>
			<div class="col-lg-6 text-center">
				<a href="${pageContext.request.contextPath}/tourlist"><button
						class="btn btn-primary" type="button">Trở về</button></a>
			</div>
		</div>
		</s:form>
	</div>
	</c:if>
	<!-- End Book Tour Box -->
</div>
</div>
</div>
<!-- === END CONTENT === -->
<!-- === BEGIN FOOTER === -->
<%@ include file="userfooter.jsp"%>
<!-- === END FOOTER === -->