<%@include file="Squelette/Base.jsp"%>
<div style="position:absolute; top:5%; left:88%; right:0;">
<a href="consultation">    
    <button class="btn btn-outline-primary d-flex">
        <span style="margin-top: 3px" class="mr-1 spinner-border primary spinner-border-sm" role="status"></span>
        Retour
    </button>
</a>
</div>
<h1 class="mt-3 ml-3 mb-3">	Les information de cet Employ� </h1>

	<section class="container-fluid row ml-2">
	  
	  <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h4 class="success">${Employe.solde }$</h4>
                  <span>Nom de cet Employ�</span>
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
                  <h4 class="success">${Employe.email }</h4>
                  <span>email de cet Employ�</span>
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
                  <h4 class="success">${Employe.password }</h4>
                  <span>Mot de passe de cet Employ�</span>
                </div>
                <div class="align-self-center">
                  <i class="icon-shield success font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
<t:if test="${Employe.upperHierarchy != null}">      
      <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h4 class="success">${Employe.upperHierarchy.email }</h4>
                  <span>l'email de sup�rieur hi�rarchique de cet Employ�</span>
                </div>
                <div class="align-self-center">
                  <i class="icon-eye success font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
	</section>
</t:if>
<h1 class="mt-3 ml-3 mb-3">	Les Comptes cr�er par cet Employ� </h1>

	<section class="container-fluid row ml-2">
	  <t:forEach items="${Employe.comptes }" var="c">
	  <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h4 class="success">${c.client.name}</h4>
                  <span>Le solde attribuer ${c.solde}$</span>
                </div>
                <div class="align-self-center">
                  <i class="icon-credit-card success font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
</t:forEach>
</section>
<h1 class="mt-3 ml-3 mb-3">Ajouter ou Modifier le sup�rieur hi�rarchique de cet Employ�</h1>
	
	<section class="container-fluid row ml-2">
	  <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
              <form class="d-flex" method="post" action="employe?id=${Employe.id}">
                <div class="media-body text-left mt-1">
                  <select class="form-select border border-secondary" name="sup">
        				<t:forEach items="${Employes}" var="c">
        					<t:if test="${ c.id != Employe.id }">
        						<option value="${c.id}"> ${c.id} -- ${c.email} -- ${c.solde} $ </option>
        					</t:if>
        				</t:forEach>
      			  </select>
                </div>
                <div class="align-self-center">
                  <button class="icon-user-follow success font-large-2 float-right btn" name="EmployeSup"></button>
                </div>
                </form>
              </div>
            </div>
          </div>
        </div>
      </div>
</section>
<%@include file="Squelette/Footer.jsp"%>