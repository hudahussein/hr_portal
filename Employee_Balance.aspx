<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Employee_Balance.aspx.cs"  Inherits="_Employee_Balance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

	<style>
		.errorMsg {
			position: absolute;
			width: 100% !important;
			bottom: -20px;
			left: 9px;
			opacity: 1;
			transition: all .5s ease;
			max-width: 250px;
			line-height: 1.2 !important;
			font-size: 14px;
			display: block;
		}
		input:valid ~ .errorMsg {
			opacity:0
		}
	</style>

	<div class='Courses internal-page' id='Employee_Balance'>

		<div class="custom-form create-course">
			<div class="cu-container">

				<div class="cu-form-group special p-4">

					<div class="title">
						<span>Employee Balance</span>
					</div>

					<div class='grouped shadow-sm rounded'>
						<div class='row'>
							<!-- employee id -->
							<div class="cu-field col-md-12">
								<h3 class="cu-label">
									<label>Employee Id :</label>
								</h3>
								<div class="cu-input text-box" style="max-width: 100%;">
									<span class="fa fa-edit"></span>
									<input v-model="impId" v-on:keydown.enter.prevent>
								</div>
							</div>
							<!-- employee name -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Employee Name :</label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<div>{{impName}}</div>
								</div>
							</div>
							<!-- employee jop discription -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Employee Jop Description :</label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<div>{{impDisc}}</div>
								</div>
							</div>
							<!-- employee department -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Employee Department :</label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<div>{{impDept}}</div>
								</div>
							</div>
							<!-- employee branch -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Employee Branch :</label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<div>{{impBranch}}</div>
								</div>
							</div>

						</div>
					</div>

					<!-- Employee balance -->	
					<div class='grouped shadow-sm rounded mb-4' id="insert-balance">
						<div class='row'>
							<!-- set balance -->
							<div class="cu-field col-md-12">
								<h3 class="cu-label">
									<label>Employee Total Balance :</label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<select id="projects" class="form-control" v-model="empBalance">
										<option value="0" selected="selected">..</option>
										<option>{{fewBalance}} days</option>
										<option>{{larageBalance}} days</option>
										<option>other...</option>
									</select>
								</div>
							</div>
							<!-- set new balance -->
							<div class="cu-field col-md-12" id="newBalance"  v-if='empBalance == "other..."'>
								<h3 class="cu-label">
									<label>Set Employee Total New Balance :</label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<input type="number" min="0" v-model="newBalance" v-on:keydown.enter.prevent>
								</div>
							</div>
							<!-- Quqrter One -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Quarter One : <span class="text-secondary" style="font-size: 14px; font-weight: bold">Ends On {{EmpVacBalance.Q1_DateTo}}</span></label>
								</h3>
								<div class="cu-input text-box" id="q1" v-if='empBalance != "other..."'>
									<span class="fa fa-edit"></span>
									<div>{{ quarterOne }} days</div>
								</div>
								<div class="cu-input text-box mt-3 mb-3" id="q1input" v-if='empBalance == "other..."'>
									<span class="fa fa-edit"></span>
									<input type="number" min="0" :max='newBalance > 21 ? 7 : newBalance <= 5 ? newBalance : 5'
										   v-model="quarterOne" v-on:keydown.enter.prevent>
									<span class='text-danger errorMsg'>
										The value must be not more than 
										{{newBalance > 21 ? 7 : newBalance => 5 ? newBalance : 5}}
									</span>
								</div>
							</div>
							<!-- Quqrter Two -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Quarter Two : <span class="text-secondary" style="font-size: 14px; font-weight: bold">Ends On {{EmpVacBalance.Q2_DateTo}}</span></label>
								</h3>
								<div class="cu-input text-box" id="q2" v-if='empBalance != "other..."'>
									<span class="fa fa-edit"></span>
									<div>{{ quarterTwo }} days</div>
								</div>
								<div class="cu-input text-box mt-3 mb-3" id="q2input" v-if='empBalance == "other..."'>
									<span class="fa fa-edit"></span>
									<input type="number"  min="0" :max='newBalance > 21 ? 7 : newBalance <= 5 ? newBalance : 5'
										   v-model="quarterTwo" v-on:keydown.enter.prevent>
									<span class='text-danger errorMsg'>
										The value must be not more than 
										{{newBalance > 21 ? 7 : newBalance <= 5 ? newBalance : 5}}
									</span>
								</div>
							</div>
							<!-- Quqrter Three -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Quarter Three : <span class="text-secondary" style="font-size: 14px; font-weight: bold">Ends On {{EmpVacBalance.Q3_DateTo}}</span></label>
								</h3>
								<div class="cu-input text-box" id="q3" v-if='empBalance != "other..."'>
									<span class="fa fa-edit"></span>
									<div>{{ quarterThree }} days</div>
								</div>
								<div class="cu-input text-box mt-3 mb-3" id="q3input" v-if='empBalance == "other..."'>
									<span class="fa fa-edit"></span>
									<input type="number"  min="0" :max='newBalance > 21 ? 7 : newBalance <= 5 ? newBalance : 5'
										   v-model="quarterThree" v-on:keydown.enter.prevent>
									<span class='text-danger errorMsg'>
										The value must be not more than 
										{{newBalance > 21 ? 7 : newBalance <= 5 ? newBalance : 5}}
									</span>
								</div>
							</div>
							<!-- Quqrter Four -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Quarter Four : <span class="text-secondary" style="font-size: 14px; font-weight: bold">Ends On {{EmpVacBalance.Q4_DateTo}}</span></label>
								</h3>
								<div class="cu-input text-box" id="q4" v-if='empBalance != "other..."'>
									<span class="fa fa-edit"></span>
									<div>{{ quarterFour }} days</div>
								</div>
								<div class="cu-input text-box mt-3 mb-3" id="q4input" v-if='empBalance == "other..."'>
									<span class="fa fa-edit"></span>
									<input type="number"  :min="newBalance > 0 ? 1 : 0"
										   :max='newBalance > 21 ? 9 : newBalance <= 6 ? newBalance : 6' v-model="quarterFour" v-on:keydown.enter.prevent>
									<span class='text-danger errorMsg'>
										The value must be 
										{{newBalance > 0 ? "at least " + 1 + " and" : ""}}
										not more than 
										{{newBalance > 21 ? 9 : newBalance <= 6 ? newBalance : 6}}
									</span>
								</div>
							</div>
							<!-- empty -->
							<div class="cu-field col-md-3 d-sm-none d-none d-md-block"></div>
							<!-- Casual Days -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Casual Days :</label>
								</h3>
								<div class="cu-input text-box" id="casual" v-if='empBalance != "other..."'>
									<span class="fa fa-edit"></span>
									<div>{{ casualDays }} days</div>
								</div>
								<div class="cu-input text-box mb-3" id="casualInput" v-if='empBalance == "other..."'>
									<span class="fa fa-edit"></span>
									<input type="number" min="0" :max='newBalance > 21 ? 7 : newBalance <= 6 ? newBalance : 6'
										   v-model="casualDays" v-on:keydown.enter.prevent>
									<span class='text-danger errorMsg'>
										The value must be not more than 
										{{newBalance > 21 ? 7 : newBalance <= 6 ? newBalance : 6}}
									</span>
								</div>
							</div>
							<!-- empty -->
							<div class="cu-field col-md-3 d-sm-none d-none d-md-block">
							</div>
							<!-- expiration Date -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Expiration Date :</label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<input type='date' v-model="EmpVacBalance.Old_Balance_ExpirationDate" v-on:keydown.enter.prevent>
								</div>
							</div>
							<!-- old balance -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Old Balance :</label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<input type="number" min="0" v-model="EmpVacBalance.Old_Balance" v-on:keydown.enter.prevent>
								</div>
							</div>
							<!-- submit balance-->
							<div class="cu-field col-md-12 mt-4">
								<div class='text-center'>
									<button class="special-btn m-0" type="button" @click.prevent="setBalance">set balance</button>
								</div>
							</div>
						</div>
					</div>

					<div class='grouped shadow-sm rounded mb-4 d-none' id="display-balance">
						<div class='row'>
							<!-- set balance -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Employee Total Balance :</label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<div>{{displayTotalBalance}} days</div>
								</div>
							</div>
							<!-- old balance -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Old Balance :</label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<div>{{ displayOldBalance }} days</div>
								</div>
							</div>
							<!-- Quqrter One -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Quarter One : <span class="text-secondary" style="font-size: 14px; font-weight: bold">Ends On {{EmpVacBalance.Q1_DateTo}}</span></label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<div>{{displayquarterOne}} days</div>
								</div>
							</div>
							<!-- Quqrter Two -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Quarter Two : <span class="text-secondary" style="font-size: 14px; font-weight: bold">Ends On {{EmpVacBalance.Q2_DateTo}}</span></label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<div>{{ displayquarterTwo }} days</div>
								</div>
							</div>
							<!-- Quqrter Three -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Quarter Three : <span class="text-secondary" style="font-size: 14px; font-weight: bold">Ends On {{EmpVacBalance.Q3_DateTo}}</span></label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<div>{{ displayquarterThree }} days</div>
								</div>
							</div>
							<!-- Quqrter Four -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Quarter Four : <span class="text-secondary" style="font-size: 14px; font-weight: bold">Ends On {{EmpVacBalance.Q4_DateTo}}</span></label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<div>{{ displayquarterFour }} days</div>
								</div>
							</div>
							<!-- Casual Days -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Casual Days :</label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<div>{{ displaycasualDays }} days</div>
								</div>
							</div>
							<!-- expiration Date -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Expiration Date :</label>
								</h3>
								<div class="cu-input text-box">
									<span class="fa fa-edit"></span>
									<div>{{ displayBalanceExpirationDate }}</div>
								</div>
							</div>
							<!-- edit balance-->
							<div class="cu-field col-md-12 mt-4">
								<div class='text-center'>
									<button class="special-btn m-auto" type="button" @click.prevent="showEdid">edit balance</button>
								</div>
							</div>
						</div>
					</div>

					<div class='grouped shadow-sm rounded mb-4 d-none' id="edit-balance">
						<div class='row'>
							<!-- set balance -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Employee Total Balance :</label>
								</h3>
								<div class="cu-input text-box mb-3">
									<span class="fa fa-edit"></span>
									<input type='number' v-model='displayTotalBalance' v-on:keydown.enter.prevent>
								</div>
							</div>
							<!-- old balance -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Old Balance :</label>
								</h3>
								<div class="cu-input text-box mb-3">
									<span class="fa fa-edit"></span>
									<input type='number' v-model='displayOldBalance' v-on:keydown.enter.prevent>
								</div>
							</div>
							<!-- Quqrter One -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Quarter One : 
										<span class="text-secondary" style="font-size: 14px; font-weight: bold">
											Ends On {{EmpVacBalance.Q1_DateTo}}
										</span>
									</label>
								</h3>
								<div class="cu-input text-box mb-3">
									<span class="fa fa-edit"></span>
									<input type='number'  min="0"
										   :max='displayTotalBalance > 21 ? 7 : displayTotalBalance <= 5 ? displayTotalBalance : 5'
										   v-model='displayquarterOne' v-on:keydown.enter.prevent>
									<span class='text-danger errorMsg'>
										The value must be not more than 
										{{displayTotalBalance > 21 ? 7 : displayTotalBalance <= 5 ? displayTotalBalance : 5}}
									</span>
								</div>
							</div>
							<!-- Quqrter Two -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Quarter Two : <span class="text-secondary" style="font-size: 14px; font-weight: bold">Ends On {{EmpVacBalance.Q2_DateTo}}</span></label>
								</h3>
								<div class="cu-input text-box mb-3">
									<span class="fa fa-edit"></span>
									<input type='number'  min="0"
										   :max='displayTotalBalance > 21 ? 7 : displayTotalBalance <= 5 ? displayTotalBalance : 5'
										   v-model='displayquarterTwo' v-on:keydown.enter.prevent>
									<span class='text-danger errorMsg'>
										The value must be not more than 
										{{displayTotalBalance > 21 ? 7 : displayTotalBalance <= 5 ? displayTotalBalance : 5}}
									</span>
								</div>
							</div>
							<!-- Quqrter Three -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Quarter Three : <span class="text-secondary" style="font-size: 14px; font-weight: bold">Ends On {{EmpVacBalance.Q3_DateTo}}</span></label>
								</h3>
								<div class="cu-input text-box mb-3">
									<span class="fa fa-edit"></span>
									<input type='number'  min="0"
										   :max='displayTotalBalance > 21 ? 7 : displayTotalBalance <= 5 ? displayTotalBalance : 5'
										   v-model='displayquarterThree' v-on:keydown.enter.prevent>
									<span class='text-danger errorMsg'>
										The value must be not more than 
										{{displayTotalBalance > 21 ? 7 : displayTotalBalance <= 5 ? displayTotalBalance : 5}}
									</span>
								</div>
							</div>
							<!-- Quqrter Four -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Quarter Four : 
										<span class="text-secondary" style="font-size: 14px; font-weight: bold">
											Ends On {{EmpVacBalance.Q4_DateTo}}
										</span>
									</label>
								</h3>
								<div class="cu-input text-box mb-3">
									<span class="fa fa-edit"></span>
									<input type='number' min="0"
										   :max='displayTotalBalance > 21 ? 7 : displayTotalBalance <= 6 ? displayTotalBalance : 6'
										   v-model='displayquarterFour' v-on:keydown.enter.prevent>
									<span class='text-danger errorMsg'>
										The value must be 
										{{newBalance > 0 ? "at least " + 1 + " and" : ""}}
										not more than 
										{{displayTotalBalance > 21 ? 9 : displayTotalBalance <= 6 ? displayTotalBalance : 6}}
									</span>
								</div>
							</div>
							<!-- Casual Days -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Casual Days :</label>
								</h3>
								<div class="cu-input text-box mb-3">
									<span class="fa fa-edit"></span>
									<input type='number' min='0'
										   :max='displayTotalBalance > 21 ? 7 : displayTotalBalance <= 6 ? displayTotalBalance : 6'
										   v-model='displaycasualDays' v-on:keydown.enter.prevent>
									<span class='text-danger errorMsg'>
										The value must be not more than 
										{{displayTotalBalance > 21 ? 7 : displayTotalBalance <= 6 ? displayTotalBalance : 6}}
									</span>
								</div>
							</div>
							<!-- expiration Date -->
							<div class="cu-field col-md-6">
								<h3 class="cu-label">
									<label>Expiration Date :</label>
								</h3>
								<div class="cu-input text-box mb-3">
									<span class="fa fa-edit"></span>
									<input type='date' v-model='displayBalanceExpirationDate' v-on:keydown.enter.prevent>
								</div>
							</div>
							<!-- edit balance-->
							<div class="cu-field col-md-12 mt-4">
								<div class='text-center'>
									<button class="special-btn m-auto" type="button" @click.prevent="edidBalance">submit edit</button>
								</div>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
	</div>

	<script src='../layout/vue-code/Employee_Balance.js'></script>
</asp:Content>