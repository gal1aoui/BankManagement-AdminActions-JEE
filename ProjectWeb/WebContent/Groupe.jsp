<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="t" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultation d'un Groupe</title>
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
<h1 class="mt-3 ml-3 mb-3">	Le Nom de groupe </h1>

	<section class="container-fluid row ml-2">
	  <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="success">${Groupe.name} $</h3>
                  <span>Le nom de ce groupe</span>
                </div>
                <div class="align-self-center">
                  <i class="icon-paper-clip danger font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
</section>

<h1 class="mt-3 ml-3 mb-3">	Les Membres de ce groupe </h1>
	<section class="container-fluid row ml-2">
	  <t:forEach items="${Groupe.groupmembres }" var="c">
	  <div class="col-xl-3 col-sm-6 col-12">
	  <a href="employe?id=${c.employee.id }" class="text-decoration-none">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="success">${c.employee.email} $</h3>
                  <span>Son solde : ${c.employee.solde }$</span>
                </div>
                <div class="align-self-center">
                  <i class="icon-user-following success font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
        </a>
      </div>
</t:forEach>
</body>
</html>