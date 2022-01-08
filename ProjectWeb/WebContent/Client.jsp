<%@include file="Squelette/Base.jsp"%>
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
                  <h4 class="success">${Client.name }</h4>
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
                  <h4 class="success">${Client.email }</h4>
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
                  <h4 class="success">${Client.password }</h4>
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
<h1 class="mt-3 ml-3 mb-3">	Les Comptes associé é ce client </h1>

	<section class="container-fluid row ml-2">
	  <t:forEach items="${Comptes }" var="c">
	  <t:if test="${c.class.name == 'compte.comptes.CompteCourant' }">
	  <div class="col-xl-3 col-sm-6 col-12">
        <div class="card">
          <div class="card-content">
            <div class="card-body">
              <div class="media d-flex">
                <div class="media-body text-left">
                  <h4 class="success">${c.solde} $</h4>
                  <span>Créer par ${c.employee.email}</span>
                  <br/>
                  <span>Type de Compte : Courant avec Découvert de ${c.decouvert }$  </span>
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
                  <h4 class="success">${c.solde} $</h4>
                  <span>Créer par ${c.employee.email}</span>
                  <br/>
                  <span>Type de Compte : Epargne avec Taux d'intéret de ${c.taux }$  </span>
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
<%@include file="Squelette/Footer.jsp"%>