<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="t" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Opération Verser</title>
<%@include file="Scripts.jsp" %>
</head>
<body>
<div style="position:absolute; top:5%; left:88%; right:0;">
<a href="consultation">    
    <button class="btn btn-outline-primary d-flex">
        <span style="margin-top: 3px" class="mr-1 spinner-border primary spinner-border-sm" role="status"></span>
        Retour
    </button>
</a>
</div>
<h1 class="mt-3 ml-3 mb-3">	Opération de versement </h1>
	<div class="container">
		<form action="verser" method="post">	
			<div class="col-12">
				<div class="card">
          			<div class="card-content">
            			<div class="card-body">
              				<div class="media d-flex">
                				<div class="media-body text-left">
                  					<h3 class="success">Choisissez le Compte</h3>
                  						<span>
                  							<div class="form-group">
      				 							<select class="form-select border border-secondary" name="compte">
        										<t:forEach items="${Comptes}" var="c">
        											<option value="${c.id}"> ${c.id} -- ${c.client.name} -- ${c.solde }$ </option>
        										</t:forEach>
      				 							</select>
     										</div>
                  						</span>
               					</div>
                				<div class="align-self-center">
                  						<i class="icon-credit-card success font-large-2 float-right"></i>
                				</div>
              				</div>
            			</div>
          			</div>
        		</div>
			</div>
			
			<div class="col-12">
				<div class="card">
          			<div class="card-content">
            			<div class="card-body">
              				<div class="media d-flex">
                				<div class="media-body text-left">
                  					<h3 class="success">Combien ?</h3>
                  					  <span>
                  						<div class="form-group mb-3">
                    						<input class="form-control form-control-lg" placeholder="Le Montant" type="number" name ="montant">
                						</div>
                  					  </span>
               					</div>
                				<div class="align-self-center">
                  						<i class="icon-wallet success font-large-2 float-right"></i>
                				</div>
              				</div>
            			</div>
          			</div>
        		</div>
			</div>
			
			<div class="col-12">
				<div class="card">
          			<div class="card-content">
            			<div class="card-body">
              				<div class="media d-flex">
                				<div class="media-body text-left">
                  					<h3 class="success">Le Responsable de cette transaction</h3>
                  						<span>
                  							<div class="form-group">
      				 							<select class="form-select border border-secondary" name="emp">
        										<t:forEach items="${Employes}" var="c">
        											<option value="${c.id}"> ${c.id} -- ${c.email} -- ${c.solde }$ </option>
        										</t:forEach>
      				 							</select>
     										</div>
                  						</span>
               					</div>
                				<div class="align-self-center">
                  						<i class="icon-earphones-alt success font-large-2 float-right"></i>
                				</div>
              				</div>
            			</div>
          			</div>
        		</div>
			</div>
			<button class="btn btn-outline-success col"> Verser </button>
		</form>

<h1 class="mt-3 ml-3 mb-3">	L'historique de Versement </h1>
		
<table class="table table-hover">
  <thead>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">Montant</th>
      <th scope="col">Le Nom de Client</th>
      <th scope="col">Date de Transactions</th>
    </tr>
  </thead>
  <tbody>
  <t:forEach items="${Operations}" var="o">
  <t:if test="${o.class.name == 'compte.operations.Versement'}">
    <tr class="table-success">
      <th scope="row"> ${o.id} </th>
      <td> ${o.solde } </td>
      <td>${o.compte.client.name }</td>
      <td>${o.createdAt}</td>
    </tr>
    </t:if>
  </t:forEach>
  </tbody>
</table>
	</div>
</body>
</html>