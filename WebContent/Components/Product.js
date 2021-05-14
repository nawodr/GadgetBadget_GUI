//hide alert
$(document).ready(function() {

	$("#alertSuccess").hide();
	$("#alertError").hide();
	$("#hidOrderIDSave").val("");
	$("#Product")[0].reset();
});

$(document).on("click", "#btnSave", function(event) {

	// Clear alerts---------------------
	$("#alertSuccess").text("");
	$("#alertSuccess").hide();
	$("#alertError").text("");
	$("#alertError").hide();
	
	// Form validation-------------------
	var status = validateItemForm();
	if (status != true) {
		$("#alertError").text(status);
		$("#alertError").show();
		return;
	}
	
	// If valid------------------------
	var type = ($("#product_Id").val() == "") ? "POST" : "PUT";

	$.ajax({
		url : "ProductAPI",
		type : type,
		data : $("#Product").serialize(),
		dataType : "text",
		complete : function(response, status) {
			console.log(response);
			onItemSaveComplete(response.responseText, status);
		}
	});

});

function onItemSaveComplete(response, status) {
	
	if (status == "success") {
		
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success") {
			
			$("#alertSuccess").text("Successfully saved.");
			$("#alertSuccess").show();
			$("#ProductGrid").html(resultSet.data);
			
		} else if (resultSet.status.trim() == "error") {
			
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
	} 
	else if (status == "error") {
		
		$("#alertError").text("Error while saving.");
		$("#alertError").show();
		
	} else {
		
		$("#alertError").text("Unknown error while saving..");
		$("#alertError").show();
	}
	
	$("#product_Id").val("");
	$("#Product")[0].reset();
}

$(document).on("click", ".btnRemove", function(event) {
	
	$.ajax({
		url : "ProductAPI",
		type : "DELETE",
		data : "product_Id=" + event.target.value,
		dataType : "text",
		complete : function(response, status) {
			onItemDeleteComplete(response.responseText, status);
			window.location.reload(true);
		}
	});
});

function onItemDeleteComplete(response, status) {
	
	if (status == "success") {
		
		var resultSet = JSON.parse(response);
		
		if (resultSet.status.trim() == "success") {
			
			$("#alertSuccess").text("Successfully deleted.");
			$("#alertSuccess").show();
			$("#ProductGrid").html(resultSet.data);
			
		} else if (resultSet.status.trim() == "error") {
			
			$("#alertError").text(resultSet.data);
			$("#alertError").show();
		}
		
	} else if (status == "error") {
		
		$("#alertError").text("Error while deleting.");
		$("#alertError").show();
		
	} else {
		
		$("#alertError").text("Unknown error while deleting..");
		$("#alertError").show();
	}
}

// UPDATE==========================================
$(document).on("click",".btnUpdate",function(event)
		{
			$("#product_Id").val($(this).closest("tr").find('td:eq(0)').text());
			$("#product_Name").val($(this).closest("tr").find('td:eq(1)').text());
			$("#product_Category").val($(this).closest("tr").find('td:eq(2)').text());
			$("#product_Price").val($(this).closest("tr").find('td:eq(3)').text());
			$("#product_Description").val($(this).closest("tr").find('td:eq(4)').text());	
		});


// CLIENTMODEL=========================================================================
function validateItemForm() {
	
	if ($("#product_Name").val().trim() == "") {
		return "Please insert Product Name.";
	}
	
	if ($("#product_Category").val().trim() == "") {
		return "Please insert Product Category.";
	}
	
	if ($("#product_Price").val().trim() == "") {
		return "Please insert Product Price.";
	}

	if ($("#product_Description").val().trim() == "") {
		return "Please insert Product Description.";
	}
	
	
	
	return true;
}
