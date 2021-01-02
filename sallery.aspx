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
                      MONTH</th>
									  <th class="head-item mbr-fonts-style display-7 sorting" >
                      TOTAL SALARY</th>
									  <th class="head-item mbr-fonts-style display-7 sorting" >
                       PREMIUM</th>
									  <th class="head-item mbr-fonts-style display-7 sorting" >
                       DISCOUNTS</th>
									  <th class="head-item mbr-fonts-style display-7 sorting" >
                       NET SALARY</th>
								  </tr>
            </thead>
						  <thead>
              <tr class="table-heads " role="row" style="height: 0px;"><th class="head-item mbr-fonts-style display-7 sorting" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 148px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="
                       MONTH: activate to sort column ascending"><div class="dataTables_sizing" style="height:0;overflow:hidden;">
                       MONTH</div></th><th class="head-item mbr-fonts-style display-7 sorting" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 437px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="
                      TOTAL SALARY: activate to sort column ascending"><div class="dataTables_sizing" style="height:0;overflow:hidden;">
                      TOTAL SALARY</div></th><th class="head-item mbr-fonts-style display-7 sorting" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 246px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="
                      PREMIUM: activate to sort column ascending"><div class="dataTables_sizing" style="height:0;overflow:hidden;">
                      PREMIUM</div></th><th class="head-item mbr-fonts-style display-7 sorting" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 346px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="
                      DISCOUNTS: activate to sort column ascending"><div class="dataTables_sizing" style="height:0;overflow:hidden;">
                      DISCOUNTS</div></th><th class="head-item mbr-fonts-style display-7 sorting" aria-controls="DataTables_Table_0" rowspan="1" colspan="1" style="width: 310px; padding-top: 0px; padding-bottom: 0px; border-top-width: 0px; border-bottom-width: 0px; height: 0px;" aria-label="
                      NET SALARY: activate to sort column ascending"><div class="dataTables_sizing" style="height:0;overflow:hidden;">
                      NET SALARY</div></th></tr>
            </thead>
					
            <tbody>
              
              
              
              
            <tr role="row" class="odd"> 
                
                
                
                
              <td class="body-item mbr-fonts-style display-7">January</td><td class="body-item mbr-fonts-style display-7">2398</td><td class="body-item mbr-fonts-style display-7">456</td><td class="body-item mbr-fonts-style display-7">983</td><td class="body-item mbr-fonts-style display-7">1983</td></tr><tr role="row" class="even">
                
                
                
                
              <td class="body-item mbr-fonts-style display-7">February</td><td class="body-item mbr-fonts-style display-7">3587</td><td class="body-item mbr-fonts-style display-7">34</td><td class="body-item mbr-fonts-style display-7">998</td><td class="body-item mbr-fonts-style display-7">1998</td></tr><tr role="row" class="odd">
                
                
                
                
              <td class="body-item mbr-fonts-style display-7">March</td><td class="body-item mbr-fonts-style display-7">2398</td><td class="body-item mbr-fonts-style display-7">456</td><td class="body-item mbr-fonts-style display-7">983</td><td class="body-item mbr-fonts-style display-7">1983</td></tr><tr role="row" class="even">
                
                
                
              <td class="body-item mbr-fonts-style display-7">April</td><td class="body-item mbr-fonts-style display-7">70</td><td class="body-item mbr-fonts-style display-7">766</td><td class="body-item mbr-fonts-style display-7">1234</td><td class="body-item mbr-fonts-style display-7">2838</td></tr></tbody>
          </table></div></div></div>
        </div>
		</div>
	  </div>

  </div>
</asp:Content>