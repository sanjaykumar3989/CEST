<%@ include file="/common/taglibs.jsp"%>
<head>
	<meta charset="utf-8">
	<title>User List</title>
	
	<script src="../js/jquery-ui.js"></script>
	<script src="../js/jquery.validationEngine.js" type="text/javascript" charset="utf-8">	</script>
	<script src="../js/jquery.jqGrid.min.js" type="text/javascript"></script>
	<script src="../js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8">	</script>
	<script src="../js/grid.locale-en.js" type="text/javascript"></script>

	<link href="../css/jquery-ui.css" rel="stylesheet" />
	<link href="../css/ui.jqgrid.css" rel="stylesheet" type="text/css"   />
	<link href="../css/validationEngine.jquery.css" rel="stylesheet"  type="text/css"/>

	
<style>
.lg-center {
 
    margin: 0px auto;
}
 
input , select{
width:80%
}
label {
color : blue;
}
 

</style>
		 
	
</head>
<body>
<a href="../user/login.ext" title="">Back</a></br></br>
	 
 <form action="" id="usrSrcForm" onsubmit="return jQuery(this).validationEngine('validate');" >
 <fieldset  > <legend>Search Info</legend>
<table class="lg-center"  width="80%" height="auto">
	
	<tr>
		<td><label>Name : </label></td>
		<td> <input type="text"  class="validate[custom[onlyLetterNumber]] text-input" name="name" id="name" /></td>
		<td><label>Login Name : </label></td>
		<td> <input type="text" class="validate[ custom[onlyLetterNumber]] text-input"   /></td>
		<td><label>Type : </label></td>
		<td> <input type="text" class="validate[ custom[onlyLetterNumber]] text-input" /></td>
	</tr>
	 
	<tr>
		<td><label>Department : </label></td>
		<td><select  ><option value="A">Department A</option> <option value="B">Department B</option> <option value="C">Department C</option>  </select></td>
		 
		<td><label>Zone : </label></td>
		<td><select ><option value="delhi">Delhi</option> <option value="agra">Agra</option> <option value="noida">Noida</option>  </select></td>
	</tr>
		
	<tr>
		<td colspan="6" align="right">
		<br>
		<button type="submit" id="search" onclick="jQuery('#usrSrcForm').submit();gridReload();" >Search</button>
		<button type="reset" id="clear" onclick="jQuery('#usrSrcForm').validationEngine('hide')">Reset</button>
		</td>
	</tr>
	 
</table>
</fieldset>

</form>
<br />

 
<div class="lg-center" style="width:auto">
	<table id="jqgrid"></table>
	<div id="pjqgrid"></div> 
	
</div>
</br>
</br>
</br>


<script>
$("#search").button();
$("#clear").button();

	var jqgrid_data = [ {
							id : "1",
							name : "Arpit Kumar",
							loginName : "arpit-u",
							dept : "Department A",
							type : "Regular",
							zone : "Delhi",
							mobile: "8285480432"
						}, {
							id : "2",
							name : "Sanjay Kumar",
							loginName : "sanjay-e",
							dept : "Department B",
							type : "Regular BAC",
							zone : "Noida",
							mobile: "3434343433444"
						} ];
	
	function loadDynamic(){
		<c:if test="${userInfoList != null}" >
			jqgrid_data = [ 
		   			<c:forEach var="userInfo" items="${userInfoList}">
		   				{
		   					id : "${userInfo.id}",
		   					name : "${userInfo.userId}",
		   					loginName : "${userInfo.userId}",
		   					dept : "${userInfo.param1}",
		   					type : "${userInfo.type}",
		   					zone : "${userInfo.zone.name}",
		   					mobile: "${userInfo.mobileNumber}"
		   				},
		   			</c:forEach>
		   			];
		</c:if>
	}
	function gridReload(){
		 
		loadDynamic();
		
		jQuery("#jqgrid")
				.jqGrid(
						{
							data : jqgrid_data,
							datatype : "local",
							height : 'auto',
							colNames : [ 'id', 'Name', 'Login Name', 'Department', 'Type', 'Zone', 'Mobile' ],
							colModel : [ {
								name : 'id',
								index : 'id',
								hidden : true
							},{
								name : 'name',
								index : 'name'
							}, {
								name : 'loginName',
								index : 'loginName'
							}, {
								name : 'dept',
								index : 'dept'
							}, {
								name : 'type',
								index : 'type'
							},{
								name : 'zone',
								index : 'zone'
							} , {
								name : 'mobile',
								index : 'mobile'
							}],
							rowNum : 10,
							rowList : [ 10, 20, 30,40,50 ],
							pager : '#pjqgrid',
							sortname : 'id',
							sortorder : "asc",
							editurl : "JQGridServlet",
							caption : "User Data <div style='float:right;margin-right:25px'><a href='../user/addUserForm.ext' >Add User</a></div>",
							multiselect : true,
							autowidth : true,
						});

		
	}
$(document).ready(function() {
	gridReload();
});

	 
</script>
</body>
