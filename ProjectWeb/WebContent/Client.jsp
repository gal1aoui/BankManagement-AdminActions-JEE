<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="t" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Consultation d'un Client</title>
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
<h1 class="mt-3 ml-3 mb-3">	Les information de ce client </h1>

	<section class="container-fluid row ml-2">
	  
	  <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="success">${Client.name }</h3>
                  <span>Nom de ce client</span>
                </div>
                <div class="align-self-center">
                  <i class="icon-user success font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="success">${Client.email }</h3>
                  <span>email de ce client</span>
                </div>
                <div class="align-self-center">
                  <i class="icon-envelope-open success font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      
      <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="success">${Client.password }</h3>
                  <span>Mot de passe de ce client</span>
                </div>
                <div class="align-self-center">
                  <i class="icon-shield success font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
	</section>
<h1 class="mt-3 ml-3 mb-3">	Les Comptes associ� � ce client </h1>

	<section class="container-fluid row ml-2">
	  <t:forEach items="${Comptes }" var="c">
	  <t:if test="${c.class.name == 'compte.comptes.CompteCourant' }">
	  <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="success">${c.solde} $</h3>
                  <span>Cr�er par ${c.employee.email}</span>
                  <br/>
                  <span>Type de Compte : Courant avec D�couvert de ${c.decouvert }$  </span>
                </div>
                <div class="align-self-center">
                  <i class="icon-notebook success font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </t:if>
      <t:if test="${c.class.name == 'compte.comptes.CompteEpargne' }">
	  <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h3 class="success">${c.solde} $</h3>
                  <span>Cr�er par ${c.employee.email}</span>
                  <br/>
                  <span>Type de Compte : Epargne avec Taux d'int�ret de ${c.taux }$  </span>
                </div>
                <div class="align-self-center">
                  <i class="icon-notebook success font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      </t:if>
</t:forEach>
</section>
</body>
</html>