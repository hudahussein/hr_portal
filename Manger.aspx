<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Manger.aspx.cs" Inherits="_Manger" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<style>
		.graph{
			height:300px;
			overflow-y: scroll;
		}
	</style>
	<div class='hr-portal internal-page' id='Manger'>
		<h1 class="text-secondary">
			<img src='../layout/img/course.png' alt='courses'/>
			Welcome to Manger page
		</h1>

		<div class="custom-form manger-vec fortab">
			<div class="cu-container">	
				<div class="cu-form-group special shadow pb-5 pt-3 m-auto bg-light" style="max-width: 95%;">

					<ul class="nav nav-tabs md-tabs bg-secondary text-white p-3 mb-2 shadow rounded" id="myTabMD" role="tablist">
						<li class="nav-item">
							<a class="nav-link active" id="home-tab-md" data-toggle="tab" href="#vacation-requests" role="tab" aria-controls="home-md"
							   aria-selected="true">Vacation Requests</a>
						</li>
						<li class="nav-item ml-2">
							<a class="nav-link" id="profile-tab-md" data-toggle="tab" href="#time-off-requests" role="tab" aria-controls="profile-md"
							   aria-selected="false">Time Off Requests</a>
						</li>
						<li class="nav-item ml-2">
							<a class="nav-link" id="contact-tab-md" data-toggle="tab" href="#employee-list" role="tab" aria-controls="contact-md"
							   aria-selected="false">Employee List</a>
						</li>
					</ul>

					<div class="tab-content card pt-3 m-0 w-100 rounded shadow" id="myTabContentMD">
						<div class="tab-pane fade show active overflow-auto" id="vacation-requests" role="tabpanel" aria-labelledby="home-tab-md" style="max-height: 600px padding-top: 10px;">
							<div v-if='VacRrq.length > 0'>
								<div class="row m-0" v-for="(request, i) in VacRrq">
									<div class="col-lg-12">
										<div class="candidates-listing-item bg-white shadow">
											<div class="list-grid-item mt-4 pl-4 pr-4 pt-4 pb-4 border rounded">
												<div class="row">
													<div class="col-md-12">
														<div class="candidates-img float-left mr-4">
															<img src="../layout/img/person.jpg" alt="" class="img-fluid d-block rounded border border-secondary">
														</div>

														<div class="candidates-list-desc job-single-meta  pt-2">
															<h4 class="mb-2 f-19 text-dark">{{ adminusersData.filter(x => x.Emp_id == request.Requester_id)[0].FullName }}</h4>
															<div class="row">
																<div class="col-md-12 col-lg-6">
																	<p class="text-muted f-15 mb-0"><i class="fa fa-user mr-2" aria-hidden="true"></i>
																		{{ adminusersData.filter(x => x.Emp_id == request.Requester_id)[0].Job_Description }}
																	</p>
																</div>
																<div class="col-md-12 col-lg-6">
																	<div class="f-15 mb-0">
																		<div class="text-muted"><i class="fa fa-pencil mr-2" aria-hidden="true"></i>
																			<span>Vacation Type : 
																				<span v-if="request.Deduction_name.trim() == 'Paid'" class="text-success">{{ request.Vacation_Type_name }}</span>
																				<span v-else class="text-success">{{ request.Deduction_name }}</span>
																			</span>
																		</div>
																	</div>
																</div>
															</div>

															<div v-if="HR_Vacations_Period.filter(x => x.Request_id == request.id).length > 0">
																<div class="row" v-show="HR_Vacations_Period.filter(x => x.Request_id == request.id && x.Date_from == x.Date_to).length > 0">
																	<div class="col-md-12 col-lg-6">
																		<div class="param param-inline">
																			<div class="text-info overflow-auto" style="max-height: 50px;">Requested Dates: 
																				<span class="text-secondary">{{HR_Vacations_Period.filter(x => x.Request_id == request.id).map(x => x.Date_from)
																					.join().replace(/,/g, "  ,  ")}}
																				</span>
																			</div>	
																		</div>
																	</div>
																</div>

																<div class="row" v-show="HR_Vacations_Period.filter(x => x.Request_id == request.id && x.Date_from == x.Date_to).length == 0">
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
																		<a href="#" @click.prevent="updateVacStatus(request.id, 2)"
																		   :class="([2,3,4,5].indexOf(request.Status) > -1 ? 'disabled ' : '') + 'btn btn-sm btn-success'">Approve</a>
																		<a href="#" @click.prevent="updateVacStatus(request.id, 3)" 
																		   :class="([2,3,4,5].indexOf(request.Status) > -1 ? 'disabled ' : '') + 'btn btn-sm btn-danger'">Reject</a>
																		<a href="#" class="btn btn-sm btn-info open-pop" data-pop-name="details-popup" 
																		   v-on:click.prevent="popUp(request,'detailsPop')">Details</a>
																	</div>
																</div>
															</div>
															<hr>
															<div class="row">
																<div class="col-md-10">
																	<p class="text-muted mb-2 f-14 pull-left text-danger forleft">
																		<i class="fa fa-list mr-3" aria-hidden="true"></i>Request Status : 
																		<span v-if="request.Status == 1" class="text-primary">requested</span>
																		<span v-else-if="request.Status == 2" class="text-success">Accepted from manger</span>
																		<span v-else-if="request.Status == 3" class="text-danger">Rejected from manger</span>
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
									</div>
								</div>
							</div>		
							<div v-else class="card">
								<div class="card-body text-center">
									There is no vacation requests yet!
								</div>
							</div>
						</div>
						<div class="tab-pane fade overflow-auto" id="time-off-requests" role="tabpanel" aria-labelledby="profile-tab-md" style="max-height: 600px">
							<div v-if='WorkRequests.length > 0'>
								<div class="row m-0" v-for="(request, i) in WorkRequests">
									<div class="col-lg-12">
										<div class="candidates-listing-item bg-light shadow">
											<div class="list-grid-item mt-4 pl-4 pr-5 pt-4 pb-4 border rounded">
												<div class="row">
													<!--<div>{{request}}</div>-->
													<div class="col-md-12">
														<div class="candidates-img float-left mr-4">
															<img src="../layout/img/person.jpg" alt="" class="img-fluid d-block rounded border border-secondary">
														</div>
														<div class="candidates-list-desc job-single-meta  pt-2">
															<h4 class="mb-2 f-19 text-dark">{{ adminusersData.filter(x => x.Emp_id == request.Emp_id)[0].FullName }}</h4>
															<div class="row">
																<div class="col-md-6">
																	<p class="text-muted f-15 mb-0"><i class="fa fa-user mr-2" aria-hidden="true"></i>
																		{{ adminusersData.filter(x => x.Emp_id == request.Emp_id)[0].Job_Description }}
																	</p>
																</div>
																<div class="col-md-6">
																	<p class="text-muted f-15 mb-0">
																		<i class="fa fa-pencil-square mr-2" aria-hidden="true"></i>Request Status : 
																		<span v-if="request.Status == 1" class="text-primary">requested</span>
																		<span v-else-if="request.Status == 2" class="text-success">Accepted from manger</span>
																		<span v-else-if="request.Status == 3" class="text-danger">Rejected from manger</span>
																		<span v-else-if="request.Status == 4" class="text-success">Accepted from HR</span>
																		<span v-else-if="request.Status == 5" class="text-danger">Rejected from HR</span>
																		<span v-else-if="request.Status == 6" class="text-primary">Pending day off request</span>
																		<span v-else-if="request.Status == 7" class="text-success">Day off request accepted from manger</span>
																		<span v-else-if="request.Status == 8" class="text-success">Day off request accepted from hr</span>
																	</p>
																</div>
															</div>

															<div class="row">
																<div class="col-md-6">
																	<dl class="param param-inline">
																		<dt  class="text-primary">Requested Date: </dt>
																		<dd>{{request.Date_From}}</dd>
																	</dl>
																</div>
															</div>

															<div class="row">
																<div class="col-md-12">
																	<div class=""> 
																		<a href="#" @click.prevent="updateWorkStatus(request.id, 2)"
																		   :class="([2,3,4,5].indexOf(request.Status) > -1 ? 'disabled ' : '') + 'btn btn-sm btn-success'">Approve</a>
																		<a href="#" @click.prevent="updateWorkStatus(request.id, 3)" 
																		   :class="([2,3,4,5].indexOf(request.Status) > -1 ? 'disabled ' : '') + 'btn btn-sm btn-danger'">Reject</a>
																	</div>
																</div>
															</div>
															<hr>
															<div class="row">
																<div class="col-md-6">
																	<p class="text-muted mb-2 f-14 pull-left text-danger">
																		<i class="fa fa-list mr-3" aria-hidden="true"></i>Employee Comment : 
																		<span v-if="request.Requester_Comment">{{ request.Requester_Comment }}</span>
																		<span v-else>No Comment For This Request</span>
																	</p>
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
									</div>
								</div>
							</div>
									
							<div v-else class="card">
								<div class="card-body text-center">
									There is no work requests yet!
								</div>
							</div>
						</div>
						<div class="tab-pane fade overflow-auto" id="employee-list" role="tabpanel" aria-labelledby="contact-tab-md" style="max-height: 600px">
							<table class="table table-bordered text-center shadow-sm table-striped mt-2">
								<thead class="bg-info text-white">
									<tr>
										<th scope="col">#</th>
										<th scope="col">Profile Img</th>
										<th scope="col" class="text-left">Full Name</th>
										<th scope="col">Emp ID</th>
										<th scope="col" class="text-left">Title</th>
										<th scope="col">Vacation Balance</th>
										<th scope="col">Vacations Details</th>
									</tr>
								</thead>
								<tbody class="bg-white">
									<tr v-for="(imp, i) in adminusersData">
										<th>{{ i + 1 }}</th>
										<th><img src="../layout/img/person.jpg" style="height: 25px; width: 25px" alt=""></th>
										<th class="text-left">{{ imp.FullName }}</th>
										<th>{{ imp.Emp_id }}</th>
										<th class="text-left">{{ imp.Job_Description }}</th>
										<th v-if="HR_Employees_Vacation_Balance.filter(x => x.Emp_id == imp.Emp_id).length > 0">{{ HR_Employees_Vacation_Balance.filter(x => x.Emp_id == imp.Emp_id)[0].Annual_Balance}} days</th>
										<th v-else>No Balance</th>
										<!--<th class="text-left">{{ HR_Employees_Vacation_Balance.filter(x => x.Emp_id == imp.admin_id)[0].Old_Balance }} days</th>-->
										<th><a href="#" class="btn btn-sm btn-secondary open-pop" data-pop-name="imp-details-popup" v-on:click.prevent="impReqPopUp(imp,'impDetailsPop')">show details</a></th>
									</tr>
								</tbody>
							</table>
						</div>
					</div>

				</div>
			</div>
		</div>





		<!-- start details popup-->
		<div v-if='vacRequest'>
			<div v-bind:class='vacRequest["detailsPop"] ? "details-popup popup active" : "details-popup popup"' v-if="vacRequest['detailsPop'] == true">
				<div class='popup-body' style="max-width: 1000px">

					<div class='container-fluid custom-form m-auto pb-4' style="max-width: 800px">
						<div class="cu-container">
							<span class='close-pop' v-on:click="close">Close</span>

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
											<div id="request-details" class="general info tabcontent active overflow-auto" style="height:530px">

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
															<div class="cu-input text-box" v-if="HR_Employees_Vacation_Balance.filter(x => x.Emp_id == vacRequest.Requester_id).length == 0">
																<span class="fa fa-edit"></span>
																No total balance has been set yet
															</div>
															<div class="cu-input text-box" v-else>
																<span class="fa fa-edit"></span>
																{{ HR_Employees_Vacation_Balance.filter(x => x.Emp_id == vacRequest.Requester_id)[0].Annual_Balance}}
															</div>
														</div>

														<!-- casual balance -->
														<div class="cu-field  col-md-6">
															<h3 class="cu-label">
																<label>total casual balance :</label>
															</h3>
															<div class="cu-input text-box" v-if="HR_Employees_Vacation_Balance.filter(x => x.Emp_id == vacRequest.Requester_id).length == 0">
																<span class="fa fa-edit"></span>
																No casual balance has been set yet
															</div>
															<div class="cu-input text-box" v-else>
																<span class="fa fa-edit"></span>
																{{ HR_Employees_Vacation_Balance.filter(x => x.Emp_id == vacRequest.Requester_id)[0].Casual_Balance}}
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
													<div v-if="HR_Vacations_Period.filter(x => x.Request_id == vacRequest.id).length > 0" class='row'>

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
												<div class='cu-form-group special shadow-sm grouped rounded mb-3 bg-light pr-3 pl-3'
													 v-if='vacRequest.Attach_File != ""'>
													<div class='row'>
														<div class="cu-field col-md-12">
															<h3 class="cu-label">
																<label>Attached File :</label>
															</h3>
															<div class="cu-input text-box">
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
															<div v-if="vacRequest.Requester_Comment" class="cu-input text-box" style="max-width: 100%;">
																<span class="fa fa-edit"></span>
																{{ vacRequest.Requester_Comment }}
															</div>
															<div v-else class="cu-input text-box" style="max-width: 100%;">
																<span class="fa fa-edit"></span>
																No Comment For This Request
															</div>
														</div>													
													</div>
												</div>

											</div>

											<div id="requester-history" class="general info tabcontent">
												<div class="col-md-12 graph">
													<table class="table table-bordered text-center shadow-sm shadow">
														<thead class="bg-light text-secondary">
															<tr>
																<th scope="col">#</th>
																<th scope="col">Type</th>
																<th scope="col">Dates</th>
																<th scope="col">Status</th>
															</tr>
														</thead>

														<tbody class="bg-white">
															<tr v-for="(request, i) in (allVacRrq.filter(x => x.Requester_id == vacRequest.Requester_id))">
																<th>{{ i + 1 }}</th>
																<td v-if="request.Deduction_name.trim() == 'Paid'">{{ request.Vacation_Type_name }}</td>
																<td v-else>{{ request.Deduction_name }}</td>

																<td v-if="HR_Vacations_Period.filter(x => x.Request_id == request.id).length == 0">
																	No date set
																</td>
																<td v-else-if="HR_Vacations_Period.filter(x => x.Request_id == request.id && x.Date_from == x.Date_to).length > 0">                                       										  requested dates : 
																	{{HR_Vacations_Period.filter(x => x.Request_id == request.id).map(x => x.Date_from).join().replace(/,/g, "  ,  ")}}
																</td>
																<td v-else-if="HR_Vacations_Period.filter(x => x.Request_id == request.id && x.Date_from != x.Date_to).length > 0">
																	start date : {{ HR_Vacations_Period.filter(x => x.Request_id == request.id)[0].Date_from }} , end date : 
																	{{ HR_Vacations_Period.filter(x => x.Request_id == request.id)[0].Date_to }}
																</td>



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



		<!-- start Employee Vacation requests popup-->

		<div v-if='impRequest'>
			<div v-bind:class='impRequest["impDetailsPop"] ? "imp-details-popup popup active" : "imp-details-popup popup"' v-if="impRequest['impDetailsPop'] == true">
				<div class='popup-body' style="max-width: 1000px">
					<div class='container-fluid custom-form m-auto pb-4' style="max-width: 800px">
						<div class="cu-container">
							<span class='close-pop' v-on:click="closeimpReq">Close</span>
							<!--- detailed -->
							<div class='col-md-12'>
								<div class="title text-center mb-3">
									<span>Employee Vacation Details</span>
								</div>

								<!--<div>{{ impRequest }}</div>-->

								<div>
									<div class="social-timeline-card shadow">
										<div class="card-body" >

											<div class="col-md-12 graph" v-if="allVacRrq.filter(x => x.Requester_id == impRequest.Emp_id).length > 0">
												<table class="table table-bordered text-center shadow-sm">
													<thead>
														<tr class="table-success">
															<th scope="col">#</th>
															<th scope="col">Vacation Type</th>
															<th scope="col">Requested Dates</th>
															<th scope="col">Status</th>
														</tr>
													</thead>
													<tbody>
														<tr class="align-middle" 
															v-for="(Req, i) in (allVacRrq.filter(x => x.Requester_id == impRequest.Emp_id))"
															v-show="HR_Vacations_Period.filter(x => x.Request_id == Req.id).length > 0">
															<td>{{ i + 1 }}</td>
															<td v-if="Req.Deduction_name.trim() == 'Paid'">{{ Req.Vacation_Type_name }}</td>
															<td v-else>{{ Req.Deduction_name }}</td>
															<td v-show="HR_Vacations_Period.filter(x => x.Request_id == Req.id && x.Date_from == x.Date_to).length > 0">{{HR_Vacations_Period.filter(x => x.Request_id == Req.id).map(x => x.Date_from).join().replace(/,/g, "  ,  ")}}
															</td>
															<td v-show="HR_Vacations_Period.filter(x => x.Request_id == Req.id && x.Date_from == x.Date_to).length == 0">
																<div><span class="text-secondary">starts:</span>
																	{{ HR_Vacations_Period.filter(x => x.Request_id == Req.id)[0].Date_from }}
																</div>
																<div><span class="text-secondary">ends: </span>
																	{{ HR_Vacations_Period.filter(x => x.Request_id == Req.id)[0].Date_to }}
																</div>
															</td>
															<td v-if="Req.Status == 1" class="text-primary">requested</td>
															<td v-else-if="Req.Status == 2" class="text-success">Accepted from manger</td>
															<td v-else-if="Req.Status == 3" class="text-danger">Rejected from manger</td>
															<td v-else-if="Req.Status == 4" class="text-success">Accepted from HR</td>
															<td v-else-if="Req.Status == 5" class="text-danger">Rejected from HR</td> 
														</tr>
														<tr v-show="HR_Vacations_Period.filter(x => x.Request_id == Req.id).length == 0">No vacation history found</tr>
													</tbody>
												</table>
											</div>
											<div class="text-center text-secondary" v-else>There is no vacation requests for this employee</div>

										</div>
									</div>
								</div>
							</div>
						</div>   
					</div>
				</div>   
			</div>
		</div>
		<!-- end Employee Vacation requests popup -->
	</div>

	<script src='../layout/vue-code/Manger.js'></script>
</asp:Content>