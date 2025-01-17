<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="t" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Creation</title>
<link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.min.css">
</head>
<style>
body,html{
	height:100%;
}
</style>
<script src="Squelette/Script.js"></script>
<body>

<div style="position:absolute; top:5%; left:88%; right:0;">
<a href="consultation">    
    <button class="btn btn-outline-primary d-flex">
        <span style="margin-top: 3px" class="mr-1 spinner-border primary spinner-border-sm" role="status"></span>
        Retour
    </button>
</a>
</div>
	<div class="container h-100">
    <div class="row justify-content-center align-items-center h-100">
        <div class="col">
            <ul class="nav nav-tabs">
  				<li class="nav-item">
    				<a class="nav-link active" data-bs-toggle="tab" href="#client">Ajouter un Client</a>
  				</li>
  				<li class="nav-item">
    				<a class="nav-link" data-bs-toggle="tab" href="#employe">Ajouter un Employe</a>
  				</li>
  				<li class="nav-item">
    				<a class="nav-link" data-bs-toggle="tab" href="#groupe">Ajouter un Groupe</a>
  				</li>
  				<li class="nav-item">
    				<a class="nav-link" data-bs-toggle="tab" href="#compte">Ajouter un Compte</a>
  				</li>
  				<li class="nav-item">
    				<a class="nav-link" data-bs-toggle="tab" href="#empGrp">Ajouter un Employe a un groupe</a>
  				</li>
  				<li class="nav-item">
    				<a class="nav-link bg-success" href="consultation">Consulter la liste >></a>
  				</li>
			</ul>
	<div id="myTabContent" class="tab-content mt-2">
  	<div class="tab-pane fade show active" id="client">
   			<form action="client" method="post">
                <div class="form-group mb-3">
                    <input class="form-control form-control-lg" placeholder="Le Nom de client" type="text" name="nom" required>
                </div>
                <div class="form-group mb-3">
                    <input class="form-control form-control-lg" placeholder="L'email de client" type="email" name="email" required>
                </div>
                <div class="form-group mb-3">
                    <input class="form-control form-control-lg" placeholder="Le mot de passe de ce client" type="password" name="password" required>
                </div>
                <div class="form-group">
                    <button class="btn btn-info btn-lg btn-block">Cr�er ce client</button>
                </div>
            </form>
  	</div>
  	<div class="tab-pane fade" id="employe">
    <form action="employe" method="post">
                <div class="form-group mb-3">
                    <input class="form-control form-control-lg" placeholder="L'email d'employe" type="email" name="eemail" required>
                </div>
                <div class="form-group mb-3">
                    <input class="form-control form-control-lg" placeholder="Le mot de passe de cet employ�" type="password" name="epass" required>
                </div>
                <div class="form-group mb-3">
                    <input class="form-control form-control-lg" placeholder="Le solde de cet employ�" type="number" name="esolde" required>
                </div>
                <div class="form-group">
                    <button class="btn btn-info btn-lg btn-block">Cr�er cet employ�</button>
                </div>
            </form>
  	</div>
  	<div class="tab-pane fade" id="groupe">
    <form action="groupe" method="post">
                <div class="form-group mb-3">
                    <input class="form-control form-control-lg" placeholder="Le Nom de Groupe" type="text" name="gname" required>
                </div>
                <div class="form-group">
                    <button class="btn btn-info btn-block">Cr�er ce groupe</button>
                </div>
    </form>
    </div>
    <div class="tab-pane fade" id="compte">
    <form action="creation" method="post">
                <div class="form-group">
      				<label for="exampleSelect1" class="form-label mt-4">Choisir le type de Compte</label>
      				 <select onchange="ses()" class="form-select border border-secondary" id="option" name="ctype">
        				<option value="Courant"> Courant </option>
        				<option value="Epargne"> Epargne </option>
        			 </select>
     			</div>
                <div class="form-group">
      				<label for="exampleSelect1" class="form-label mt-4">Choisissez le Client</label>
      				 <select class="form-select border border-secondary" name="cclient">
        				<t:forEach items="${Clients}" var="c">
        				<option value="${c.id}"> ${c.id} -- ${c.name} </option>
        				</t:forEach>
      				 </select>
     			</div>
     			<div class="form-group mb-3">
      				<label for="exampleSelect1" class="form-label mt-4">Choisissez l'employ�</label>
      				 <select class="form-select border border-secondary" name="cemploye">
        				<t:forEach items="${Employes}" var="c">
        				<option value="${c.id}"> ${c.id} -- ${c.email} -- ${c.solde} $ </option>
        				</t:forEach>
      				 </select>
     			</div>
     			<div class="form-group mb-3">
                    <input class="form-control form-control-lg" placeholder="Le Solde de ce compte" type="number" name="csolde" required>
                </div>
                <div class="form-group mb-3" id="td" >
                    <input class="form-control form-control-lg" placeholder="Le D�couvert" type="number" name="cdec">
                </div>
                <div class="form-group mb-3" id="ti" style="display:none;">
                    <input class="form-control form-control-lg" placeholder="Le Taux d'interet" type="number" name="cint">
                </div>
                <div class="form-group">
                    <button class="btn btn-info btn-block">Cr�er ce compte</button>
                </div>
    </form>
    </div>
    <div class="tab-pane fade" id="empGrp">
    <form action="creation" method="post">
    	<div class="form-group mb-3">
      				<label for="exampleSelect1" class="form-label mt-4">Choisissez l'employ�</label>
      				 <select class="form-select border border-secondary" name="empgrp">
        				<t:forEach items="${Employes}" var="c">
        				<option value="${c.id}"> ${c.id} -- ${c.email} -- ${c.solde} $ </option>
        				</t:forEach>
      				 </select>
     			</div>
    	<div class="form-group mb-3">
      				<label for="exampleSelect1" class="form-label mt-4">Choisissez auquel Groupe</label>
      				 <select class="form-select border border-secondary" name="grpemp">
        				<t:forEach items="${Groupes}" var="c">
        				<option value="${c.id}"> ${c.id} -- ${c.name}</option>
        				</t:forEach>
      				 </select>
     			</div>
     	<div class="form-group">
                    <button class="btn btn-info btn-block">Effectuer cette action</button>
                </div>
    </form>
    </div>
</div>
</div>
</div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>