<%@page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="adminheader.jsp"%>
<!-- === BEGIN CONTENT === -->
<div id="content">
	<div class="container background-white">
		<div class="container">
			<div class="row margin-vert-40">
				<!-- Create Export Box -->
				<div class="col-md-6 col-md-offset-3 col-sm-offset-3">
					<s:form class="signup-page" action="processExcel" commandName="importData"
						enctype="multipart/form-data" method="POST">
						<div class="signup-header">
							<div class="text-center">
								<h2>Quản lý Import</h2>
							</div>
						</div>
						<div class="row">
						<div class="col-lg-12 col-sm-12">
							<small style="color:red">${formatError}</small>
							<small style="color:red">${failedSize}</small>
							<br />
							<label>Chọn tệp</label>
							<div class="input-group">
								<label class="input-group-btn"> <span
									class="btn btn-primary"> Tập tin&hellip; <input
										type="file" name="file" style="display: none;" multiple>
								</span>
								</label> <input type="text" class="form-control" readonly>
							</div>
						</div>
						</div>
						<br />
							<div class="row">
								<div class="col-sm-7">
									<label>Loại Import</label> <br />
									<div class="input-group margin-bottom-20">
										<span class="input-group-addon"> <i class="fa fa-exchange"></i>
										</span> <select class="form-control margin-bottom-20"
											name="listType">
											<option>Danh sách tour</option>
											<option>Danh sách người dùng</option>
											<option>Danh sách admin uri</option>
										</select>
									</div>
								</div>
								<div class="col-sm-5">
									<label>Loại File</label> <br />
									<div class="input-group margin-bottom-20">
										<span class="input-group-addon"> <i class="fa fa-folder-open"></i>
										</span> <s:select class="form-control margin-bottom-20"
											name="exportType" path="fileType">
											<option>Excel</option>
											<option>Xml</option>
										</s:select>
									</div>
								</div>
							</div>
							<hr class="margin-bottom-20">
							<div class="row">
								<div class="col-lg-6 text-center">
									<button class="btn btn-primary" type="submit">Xác Nhận</button>
								</div>
								<div class="col-lg-6 text-center">
									<a href="managetour"><button class="btn btn-primary"
											type="button">Hủy Bỏ</button></a>
								</div>
							</div>
					</s:form>
				</div>
				<!-- End Export Box -->
			</div>
		</div>
	</div>
</div>
<!-- === END CONTENT === -->
<%@ include file="adminfooter.jsp"%>