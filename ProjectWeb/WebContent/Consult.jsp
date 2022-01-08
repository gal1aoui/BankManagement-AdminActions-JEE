<%@include file="Squelette/Base.jsp"%>
<div style="position:absolute; top:5%; left:88%; right:0;">
<a href="creation">    
    <button class="btn btn-outline-danger d-flex">
        <span style="margin-top: 3px" class="mr-1 spinner-border danger spinner-border-sm" role="status"></span>
        Creation
    </button>
</a>
</div>

<div class="container"> 
  <div class="row">
	<div class="col">
	 <form class="form-group" action="chercheclient">
      <label for="exampleSelect1" class="form-label mt-4">Chercher un Client Par nom</label>
      	<div class="d-flex">
            <input class="form-control form-control-lg" placeholder="Taper le Nom de client" type="text" name="nom" required>
        	<button class="btn btn-outline-primary">
        	Chercher
        </button>
        </div>
     </form>
    </div>
    
  </div>
  <br/>
  <h4>Effectuer une Operation</h4>
  <div class="row">
	<div class="col-6">	<a class="btn btn-outline-success col" href="verser"> Verser</a> </div>
	<div class="col-6">	<a class="btn btn-outline-danger col" href="retrait"> Retrait</a> </div>
  </div>
</div>


<h1 class="mt-3 ml-3 mb-3">	Liste des Clients </h1>

	<section class="container-fluid row ml-2">
	  <t:forEach items="${Clients}" var="c">
	  	  
	  <div class="col-xl-3 col-sm-6 col-12">
	  <form method="post" action="consultation?id=${c.id}">
        <button class="btn btn-danger" name="Clientremove">
            <span class="mr-1 spinner-grow light spinner-grow-sm" role="status"></span>
            Supprimer</button>
      </form>
      <a href="client?id=${c.id}">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h4 class="success">${c.email }</h4>
                  <span>${c.name }</span>
                </div>
                <div class="align-self-center">
                  <i class="icon-user success font-large-2 float-right"></i>
                </div>
              </div>
            </div>
          </div>
        </div>
     </a>
      </div>
    
      </t:forEach>
	</section>
	
	<h1 class="mt-3 ml-3 mb-3">	Liste des Employes </h1>

	<section class="container-fluid row ml-2">
	  <t:forEach items="${Employes}" var="c">
	  
	  
	  <div class="col-xl-3 col-sm-6 col-12">
	  <form method="post" action="consultation?id=${c.id}">
        <button class="btn btn-danger" name="Employeremove">
            <span class="mr-1 spinner-grow light spinner-grow-sm" role="status"></span>
            Supprimer</button>
      </form>
      <a href="employe?id=${c.id}">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h4 class="success">${c.email }</h4>
                  <span> ${c.solde} $</span>
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
	</section>
	
	<h1 class="mt-3 ml-3 mb-3">	Liste des Groupes </h1>

	<section class="container-fluid row ml-2">
	  <t:forEach items="${Groupes}" var="c">
	  
	  
	  <div class="col-xl-3 col-sm-6 col-12">
	  <form method="post" action="consultation?id=${c.id}">
        <button class="btn btn-danger" name="Groupremove">
            <span class="mr-1 spinner-grow light spinner-grow-sm" role="status"></span>
            Supprimer</button>
      </form>
	<a href="groupe?id=${c.id}">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h4 class="success">${c.name }</h4>
                  <% int s =0; %>
                  <span> <t:forEach items="${c.groupmembres}" var="d">${d.employee.email}<br> <%s++; %> </t:forEach> 
                 </span>
                </div>
                <div class="align-self-center">
                  <i class="icon-users success font-large-2 float-right"></i>
              
                </div>
                <p class="success">(<%=s %>)</p>
              </div>
            </div>
          </div>
        </div>
     </a>
      </div>
      
      </t:forEach>
	</section>
  <%@include file="Squelette/Footer.jsp"%>