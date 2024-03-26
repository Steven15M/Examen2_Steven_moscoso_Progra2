<%@ Page Title="" Language="vb" AutoEventWireup="false" MasterPageFile="~/Menuprincipal.Master" CodeBehind="Reportes.aspx.vb" Inherits="Examen2_progra2Steven.Reportes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .texto-blancoTITULO {
            color: white;
            font-size: 31px;
        }
        .posicion-estadisticas {
            position: absolute;
            top: 200px;
            left: 100px;
        }
        .posicion-tabla {
            position: absolute;
            top: 150px;
            left:450px;
            background-color: white; 
            border-collapse: collapse; 
            width: 60%; 
            height: 60%;
            overflow:auto;  /* barras para navegar la tabla de reportes*/
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div>
        <p class="text-start texto-blancoTITULO">REPORTES</p>
    </div>
    
    <div>     <!--imagen uh-->
        <img src="IMG/u_hispa%20(1).png" width="125" height="125" style="position: absolute; top: 0; right: 0;"/>
    </div>

    <!-- tabla con los datos-->
    <div class="posicion-tabla">
        <asp:GridView ID="GridViewEncuesta" runat="server"></asp:GridView>
    </div>

    <!--estadisticas-->
    <div class="posicion-estadisticas">
        <div class="card" style="width: 18rem;">
            <ul class="list-group list-group-flush">
                <li class="list-group-item">Total de personas que han llenado la encuesta: <asp:Label ID="lblTotalEncuestas" runat="server" Text="0"></asp:Label></li>
                <li class="list-group-item">Promedio de edades: <asp:Label ID="lblPromedioEdades" runat="server" Text="0"></asp:Label></li>
                <li class="list-group-item">Total de personas que tienen carro: <asp:Label ID="lblPorcentajeCarro" runat="server" Text="0"></asp:Label></li>
                <li class="list-group-item">Total de personas que no tienen carro: <asp:Label ID="lblPorcentajeSinCarro" runat="server" Text="0"></asp:Label></li>
            </ul>
            <div class="card-footer">
                <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" OnClick="btnActualizar_Click" />
            </div>
        </div>
    </div>
</asp:Content>