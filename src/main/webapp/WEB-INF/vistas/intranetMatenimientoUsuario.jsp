<jsp:include page="intranetValida.jsp" />
<!DOCTYPE html>
<html lang="esS" >
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta http-equiv="Expires" content="-1" />
<meta http-equiv="Cache-Control" content="private" />
<meta http-equiv="Cache-Control" content="no-store" />
<meta http-equiv="Pragma" content="no-cache" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/jquery.dataTables.min.js"></script>
<script type="text/javascript" src="js/dataTables.bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrap.min.js"></script>
<script type="text/javascript" src="js/bootstrapValidator.js"></script>
<script type="text/javascript" src="js/global.js"></script>

<link rel="stylesheet" href="css/bootstrap.css"/>
<link rel="stylesheet" href="css/dataTables.bootstrap.min.css"/>
<link rel="stylesheet" href="css/bootstrapValidator.css"/>

<title>Intranet</title>
</head>
<body>
<jsp:include page="intranetCabecera.jsp" />
<div class="container" style="margin-top: 4%"><h4>Matenimiento Usuario</h4></div>

<div class="container" style="margin-top: 1%">
			<!------------------------------ Cabecera -->
			<div class="row" style="height: 70px">
				<div class="col-md-5" >
						<input class="form-control" id="id_txt_filtro"  name="filtro" placeholder="Ingrese el nombre y/o apellido" type="text" maxlength="30"/>
				</div>
				<div class="col-md-2" >
					<button type="button" class="btn btn-primary" id="id_btn_filtrar" style="width: 150px">FILTRA</button>
				</div>
				<div class="col-md-2">
					<button type="button" data-toggle='modal'  data-target="#id_div_modal_registra"  class='btn btn-success' style="width: 150px">REGISTRA</button>
				</div>
			</div>
			<!------------------------------ Grilla -->
			<div class="row" > 
				<div class="col-md-12">
						<div class="content" >
							<table id="id_table" class="table table-striped table-bordered" >
								<thead>
									<tr>
										<th style="width: 5%" >Código</th>
										<th style="width: 12%">Nombres</th>
										<th style="width: 12%">Apellidos</th>
										<th style="width: 8%">DNI</th>
										<th style="width: 13%">Login</th>
										<th style="width: 10%">Correo</th>
										<th style="width: 8%">Estado</th>
									</tr>
								</thead>
								</table>
						</div>	
				</div>
			</div>
			
			<!--------------------------------------- MODAL de Registro ----------------------------------------------->
		  	 <div class="modal fade" id="id_div_modal_registra" >
					<div class="modal-dialog" style="width: 60%">
						<!-- Modal content-->
						<div class="modal-content">
						<div class="modal-header" style="padding: 35px 50px">
							<button type="button" class="close" data-dismiss="modal">&times;</button>
							<h4><span class="glyphicon glyphicon-ok-sign"></span> Registro de Usuario</h4>
						</div>
						<div class="modal-body" style="padding: 20px 10px;">
								<form id="id_form_registra" accept-charset="UTF-8" class="form-horizontal"  method="post">
				                    <div class="panel-group" id="steps">
				                        <!-- Step 1 -->
				                        <div class="panel panel-default">
				                            <div class="panel-heading">
				                                <h4 class="panel-title"><a data-toggle="collapse" data-parent="#steps" href="#stepOne">Datos del Usuario</a></h4>
				                            </div>
				                            <div id="stepOne" class="panel-collapse collapse in">
				                                <div class="panel-body">
				                                     <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_nombres">Nombres</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_reg_nombres" name="nombres" placeholder="Ingrese el nombre" type="text" maxlength="50"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_apellidos">Apellidos</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_reg_apellidos" name="apellidos" placeholder="Ingrese los apellidos" type="text" maxlength="50"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_dni">DNI</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_reg_dni" name="dni" placeholder="Ingrese el DNI" type="text" maxlength="8"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_login">Login</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_reg_login" name="login" placeholder="Ingrese el Login" type="text" maxlength="20"/>
				                                        </div>
				                                    </div>
				                                     <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_login">Clave</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_reg_login" name="password" placeholder="Ingrese el Login" type="password" maxlength="20"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_correo">Correo</label>
				                                        <div class="col-lg-8">
															<input class="form-control" id="id_reg_correo" name="correo" placeholder="Ingrese el correo" type="text" maxlength="50"/>
				                                        </div>
				                                    </div>
				                                    <div class="form-group">
				                                        <label class="col-lg-3 control-label" for="id_reg_fechaNacimiento">Fecha de Nacimiento</label>
				                                        <div class="col-lg-3">
															<input class="form-control" id="id_reg_fechaNacimiento" name="fechaNacimiento" type="date"/>
				                                        </div>
				                                    </div>		   
				                                    <div class="form-group">
				                                        <div class="col-lg-9 col-lg-offset-3">
				                                        	<button type="button" class="btn btn-primary" id="id_btn_registra">REGISTRAR</button>
				                                        </div>
				                                    </div>
				                                </div>
				                            </div>
				                        </div>          
				                    </div>
				                </form>   
						</div>
					</div>
				</div>		
			</div>
