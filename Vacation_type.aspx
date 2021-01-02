<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Vacation_type.aspx.cs"  Inherits="_Vacation_type" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<div class='Courses internal-page' id='Vacation_type'>

		<div class="custom-form create-course">
			<div class="cu-container">

				<div class="cu-form-group special p-4">

					<div class="title">
						<span>Vacation Type</span>
					</div>

					<div class='grouped shadow-sm pt-4 rounded'>
						<div class="row">
							<!-- vacation type -->
							<div class='col-md-12'>
								<div class="cu-field">
									<label class="cu-label">
										<span>Add New Vacation Type:</span>
									</label> 
									<div class="cu-input text-box">
										<span class="fa fa-edit"></span>
										<input type='text' v-model="NewHR_Vacation_Type.Type_Name">
									</div>
								</div>
							</div>
						</div>
						<!-- submit-->
						<div class='text-center'>
							<button class="special-btn" type="button"  v-on:click="SubmitVacationType">Add</button>
						</div>
					</div>

					<div class='grouped shadow-sm pt-4 pb-5 rounded'>
						<div class="row">
							<!-- vacation type -->
							<div class='col-md-12'>
								<div class="cu-field">
									<label class="cu-label">
										<span>All Vacation Types:</span>
									</label> 
									<!--<select id="projects" class="form-control">
<option value="0" selected="selected">..</option>
<option  v-for='type in types'>{{ type.Type_Name }}</option>
</select>
</div>-->

									<table class="table table-striped text-center">
										<thead class="bg-secondary text-white">
											<tr>
												<th scope="col" class="">#</th>
												<th scope="col">Vacation Type</th>
												<th scope="col">delete</th>
											</tr>
										</thead>
										<tbody>
											<tr v-for="(type, i) in Vacations">
												<th>{{ i + 1}}</th>
												<th>{{ type.Type_Name }}</th>
												<th><a href="#">
													<i class="fa fa-trash fa-lg btn text-danger" 
													   aria-hidden="true"
													   @click.prevent="deleteVacation(type.id, true)">
													</i>
													</a>
												</th>
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

	<script src='../layout/vue-code/Vacation_type.js'></script>
</asp:Content>