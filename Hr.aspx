<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Hr.aspx.cs"  Inherits="_Hr" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<style>
		.number-border{
			width: 30px;
			height: 30px;
			line-height: 27px;
			border: 2px solid #fff;
			border-radius: 50%;
			color: #fff;
			text-align: center;
		}
		.nav-tabs .nav-link.active .number-border{
			border: 2px solid #dc3545;
		}
		/* The sidepanel menu */
		.sidepanel {
			direction: ltr;
			position: relative;
			z-index: 11000;
			font-weight: 500;
			font-size: 12px;
			width: 47px;
			height: 100%;
			left: 93%;
			top: 44px;
			max-width: 85vw;
			transition: transform .6s;
			-webkit-perspective: 1000;
			-moz-perspective: 1000;
			-ms-perspective: 1000;
			perspective: 1000;

		}
		.opened{
			transform: translateX(-100%);

		}

		.sidepanel .panel-buttons {
			background-color: #ccc6c6 !important;

			border: 1px solid #efe9e9;
			cursor: pointer;
			z-index: 10002;
			box-shadow: -5px 0 15px -1px rgba(0,0,0,.05);

			border-top-left-radius: 6px;
			border-bottom-left-radius: 6px;
			transition: opacity .2s;
			padding: 5px 5px;
		}
		.sidepanel .panel-buttons .sub-menu {
			width: 0px;
			float: right;
			overflow: hidden;
			position: absolute;
			right: 41px;
			top: -15px;
			background-color: #fff;
		}
		.panel-open, .panel-docs, .panel-social, .panel-theme, .panel-others, .panel-buy, .panel-gdpr {
			width: 35px;
			height: 28px;
			position: relative;
			padding-bottom: 34px;
			box-shadow: 0 .5rem 1rem rgba(0,0,0,.15);
			border: 1px solid #eeecec;
			border-radius: 2px;
			background-color: #fff;
		}
		.dropbtn{
			height: 32px;
			color: darkgreen;	
		}
		.panel-buttons i {
			position: relative;
			top: 5px;
			left: 9px;
			color: #cd1d1d;
			font-size: 24px;
		}
		.sidepanel .panel-theme .item a {
			width: 162px;
			font-size: 20px;
			padding: 4px 10px;
			min-width: 160px;
		}

		.sidepanel ol {
			list-style-type: none;
			margin: 0 auto;
			padding: 0;
		}
		.sidepanel > ol {
			max-width: 1000px;
			padding: 0 2rem;
			display: flex;
		}
		.sidepanel > ol > .menu-item {
			flex: 1;
			padding: 0.75rem 0;
		}
		.sidepanel > ol > .menu-item:after {

			position: absolute;
			width: 4px;
			height: 4px;
			border-radius: 50%;
			bottom: 5px;
			left: calc(50% - 2px);
			background: #FECEAB;
			will-change: transform;
			transform: scale(0);
			transition: transform 0.2s ease;
		}
		.sidepanel > ol > .menu-item:hover:after {
			transform: scale(1);
		}

		.sidepanel .item a {
			display: block;
		}

		.sidepanel .item a .else {
			position: relative;
			font-size: 18px;

		}


		.sidepanel .panel-theme .item {
			min-width: 160px;
			border-radius: 5px;
			width: 267px;
			box-shadow: 0 .5rem 1rem rgba(0,0,0,.15);
			border: 1px solid #b7b3b3;
			display: flex;
			justify-content: space-between;
			margin-bottom: 3px;
		}

		.sidepanel .sub-menu .item span{
			font-size: 20px;
			border-radius: 6px;
			padding: 3px;
			margin: 2px;
			text-align: center;
			box-shadow: 0 .5rem 1rem rgba(0,0,0,.15);
			border: 1px solid #eeecec;
			background-color: #1ca963;
			color: #fff;	

		}
		/*	.sidepanel .sub-menu .item:nth-child(1) {
		animation-duration: 0.2s;
		animation-delay: 0s;
		}
		.sidepanel .sub-menu .item:nth-child(2) {
		animation-duration: 0.3s;
		animation-delay: 0.1s;
		}
		.sidepanel .sub-menu .item:nth-child(3) {
		animation-duration: 0.4s;
		animation-delay: 0.2s;
		}*/

		.menu-item{
			position: relative;
		}






		/* start manger*/
		.hr-portal .candidates-img img {
			max-width: 90px;
		}
		.hr-portal .candidates-list-desc {
			overflow: hidden;
		}

		.hr-portal .candidates-right-details {
			position: absolute;
			top: 0;
			right: 20px;
		}

		.hr-portal .candidates-item-desc {
			margin-left: 30px;
			width: 90%;
		}

		.hr-portal .list-grid-item {
			border: 1px solid #ececec;
			border-radius: 6px;
			-webkit-transition: all 0.5s;
			transition: all 0.5s;
		}

		.hr-portal .list-grid-item:hover {
			-webkit-box-shadow: 0 0 20px 0px rgba(47, 47, 47, 0.09);
			box-shadow: 0 0 20px 0px rgba(47, 47, 47, 0.09);
			-webkit-transition: all 0.5s;
			transition: all 0.5s;
			border-color: transparent;
		}
		.hr-portal .param {
			display: flex;
			margin-top: 7px;
		}
		.hr-portal .param dt{
			margin-right: 10px;
		}
		.hr-portal .param dd{
			margin-bottom: 0px;
		}
		@media (max-width: 991.98px) { 
			.sidepanel {
				left: 86%;
				top: 51px;
			}
			.hr-portal .fortab .tab-content{
				padding: 0 0 30px 0;
			}
			.hr-portal .candidates-img{
				text-align: center;
				display: flex;
				justify-content: center;
				float:none!important;
				margin-right:0!important;
			}
			.hr-portal .candidates-list-desc{
				text-align: center;

			}
			.hr-portal .param {
				display: flex;

				justify-content: center;
			}
			.hr-portal  .forleft, .hr-portal .forright{
				float:none!important;
			}

		}

		@media (max-width: 767.98px) { 
			.hr-portal .param.two{
				margin-top: -7px;
			}
		}

		@media (max-width: 575.98px) { 
			.hr-portal .param {

				justify-content: center;
			}
			.hr-portal .candidates-list-desc {

				text-align: center;
			}
			.hr-portal .candidates-img{
				display: flex;
				justify-content: center;
				margin-right: 0 !important;
				float:none!important;
			}
		}


		/* end manger*/
	</style>

	<div class='hr-portal internal-page' id='Hr'>
		<h1 class="text-secondary">
			<img src='../layout/img/course.png' alt='courses'/>
			Welcome to HR page
		</h1>

		<div class="custom-form vec-kinds fortab">
			<div class="cu-container">
				<div class="cu-form-group special shadow" style="max-width: 90%;">
					<!-- Page Content -->
					<div class="container">

						<ul class="row nav nav-tabs nav-justified mt-3 mb-3 mr-0 ml-0 w-100 p-3 shadow rounded text-center bg-secondary text-white header-title">
							<li class="col-md-4 nav-item">
								<a class="nav-link active" data-toggle="tab" href="#paid-vacation">Paid Vacation</a>
							</li>
							<li class="col-md-4 nav-item">
								<a class="nav-link" data-toggle="tab" href="#work-requests">Work Requests</a>
							</li>
							<li class="col-md-4 nav-item">
								<a class="nav-link" data-toggle="tab" href="#unpaid-vacation">Unpaid Vacation</a>
							</li>
						</ul>

						<div class="tab-content mr-0 mt-4 ml-0 w-100 pt-2 rounded bg-light fortab">
							<div class="tab-pane fade show active" id="paid-vacation" style="max-height: 600px">
								<div class="row">
									<div class="col-md-9 w-100 overflow-auto">
										<div class="tab-content flex-center ml-0 mr-0 mt-0 p-0 w-100 rounded shadow-sm">
											<!-- Vacations Types -->
											<div v-for="(vacation, i) in HR_Vacation_Type" 
												 :class="i == 0 ? 'row tab-pane fade show active p-3 overflow-auto bg-light' : 'row tab-pane fade p-3 overflow-auto bg-light'" 
												 :id="vacation.Type_Name.split(' ').join('')" 
												 style="max-height: 600px">
												<!--	<div id="mySidepanel" class="sidepanel">
