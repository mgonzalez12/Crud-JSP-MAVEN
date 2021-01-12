<!-- Modal -->
<div class="modal fade" id="agregarClienteModal" tabindex="-1"
	aria-labelledby="agregarClienteModal" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title">Agregar Clientee</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form
					action="${pageContext.request.contextPath}/ServletControlador?accion=insertar"
					method="post" class="was-validated">
					<div class="modal-body">
						<div class="form-group">
							<label for="nombre">Nombre</label> <input type="text"
								name="nombre" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="apellido">Apellido</label> <input type="text"
								name="apellido" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="email">Email</label> <input type="email" name="email"
								class="form-control" required>
						</div>
						<div class="form-group">
							<label for="telefono">Telefono</label> <input type="text"
								name="telefono" class="form-control" required>
						</div>
						<div class="form-group">
							<label for="saldo">Saldo</label> <input type="text" name="saldo"
								class="form-control" required>
						</div>

					</div>
					<div class="modal-footer">
						<button type="submit" class="btn btn-primary" >Guardar</button>
					</div>
				</form>
			</div>

		</div>
	</div>
</div>