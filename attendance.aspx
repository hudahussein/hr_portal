<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
	
  <div class="sallery">
	<div class="container">
		<div class="sall">
			<div class="row">
				<div class="col-md-12">
					<div class="employee">
						<div class="info">
							<div class="img-con">
								<img src="../layout/img/user.jpg">
							</div>
							<h2>Mervat Farouk</h2>
							<div class="date">
								<h4>Hiring Date :</h4>
								<h5>28/7/1971</h5>
							</div>
							<div class="jop">
								<h4>Id :</h4>
								<h5>2389485</h5>
							</div>
						</div>
						
						
					</div>
				</div>
			</div>
			<div class="selection">
				 <label for="cars">Choose a year :</label>

<select name="year" id="year">
  <option value="2020">2020</option>
  <option value="2019">2019</option>
  <option value="2018">2018</option>
  <option value="2017">2017</option>
</select> 
				
			</div>
			<div class="selection">
				 <label for="cars">Choose a month :</label>

<select name="month" id="month">
  <option value="January">January</option>
  <option value="February">February</option>
  <option value="March">March</option>
  <option value="April">April</option>
</select> 
				
			</div>
				  <div class="container">
          <div class="dataTables_wrapper no-footer">
			 
			  <div class="dataTables_scroll">
				  <div class="dataTables_scrollHead" style="overflow: hidden; position: relative; border: 0px none; width: 100%;">
					  <div class="dataTables_scrollHeadInner" style="box-sizing: content-box; padding-right: 0px;">
						  <table class="table isSearch dataTable no-footer" role="grid" style="margin-left: 0px; " cellspacing="0">
							 
						  </table>
					  </div>
				  </div>
				  <div class="dataTables_scrollBody" style="position: relative; overflow: auto; width: 100%;">
					  <table class="table isSearch dataTable no-footer" >
						   <thead>
             
								  <tr class="table-heads " role="row">
									  <th class="head-item mbr-fonts-style display-7 sorting" >
                      DATE</th>
									  <th class="head-item mbr-fonts-style display-7 sorting" >
                       ATTENDANCE</th>
									  <th class="head-item mbr-fonts-style display-7 sorting" >
                        DISMISS</th>
									 
								  </tr>
            </thead>
						  <thead>
              <tr class="table-heads " role="row" style="height: 0px;"><th class="head-item mbr-fonts-style display-7 sorting" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 148px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="
                       DATE: activate to sort column ascending"><div class="dataTables_sizing" style="height:0;overflow:hidden;">
                       DATE</div></th><th class="head-item mbr-fonts-style display-7 sorting" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 437px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="
                      ATTENDANCE: activate to sort column ascending"><div class="dataTables_sizing" style="height:0;overflow:hidden;">
                      ATTENDANCE</div></th><th class="head-item mbr-fonts-style display-7 sorting" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 246px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="
                      DISMISS: activate to sort column ascending"><div class="dataTables_sizing" style="height:0;overflow:hidden;">
                      DISMISS</div></th></tr>
            </thead>
					
            <tbody>
              
              
              
              
            <tr role="row" class="odd"> 
                
                
                
                
              <td class="body-item mbr-fonts-style display-7">2016-10-17</td><td class="body-item mbr-fonts-style display-7">23:98</td><td class="body-item mbr-fonts-style display-7">04:56</td></tr><tr role="row" class="even">
                
                
                
                
              <td class="body-item mbr-fonts-style display-7">2016-10-17</td><td class="body-item mbr-fonts-style display-7">03:87</td><td class="body-item mbr-fonts-style display-7">03:40</td></tr><tr role="row" class="odd">
                
                
                
                
              <td class="body-item mbr-fonts-style display-7">2016-10-17</td><td class="body-item mbr-fonts-style display-7">23:98</td><td class="body-item mbr-fonts-style display-7">04:56</td></tr><tr role="row" class="even">
                
                
                
              <td class="body-item mbr-fonts-style display-7">2016-10-17</td><td class="body-item mbr-fonts-style display-7">07:00</td><td class="body-item mbr-fonts-style display-7">07:23</td></tr></tbody>
          </table></div></div></div>
        </div>
		</div>
	  </div>

  </div>
</asp:Content>