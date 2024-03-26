<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Menuprincipal.Master" CodeBehind="Inicio.aspx.vb" Inherits="Examen2_progra2Steven.Inicio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .texto-blancoTITULO {
            color: white; /* Texto en blanco */
            font-size: 31px; /* Ajusta este valor al tamaño que prefieras */
            text-align: center; /* Centrado horizontal del texto */
        }
        .centrar-vertical-horizontal {
            height: 100vh; /* Altura completa de la ventana */
            display: flex;
            flex-direction: column; /* Organiza los elementos en columna */
            justify-content: center; /* Centrado horizontal */
            align-items: center; /* Centrado vertical */
        }
        .mensaje-bienvenida {
            font-size: 24px; /* Tamaño del texto del mensaje */
            margin-bottom: 20px; /* Espacio debajo del mensaje */
            color: white; /* Texto en blanco */
        }
        .espacio-entre {
            margin-bottom: 50px; /* Espacio adicional entre el mensaje y el botón */
        /* Estilos para el texto en la esquina inferior derecha */
        /* Estilos para el texto en la esquina inferior derecha */
        }
        .texto-inferior-derecha {
            position: fixed; /* Posicionamiento fijo en la pantalla */
            bottom: 10px; /* Ajusta este valor para mover el texto más abajo */
            right: 10px; /* Ajusta este valor para mover el texto más a la derecha */
            color: white; /* Texto en blanco */
            padding: 10px; /* Espaciado alrededor del texto */
            font-size: 14px; /* Tamaño del texto */
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div>
         <p class="text-start texto-blancoTITULO">INICIO</p>
    </div>
    
<div class="centrar-vertical-horizontal">
        <div class="espacio-entre">
            <p class="mensaje-bienvenida">Bienvenido al sistema de encuestas UH</p>
        </div>
        <asp:Button ID="btnIniciarEncuesta" runat="server" CssClass="btn btn-primary" Text="Iniciar encuesta" PostBackUrl="~/Encuesta.aspx" />
    <div class="espacio-entre">
        <img src="IMG/u_hispa%20(1).png" width="300" height="300" />
    </div>
    </div>
</asp:Content>