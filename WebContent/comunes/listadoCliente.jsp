<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:setLocale value="es_PE" />

<section>
	<div class="container">
		<div class="row">
			<div class="col-md-9">
			<div class="card border-0">
				<div class="card-header" style="background-color:#15fb90;">
					<h4>Listado de cliente</h4>
				</div>
				<table class="table table-striped">
					<thead>
						<tr>
							<th scope="col">#</th>
							<th scope="col">Nombre Apellido</th>
							<th scope="col">Saldo</th>
							<th scope="col">Accion</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach var="cliente" items="${clientes}">
							<tr>
								<th scope="row">${cliente.idCliente }</th>
								<td>${cliente.nombre }  ${cliente.apellido }</td>
								<td><fmt:formatNumber value="${cliente.saldo }" type="currency"/></td>
								<td>
								 <a  class="btn btn-warning"
								 href="${pageContext.request.contextPath}/ServletControlador?accion=editar&idCliente=${cliente.idCliente}">
								 <i class="fas fa-angle-double-right"></i> Editar</a>
								</td>
							</tr>

						</c:forEach>

					</tbody>
				</table>
			</div>
				
			</div>
		 <!--  tarjetas para totales -->
		 <div class="col-md-3">
		 	<div class="card text-center bg-danger text-white mb-3">
			 	 <div class="card_body mt-3">
			 		<h3>Saldo Total </h3>
			 		<h4  class="display-4">
			 			<fmt:formatNumber value="${saldoTotal}" type="currency"></fmt:formatNumber>
			 		</h4>
			 	</div>
		 	</div>	
		 	<div class="card text-center bg-success text-white mb-3">
			 	 <div class="card_body">
			 		<h3> Total Cliente </h3>
			 		<h4  class="display-4">
			 			<i class="fas fa-users"></i> ${totalClientes}
			 		</h4>
			 	</div>
		 	</div>
		 </div>
		 <!-- fin 2da de tarjeta totales -->
		</div>
	</div>
</section>

<jsp:include page="../agregarCliente.jsp" /> 

