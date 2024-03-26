<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Menuprincipal.Master" CodeBehind="Encuesta.aspx.vb" Inherits="Examen2_progra2Steven.Encuesta" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .texto-blancoTITULO {
            color: white;
            font-size: 31px; /* tamaño */
        }
        .contenedor-centrado {
            margin-top: 100px; /* top es desde arriba*/
            display: flex;
            justify-content: center; /*centrado horizontal*/
        }
        .formulario-encuesta {
            width: 500%; /* ancho */
            max-width: 200px; /* ancho máximo del formulario */
        }
        .espacio-inferior {
            margin-bottom: 10px; 
        }
        .mensaje-bienvenida {
            font-size: 15px; /* tamaño del texto */
            margin-bottom: 20px; 
            color: white; /* texto en blanco */
        }
        .mensaje-error {
            width: 200px;
            height: 150px;
            background-color: lightblue;
            position: absolute; 
            left: 50%; 
            top: 50%; 
            transform: translate(-50%, -50%); 
        }
        .espacio-entre {
            margin-bottom: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
        <img src="IMG/u_hispa%20(1).png" width="125" height="125" style="position: absolute; top: 0; right: 0;"/>
    </div>
    <script type="text/javascript">
        function validarEncuesta() {
            var nombre = document.getElementById("fname").value;
            var apellido = document.getElementById("lname").value;
            var fechaNacimiento = document.getElementById("bday").value;
            var correo = document.getElementById("Correo").value;

            // verificacion de campos está vacios
            if (nombre === "" || apellido === "" || fechaNacimiento === "" || correo === "") {
                alert("Por favor complete todos los campos.");
                return false; // Detener el envío del formulario
            }

            // Calcular la edad a partir de la fecha de nacimiento
            var hoy = new Date();
            var fechaNac = new Date(fechaNacimiento);
            var edad = hoy.getFullYear() - fechaNac.getFullYear();
            var mes = hoy.getMonth() - fechaNac.getMonth();
            if (mes < 0 || (mes === 0 && hoy.getDate() < fechaNac.getDate())) {
                edad--;
            }

            // Verificar si la edad está dentro del rango permitido
            if (edad < 18 || edad > 50) {
                alert("La edad debe ser entre 18 a 50 años.");
                return false; // Detener el envío del formulario
            }

            // Si todas las validaciones pasan, enviar el formulario
            return true;
        }
    </script>

    <div class="contenedor-centrado">       <!-- diseño principal de la encuesta -->
        <div class="formulario-encuesta">
            <div>
                <asp:Label ID="lblSuccessMessage" runat="server" Text="" CssClass="text-success"></asp:Label>
                <asp:Label ID="lblErrorMessage" runat="server" Text="" CssClass="text-danger"></asp:Label>
            </div>
               
            <label for="fname" class="espacio-inferior">Nombre:</label>
            <input type="text" id="fname" name="fname" value="" class="espacio-inferior">
            <label for="lname" class="espacio-inferior">Apellido:</label>
            <input type="text" id="lname" name="lname" value="" class="espacio-inferior">
            <label class="espacio-inferior">
                Ingrese su fecha de nacimiento:
                <input type="date" name="fnacimiento" class="espacio-inferior" />
            </label>
            <label for="Correo" class="espacio-inferior">Correo electrónico:</label>
            <input type="text" id="Correo" name="Correo" value="" class="espacio-inferior">
            <label for="form-check-label" class="espacio-inferior">¿Posee usted carro propio?</label>
            <div class="dropdown espacio-inferior">
                <asp:DropDownList ID="DropDownList1" runat="server">
                    <asp:ListItem Text="Sí tengo carro" Value="1"></asp:ListItem>
                    <asp:ListItem Text="No tengo carro" Value="0"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="centrar-vertical-horizontal">
                <p class="mensaje-bienvenida">¿Desea guardar?</p>
            </div>
            <asp:Button ID="btnIniciarEncuesta" runat="server" CssClass="btn btn-primary" Text="Guardar datos ingresados" OnClientClick="return validarEncuesta();" OnClick="Guardar_datos_Click" />
        </div>
    </div>
</asp:Content>
