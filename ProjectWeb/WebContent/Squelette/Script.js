function ses(){
op = document.getElementById('option').value;
if(op == "Courant"){
	document.getElementById('td').style.display = "block";
	document.getElementById('ti').style.display = "none";
}else{
	document.getElementById('td').style.display = "none";
	document.getElementById('ti').style.display = "block";
}
}