<div class="panel-buttons">
<div class="panel-theme">
<div class="menu-item">
<div class="dropbtn"><i class="fa fa-angle-double-left" aria-hidden="true"></i>
</div>
<div class="sub-menu">
<div class="item">
<a href="#">Annual</a>
<span>234</span>
</div>
<div class="item">
<a href="#">Casual
</a>
<span>234</span>
</div>
<div class="item">
<a href="#">PH</a>
<span>234</span>
</div>
<div class="item">
<a href="#">Mariage</a>
<span>234</span>
</div>
<div class="item">
<a href="#">Working Injury</a>
<span>234</span>
</div>
<div class="item">
<a href="#">Military</a>
<span>234</span>
</div>
<div class="item">
<a href="#">Sick Leave</a>
<span>234</span>
</div>
<div class="item">
<a href="#">Death</a>
<span>234</span>
</div>
<div class="item">
<a href="#">OFFDayes
</a>
<span>234</span>
</div>
<div class="item">
<a href="#">Maternity</a>
<span>234</span>
</div>
</div>
</div>
</div>
</div>
</div>-->
												<div v-if="allVacRrq.filter(x => x.Vacation_Type_name.trim() == vacation.Type_Name).length > 0">
													<div class="card bg-white mb-3 p-4 rounded w-100 shadow-sm" v-for="request in (allVacRrq.filter(x => x.Vacation_Type_name.trim() == vacation.Type_Name))">
														<div class="row">
															<div class="col-md-12">
																<div class="candidates-img float-left mr-4">
																	<img src="../layout/img/person.jpg" alt="" class="img-fluid d-block rounded border border-secondary"></div>
																<div class="candidates-list-desc job-single-meta  pt-2">
																	<h4 class="mb-2 text-dark">{{ adminusersData.filter(x => x.Emp_id == request.Requester_id)[0].FullName }}</h4>
																	<div class="row">
																		<div class="col-md-12 col-lg-6">
																			<p class="text-muted f-15 mb-0"><i class="fa fa-user mr-2" aria-hidden="true"></i>
																				{{ adminusersData.filter(x => x.Emp_id == request.Requester_id)[0].Job_Description }}
																			</p>
																		</div>
																		<div class="col-md-12 col-lg-6">
																			<p class="f-15 mb-0">
																				<a href="" class="text-muted"><i class="fa fa-pencil mr-2" aria-hidden="true"></i>
																					<span>Department : </span><span class="text-success">
																					{{ adminusersData.filter(x => x.Emp_id == request.Requester_id)[0].Dept_name }}</span>
																				</a>
																			</p>
																		</div>
																	</div>
																	<div v-if="HR_Vacations_Period.filter(x => x.Request_id == request.id).length > 0">
																		<div class="row" 
																			 v-show="HR_Vacations_Period.filter(x => x.Request_id == request.id && x.Date_from == x.Date_to).length > 0">
																			<div class="col-md-12 ">
																				<div class="param param-inline">
																					<div class="text-info overflow-auto" style="max-height: 50px;">Requested Dates: 
																						<span class="text-secondary">
																							{{HR_Vacations_Period.filter(x => x.Request_id == request.id).map(x => x.Date_from)
																							.join().replace(/,/g, "  ,  ")}}
																						</span>
																					</div>	
																				</div>
																			</div>
																		</div>
																		<div class="row" 
																			 v-show="HR_Vacations_Period.filter(x => x.Request_id == request.id && x.Date_from == x.Date_to).length == 0">
																			<div class="col-md-12 col-lg-6">
																				<div class="param param-inline">
																					<span class="text-info"><i class="fa fa-calendar-o mr-2" aria-hidden="true"></i>Start date: 
																						<span class="text-secondary">
																							{{ HR_Vacations_Period.filter(x => x.Request_id == request.id)[0].Date_from }}
																						</span>
																					</span>	
																				</div>
																			</div>
																			<div class="col-md-12 col-lg-6">
																				<div class="param param-inline two">
																					<span class="text-info"><i class="fa fa-calendar-o mr-2" aria-hidden="true"></i>End date: 
																						<span class="text-secondary">
																							{{ HR_Vacations_Period.filter(x => x.Request_id == request.id)[0].Date_to }}
																						</span>
																					</span>
																				</div>
																			</div>
																		</div>
																	</div>

																	<div class="row mt-3">
																		<div class="col-md-12">
																			<div> 
																				<a href="#" @click.prevent="updateVacStatus(request.id, 4, request.Requester_id)"
																				   :class="([4,5].indexOf(request.Status) > -1 ? 'disabled ' : '') + 'btn btn-sm btn-success'">Approve</a>
																				<a href="#" @click.prevent="updateVacStatus(request.id, 5)" 
																				   :class="([4,5].indexOf(request.Status) > -1 ? 'disabled ' : '') + 'btn btn-sm btn-danger'">Reject</a>
																				<a href="#" class="btn btn-sm btn-info open-pop" data-pop-name="details-popup" 
																				   v-on:click.prevent="popUp(request,'detailsPop')">Details</a>
																			</div>
																		</div>
																	</div>
																	<hr>
																	<div class="row">
																		<div class="col-md-10">
																			<p class="text-muted mb-2 f-14 pull-left forleft">
																				<i class="fa fa-list mr-3" aria-hidden="true"></i>Request Status : 
																				<span v-if="request.Status == 2" class="text-success">Accepted from manger</span>
																				<span v-else-if="request.Status == 4" class="text-success">Accepted from HR</span>
																				<span v-else-if="request.Status == 5" class="text-danger">Rejected from HR</span> 
																			</p>
																		</div>
																		<div class="col-md-2">
																			<a href="#" class="pull-right forright">
																				<i class="fa fa-trash fa-lg btn text-danger" 
																				   aria-hidden="true"
																				   @click.prevent="deleteVacRequest(request.id, true, i)">
																				</i>
																			</a>
																		</div>
																	</div>
																</div>                                                
															</div>
														</div>
													</div>
												</div>
												<div v-else class="text-center bg-white pt-5 pb-5 shadow-sm">
													There is no requests for {{ vacation.Type_Name.split(' ').join('') }} vacations
												</div>
											</div>
										</div> 
									</div>
									<div class="col-md-3 overflow-auto">
										<ul class="w-100 m-0 p-0 nav nav-tabs flex-column">
											<li class="bg-secondary text-white mb-2 pt-2 pb-2" v-for="(vacation, i) in HR_Vacation_Type">
												<a :class="i == 0 ? 'nav-link align-middle active' : 'nav-link align-middle'" 
												   data-toggle="tab" 
												   :href="'#' + vacation.Type_Name.split(' ').join('')">{{ vacation.Type_Name }}
													<span class="bg-danger pull-right number-border" 
														  v-if='allVacRrq.filter(x => x.Vacation_Type_name.trim() == vacation.Type_Name).length > 0'>
														{{ allVacRrq.filter(x => x.Vacation_Type_name.trim() == vacation.Type_Name).length}}
													</span>
												</a>
											</li>
										</ul>
									</div>
								</div>
							</div>
							<div class="row tab-pane row fade p-3 overflow-auto bg-light" id="work-requests" role="tabpanel" aria-labelledby="profile-tab-md" style="max-height: 600px">
								<div v-if="WorkRequests.length > 0">
									<div class="card bg-white mb-3 p-4 rounded w-100 shadow-sm" v-for="request in WorkRequests">
										<div class="row">
											<div class="col-md-12">
												<div class="candidates-img float-left mr-4">
													<img src="../layout/img/person.jpg" alt="" class="img-fluid d-block rounded border border-secondary">
												</div>
												<div class="candidates-list-desc job-single-meta  pt-2">
													<h4 class="mb-2 text-dark">{{ adminusersData.filter(x => x.Emp_id == request.Emp_id)[0].FullName }}</h4>
													<div class="row">
														<div class="col-md-12 col-lg-6">
															<p class="text-muted f-15 mb-0"><i class="fa fa-user mr-2" aria-hidden="true"></i>
																{{ adminusersData.filter(x => x.Emp_id == request.Emp_id)[0].Job_Description }}
															</p>
														</div>
														<div class="col-md-12 col-lg-6">
															<p class="f-15 mb-0">
																<a href="" class="text-muted"><i class="fa fa-pencil mr-2" aria-hidden="true"></i>
																	<span>Department : </span><span class="text-success">{{ adminusersData.filter(x => x.Emp_id == request.Emp_id)[0].Dept_name }}</span>
																</a>
															</p>
														</div>
													</div>

													<div class="row">
														<div class="col-md-6">
															<div class="param param-inline">
																<div class="text-primary">Requested Date: <span class="text-secondary">{{request.Date_From}}</span></div>
															</div>
														</div>
														<div class="col-md-6">
															<div class="param param-inline">
																<p class="text-muted mb-2 f-14 pull-left text-danger forleft">Status : 
																	<span v-if="request.Status == 2" class="text-success">Accepted from manger</span>
																	<span v-else-if="request.Status == 4" class="text-success">Accepted from HR</span>
																	<span v-else-if="request.Status == 5" class="text-danger">Rejected from HR</span>
																	<span v-else-if="request.Status == 6" class="text-primary">Pending day off request</span>
																	<span v-else-if="request.Status == 7" class="text-success">Day off request accepted from manger</span>
																	<span v-else-if="request.Status == 8" class="text-success">Day off request accepted from hr</span>
																</p>
															</div>
														</div>
													</div>

													<div class="row mt-3">
														<div class="col-md-12">
															<div class=""> 
																<a href="#" @click.prevent="updateWorkStatus(request.id, 4, request.Emp_id, request.Date_To)"
																   :class="([4,5].indexOf(request.Status) > -1 ? 'disabled ' : '') + 'btn btn-sm btn-success'">Approve</a>
																<a href="#" @click.prevent="updateWorkStatus(request.id, 5)" 
																   :class="([4,5].indexOf(request.Status) > -1 ? 'disabled ' : '') + 'btn btn-sm btn-danger'">Reject</a>
															</div>
														</div>
													</div>


													<hr>
													<div class="row">
														<div class="col-md-6">
															<p class="text-muted mb-2 f-14 pull-left text-danger forleft ">
																<i class="fa fa-list mr-3" aria-hidden="true"></i>Employee Comment : <span>{{ request.Requester_Comment }}</span> </p>
														</div>
														<div class="col-md-6">
															<a href="#" class="pull-right">
																<i class="fa fa-trash fa-lg btn text-danger" 
																   aria-hidden="true"
																   @click.prevent="deleteWorkRequest(request.id, true, i)">
																</i>
															</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
								<div v-else class="text-center bg-white pt-5 pb-5 shadow-sm">There are no work requests</div>
							</div>
							<div class="row tab-pane row fade p-3 overflow-auto bg-light" id="unpaid-vacation" role="tabpanel" aria-labelledby="contact-tab-md" style="max-height: 600px">
								<div v-if="Unpaid.length > 0">
									<div class="card bg-white mb-3 p-4 rounded w-100 shadow-sm" v-for="request in allVacRrq.filter(x => x.Deduction_name.trim() == 'Unpaid')">
										<div class="row">
											<div class="col-md-12">
												<div class="candidates-img float-left mr-4">
													<img src="../layout/img/person.jpg" alt="" class="img-fluid d-block rounded border border-secondary">
												</div>
												<div class="candidates-list-desc job-single-meta  pt-2">
													<h4 class="mb-2 text-dark">{{ adminusersData.filter(x => x.Emp_id == request.Requester_id)[0].FullName }}</h4>
													<div class="row">
														<div class="col-md-12 col-lg-6">
															<p class="text-muted f-15 mb-0"><i class="fa fa-user mr-2" aria-hidden="true"></i>
																{{ adminusersData.filter(x => x.Emp_id == request.Requester_id)[0].Job_Description }}
															</p>
														</div>
														<div class="col-md-12 col-lg-6">
															<p class="f-15 mb-0">
																<a href="" class="text-muted"><i class="fa fa-pencil mr-2" aria-hidden="true"></i>
																	<span>Department : </span><span class="text-success">{{ adminusersData.filter(x => x.Emp_id == request.Requester_id)[0].Dept_name }}</span>
																</a>
															</p>
														</div>
													</div>

													<div class="row mt-2" v-if="HR_Vacations_Period.filter(x => x.Request_id == request.id).length > 0">
														<div class="col-md-12 col-lg-6">
															<div class="param param-inline">
																<div  class="text-primary">Start date: 
																	<span class="text-secondary">
																		{{ HR_Vacations_Period.filter(x => x.Request_id == request.id)[0].Date_from }}
																	</span>
																</div>
															</div>
														</div>
														<div class=" col-md-12 col-lg-6">
															<div class="param param-inline two">
																<div class="text-primary">End date: 
																	<span class="text-secondary">
																		{{ HR_Vacations_Period.filter(x => x.Request_id == request.id)[0].Date_to }}
																	</span>
																</div>
															</div>
														</div>
													</div>

													<div class="row mt-3">
														<div class="col-md-12">
															<div> 
																<a href="#" @click.prevent="updateVacStatus(request.id, 4)"
																   :class="([4,5].indexOf(request.Status) > -1 ? 'disabled ' : '') + 'btn btn-sm btn-success'">Approve</a>
																<a href="#" @click.prevent="updateVacStatus(request.id, 5)" 
																   :class="([4,5].indexOf(request.Status) > -1 ? 'disabled ' : '') + 'btn btn-sm btn-danger'">Reject</a>
																<a href="#" class="btn btn-sm btn-info open-pop" data-pop-name="details-popup" 
																   v-on:click.prevent="popUp(request,'detailsPop')">Details</a>
															</div>
														</div>
													</div>


													<hr>
													<div class="row">
														<div class="col-md-10">
															<p class="text-muted mb-2 f-14 pull-left forleft">
																<i class="fa fa-list mr-3" aria-hidden="true"></i>Request Status : 
																<span v-if="request.Status == 2" class="text-success">Accepted from manger</span>
																<span v-else-if="request.Status == 4" class="text-success">Accepted from HR</span>
																<span v-else-if="request.Status == 5" class="text-danger">Rejected from HR</span> 
															</p>
														</div>
														<div class="col-md-2">
															<a href="#" class="pull-right forright">
																<i class="fa fa-trash fa-lg btn text-danger" 
																   aria-hidden="true"
																   @click.prevent="deleteVacRequest(request.id, true, i)">
																</i>
															</a>
														</div>
													</div>
												</div>
											</div>
										</div>
									</div>		</div>
								<div v-else class="text-center bg-white pt-5 pb-5 shadow-sm">There are no unpaid vacation requests</div>
							</div>
						</div>
					</div>
					<!-- /.container -->
				</div>
			</div>



			<!-- start details popup in new box -->

			<div v-if='vacRequest'>
				<div v-bind:class='vacRequest["detailsPop"] ? "details-popup popup active" : "details-popup popup"' v-if="vacRequest['detailsPop'] == true">
					<div class='popup-body' style="max-width: 1000px">

						<div class='container-fluid custom-form m-auto pb-4' style="max-width: 800px">
							<div class="cu-container">
								<span class='close-pop'>Close</span>

								<!--- detailed -->
								<div class='col-md-12'>
									<div>
										<div class="social-timeline-card shadow">
											<div class="card-header  bg-secondary text-white">
												<ul class="nav nav-tabs card-header-tabs tab">	
													<li class="nav-item">
														<a class="nav-link tablinks stylish" data-tab='#request-details'>Request Details 
														</a>
													</li>
													<li class="nav-item">
														<a class="nav-link tablinks " data-tab='#requester-history'>Requester History 
														</a>
													</li>
												</ul>
											</div>

											<div class="card-body" >
												<div id="request-details" class="general info tabcontent active overflow-auto" style="height:500px">

													<div class='cu-form-group special shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'>
														<div class='row'>
															<!-- employee name -->
															<div class="cu-field col-md-6">
																<h3 class="cu-label">
																	<label>Employee Name :</label>
																</h3>
																<div class="cu-input text-box">
																	<span class="fa fa-edit"></span>
																	{{ adminusersData.filter(x => x.Emp_id == vacRequest.Requester_id)[0].FullName }}
																</div>
															</div>

															<!-- employee id -->
															<div class="cu-field col-md-6">
																<h3 class="cu-label">
																	<label>Employee Id :</label>
																</h3>
																<div class="cu-input text-box">
																	<span class="fa fa-edit"></span>
																	{{ adminusersData.filter(x => x.Emp_id == vacRequest.Requester_id)[0].Emp_id }}
																</div>
															</div>

															<!-- department -->
															<div class="cu-field col-md-6">
																<h3 class="cu-label">
																	<label>Department Name :</label>
																</h3>
																<div class="cu-input text-box">
																	<span class="fa fa-edit"></span>
																	{{ adminusersData.filter(x => x.Emp_id == vacRequest.Requester_id)[0].Dept_name }}
																</div>
															</div>

															<!-- Branch Name -->
															<div class="cu-field  col-md-6">
																<h3 class="cu-label">
																	<label>Branch Name :</label>
																</h3>
																<div class="cu-input text-box">
																	<span class="fa fa-edit"></span>
																	{{ adminusersData.filter(x => x.Emp_id == vacRequest.Requester_id)[0].Branch_name }}
																</div>
															</div>

															<!-- total balance -->
															<div class="cu-field  col-md-6">
																<h3 class="cu-label">
																	<label>Total Vacation Balance :</label>
																</h3>
																<div class="cu-input text-box" v-if="Employees_Balance">
																	<span class="fa fa-edit"></span>
																	{{ Employees_Balance.Annual_Balance}}
																</div>
																<div class="cu-input text-box" v-else>
																	<span class="fa fa-edit"></span>
																	No total balance has been set yet
																</div>
															</div>

															<!-- casual balance -->
															<div class="cu-field  col-md-6">
																<h3 class="cu-label">
																	<label>total casual balance :</label>
																</h3>
																<div class="cu-input text-box" v-if="Employees_Balance">
																	<span class="fa fa-edit"></span>
																	{{ Employees_Balance.Casual_Balance}}
																</div>
																<div class="cu-input text-box" v-else>
																	<span class="fa fa-edit"></span>
																	No casual balance has been set yet
																</div>
															</div>
														</div>
													</div>

													<!-- about vacation -->	
													<div class='cu-form-group special shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'>
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

															<!-- delegated to-->
															<div class="cu-field col-md-12">
																<h3 class="cu-label">
																	<label>Delegated To :</label>
																</h3>
																<div class="cu-input text-box" style="max-width: 100%;">
																	<span class="fa fa-edit"></span>
																	{{ vacRequest.Delegation_EmpName }}
																</div>
															</div>
														</div>
													</div>

													<!-- vacation dates -->	
													<div class='cu-form-group special shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'>
														<div class='row'>

															<!-- Start Date -->
															<div class="cu-field col-md-12" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length > 0">
																<h3 class="cu-label">
																	<label>Requested dates :</label>
																</h3>
																<div class="cu-input text-box" style="max-width: 100%;">
																	<span class="fa fa-edit"></span>
																	{{HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id).map(x => x.Date_from).join().replace(/,/g, "  ,  ")}}
																</div>
															</div>

															<div class="cu-field col-md-6" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length == 0">
																<h3 class="cu-label">
																	<label>Start Date :</label>
																</h3>
																<div class="cu-input text-box">
																	<span class="fa fa-edit"></span>
																	{{ HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id)[0].Date_from }}
																</div>
															</div>

															<!-- End Date -->
															<div class="cu-field col-md-6 d-none" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length > 0">
																<h3 class="cu-label">
																	<label>End Date :</label>
																</h3>
																<div class="cu-input text-box">
																	<span class="fa fa-edit"></span>
																	{{ HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id)[0].Date_to }}
																</div>
															</div>
															<div class="cu-field col-md-6" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length == 0">
																<h3 class="cu-label">
																	<label>End Date :</label>
																</h3>
																<div class="cu-input text-box">
																	<span class="fa fa-edit"></span>
																	{{ HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id)[0].Date_to }}
																</div>
															</div>

															<!-- Vacation Days -->
															<div class="cu-field col-md-6" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length > 0">
																<h3 class="cu-label">
																	<label>Vacation Days :</label>
																</h3>
																<div class="cu-input text-box">
																	<span class="fa fa-edit"></span>
																	{{ HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id).length }} days
																</div>
															</div>
															<div class="cu-field col-md-6" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length == 0">
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
													<div class='cu-form-group special shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'>
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
													<div class='cu-form-group special shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'>
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
													<div class='cu-form-group special shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'>
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

												<div id="requester-history" class="general info tabcontent">
													<div class="col-md-12 graph">
														<table class="table table-bordered text-center shadow-sm shadow">
															<thead class="bg-light text-dark">
																<tr>
																	<th scope="col">#</th>
																	<th scope="col">Type</th>
																	<th scope="col" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length > 0">Requested Dates</th>
																	<th scope="col" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length == 0">Start</th>
																	<th scope="col" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length == 0">End</th>
																	<th scope="col" class="d-none" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length > 0">Status</th>
																	<th scope="col">Status</th>
																</tr>
															</thead>

															<tbody class="bg-white">
																<tr v-for="(request, i) in (allVacRrq.filter(x => x.Requester_id == vacRequest.Requester_id))">
																	<th scope="row">{{ i + 1 }}</th>
																	<td>{{ request.Vacation_Type_name }}</td>
																	<td scope="col" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length > 0">{{HR_Vacations_Period.filter(x => x.Request_id == request.id).map(x => x.Date_from).join().replace(/,/g, "  ,  ")}}</td>
																	<td scope="col" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length == 0">{{ HR_Vacations_Period.filter(x => x.Request_id == request.id)[0].Date_from }}</td>
																	<td scope="col" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length == 0">{{ HR_Vacations_Period.filter(x => x.Request_id == request.id)[0].Date_to }}</td>
																	<td scope="col" class="d-none" v-show="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id && x.Date_from == x.Date_to).length > 0">{{ request.Date_to }}</td>
																	<td v-if="request.Status == 1" class="text-primary">requested</td>
																	<td v-else-if="request.Status == 2" class="text-success">Accepted from manger</td>
																	<td v-else-if="request.Status == 3" class="text-danger">Rejected from manger</td>
																	<td v-else-if="request.Status == 4" class="text-success">Accepted from HR</td>
																	<td v-else-if="request.Status == 5" class="text-danger">Rejected from HR</td>
																</tr>
															</tbody>
														</table>

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
			</div>
			<!-- end details popup -->

		</div>
	</div>
	<script src='../layout/vue-code/Hr.js'></script>
</asp:Content>