</div>			
			

<script type="text/javascript">
//--------------------- Mostrar datos en grilla al cargar
$(document).ready(function() {
	$.getJSON("consultaCrudUsuario",{"filtro":""}, function (listaUsuario){
		agregarGrilla(listaUsuario);
	});
});

function agregarGrilla(listaUsuario){
	 $('#id_table').DataTable().clear();
	 $('#id_table').DataTable().destroy();
	 $('#id_table').DataTable({
			data: listaUsuario,
			searching: false,
			ordering: true,
			processing: true,
			pageLength: 5,
			lengthChange: false,
			columns:[
				{data: "idUsuario"},
				{data: "nombres"},
				{data: "apellidos"},
				{data: "dni"},
				{data: "login"}, 
				{data: "correo"},
				{data: function(row, type, val, meta){
					var salida = (row.estado == 1) ? 'Activo' : "Inactivo" ;
					return salida;
				},className:'text-center'},
			]                                     
	    });
}

//------------------------ btn FILTRAR ---------------------------
$("#id_btn_filtrar").click(function(){
	var fil=$("#id_txt_filtro").val();
	$.getJSON("consultaCrudUsuario",{"filtro":fil}, function (listaUsuario){
		agregarGrilla(listaUsuario);
	});
});

function limpiarFormulario(){
	$("#id_reg_nombres").val('');
	$("#id_reg_apellidos").val('');
	$("#id_reg_telefono").val('');
	$("#id_reg_dni").val('');
	$("#id_reg_correo").val('');
	$("#id_reg_fechaNacimiento").val('');
	$("#id_reg_pais").val(' ');
	$("#id_reg_modalidad").val(' ');
} 

//------------------------ botón REGISTRAR ------------------------
$("#id_btn_registra").click(function(){
	var validator = $('#id_form_registra').data('bootstrapValidator');
    validator.validate();
	
    if (validator.isValid()) {
        $.ajax({
          type: "POST",
          url: "registraCrudUsuario", 
          data: $('#id_form_registra').serialize(),
          success: function(data){
        	  agregarGrilla(data.lista); //'lista' viene de la "lista" creada en el Controller
        	  $('#id_div_modal_registra').modal("hide");
        	  mostrarMensaje(data.mensaje);
        	  limpiarFormulario();
        	  validator.resetForm();
          },
          error: function(){
        	  mostrarMensaje(MSG_ERROR);
          }
        });
        
    }
});



//---------- Validaciones Model Registra ----------------------
$(document).ready(function() {
    $('#id_form_registra').bootstrapValidator({
        message: 'This value is not valid',
        feedbackIcons: {
            valid: 'glyphicon glyphicon-ok',
            invalid: 'glyphicon glyphicon-remove',
            validating: 'glyphicon glyphicon-refresh'
        },
        fields: {
        		nombres:{
                    selector: "#id_reg_nombres",
                    validators:{
                        notEmpty: {
                             message: 'El nombre es obligatorio'
                        },
                        stringLength: {
                            min: 2,
                            max: 40,
                            message: 'El nombre es de 2 a 40 caracteres'
                        },
                    }
                },
                apellidos:{
                    selector: "#id_reg_apellidos",
                    validators:{
                        notEmpty: {
                             message: 'Los apellidos son obligatorios'
                        },
                        stringLength: {
                        	min: 2,
                            max: 40,
                            message: 'Los apellidos son de 2 a 40 caracteres '
                        },
                    }
                },
                dni:{
                    selector: "#id_reg_dni",
                    validators:{
                        notEmpty: {
                             message: 'El DNI es obligatorio'
                        },
                        stringLength: {
                        	max: 8,
                        	min: 8,
                            message: 'El DNI es de 8 dígitos'
                        },
                        regexp: {
                            regexp: /^[0-9]+$/,
                            message: 'Ingresar DNI con caracteres numéricos'
                        }
                    }
                },
                login:{
                    selector: "#id_reg_login",
                    validators:{
                        notEmpty: {
                             message: 'El Login es obligatorio'
                        },
                    }
                },
                password:{
                    selector: "#id_reg_password",
                    validators:{
                        notEmpty: {
                             message: 'El Login es obligatorio'
                        },
                    }
                },
                correo:{
                    selector: "#id_reg_correo",
                    validators:{
                        notEmpty: {
                             message: 'El correo es obligatorio'
                        },
                        emailAddress: {
                            message: 'El correo no es válido'
                        },
                        regexp: {
                            regexp: /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/,
                            message: 'Ingresar un correo válido'
                        }
                    }
                },
                fechaNacimiento:{
                    selector: "#id_reg_fechaNacimiento",
                    validators:{
                        notEmpty: {
                             message: 'La fecha de nacimiento es obligatoria'
                        },
                    }
                },
              
        }   
    });
});






</script>   		
</body>
</html>