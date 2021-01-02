<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"  %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	<style>

		.param {
			margin-bottom: 7px;
			line-height: 1.4;
		}
		.param-inline dt {
			display: inline-block;
		}
		.param dt {
			margin: 0;
			margin-right: 7px;
			font-weight: 600;
		}
		.param-inline dd {
			vertical-align: middle;
			display: inline-block;
		}

		.param dd {
			margin: 0;
			vertical-align: middle;
		} 

		.shopping-cart-wrap .price {
			color: #007bff;
			font-size: 20px;
			font-weight: bold;
			margin-right: 5px;
			display: block;
		}

		.img-sm {
			width: 90px;
			max-height: 75px;
			object-fit: cover;
		}
	</style>


	<div class='Courses internal-page' id='Manger'>
		<h1 class="text-secondary">
			<img src='../layout/img/course.png' alt='courses'/>
			Welcome to Manger page
		</h1>

		<div class="custom-form create-course">
			<div class="cu-container">


				<div class="cu-form-group special shadow pt-2 pb-2 m-auto bg-light" style="max-width: 95%;">
					<div class="container">
						<br>  <h2 class="text-center">Employee Requests For Vacations</h2>
						<hr>

						<div class="card">
							<table class="table table-striped shopping-cart-wrap shadow">

								<thead class="text-center btn-success text-white">
									<tr>
										<th scope="col">Employee</th>
										<th scope="col" width="200">Days & Type</th>
										<th scope="col" width="200">Dates</th>
										<th scope="col" width="200">Action</th>
									</tr>
								</thead>

								<tbody>
									<tr>
										<td>
											<figure class="media align-middle m-0">
												<div class="img-wrap shadow-sm"><img src='../layout/img/profile.png' class="img-thumbnail img-sm" alt='courses'/></div>
												<figcaption class="media-body ml-3">
													<dl class="param param-inline small">
														<dt>Neme: </dt>
														<dd>Rabaa Ahmad</dd>
													</dl>
													<dl class="param param-inline small">
														<dt>Title: </dt>
														<dd>Web Designer</dd>
													</dl>
													<dl class="param param-inline small">
														<dt>Department: </dt>
														<dd>Programing Section</dd>
													</dl>
												</figcaption>
											</figure> 
										</td>
										<td class="align-middle"> 
											<dl class="param param-inline small">
												<dt>number of days: </dt>
												<dd>5 days</dd>
											</dl>
											<dl class="param param-inline small">
												<dt>vacation type: </dt>
												<dd class="text-danger font-weight-bold">unpaid</dd>
											</dl>
										</td>
										<td class="align-middle"> 
											<dl class="param param-inline small">
												<dt  class="text-primary">start date: </dt>
												<dd>20-10-2020</dd>
											</dl>
											<dl class="param param-inline small">
												<dt  class="text-primary">end date: </dt>
												<dd>25-10-2020</dd>
											</dl>
										</td>
										<td class="text-center align-middle"> 
											<a href="" class="btn btn-sm btn-success">Approve</a>
											<a href="" class="btn btn-sm btn-danger">Reject</a>
											<a href="" class="btn btn-sm btn-primary">Details</a>
										</td>
									</tr>
									
									<tr>
										<td>
											<figure class="media align-middle m-0">
												<div class="img-wrap shadow-sm"><img src='../layout/img/profile.png' class="img-thumbnail img-sm" alt='courses'/></div>
												<figcaption class="media-body ml-3">
													<dl class="param param-inline small">
														<dt>Neme: </dt>
														<dd>Rabaa Ahmad</dd>
													</dl>
													<dl class="param param-inline small">
														<dt>Title: </dt>
														<dd>Web Designer</dd>
													</dl>
													<dl class="param param-inline small">
														<dt>Department: </dt>
														<dd>Programing Section</dd>
													</dl>
												</figcaption>
											</figure> 
										</td>
										<td class="align-middle"> 
											<dl class="param param-inline small">
												<dt>number of days: </dt>
												<dd>5 days</dd>
											</dl>
											<dl class="param param-inline small">
												<dt>vacation type: </dt>
												<dd class="text-danger font-weight-bold">unpaid</dd>
											</dl>
										</td>
										<td class="align-middle"> 
											<dl class="param param-inline small">
												<dt  class="text-primary">start date: </dt>
												<dd>20-10-2020</dd>
											</dl>
											<dl class="param param-inline small">
												<dt  class="text-primary">end date: </dt>
												<dd>25-10-2020</dd>
											</dl>
										</td>
										<td class="text-center align-middle"> 
											<a href="" class="btn btn-sm btn-success">Approve</a>
											<a href="" class="btn btn-sm btn-danger">Reject</a>
											<a href="" class="btn btn-sm btn-primary">Details</a>
										</td>
									</tr>
									<tr>
										<td>
											<figure class="media align-middle m-0">
												<div class="img-wrap shadow-sm"><img src='../layout/img/profile.png' class="img-thumbnail img-sm" alt='courses'/></div>
												<figcaption class="media-body ml-3">
													<dl class="param param-inline small">
														<dt>Neme: </dt>
														<dd>Rabaa Ahmad</dd>
													</dl>
													<dl class="param param-inline small">
														<dt>Title: </dt>
														<dd>Web Designer</dd>
													</dl>
													<dl class="param param-inline small">
														<dt>Department: </dt>
														<dd>Programing Section</dd>
													</dl>
												</figcaption>
											</figure> 
										</td>
										<td class="align-middle"> 
											<dl class="param param-inline small">
												<dt>number of days: </dt>
												<dd>5 days</dd>
											</dl>
											<dl class="param param-inline small">
												<dt>vacation type: </dt>
												<dd class="text-danger font-weight-bold">unpaid</dd>
											</dl>
										</td>
										<td class="align-middle"> 
											<dl class="param param-inline small">
												<dt  class="text-primary">start date: </dt>
												<dd>20-10-2020</dd>
											</dl>
											<dl class="param param-inline small">
												<dt class="text-primary">end date: </dt>
												<dd>25-10-2020</dd>
											</dl>
										</td>
										<td class="text-center align-middle"> 
											<a href="" class="btn btn-sm btn-success">Approve</a>
											<a href="" class="btn btn-sm btn-danger">Reject</a>
											<a href="" class="btn btn-sm btn-primary">Details</a>
										</td>
									</tr>
								</tbody>
							</table>
						</div> 

					</div> 
					<!--container end.//-->

					<br><br>

				</div>
			</div>

		</div>
	</div>

</asp:Content>