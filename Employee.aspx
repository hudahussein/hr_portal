<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Employee.aspx.cs"  Inherits="_Employee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<style>
		.calendar {
			display: grid;
			width: 100%;
			grid-template-columns: repeat(7, minmax(30px, 1fr));
			grid-template-rows: 60px;
		}
		.calendar-container {
			width: 100%;
			margin: auto;
			overflow: hidden;
			box-shadow: 0 2px 20px rgba(0, 0, 0, 0.1);
			border-radius: 5px;
			background: #fff;
		}
		.day {
			border-bottom: 1px solid rgba(166, 168, 179, 0.5);
			border-right: 1px solid rgba(166, 168, 179, 0.5);
			text-align: center;
			padding: 10px 5px;
			letter-spacing: 1px;
			font-size: 16px;
			box-sizing: border-box;
			position: relative;
			pointer-events: none;
			z-index: 5;
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
			text-align: center;
			border-bottom: 1px solid rgba(166, 168, 179, 0.5);
			line-height: 50px;
			font-weight: 500;
			padding: 5px 0;
		}
		.calendar-box .vacation {
			display: inline-block;
			width: 15px;
			height: 15px;
			border-radius: 50%;
		}
		.calendar-box .vacation.paid {
			background-color: #69e84a;
		}
		.calendar-box .vacation.unpaid {
			background-color: #f00;
		}
		.calendar-box .vacation .badge {
			position: absolute;
			bottom: 0;
			left: 7px;
			font-weight: normal;
			font-size: 10px;
		}
		.graph{
			height:300px;
			overflow-y: scroll;
		}

		a {
			background-color: transparent;
		}

		a:active,
		a:hover {
			outline: 0;
		}

		.col-xs-3 {
			float: left;
			width: 20%;
		}

		.col-xs-9 {
			width: 75%;
			float: left;
		}

		.clearfix:after {
			clear: both;
		}

		.clearfix:before,
		.clearfix:after {
			display: table;
			content: " ";
		}

		.panel {
			margin-bottom: 10px;
			background-color: #fff;
			border: 1px solid transparent;
			border-radius: 4px;
			-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
			box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
		}

		.panel-footer {
			padding: 10px 15px;
			background-color: #f5f5f5;
			border-top: 1px solid #ddd;
			border-bottom-right-radius: 3px;
			border-bottom-left-radius: 3px;
		}

		.panel-heading {
			height: 100px;
			background-color: turquoise;
			padding: 10px 15px;
			border-bottom: 1px solid transparent;
			border-top-left-radius: 3px;
			border-top-right-radius: 3px;
		}

		.panel-green {
			background: linear-gradient(90deg, rgba(135,95,190,1) 48%, rgba(88,73,187,1) 93%);
		}

		.panel-green .panel-heading {
			background: linear-gradient(90deg, rgba(135,95,190,1) 48%, rgba(88,73,187,1) 93%);

		}

		.panel-green .panel-footer span {
			background: linear-gradient(90deg, rgba(135,95,190,1) 48%, rgba(88,73,187,1) 93%);
		}

		.panel-primary .panel-footer span {
			background: linear-gradient(90deg, rgba(70,197,244,1) 48%, rgba(102,146,217,1) 93%);
		}

		.panel-red .panel-footer span {
			background: linear-gradient(90deg, rgba(236,72,135,1) 48%, rgba(189,82,160,1) 93%);
		}

		.panel-primary {
			border: 1px solid rgba(54, 90, 150);
		}

		.panel-primary .panel-heading {
			background: linear-gradient(90deg, rgba(70,197,244,1) 48%, rgba(102,146,217,1) 93%);
		}

		.panel-yellow .panel-footer span {
			background: linear-gradient(90deg, rgba(254,183,43,1) 48%, rgba(246,131,85,1) 93%);
		}

		.panel-yellow {
			background: linear-gradient(90deg, rgba(254,183,43,1) 48%, rgba(246,131,85,1) 93%);
		}

		.panel-yellow .panel-heading {
			background: linear-gradient(90deg, rgba(254,183,43,1) 48%, rgba(246,131,85,1) 93%);
		}

		.panel-red {
			background: linear-gradient(90deg, rgba(236,72,135,1) 48%, rgba(189,82,160,1) 93%);
		}

		.panel-red .panel-heading {
			background: linear-gradient(90deg, rgba(236,72,135,1) 48%, rgba(189,82,160,1) 93%);
		}

		.huge {
			font-size: 25px;
		}

		.panel-heading {
			color: #fff;
		}

		.pull-left {
			float: left !important;
		}

		.pull-right {
			float: right !important;
		}

		.text-right {
			text-align: right;
		}

		.under-number {
			font-size: 20px;
		}
	</style>

	<div class='Courses internal-page' id='Employee'>
		
		<div class="status-loader">
			<img src='../layout/img/load-gif.gif' alt="" />
		</div>
		
		<h1 class="text-secondary">
			<img src='../layout/img/course.png' alt='courses'/>
			Welcome to your dashboard <%:Session["admin"]%>
		</h1>

		<div class="custom-form">
			<div class="cu-container">

				<div class="shadow-sm rounded card pt-2 pb-2 bg-light m-auto" style="max-width: 95%;">
					<div class="container my-4">
						<div class="responsive1 text-center text-white row">
							<div v-for='type in vacationsTypes' class="col-lg-3 col-sm-6">
								<div class="panel-primary">
									<div class="panel-heading">
										<div class="row">
											<div class="col-xs-3">
												<i class="fa fa-file-text fa-3x ml-2"></i>
											</div>
											<div class="col-xs-9 text-right">
												<div class='huge'>{{vacationsType(type.Type_Name)}} Days</div>
												<div class="under-number">{{type.Type_Name}}</div>
											</div>
										</div>
									</div>
									<div class="panel-footer bg-white">
										<span class="pull-left blue pl-1 pr-1">View Details</span>
										<span class="pull-right blue pl-1 pr-1"><i class="fa fa-arrow-circle-right"></i></span>
										<div class="clearfix"></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- work requests -->
				<div class="shadow-sm rounded card pt-4 pb-4 bg-info ml-auto mr-auto mt-4 text-center text-white" style="max-width: 95%;">
					<div class="container">
						<div class="row">
							<div class="col-md-6">
								<h3>Work Requests Details</h3>
							</div>
							<div class="col-md-6">
								<a href="#" class="btn btn-light shadow-sm open-pop" data-pop-name="details-popup">Display Requests</a>
								<button class="btn btn-light shadow-sm ml-3"><a href="Work_Request.aspx">Make a request</a></button>
							</div>
						</div>
					</div>
				</div>

				<div class="rounded card pt-3 pb-3 bg-light ml-auto mr-auto mt-4  cu-form-group special" style="max-width: 95%;">
					<div class="container">
						<h4 class='mb-3'>Your Vacations</h4>
						<div class="resp-table bg-white" v-if='vacationsRequests.length > 0'>
							<table class='table table-striped table-bordered text-center shadow-sm shadow'>
								<thead>
									<tr>
										<th>#</th>
										<th>Type</th>
										<th>Status</th>
										<th>Controls</th>
									</tr>
								</thead>
							</table>
							<div class='scroll-box'>
								<table class='table table-striped table-bordered text-center shadow-sm shadow'>
									<tbody>
										<tr v-for='(request, i) in vacationsRequests'>
											<td scope="row">{{i + 1}}</td>
											<td>{{request.Vacation_Type_name ? request.Vacation_Type_name : request.Deduction_name}}</td>
											<td>
												<span v-if='request.Status == 1' class="text-primary">Pending</span>
												<span v-else-if='request.Status == 2' class="text-warning">Accepted From Manager</span>
												<span v-else-if='request.Status == 3' class="text-danger">Rejected From Manager</span>
												<span v-else-if='request.Status == 4' class="text-success">Accepted From HR</span>
												<span v-else-if='request.Status == 5' class="text-danger">Rejected From HR</span>
											</td>
											<td>
												<button class="btn btn-info shadow-sm open-pop" data-pop-name="v-details-popup" v-on:click.prevent="popUp(request,'detailsPop')">Details</button>
												<i class='fa fa-trash bg-danger p-2 rounded text-white'></i>
											</td>
										</tr>

									</tbody>
								</table>
							</div>

						</div>
						<div v-else class="card">
							<div class="card-body text-center">
								There is no vacation requests yet!
							</div>
						</div>
					</div>
				</div>


				<div class="pt-4 pb-4 ml-auto bg-light mr-auto cu-form-group special" style="max-width: 95%;">
					<div class="container">
						<div class="row align-items-center">
							<div class="col-lg-6">
								<div class='calendar-box'>
									<div class="form-group">
										<h4>Select Month</h4>
										<select class="form-control f-select" v-model='Month' @change='getMonths(Month,new Date().getFullYear())'>
											<option v-for='month in Months'
													:value='month.id'
													:selected='month.id == Month'>
												{{month.name}}
											</option>
										</select>
									</div>
									<div class="card mb-2 sec shadow">
										<div class="bg-secondary text-white text-center p-3">{{Month}}</div>

										<div class="calendar-container">
											<div class="calendar">
												<span class="day-name text-primary" v-for='name in daysNames'>{{name}}</span>
												<div class='day' v-for='i in firstDay'></div>
												<div class="day" v-for='(day,x) in calendar'
													 :class='x == today && Month == Months[(new Date).getMonth()].id ? "today" : ""'>
													{{day.split('-')[2]}}
													<span v-if='filterCalendar(day)' 
														  :class='filterCalendar(day)[0].Vacation_Type_id == 500 ? "vacation unpaid"  : "vacation paid"'>
														<span class="badge badge-dark">
															{{filterCalendar(day)[0].Vacation_Type_name ? filterCalendar(day)[0].Vacation_Type_name : filterCalendar(day)[0].Deduction_name}}
														</span>
													</span>
												</div>
											</div>
										</div>
									</div>

									<ul class='list-unstyled mt-3 p-3 rounded border border-secondary d-inline-block bg-white'>
										<li><span class='vacation paid'></span> Paid Vacation</li>
										<li><span class='vacation unpaid'></span> Unpaid Vacation</li>
									</ul>

								</div>
							</div>

							<div class="col-lg-6 graph">
								<div class="bg-white border shadow pt-3 pb-3">
									<canvas id="tasks-chart" height='250'></canvas>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- start details vacation popup -->

		<div v-if='vacRequest'>
			<div v-bind:class='vacRequest["detailsPop"] ? "v-details-popup popup active" : "v-details-popup popup"' v-if="vacRequest['detailsPop'] == true">
				<div class='popup-body mt-3' style="max-width: 1000px">

					<div class='custom-form m-auto pb-4' style="max-width: 800px">
						<div class="cu-container">
							<span class='close-pop'>Close</span>

							<div class="general info">

								<!-- about vacation -->	
								<div class='border shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'>
									<div class='row'>
										<!-- time off type -->
										<div class="cu-field col-md-6">
											<h3 class="cu-label">
												<label>Vacation Type :</label>
											</h3>
											<div class="cu-input text-box">
												<span class="fa fa-edit"></span>
												{{ vacRequest.Deduction_name }}
											</div>
										</div>

										<!-- Purpose of Time-Off -->
										<div class="cu-field col-md-6" v-if="vacRequest.Deduction_name.trim() == 'Paid'">
											<h3 class="cu-label">
												<label>Purpose of Vacation :</label>
											</h3>
											<div class="cu-input text-box">
												<span class="fa fa-edit"></span>
												{{ vacRequest.Vacation_Type_name }}
											</div>
										</div>

										<!-- Reason of the vacation-->
										<div class="cu-field col-md-6" v-if="vacRequest.Deduction_name.trim() == 'Unpaid'">
											<h3 class="cu-label">
												<label>Reason Of The Vacation :</label>
											</h3>
											<div class="cu-input text-box">
												<span class="fa fa-edit"></span>
												{{ vacRequest.Vacation_Type_Others }}
											</div>
										</div>
									</div>
								</div>
								
								<!-- about vacation -->	
								<div class='border shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'>
									<h3>Delegated To</h3>
									<div class='row'>
										<!-- delegated to-->
										<div class="cu-field col-md-6">
											<h3 class="cu-label">
												<label>Name :</label>
											</h3>
											<div class="cu-input text-box" style="max-width: 100%;">
												<span class="fa fa-edit"></span>
												{{ vacRequest.Delegation_EmpName }}
											</div>
										</div>
										
										<div class="cu-field col-md-6">
											<h3 class="cu-label">
												<label>ID :</label>
											</h3>
											<div class="cu-input text-box" style="max-width: 100%;">
												<span class="fa fa-edit"></span>
												{{ vacRequest.Delegation_EmpCode }}
											</div>
										</div>
									</div>
								</div>

								<!-- vacation dates -->	
								<div class='border shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'>
									<div class='row'>

										<!-- Start Date -->
										<div class="cu-field col-md-12" v-show="vacationsPeriods.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length > 0">
											<h3 class="cu-label">
												<label>Requested dates :</label>
											</h3>
											<div class="cu-input text-box" style="max-width: 100%;">
												<span class="fa fa-edit"></span>
												{{vacationsPeriods.filter(x => x.Request_id == vacRequest.id).map(x => x.Date_from).join().replace(/,/g, "  ,  ")}}
											</div>
										</div>

										<div class="cu-field col-md-6" v-show="vacationsPeriods.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length == 0">
											<h3 class="cu-label">
												<label>Start Date :</label>
											</h3>
											<div class="cu-input text-box">
												<span class="fa fa-edit"></span>
												{{ vacationsPeriods.filter(x => x.Request_id == vacRequest.id)[0].Date_from }}
											</div>
										</div>

										<!-- End Date -->
										<div class="cu-field col-md-6 d-none" v-show="vacationsPeriods.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length > 0">
											<h3 class="cu-label">
												<label>End Date :</label>
											</h3>
											<div class="cu-input text-box">
												<span class="fa fa-edit"></span>
												{{ vacationsPeriods.filter(x => x.Request_id == vacRequest.id)[0].Date_to }}
											</div>
										</div>
										<div class="cu-field col-md-6" v-show="vacationsPeriods.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length == 0">
											<h3 class="cu-label">
												<label>End Date :</label>
											</h3>
											<div class="cu-input text-box">
												<span class="fa fa-edit"></span>
												{{ vacationsPeriods.filter(x => x.Request_id == vacRequest.id)[0].Date_to }}
											</div>
										</div>

										<!-- Vacation Days -->
										<div class="cu-field col-md-6" v-show="vacationsPeriods.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length > 0">
											<h3 class="cu-label">
												<label>Vacation Days :</label>
											</h3>
											<div class="cu-input text-box">
												<span class="fa fa-edit"></span>
												{{ vacationsPeriods.filter(x => x.Request_id == vacRequest.id).length }} days
											</div>
										</div>
										<div class="cu-field col-md-6" v-show="vacationsPeriods.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length == 0">
											<h3 class="cu-label">
												<label>Vacation Days :</label>
											</h3>
											<div class="cu-input text-box">
												<span class="fa fa-edit"></span>
												{{ vacRequest.Total_Days }} days
											</div>
										</div>
										<!-- Request Date -->
										<div class="cu-field col-md-6">
											<h3 class="cu-label">
												<label>The Date Of The Request :</label>
											</h3>
											<div class="cu-input text-box">
												<span class="fa fa-edit"></span>
												{{ vacRequest.Entry_date.split("T")[0] }}
											</div>
										</div>
									</div>
								</div>

								<!-- Emergency cases -->	
								<div class='border shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'>
									<div class='row'>
										<div class="cu-field col-md-12">
											<h3 class="cu-label">
												<label>In case of emergency, We can we cotact you by :</label>
											</h3>
											<div class="cu-input text-box" style="max-width: 100%;">
												<span class="fa fa-edit"></span>
												{{ vacRequest.Emergency_Contact }}
											</div>
										</div>													
									</div>
								</div>

								<!-- Attached File -->	
								<div class='border shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'>
									<div class='row'>
										<div class="cu-field col-md-12">
											<h3 class="cu-label">
												<label>Attached File :</label>
											</h3>
											<div class="cu-input text-box" style="max-width: 100%;">
												<span class="fa fa-edit"></span>
												{{ vacRequest.Attach_File }}
											</div>
										</div>													
									</div>
								</div>

								<!-- requester comment -->	
								<div class='border shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'>
									<div class='row'>
										<div class="cu-field col-md-12">
											<h3 class="cu-label">
												<label>Requester Comment :</label>
											</h3>
											<div class="cu-input text-box" style="max-width: 100%;">
												<span class="fa fa-edit"></span>
												{{ vacRequest.Requester_Comment }}
											</div>
										</div>													
									</div>
								</div>
							</div>

						</div>   
					</div>
				</div>   
			</div>
		</div>
		<!-- end details vacation popup -->

		<!-- start details work request popup in new box -->
		<div class="details-popup popup">
			<div class='popup-body' style="max-width: 1000px">
				<div class='container custom-form mr-auto ml-auto mt-5 pb-4' style="max-width: 900px">
					<div class="cu-container">
						<span class='close-pop'>Close</span>
						<div class="card-body" >
							<div id="request-details" class="general info tabcontent active overflow-auto" style="max-height:500px">
								<div class='cu-form-group special shadow-sm grouped rounded mb-3 bg-light'>
									<div class='row' v-if='WorkRequests.length > 0'>
										<div class="text-secondary ml-5">Work Requests Details</div>

										<table class="table table-bordered text-center shadow-sm table-striped mt-2 ml-auto mr-auto" style="width: 90%">
											<thead class="bg-info text-white">
												<tr>
													<th scope="col">#</th>
													<th scope="col">Date</th>
													<th scope="col">Status</th>
													<th scope="col">Expiration Date</th>
												</tr>
											</thead>
											<tbody class="bg-white">
												<tr v-for="(request, i) in WorkRequests">
													<th>{{ i + 1 }}</th>
													<th>{{ request.Date_From }}</th>
													<th><span v-if="request.Status == 1" class="text-primary">requested</span>
														<span v-else-if="request.Status == 2" class="text-success">Accepted from manger</span>
														<span v-else-if="request.Status == 3" class="text-warning">Rejected from manger</span>
														<span v-else-if="request.Status == 4" class="text-success">Accepted from HR</span>
														<span v-else-if="request.Status == 5" class="text-danger">Rejected from HR</span>
														<span v-else-if="request.Status == 6" class="text-primary">Pending day off request</span>
														<span v-else-if="request.Status == 7" class="text-warning">Day off request accepted from manger</span>
														<span v-else-if="request.Status == 8" class="text-success">Day off request accepted from hr</span>
													</th>
													<th v-if='request.ExpirationDate.trim() != ""'>
														{{new Date(request.ExpirationDate.trim()).toISOString().substr(0,10)}}
													</th>
												</tr>
											</tbody>
										</table>

									</div>
									
									<div v-else class="card">
										<div class="card-body text-center">
											There is no work requests yet!
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>   
				</div>
			</div>   
		</div>
		<!-- end details popup -->


	</div>

	<script src='../layout/vue-code/Employee.js'></script>
</asp:Content>