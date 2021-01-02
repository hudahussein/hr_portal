<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Hr_home.aspx.cs"  Inherits="_Hr_home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<style>
		.static-img{
			height: 300px;
			overflow: hidden;
			
		}
		.static-img img{
			height: 100%;
			object-fit: cover;
			
		}
		.calendar {
			display: grid;
			width: 90%;
			margin: auto;
			grid-template-columns: repeat(7, minmax(40px, 1fr));
			grid-template-rows: 40px;
			grid-auto-rows: 40px;
			overflow: auto;
		}
		.calendar-container {
			width: 90%;
			margin: auto;
			overflow: hidden;
			border-radius: 10px;
			background: #fff;
			max-width: 500px;
		}
		.day {
			border-bottom: 1px solid rgba(166, 168, 179, 0.5);
			border-right: 1px solid rgba(166, 168, 179, 0.5);
			text-align: right;
			padding: 14px 20px;
			letter-spacing: 1px;
			font-size: 14px;
			box-sizing: border-box;
			position: relative;
			pointer-events: none;
			z-index: 1;
		}
		.day.today {background-color:#0092ff;
			color:#fff;}
		.day:nth-of-type(7n + 7) {
			border-right: 0;
		}
		.day:nth-of-type(n + 1):nth-of-type(-n + 7) {
			grid-row: 2;
		}
		.day:nth-of-type(n + 8):nth-of-type(-n + 14) {
			grid-row: 3;
		}
		.day:nth-of-type(n + 15):nth-of-type(-n + 21) {
			grid-row: 4;
		}
		.day:nth-of-type(n + 22):nth-of-type(-n + 28) {
			grid-row: 5;
		}
		.day:nth-of-type(n + 29):nth-of-type(-n + 35) {
			grid-row: 6;
		}
		.day:nth-of-type(7n + 1) {
			grid-column: 1/1;
		}
		.day:nth-of-type(7n + 2) {
			grid-column: 2/2;
		}
		.day:nth-of-type(7n + 3) {
			grid-column: 3/3;
		}
		.day:nth-of-type(7n + 4) {
			grid-column: 4/4;
		}
		.day:nth-of-type(7n + 5) {
			grid-column: 5/5;
		}
		.day:nth-of-type(7n + 6) {
			grid-column: 6/6;
		}
		.day:nth-of-type(7n + 7) {
			grid-column: 7/7;
		}
		.day-name {
			font-size: 16px;
			text-transform: uppercase;
			color: #0092ff;
			text-align: center;
			border-bottom: 1px solid rgba(166, 168, 179, 0.5);
			line-height: 50px;
			font-weight: 500;
		}
	</style>

	<div class='Courses internal-page' id='Hr_home'>

		<h1>
			<img src='../layout/img/course.png' alt='courses'/>
			Welcome to HR home page
		</h1>

		<div class="custom-form">
			<div class="cu-container">

				<!-- Page Wrapper -->
				<div id="wrapper">
					<!-- Content Wrapper -->
					<div id="content-wrapper" class="d-flex flex-column">
						<!-- Main Content -->
						<div id="content">

							<!-- Begin Page Content -->
							<div class="container-fluid">
								<!-- Content Row -->
								<div class="row bg-info w-100 m-auto pt-4 shadow">
									<!-- Earnings (Monthly) Card Example -->
									<div class="col-xl-3 col-md-6 mb-4">
										<div class="card border-left-primary shadow h-100 py-2">
											<div class="card-body">
												<div class="row no-gutters align-items-center">
													<div class="col mr-2">
														<div class="text-xs font-weight-bold text-primary text-uppercase mb-1">Vacation Requestes</div>
														<div class="h5 mb-0 font-weight-bold text-gray-800">10 request</div>
													</div>
													<div class="col-auto">
														<i class="fa fa-calendar fa-2x text-gray-300"></i>
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- Earnings (Monthly) Card Example -->
									<div class="col-xl-3 col-md-6 mb-4">
										<div class="card border-left-success shadow h-100 py-2">
											<div class="card-body">
												<div class="row no-gutters align-items-center">
													<div class="col mr-2">
														<div class="text-xs font-weight-bold text-success text-uppercase mb-1">Runing Courses</div>
														<div class="h5 mb-0 font-weight-bold text-gray-800">10 courses</div>
													</div>
													<div class="col-auto">
														<i class="fa fa-dollar-sign fa-2x text-gray-300"></i>
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- Earnings (Monthly) Card Example -->
									<div class="col-xl-3 col-md-6 mb-4">
										<div class="card border-left-info shadow h-100 py-2">
											<div class="card-body">
												<div class="row no-gutters align-items-center">
													<div class="col mr-2">
														<div class="text-xs font-weight-bold text-danger text-uppercase mb-1">Tasks</div>
														<div class="row no-gutters align-items-center">
															<div class="col-auto">
																<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">50%</div>
															</div>
															<div class="col">
																<div class="progress progress-sm mr-2">
																	<div class="progress-bar bg-danger" role="progressbar" style="width: 50%" aria-valuenow="50" aria-valuemin="0" aria-valuemax="100"></div>
																</div>
															</div>
														</div>
													</div>
													<div class="col-auto">
														<i class="fa fa-clipboard-list fa-2x text-gray-300"></i>
													</div>
												</div>
											</div>
										</div>
									</div>

									<!-- Pending Requests Card Example -->
									<div class="col-xl-3 col-md-6 mb-4">
										<div class="card border-left-warning shadow h-100 py-2">
											<div class="card-body">
												<div class="row no-gutters align-items-center">
													<div class="col mr-2">
														<div class="text-xs font-weight-bold text-warning text-uppercase mb-1">Training Requests</div>
														<div class="h5 mb-0 font-weight-bold text-gray-800">18 requests</div>
													</div>
													<div class="col-auto">
														<i class="fa fa-graduation-cap fa-2x text-gray-300" aria-hidden="true"></i>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								
								<div class="row card w-100 ml-auto mr-auto mt-4 static-img shadow">
									<img src='../layout/img/hrPortal.jpg' alt='portal'/>
								</div>

								<!-- Content Row -->

								<div class="row  mt-4">

									<!-- Area Chart -->
									<div class="col-xl-8 col-lg-7">
										<div class="card shadow">
											<!-- Card Header - Dropdown -->
											<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
												<h6 class="m-0 font-weight-bold text-primary">News</h6>
												<div class="dropdown no-arrow">
													<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
														<i class="fa fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
													</a>
													<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
														<a class="dropdown-item" href="#">details</a>
													</div>
												</div>
											</div>
											<!-- Card Body -->
											<div class="card-body">
												<i class="fa fa-circle text-danger"></i>
												Our integrated management system enables a continuous improvement and assessment process of all important structures
												<br>
												<i class="fa fa-circle text-success"></i>
												Policy management is an essential part of any large organization, as it sets a standard on 
												how the business.
												<br>
												<i class="fa fa-circle text-info"></i>
												Policy management, by definition, is the creation, organization, approval, and dissemination 
												of policy.
												<div class="text-center small mt-3">
													<span class="mr-2">
														<i class="fa fa-circle text-danger"></i> Important
													</span>
													<span class="mr-2">
														<i class="fa fa-circle text-success"></i> Pendding
													</span>
													<span class="mr-2">
														<i class="fa fa-circle text-info"></i> Referral
													</span>
												</div>
											</div>
										</div>
									</div>

									<!-- Pie Chart -->
									<div class="col-xl-4 col-lg-5">
										<div class="card shadow mb-4">
											<!-- Card Header - Dropdown -->
											<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
												<h6 class="m-0 font-weight-bold text-primary">Notification</h6>
												<div class="dropdown no-arrow">
													<a class="dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
														<i class="fa fa-ellipsis-v fa-sm fa-fw text-gray-400"></i>
													</a>
													<div class="dropdown-menu dropdown-menu-right shadow animated--fade-in" aria-labelledby="dropdownMenuLink">
														<a class="dropdown-item" href="#">details</a>
													</div>
												</div>
											</div>
											<!-- Card Body -->
											<div class="card-body">
												<i class="fa fa-circle text-danger"></i>
												Our integrated management system enables
												<br>
												<i class="fa fa-circle text-success"></i>
												Policy management is an essential part
												<br>
												<i class="fa fa-circle text-info"></i>
												Policy management, by definition, is the creation.
												<div class="text-center small mt-3">
													<span class="mr-2">
														<i class="fa fa-circle text-danger"></i> Important
													</span>
													<span class="mr-2">
														<i class="fa fa-circle text-success"></i> Pendding
													</span>
													<span class="mr-2">
														<i class="fa fa-circle text-info"></i> Referral
													</span>
												</div>
											</div>
										</div>
									</div>
								</div>

								<!-- Content Row -->
								<div class="row">

									<!-- Content Column -->
									<div class="col-lg-6 mb-4">

										<!-- Project Card Example -->
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-0 font-weight-bold text-primary">Projects</h6>
											</div>
											<div class="card-body">
												<h4 class="small font-weight-bold">Server Migration <span class="float-right">20%</span></h4>
												<div class="progress mb-4">
													<div class="progress-bar bg-danger" role="progressbar" style="width: 20%" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
												<h4 class="small font-weight-bold">Sales Tracking <span class="float-right">40%</span></h4>
												<div class="progress mb-4">
													<div class="progress-bar bg-warning" role="progressbar" style="width: 40%" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
												<h4 class="small font-weight-bold">Customer Database <span class="float-right">60%</span></h4>
												<div class="progress mb-4">
													<div class="progress-bar" role="progressbar" style="width: 60%" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
												<h4 class="small font-weight-bold">Payout Details <span class="float-right">80%</span></h4>
												<div class="progress mb-4">
													<div class="progress-bar bg-info" role="progressbar" style="width: 80%" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
												<h4 class="small font-weight-bold">Account Setup <span class="float-right">Complete!</span></h4>
												<div class="progress">
													<div class="progress-bar bg-success" role="progressbar" style="width: 100%" aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
												</div>
											</div>
										</div>

										<!-- Color System -->
										<div class="row">
											<a class="col-lg-6 mb-4">
												<div class="card bg-primary text-white shadow">
													<div class="card-body">
														Benefits
													</div>
												</div>
											</a>
											<a class="col-lg-6 mb-4">
												<div class="card bg-success text-white shadow">
													<div class="card-body">
														Performance
													</div>
												</div>
											</a>
											<a class="col-lg-6 mb-4">
												<div class="card bg-info text-white shadow">
													<div class="card-body">
														Self services
													</div>
												</div>
											</a>
											<a class="col-lg-6 mb-4">
												<div class="card bg-warning text-white shadow">
													<div class="card-body">
														Payroll
													</div>
												</div>
											</a>
											<a class="col-lg-6 mb-4">
												<div class="card bg-danger text-white shadow">
													<div class="card-body">
														Documents
													</div>
												</div>
											</a>
											<a class="col-lg-6 mb-4">
												<div class="card bg-secondary text-white shadow">
													<div class="card-body">
														New Hiring
													</div>
												</div>
											</a>
										</div>

									</div>

									<div class="col-lg-6 mb-4">

										<!-- Illustrations -->
										<div class="card shadow mb-4">
											<div class="card-header py-3">
												<h6 class="m-0 font-weight-bold text-primary">Management Policy</h6>
											</div>
											<div class="card-body">
												<p>Policy management is the process of creating, communicating, and maintaining policies and procedures within an organization. 
													An effective policy management system can mitigate risk in two ways. First, it makes policies more quickly
													accessible to direct care staff, guiding care and safety decisions
												</p>
											</div>
										</div>

										<!-- Events -->
										<div class="card shadow mb-4" style="height:62%">
											<div class="card-header py-3">
												<h6 class="m-0 font-weight-bold text-primary">Important Events</h6>
											</div>
											<div class="card-body">
												<div id='app'>
													<div class="calendar-container">
														 <div class="form-group">
															 <label for="exampleFormControlSelect1">Select mounth</label>
															 <select class="form-control" id="exampleFormControlSelect1">
																 <option>january</option>
																 <option>february</option>
																 <option>march</option>
																 <option>april</option>
																 <option>may</option>
																 <option>june</option>
																 <option>july</option>
																 <option>august</option>
																 <option>september</option>
																 <option>october</option>
																 <option>november</option>
																 <option>december</option>
															 </select>
														</div>
														<div class="calendar">
															<span class="day-name" v-for='name in daysNames'>{{name}}</span>
															<div class='day' v-for='i in firstDay'></div>
															<div class="day" v-for='(day,x) in calendar' :class='x == today ?   "today" : ""'>
																{{day.split('-')[0]}}
															</div>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
							</div>
							<!-- /.container-fluid -->

						</div>
						<!-- End of Main Content -->
					</div>
					<!-- End of Content Wrapper -->

				</div>
				<!-- End of Page Wrapper -->

			</div>
		</div>

	</div>	

	<script src='../layout/vue-code/Hr_home.js'></script>
</asp:Content>